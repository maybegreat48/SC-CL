# Install script for directory: C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/LLVM")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/Basic/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/Lex/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/Driver/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/Analysis/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/StaticAnalyzer/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/ASTMatchers/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/AST/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/CrossTU/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/Tooling/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/Introspection/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/Format/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/Frontend/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/Rewrite/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/Sema/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/CodeGen/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/Interpreter/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/DirectoryWatcher/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/Rename/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/Index/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/unittests/Serialization/cmake_install.cmake")

endif()

