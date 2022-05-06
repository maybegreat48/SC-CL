# Install script for directory: C:/projects/SC-CL/llvm-14.0.0.src

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xllvm-headersx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES
    "C:/projects/SC-CL/llvm-14.0.0.src/include/llvm"
    "C:/projects/SC-CL/llvm-14.0.0.src/include/llvm-c"
    FILES_MATCHING REGEX "/[^/]*\\.def$" REGEX "/[^/]*\\.h$" REGEX "/[^/]*\\.td$" REGEX "/[^/]*\\.inc$" REGEX "/license\\.txt$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xllvm-headersx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES
    "C:/projects/SC-CL/llvm-14.0.0.src/include/llvm"
    "C:/projects/SC-CL/llvm-14.0.0.src/include/llvm-c"
    FILES_MATCHING REGEX "/[^/]*\\.def$" REGEX "/[^/]*\\.h$" REGEX "/[^/]*\\.gen$" REGEX "/[^/]*\\.inc$" REGEX "/cmakefiles$" EXCLUDE REGEX "/config\\.h$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xcmake-exportsx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/llvm" TYPE FILE FILES "C:/projects/SC-CL/llvm-14.0.0.src/lib/cmake/llvm/LLVMConfigExtensions.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Demangle/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/Support/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/TableGen/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/utils/TableGen/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/include/llvm/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/lib/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/utils/FileCheck/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/utils/PerfectShuffle/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/utils/count/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/utils/not/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/utils/yaml-bench/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/utils/LLVMVisualizers/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/projects/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/tools/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/runtimes/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/examples/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/utils/lit/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/test/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/unittests/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/utils/unittest/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/utils/KillTheDoctor/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/docs/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/cmake/modules/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/utils/llvm-lit/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/third-party/benchmark/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/benchmarks/cmake_install.cmake")
  include("C:/projects/SC-CL/llvm-14.0.0.src/utils/llvm-locstats/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "C:/projects/SC-CL/llvm-14.0.0.src/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
