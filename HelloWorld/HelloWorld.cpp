//=============================================================================
// FILE:
//    HelloWorld.cpp
//
// DESCRIPTION:
//    Visits all functions in a module, prints their names and the number of
//    arguments via stderr. Strictly speaking, this is an analysis pass (i.e.
//    the functions are not modified). However, in order to keep things simple
//    there's no 'print' method here (every analysis pass should implement it).
//
// USAGE:
//    New PM
//      opt -load-pass-plugin=libHelloWorld.dylib -passes="hello-world" `\`
//        -disable-output <input-llvm-file>
//
//
// License: MIT
//=============================================================================
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FormatVariadic.h"

#include <map>

using namespace llvm;

//-----------------------------------------------------------------------------
// HelloWorld implementation
//-----------------------------------------------------------------------------
// No need to expose the internals of the pass to the outside world - keep
// everything in an anonymous namespace.
namespace {

    void visitor(Function &fn) {
        errs() << "Liveness Analysis: " << fn.getName() << "\n";
    
        // Data structures for analysis
        std::map<BasicBlock*, std::set<Value*>> UEVAR;
        std::map<BasicBlock*, std::set<Value*>> VARKILL;
        std::map<BasicBlock*, std::set<Value*>> LIVEOUT;
    
        // Step 1: Calculate UEVAR and VARKILL for each basic block
        for (auto& basicBlock : fn) {
            std::set<Value*> uevarSet;
            std::set<Value*> varkillSet;
    
            for (auto& instruction : basicBlock) {
                // Iterate over operands to find uses
                for (unsigned i = 0; i < instruction.getNumOperands(); ++i) {
                    Value* operand = instruction.getOperand(i);
    
                    // If the operand is not defined in this block, it's UEVAR
                    if (!varkillSet.count(operand)) {
                        uevarSet.insert(operand);
                    }
                }
    
                // Defined variables go to VARKILL
                if (!instruction.getType()->isVoidTy()) {
                    varkillSet.insert(&instruction);
                }
            }
    
            UEVAR[&basicBlock] = uevarSet;
            VARKILL[&basicBlock] = varkillSet;
        }
    
        // Step 2: Iteratively calculate LIVEOUT using worklist
        bool changed = true;
        while (changed) {
            changed = false;
    
            for (auto& basicBlock : fn) {
                std::set<Value*> liveOutSet;
    
                // Collect LIVEOUT from successors
                for (auto succ = succ_begin(&basicBlock); succ != succ_end(&basicBlock); ++succ) {
                    BasicBlock* succBlock = *succ;
    
                    // LIVEOUT = (LIVEOUT - VARKILL) U UEVAR
                    std::set<Value*> tempOut = LIVEOUT[succBlock];
                    for (auto v : VARKILL[succBlock]) {
                        tempOut.erase(v);
                    }
                    liveOutSet.insert(tempOut.begin(), tempOut.end());
                    liveOutSet.insert(UEVAR[succBlock].begin(), UEVAR[succBlock].end());
                }
    
                // Check if LIVEOUT changed
                if (LIVEOUT[&basicBlock] != liveOutSet) {
                    LIVEOUT[&basicBlock] = liveOutSet;
                    changed = true;
                }
            }
        }
    
        // Step 3: Print UEVAR, VARKILL, and LIVEOUT for each block
        for (auto& basicBlock : fn) {
            errs() << "----- " << basicBlock.getName() << " -----\n";
    
            // Print UEVAR
            errs() << "UEVAR: ";
            for (auto v : UEVAR[&basicBlock]) {
                errs() << v->getName() << " ";
            }
            errs() << "\n";
    
            // Print VARKILL
            errs() << "VARKILL: ";
            for (auto v : VARKILL[&basicBlock]) {
                errs() << v->getName() << " ";
            }
            errs() << "\n";
    
            // Print LIVEOUT
            errs() << "LIVEOUT: ";
            for (auto v : LIVEOUT[&basicBlock]) {
                errs() << v->getName() << " ";
            }
            errs() << "\n";
        }
    }
    

// New PM implementation
struct HelloWorld : PassInfoMixin<HelloWorld> {
  // Main entry point, takes IR unit to run the pass on (&F) and the
  // corresponding pass manager (to be queried if need be)
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &) {
    visitor(F);
    return PreservedAnalyses::all();
  }

  // Without isRequired returning true, this pass will be skipped for functions
  // decorated with the optnone LLVM attribute. Note that clang -O0 decorates
  // all functions with optnone.
  static bool isRequired() { return true; }
};
} // namespace

//-----------------------------------------------------------------------------
// New PM Registration
//-----------------------------------------------------------------------------
llvm::PassPluginLibraryInfo getHelloWorldPluginInfo() {
  return {LLVM_PLUGIN_API_VERSION, "HelloWorld", LLVM_VERSION_STRING,
          [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                [](StringRef Name, FunctionPassManager &FPM,
                   ArrayRef<PassBuilder::PipelineElement>) {
                  if (Name == "hello-world") {
                    FPM.addPass(HelloWorld());
                    return true;
                  }
                  return false;
                });
          }};
}

// This is the core interface for pass plugins. It guarantees that 'opt' will
// be able to recognize HelloWorld when added to the pass pipeline on the
// command line, i.e. via '-passes=hello-world'
extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
  return getHelloWorldPluginInfo();
}
