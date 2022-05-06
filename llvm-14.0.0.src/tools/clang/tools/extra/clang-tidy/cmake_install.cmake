# Install script for directory: C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xclangTidyx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/SC-CL/llvm-14.0.0.src/Debug/lib/clangTidy.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/SC-CL/llvm-14.0.0.src/Release/lib/clangTidy.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/SC-CL/llvm-14.0.0.src/MinSizeRel/lib/clangTidy.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/projects/SC-CL/llvm-14.0.0.src/RelWithDebInfo/lib/clangTidy.lib")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xclang-tidy-headersx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/clang-tidy" TYPE DIRECTORY FILES "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/." FILES_MATCHING REGEX "/[^/]*\\.h$")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/android/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/abseil/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/altera/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/boost/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/bugprone/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/cert/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/concurrency/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/cppcoreguidelines/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/darwin/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/fuchsia/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/google/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/hicpp/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/linuxkernel/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/llvm/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/llvmlibc/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/misc/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/modernize/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/mpi/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/objc/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/openmp/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/performance/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/portability/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/readability/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/zircon/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/plugin/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/tool/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clang-tidy/utils/cmake_install.cmake")

endif()

