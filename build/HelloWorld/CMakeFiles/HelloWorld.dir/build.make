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
CMAKE_SOURCE_DIR = /home/shr/Documents/temp/project201

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/shr/Documents/temp/project201/build

# Include any dependencies generated for this target.
include HelloWorld/CMakeFiles/HelloWorld.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include HelloWorld/CMakeFiles/HelloWorld.dir/compiler_depend.make

# Include the progress variables for this target.
include HelloWorld/CMakeFiles/HelloWorld.dir/progress.make

# Include the compile flags for this target's objects.
include HelloWorld/CMakeFiles/HelloWorld.dir/flags.make

HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.cpp.o: HelloWorld/CMakeFiles/HelloWorld.dir/flags.make
HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.cpp.o: /home/shr/Documents/temp/project201/HelloWorld/HelloWorld.cpp
HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.cpp.o: HelloWorld/CMakeFiles/HelloWorld.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/shr/Documents/temp/project201/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.cpp.o"
	cd /home/shr/Documents/temp/project201/build/HelloWorld && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.cpp.o -MF CMakeFiles/HelloWorld.dir/HelloWorld.cpp.o.d -o CMakeFiles/HelloWorld.dir/HelloWorld.cpp.o -c /home/shr/Documents/temp/project201/HelloWorld/HelloWorld.cpp

HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/HelloWorld.dir/HelloWorld.cpp.i"
	cd /home/shr/Documents/temp/project201/build/HelloWorld && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shr/Documents/temp/project201/HelloWorld/HelloWorld.cpp > CMakeFiles/HelloWorld.dir/HelloWorld.cpp.i

HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/HelloWorld.dir/HelloWorld.cpp.s"
	cd /home/shr/Documents/temp/project201/build/HelloWorld && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shr/Documents/temp/project201/HelloWorld/HelloWorld.cpp -o CMakeFiles/HelloWorld.dir/HelloWorld.cpp.s

# Object files for target HelloWorld
HelloWorld_OBJECTS = \
"CMakeFiles/HelloWorld.dir/HelloWorld.cpp.o"

# External object files for target HelloWorld
HelloWorld_EXTERNAL_OBJECTS =

lib/libHelloWorld.so: HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.cpp.o
lib/libHelloWorld.so: HelloWorld/CMakeFiles/HelloWorld.dir/build.make
lib/libHelloWorld.so: HelloWorld/CMakeFiles/HelloWorld.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/shr/Documents/temp/project201/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library ../lib/libHelloWorld.so"
	cd /home/shr/Documents/temp/project201/build/HelloWorld && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/HelloWorld.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
HelloWorld/CMakeFiles/HelloWorld.dir/build: lib/libHelloWorld.so
.PHONY : HelloWorld/CMakeFiles/HelloWorld.dir/build

HelloWorld/CMakeFiles/HelloWorld.dir/clean:
	cd /home/shr/Documents/temp/project201/build/HelloWorld && $(CMAKE_COMMAND) -P CMakeFiles/HelloWorld.dir/cmake_clean.cmake
.PHONY : HelloWorld/CMakeFiles/HelloWorld.dir/clean

HelloWorld/CMakeFiles/HelloWorld.dir/depend:
	cd /home/shr/Documents/temp/project201/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/shr/Documents/temp/project201 /home/shr/Documents/temp/project201/HelloWorld /home/shr/Documents/temp/project201/build /home/shr/Documents/temp/project201/build/HelloWorld /home/shr/Documents/temp/project201/build/HelloWorld/CMakeFiles/HelloWorld.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : HelloWorld/CMakeFiles/HelloWorld.dir/depend

