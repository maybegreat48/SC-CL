# Install script for directory: C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples

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
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples/LLJITDumpObjects/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples/LLJITWithCustomObjectLinkingLayer/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples/LLJITWithExecutorProcessControl/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples/LLJITWithGDBRegistrationListener/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples/LLJITWithInitializers/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples/LLJITWithLazyReexports/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples/LLJITWithObjectCache/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples/LLJITWithObjectLinkingLayerPlugin/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples/LLJITWithOptimizingIRTransform/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples/LLJITWithThinLTOSummaries/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples/OrcV2CBindingsAddObjectFile/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples/OrcV2CBindingsBasicUsage/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples/OrcV2CBindingsDumpObjects/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples/OrcV2CBindingsIRTransforms/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples/OrcV2CBindingsReflectProcessSymbols/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples/OrcV2CBindingsRemovableCode/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples/OrcV2CBindingsLazy/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/OrcV2Examples/OrcV2CBindingsVeryLazy/cmake_install.cmake")

endif()

