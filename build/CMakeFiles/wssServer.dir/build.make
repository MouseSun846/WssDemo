# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_SOURCE_DIR = /home/liushangyang/dev/mouseu/wss_demo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/liushangyang/dev/mouseu/wss_demo/build

# Include any dependencies generated for this target.
include CMakeFiles/wssServer.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/wssServer.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/wssServer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/wssServer.dir/flags.make

CMakeFiles/wssServer.dir/server.cpp.o: CMakeFiles/wssServer.dir/flags.make
CMakeFiles/wssServer.dir/server.cpp.o: ../server.cpp
CMakeFiles/wssServer.dir/server.cpp.o: CMakeFiles/wssServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/liushangyang/dev/mouseu/wss_demo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/wssServer.dir/server.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/wssServer.dir/server.cpp.o -MF CMakeFiles/wssServer.dir/server.cpp.o.d -o CMakeFiles/wssServer.dir/server.cpp.o -c /home/liushangyang/dev/mouseu/wss_demo/server.cpp

CMakeFiles/wssServer.dir/server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/wssServer.dir/server.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/liushangyang/dev/mouseu/wss_demo/server.cpp > CMakeFiles/wssServer.dir/server.cpp.i

CMakeFiles/wssServer.dir/server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/wssServer.dir/server.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/liushangyang/dev/mouseu/wss_demo/server.cpp -o CMakeFiles/wssServer.dir/server.cpp.s

# Object files for target wssServer
wssServer_OBJECTS = \
"CMakeFiles/wssServer.dir/server.cpp.o"

# External object files for target wssServer
wssServer_EXTERNAL_OBJECTS =

../out/wssServer: CMakeFiles/wssServer.dir/server.cpp.o
../out/wssServer: CMakeFiles/wssServer.dir/build.make
../out/wssServer: CMakeFiles/wssServer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/liushangyang/dev/mouseu/wss_demo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../out/wssServer"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wssServer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/wssServer.dir/build: ../out/wssServer
.PHONY : CMakeFiles/wssServer.dir/build

CMakeFiles/wssServer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/wssServer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/wssServer.dir/clean

CMakeFiles/wssServer.dir/depend:
	cd /home/liushangyang/dev/mouseu/wss_demo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/liushangyang/dev/mouseu/wss_demo /home/liushangyang/dev/mouseu/wss_demo /home/liushangyang/dev/mouseu/wss_demo/build /home/liushangyang/dev/mouseu/wss_demo/build /home/liushangyang/dev/mouseu/wss_demo/build/CMakeFiles/wssServer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/wssServer.dir/depend

