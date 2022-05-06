# Install script for directory: C:/projects/SC-CL/llvm-14.0.0.src/unittests

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
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/ADT/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/Analysis/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/AsmParser/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/BinaryFormat/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/Bitcode/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/Bitstream/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/CodeGen/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/DebugInfo/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/Debuginfod/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/Demangle/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/ExecutionEngine/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/FileCheck/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/Frontend/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/FuzzMutate/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/InterfaceStub/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/IR/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/LineEditor/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/Linker/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/MC/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/MI/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/MIR/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/Object/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/ObjectYAML/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/Option/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/Remarks/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/Passes/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/ProfileData/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/Support/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/TableGen/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/Target/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/TextAPI/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/Transforms/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/XRay/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/tools/cmake_install.cmake")

endif()

