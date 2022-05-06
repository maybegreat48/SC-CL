# Install script for directory: C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xclang-resource-headersx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/14.0.0/include" TYPE FILE FILES
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/adxintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/altivec.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/ammintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/amxintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/arm_acle.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/arm_cmse.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/armintr.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/arm64intr.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx2intrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512bf16intrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512bwintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512bitalgintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512vlbitalgintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512cdintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512vpopcntdqintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512dqintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512erintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512fintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512fp16intrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512ifmaintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512ifmavlintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512pfintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512vbmiintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512vbmivlintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512vbmi2intrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512vlvbmi2intrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512vlbf16intrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512vlbwintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512vlcdintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512vldqintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512vlfp16intrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512vlintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512vp2intersectintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512vlvp2intersectintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512vpopcntdqvlintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512vnniintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avx512vlvnniintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avxintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/avxvnniintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/bmi2intrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/bmiintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/builtins.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/__clang_cuda_builtin_vars.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/__clang_cuda_math.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/__clang_cuda_cmath.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/__clang_cuda_complex_builtins.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/__clang_cuda_device_functions.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/__clang_cuda_intrinsics.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/__clang_cuda_texture_intrinsics.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/__clang_cuda_libdevice_declares.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/__clang_cuda_math_forward_declares.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/__clang_cuda_runtime_wrapper.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/__clang_hip_libdevice_declares.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/__clang_hip_cmath.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/__clang_hip_math.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/__clang_hip_runtime_wrapper.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/cetintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/cet.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/cldemoteintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/clzerointrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/crc32intrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/cpuid.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/clflushoptintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/clwbintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/emmintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/enqcmdintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/f16cintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/float.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/fma4intrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/fmaintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/fxsrintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/gfniintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/hexagon_circ_brev_intrinsics.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/hexagon_protos.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/hexagon_types.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/hvx_hexagon_protos.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/hresetintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/htmintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/htmxlintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/ia32intrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/immintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/intrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/inttypes.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/invpcidintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/iso646.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/keylockerintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/limits.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/lwpintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/lzcntintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/mm3dnow.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/mmintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/mm_malloc.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/module.modulemap"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/movdirintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/msa.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/mwaitxintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/nmmintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/opencl-c.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/opencl-c-base.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/pkuintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/pmmintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/pconfigintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/popcntintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/prfchwintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/ptwriteintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/rdseedintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/rtmintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/serializeintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/sgxintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/s390intrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/shaintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/smmintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/stdalign.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/stdarg.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/stdatomic.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/stdbool.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/stddef.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/__stddef_max_align_t.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/stdint.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/stdnoreturn.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/tbmintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/tgmath.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/tmmintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/tsxldtrkintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/uintrintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/unwind.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/vadefs.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/vaesintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/varargs.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/vecintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/vpclmulqdqintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/waitpkgintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/wasm_simd128.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/wbnoinvdintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/wmmintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/__wmmintrin_aes.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/__wmmintrin_pclmul.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/x86gprintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/x86intrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/xmmintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/xopintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/xsavecintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/xsaveintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/xsaveoptintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/xsavesintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/xtestintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/arm_neon.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/arm_fp16.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/arm_sve.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/arm_bf16.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/arm_mve.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/arm_cde.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/riscv_vector.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xclang-resource-headersx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/14.0.0/include/cuda_wrappers" TYPE FILE FILES
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/cuda_wrappers/algorithm"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/cuda_wrappers/complex"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/cuda_wrappers/new"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xclang-resource-headersx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/14.0.0/include/ppc_wrappers" TYPE FILE FILES
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/ppc_wrappers/mmintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/ppc_wrappers/xmmintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/ppc_wrappers/mm_malloc.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/ppc_wrappers/emmintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/ppc_wrappers/pmmintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/ppc_wrappers/tmmintrin.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/ppc_wrappers/smmintrin.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xclang-resource-headersx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/14.0.0/include/openmp_wrappers" TYPE FILE FILES
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/openmp_wrappers/math.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/openmp_wrappers/cmath"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/openmp_wrappers/complex.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/openmp_wrappers/complex"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/openmp_wrappers/__clang_openmp_device_functions.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/openmp_wrappers/complex_cmath.h"
    "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/lib/Headers/openmp_wrappers/new"
    )
endif()

