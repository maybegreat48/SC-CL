; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown -mattr=+sse2 | FileCheck %s --check-prefix=X32-SSE
; RUN: llc < %s -mtriple=i686-unknown -mattr=+avx | FileCheck %s --check-prefix=X32-AVX
; RUN: llc < %s -mtriple=x86_64-unknown -mattr=+sse2 | FileCheck %s --check-prefix=X64-SSE
; RUN: llc < %s -mtriple=x86_64-unknown -mattr=+avx | FileCheck %s --check-prefix=X64-AVX

;PR29079

define <4 x float> @mask_ucvt_4i32_4f32(<4 x i32> %a) {
; X32-SSE-LABEL: mask_ucvt_4i32_4f32:
; X32-SSE:       # %bb.0:
; X32-SSE-NEXT:    andps {{\.?LCPI[0-9]+_[0-9]+}}, %xmm0
; X32-SSE-NEXT:    cvtdq2ps %xmm0, %xmm0
; X32-SSE-NEXT:    retl
;
; X32-AVX-LABEL: mask_ucvt_4i32_4f32:
; X32-AVX:       # %bb.0:
; X32-AVX-NEXT:    vandps {{\.?LCPI[0-9]+_[0-9]+}}, %xmm0, %xmm0
; X32-AVX-NEXT:    vcvtdq2ps %xmm0, %xmm0
; X32-AVX-NEXT:    retl
;
; X64-SSE-LABEL: mask_ucvt_4i32_4f32:
; X64-SSE:       # %bb.0:
; X64-SSE-NEXT:    andps {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0
; X64-SSE-NEXT:    cvtdq2ps %xmm0, %xmm0
; X64-SSE-NEXT:    retq
;
; X64-AVX-LABEL: mask_ucvt_4i32_4f32:
; X64-AVX:       # %bb.0:
; X64-AVX-NEXT:    vandps {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0, %xmm0
; X64-AVX-NEXT:    vcvtdq2ps %xmm0, %xmm0
; X64-AVX-NEXT:    retq
  %and = and <4 x i32> %a, <i32 127, i32 255, i32 4095, i32 65595>
  %cvt = uitofp <4 x i32> %and to <4 x float>
  ret <4 x float> %cvt
}

define <4 x double> @mask_ucvt_4i32_4f64(<4 x i32> %a) {
; X32-SSE-LABEL: mask_ucvt_4i32_4f64:
; X32-SSE:       # %bb.0:
; X32-SSE-NEXT:    pand {{\.?LCPI[0-9]+_[0-9]+}}, %xmm0
; X32-SSE-NEXT:    cvtdq2pd %xmm0, %xmm2
; X32-SSE-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[2,3,2,3]
; X32-SSE-NEXT:    cvtdq2pd %xmm0, %xmm1
; X32-SSE-NEXT:    movaps %xmm2, %xmm0
; X32-SSE-NEXT:    retl
;
; X32-AVX-LABEL: mask_ucvt_4i32_4f64:
; X32-AVX:       # %bb.0:
; X32-AVX-NEXT:    vandps {{\.?LCPI[0-9]+_[0-9]+}}, %xmm0, %xmm0
; X32-AVX-NEXT:    vcvtdq2pd %xmm0, %ymm0
; X32-AVX-NEXT:    retl
;
; X64-SSE-LABEL: mask_ucvt_4i32_4f64:
; X64-SSE:       # %bb.0:
; X64-SSE-NEXT:    pand {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0
; X64-SSE-NEXT:    cvtdq2pd %xmm0, %xmm2
; X64-SSE-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[2,3,2,3]
; X64-SSE-NEXT:    cvtdq2pd %xmm0, %xmm1
; X64-SSE-NEXT:    movaps %xmm2, %xmm0
; X64-SSE-NEXT:    retq
;
; X64-AVX-LABEL: mask_ucvt_4i32_4f64:
; X64-AVX:       # %bb.0:
; X64-AVX-NEXT:    vandps {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0, %xmm0
; X64-AVX-NEXT:    vcvtdq2pd %xmm0, %ymm0
; X64-AVX-NEXT:    retq
  %and = and <4 x i32> %a, <i32 127, i32 255, i32 4095, i32 65595>
  %cvt = uitofp <4 x i32> %and to <4 x double>
  ret <4 x double> %cvt
}

; Regression noticed in D56387
define <4 x float> @lshr_truncate_mask_ucvt_4i64_4f32(<4 x i64> *%p0) {
; X32-SSE-LABEL: lshr_truncate_mask_ucvt_4i64_4f32:
; X32-SSE:       # %bb.0:
; X32-SSE-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-SSE-NEXT:    movups (%eax), %xmm0
; X32-SSE-NEXT:    movups 16(%eax), %xmm1
; X32-SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,2],xmm1[0,2]
; X32-SSE-NEXT:    psrld $16, %xmm0
; X32-SSE-NEXT:    cvtdq2ps %xmm0, %xmm0
; X32-SSE-NEXT:    mulps {{\.?LCPI[0-9]+_[0-9]+}}, %xmm0
; X32-SSE-NEXT:    retl
;
; X32-AVX-LABEL: lshr_truncate_mask_ucvt_4i64_4f32:
; X32-AVX:       # %bb.0:
; X32-AVX-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-AVX-NEXT:    vmovups (%eax), %xmm0
; X32-AVX-NEXT:    vshufps {{.*#+}} xmm0 = xmm0[0,2],mem[0,2]
; X32-AVX-NEXT:    vpsrld $16, %xmm0, %xmm0
; X32-AVX-NEXT:    vcvtdq2ps %xmm0, %xmm0
; X32-AVX-NEXT:    vmulps {{\.?LCPI[0-9]+_[0-9]+}}, %xmm0, %xmm0
; X32-AVX-NEXT:    retl
;
; X64-SSE-LABEL: lshr_truncate_mask_ucvt_4i64_4f32:
; X64-SSE:       # %bb.0:
; X64-SSE-NEXT:    movups (%rdi), %xmm0
; X64-SSE-NEXT:    movups 16(%rdi), %xmm1
; X64-SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,2],xmm1[0,2]
; X64-SSE-NEXT:    psrld $16, %xmm0
; X64-SSE-NEXT:    cvtdq2ps %xmm0, %xmm0
; X64-SSE-NEXT:    mulps {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0
; X64-SSE-NEXT:    retq
;
; X64-AVX-LABEL: lshr_truncate_mask_ucvt_4i64_4f32:
; X64-AVX:       # %bb.0:
; X64-AVX-NEXT:    vmovups (%rdi), %xmm0
; X64-AVX-NEXT:    vshufps {{.*#+}} xmm0 = xmm0[0,2],mem[0,2]
; X64-AVX-NEXT:    vpsrld $16, %xmm0, %xmm0
; X64-AVX-NEXT:    vcvtdq2ps %xmm0, %xmm0
; X64-AVX-NEXT:    vmulps {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0, %xmm0
; X64-AVX-NEXT:    retq
  %load = load <4 x i64>, <4 x i64>* %p0, align 2
  %lshr = lshr <4 x i64> %load, <i64 16, i64 16, i64 16, i64 16>
  %and = and <4 x i64> %lshr, <i64 65535, i64 65535, i64 65535, i64 65535>
  %uitofp = uitofp <4 x i64> %and to <4 x float>
  %fmul = fmul <4 x float> %uitofp, <float 0x3EF0001000000000, float 0x3EF0001000000000, float 0x3EF0001000000000, float 0x3EF0001000000000>
  ret <4 x float> %fmul
}
