# project201
This repository is an implementation of a Local Value Numbering (LVN) pass for the LLVM compiler infrastructure. LVN is a compiler optimization technique that identifies redundant computations within a basic block ans assigns unique value numbers to expressions. This analyzes LLVM IR and detects redundant arithmetic operations, such as ```a+b```, without modifying the code. 

## Requirements
 - LLVM
 - CMake
 - C++ Compiler
 - Clang

