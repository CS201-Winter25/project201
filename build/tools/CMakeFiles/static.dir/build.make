# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/shr/Documents/project201

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/shr/Documents/project201/build

# Include any dependencies generated for this target.
include tools/CMakeFiles/static.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tools/CMakeFiles/static.dir/compiler_depend.make

# Include the progress variables for this target.
include tools/CMakeFiles/static.dir/progress.make

# Include the compile flags for this target's objects.
include tools/CMakeFiles/static.dir/flags.make

tools/CMakeFiles/static.dir/StaticMain.cpp.o: tools/CMakeFiles/static.dir/flags.make
tools/CMakeFiles/static.dir/StaticMain.cpp.o: /home/shr/Documents/project201/tools/StaticMain.cpp
tools/CMakeFiles/static.dir/StaticMain.cpp.o: tools/CMakeFiles/static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/shr/Documents/project201/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tools/CMakeFiles/static.dir/StaticMain.cpp.o"
	cd /home/shr/Documents/project201/build/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tools/CMakeFiles/static.dir/StaticMain.cpp.o -MF CMakeFiles/static.dir/StaticMain.cpp.o.d -o CMakeFiles/static.dir/StaticMain.cpp.o -c /home/shr/Documents/project201/tools/StaticMain.cpp

tools/CMakeFiles/static.dir/StaticMain.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/static.dir/StaticMain.cpp.i"
	cd /home/shr/Documents/project201/build/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shr/Documents/project201/tools/StaticMain.cpp > CMakeFiles/static.dir/StaticMain.cpp.i

tools/CMakeFiles/static.dir/StaticMain.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/static.dir/StaticMain.cpp.s"
	cd /home/shr/Documents/project201/build/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shr/Documents/project201/tools/StaticMain.cpp -o CMakeFiles/static.dir/StaticMain.cpp.s

tools/CMakeFiles/static.dir/__/lib/StaticCallCounter.cpp.o: tools/CMakeFiles/static.dir/flags.make
tools/CMakeFiles/static.dir/__/lib/StaticCallCounter.cpp.o: /home/shr/Documents/project201/lib/StaticCallCounter.cpp
tools/CMakeFiles/static.dir/__/lib/StaticCallCounter.cpp.o: tools/CMakeFiles/static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/shr/Documents/project201/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object tools/CMakeFiles/static.dir/__/lib/StaticCallCounter.cpp.o"
	cd /home/shr/Documents/project201/build/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tools/CMakeFiles/static.dir/__/lib/StaticCallCounter.cpp.o -MF CMakeFiles/static.dir/__/lib/StaticCallCounter.cpp.o.d -o CMakeFiles/static.dir/__/lib/StaticCallCounter.cpp.o -c /home/shr/Documents/project201/lib/StaticCallCounter.cpp

tools/CMakeFiles/static.dir/__/lib/StaticCallCounter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/static.dir/__/lib/StaticCallCounter.cpp.i"
	cd /home/shr/Documents/project201/build/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shr/Documents/project201/lib/StaticCallCounter.cpp > CMakeFiles/static.dir/__/lib/StaticCallCounter.cpp.i

tools/CMakeFiles/static.dir/__/lib/StaticCallCounter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/static.dir/__/lib/StaticCallCounter.cpp.s"
	cd /home/shr/Documents/project201/build/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shr/Documents/project201/lib/StaticCallCounter.cpp -o CMakeFiles/static.dir/__/lib/StaticCallCounter.cpp.s

# Object files for target static
static_OBJECTS = \
"CMakeFiles/static.dir/StaticMain.cpp.o" \
"CMakeFiles/static.dir/__/lib/StaticCallCounter.cpp.o"

# External object files for target static
static_EXTERNAL_OBJECTS =

bin/static: tools/CMakeFiles/static.dir/StaticMain.cpp.o
bin/static: tools/CMakeFiles/static.dir/__/lib/StaticCallCounter.cpp.o
bin/static: tools/CMakeFiles/static.dir/build.make
bin/static: /usr/lib/llvm-19/lib/libLLVMCore.a
bin/static: /usr/lib/llvm-19/lib/libLLVMPasses.a
bin/static: /usr/lib/llvm-19/lib/libLLVMIRReader.a
bin/static: /usr/lib/llvm-19/lib/libLLVMSupport.a
bin/static: /usr/lib/llvm-19/lib/libLLVMCFGuard.a
bin/static: /usr/lib/llvm-19/lib/libLLVMCodeGen.a
bin/static: /usr/lib/llvm-19/lib/libLLVMCodeGenTypes.a
bin/static: /usr/lib/llvm-19/lib/libLLVMCoroutines.a
bin/static: /usr/lib/llvm-19/lib/libLLVMHipStdPar.a
bin/static: /usr/lib/llvm-19/lib/libLLVMipo.a
bin/static: /usr/lib/llvm-19/lib/libLLVMBitWriter.a
bin/static: /usr/lib/llvm-19/lib/libLLVMFrontendOpenMP.a
bin/static: /usr/lib/llvm-19/lib/libLLVMFrontendOffloading.a
bin/static: /usr/lib/llvm-19/lib/libLLVMLinker.a
bin/static: /usr/lib/llvm-19/lib/libLLVMIRPrinter.a
bin/static: /usr/lib/llvm-19/lib/libLLVMObjCARCOpts.a
bin/static: /usr/lib/llvm-19/lib/libLLVMScalarOpts.a
bin/static: /usr/lib/llvm-19/lib/libLLVMAggressiveInstCombine.a
bin/static: /usr/lib/llvm-19/lib/libLLVMInstCombine.a
bin/static: /usr/lib/llvm-19/lib/libLLVMTarget.a
bin/static: /usr/lib/llvm-19/lib/libLLVMVectorize.a
bin/static: /usr/lib/llvm-19/lib/libLLVMInstrumentation.a
bin/static: /usr/lib/llvm-19/lib/libLLVMTransformUtils.a
bin/static: /usr/lib/llvm-19/lib/libLLVMAnalysis.a
bin/static: /usr/lib/llvm-19/lib/libLLVMProfileData.a
bin/static: /usr/lib/llvm-19/lib/libLLVMSymbolize.a
bin/static: /usr/lib/llvm-19/lib/libLLVMDebugInfoPDB.a
bin/static: /usr/lib/llvm-19/lib/libLLVMDebugInfoMSF.a
bin/static: /usr/lib/llvm-19/lib/libLLVMDebugInfoBTF.a
bin/static: /usr/lib/llvm-19/lib/libLLVMDebugInfoDWARF.a
bin/static: /usr/lib/llvm-19/lib/libLLVMObject.a
bin/static: /usr/lib/llvm-19/lib/libLLVMIRReader.a
bin/static: /usr/lib/llvm-19/lib/libLLVMAsmParser.a
bin/static: /usr/lib/llvm-19/lib/libLLVMBitReader.a
bin/static: /usr/lib/llvm-19/lib/libLLVMCore.a
bin/static: /usr/lib/llvm-19/lib/libLLVMRemarks.a
bin/static: /usr/lib/llvm-19/lib/libLLVMBitstreamReader.a
bin/static: /usr/lib/llvm-19/lib/libLLVMMCParser.a
bin/static: /usr/lib/llvm-19/lib/libLLVMTextAPI.a
bin/static: /usr/lib/llvm-19/lib/libLLVMMC.a
bin/static: /usr/lib/llvm-19/lib/libLLVMBinaryFormat.a
bin/static: /usr/lib/llvm-19/lib/libLLVMTargetParser.a
bin/static: /usr/lib/llvm-19/lib/libLLVMDebugInfoCodeView.a
bin/static: /usr/lib/llvm-19/lib/libLLVMSupport.a
bin/static: /usr/lib/llvm-19/lib/libLLVMDemangle.a
bin/static: /usr/lib/x86_64-linux-gnu/libz.so
bin/static: /usr/lib/x86_64-linux-gnu/libzstd.so
bin/static: tools/CMakeFiles/static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/shr/Documents/project201/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../bin/static"
	cd /home/shr/Documents/project201/build/tools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/CMakeFiles/static.dir/build: bin/static
.PHONY : tools/CMakeFiles/static.dir/build

tools/CMakeFiles/static.dir/clean:
	cd /home/shr/Documents/project201/build/tools && $(CMAKE_COMMAND) -P CMakeFiles/static.dir/cmake_clean.cmake
.PHONY : tools/CMakeFiles/static.dir/clean

tools/CMakeFiles/static.dir/depend:
	cd /home/shr/Documents/project201/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/shr/Documents/project201 /home/shr/Documents/project201/tools /home/shr/Documents/project201/build /home/shr/Documents/project201/build/tools /home/shr/Documents/project201/build/tools/CMakeFiles/static.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : tools/CMakeFiles/static.dir/depend

