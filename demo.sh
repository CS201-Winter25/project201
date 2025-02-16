# rebuild pass
export LLVMDIR=export LLVM_DIR=/usr/lib/llvm-19
rm -rf build
mkdir build
cd build
cmake -DLT_LLVM_INSTALL_DIR=$LLVM_DIR ..
make

# move to example file
cd ..

# convert input.c to input.b
clang-19 -c -emit-llvm -fno-discard-value-names -O0 test.c -o test.bc

# run with the pass
opt-19 -load-pass-plugin build/lib/libHelloWorld.so -passes=hello-world -disable-output test.bc
