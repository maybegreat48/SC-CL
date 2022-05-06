# Install script for directory: C:/projects/SC-CL/llvm-14.0.0.src/lib/Target

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xLLVMTargetx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/SC-CL/llvm-14.0.0.src/Debug/lib/LLVMTarget.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/SC-CL/llvm-14.0.0.src/Release/lib/LLVMTarget.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/SC-CL/llvm-14.0.0.src/MinSizeRel/lib/LLVMTarget.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/SC-CL/llvm-14.0.0.src/RelWithDebInfo/lib/LLVMTarget.lib")
  endif()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Target/AArch64/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Target/AMDGPU/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Target/ARM/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Target/AVR/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Target/BPF/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Target/Hexagon/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Target/Lanai/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Target/Mips/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Target/MSP430/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Target/NVPTX/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Target/PowerPC/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Target/RISCV/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Target/Sparc/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Target/SystemZ/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Target/VE/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Target/WebAssembly/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Target/X86/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Target/XCore/cmake_install.cmake")

endif()

