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
CMAKE_SOURCE_DIR = /home/liushangyang/dev/mouseu/wss_demo/client

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/liushangyang/dev/mouseu/wss_demo/client/wssClient

# Include any dependencies generated for this target.
include CMakeFiles/wssClient.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/wssClient.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/wssClient.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/wssClient.dir/flags.make

CMakeFiles/wssClient.dir/client.cpp.o: CMakeFiles/wssClient.dir/flags.make
CMakeFiles/wssClient.dir/client.cpp.o: ../client.cpp
CMakeFiles/wssClient.dir/client.cpp.o: CMakeFiles/wssClient.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/liushangyang/dev/mouseu/wss_demo/client/wssClient/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/wssClient.dir/client.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/wssClient.dir/client.cpp.o -MF CMakeFiles/wssClient.dir/client.cpp.o.d -o CMakeFiles/wssClient.dir/client.cpp.o -c /home/liushangyang/dev/mouseu/wss_demo/client/client.cpp

CMakeFiles/wssClient.dir/client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/wssClient.dir/client.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/liushangyang/dev/mouseu/wss_demo/client/client.cpp > CMakeFiles/wssClient.dir/client.cpp.i

CMakeFiles/wssClient.dir/client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/wssClient.dir/client.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/liushangyang/dev/mouseu/wss_demo/client/client.cpp -o CMakeFiles/wssClient.dir/client.cpp.s

# Object files for target wssClient
wssClient_OBJECTS = \
"CMakeFiles/wssClient.dir/client.cpp.o"

# External object files for target wssClient
wssClient_EXTERNAL_OBJECTS =

../out/wssClient: CMakeFiles/wssClient.dir/client.cpp.o
../out/wssClient: CMakeFiles/wssClient.dir/build.make
../out/wssClient: CMakeFiles/wssClient.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/liushangyang/dev/mouseu/wss_demo/client/wssClient/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../out/wssClient"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wssClient.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/wssClient.dir/build: ../out/wssClient
.PHONY : CMakeFiles/wssClient.dir/build

CMakeFiles/wssClient.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/wssClient.dir/cmake_clean.cmake
.PHONY : CMakeFiles/wssClient.dir/clean

CMakeFiles/wssClient.dir/depend:
	cd /home/liushangyang/dev/mouseu/wss_demo/client/wssClient && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/liushangyang/dev/mouseu/wss_demo/client /home/liushangyang/dev/mouseu/wss_demo/client /home/liushangyang/dev/mouseu/wss_demo/client/wssClient /home/liushangyang/dev/mouseu/wss_demo/client/wssClient /home/liushangyang/dev/mouseu/wss_demo/client/wssClient/CMakeFiles/wssClient.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/wssClient.dir/depend
