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

#include <map>

using namespace llvm;

//-----------------------------------------------------------------------------
// HelloWorld implementation
//-----------------------------------------------------------------------------
// No need to expose the internals of the pass to the outside world - keep
// everything in an anonymous namespace.
namespace {

void visitor(Function &fn) {
    // Map to store value numbers for each value
    std::map<Value*, int> valueNumberMap;
    // Map to store expressions and their value numbers
    std::map<std::string, int> exprNumberMap;
    int nextValueNumber = 1;

    // Helper function to get or assign a value number
    auto getValueNumber = [&](Value* value) -> int {
        if (valueNumberMap.find(value) == valueNumberMap.end()) {
            // For constants and arguments, assign new value numbers
            if (isa<Constant>(value) || isa<Argument>(value)) {
                valueNumberMap[value] = nextValueNumber++;
            }
        }
        return valueNumberMap[value];
    };

    // Helper function to create expression string
    auto getExprString = [&](std::string opcode, Value* op1, Value* op2) -> std::string {
        int vn1 = getValueNumber(op1);
        int vn2 = getValueNumber(op2);
        // Normalize expression by ordering operands
        if (vn1 > vn2) {
            std::swap(vn1, vn2);
        }
        return opcode + " " + std::to_string(vn1) + " " + std::to_string(vn2);
    };

    for (auto& basicBlock : fn) {
        errs() << "ValueNumbering: " << fn.getName() << "\n";
        
        for (auto& instruction : basicBlock) {
            errs() << instruction << "\n";
            
            if (auto* storeInst = dyn_cast<StoreInst>(&instruction)) {
                // For store instructions, propagate the value number
                Value* storedValue = storeInst->getValueOperand();
                Value* pointer = storeInst->getPointerOperand();
                int valueNum = getValueNumber(storedValue);
                valueNumberMap[pointer] = valueNum;
                errs() << "    " << valueNum << " = " << valueNum << "\n";
            }
            else if (auto* loadInst = dyn_cast<LoadInst>(&instruction)) {
                // For load instructions, use the pointer's value number
                Value* pointer = loadInst->getPointerOperand();
                if (valueNumberMap.find(pointer) != valueNumberMap.end()) {
                    valueNumberMap[&instruction] = valueNumberMap[pointer];
                    errs() << "    " << valueNumberMap[&instruction] << " = " 
                        << valueNumberMap[pointer] << "\n";
                }
            }
            else if (auto* binOp = dyn_cast<BinaryOperator>(&instruction)) {
                Value* op1 = binOp->getOperand(0);
                Value* op2 = binOp->getOperand(1);
                
                // Create expression string based on operation and operands
                std::string exprString = getExprString(binOp->getOpcodeName(), op1, op2);
                
                // Check if this expression has been computed before
                if (exprNumberMap.find(exprString) != exprNumberMap.end()) {
                    // Redundant computation found
                    valueNumberMap[&instruction] = exprNumberMap[exprString];
                    errs() << "    " << valueNumberMap[&instruction] << " = "
                        << getValueNumber(op1) << " " << binOp->getOpcodeName() << " "
                        << getValueNumber(op2) << " (redundant)\n";
                } else {
                    // New computation
                    valueNumberMap[&instruction] = nextValueNumber;
                    exprNumberMap[exprString] = nextValueNumber++;
                    errs() << "    " << valueNumberMap[&instruction] << " = "
                        << getValueNumber(op1) << " " << binOp->getOpcodeName() << " "
                        << getValueNumber(op2) << "\n";
                }
            }
        }
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
