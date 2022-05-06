; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instcombine -S                             | FileCheck %s --check-prefixes=ANY,NO-FLOAT-SHRINK
; RUN: opt < %s -instcombine -enable-double-float-shrink -S | FileCheck %s --check-prefixes=ANY,DO-FLOAT-SHRINK

target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"

declare double @cos(double)
declare double @llvm.cos.f64(double)
declare float @cosf(float)
declare float @llvm.cos.f32(float)

declare double @sin(double)
declare double @llvm.sin.f64(double)
declare float @sinf(float)
declare float @llvm.sin.f32(float)

declare double @tan(double)
declare fp128 @tanl(fp128)

; cos(-x) -> cos(x);

define double @cos_negated_arg(double %x) {
; ANY-LABEL: @cos_negated_arg(
; ANY-NEXT:    [[COS:%.*]] = call double @cos(double [[X:%.*]])
; ANY-NEXT:    ret double [[COS]]
;
  %neg = fsub double -0.0, %x
  %r = call double @cos(double %neg)
  ret double %r
}

define double @cos_negated_arg_tail(double %x) {
; ANY-LABEL: @cos_negated_arg_tail(
; ANY-NEXT:    [[COS:%.*]] = tail call double @cos(double [[X:%.*]])
; ANY-NEXT:    ret double [[COS]]
;
  %neg = fsub double -0.0, %x
  %r = tail call double @cos(double %neg)
  ret double %r
}

define double @cos_negated_arg_musttail(double %x) {
; ANY-LABEL: @cos_negated_arg_musttail(
; ANY-NEXT:    [[NEG:%.*]] = fneg double [[X:%.*]]
; ANY-NEXT:    [[R:%.*]] = musttail call double @cos(double [[NEG]])
; ANY-NEXT:    ret double [[R]]
;
  %neg = fsub double -0.0, %x
  %r = musttail call double @cos(double %neg)
  ret double %r
}

define double @cos_unary_negated_arg(double %x) {
; ANY-LABEL: @cos_unary_negated_arg(
; ANY-NEXT:    [[COS:%.*]] = call double @cos(double [[X:%.*]])
; ANY-NEXT:    ret double [[COS]]
;
  %neg = fneg double %x
  %r = call double @cos(double %neg)
  ret double %r
}

define float @cosf_negated_arg(float %x) {
; ANY-LABEL: @cosf_negated_arg(
; ANY-NEXT:    [[COS:%.*]] = call float @cosf(float [[X:%.*]])
; ANY-NEXT:    ret float [[COS]]
;
  %neg = fsub float -0.0, %x
  %r = call float @cosf(float %neg)
  ret float %r
}

define float @cosf_unary_negated_arg(float %x) {
; ANY-LABEL: @cosf_unary_negated_arg(
; ANY-NEXT:    [[COS:%.*]] = call float @cosf(float [[X:%.*]])
; ANY-NEXT:    ret float [[COS]]
;
  %neg = fneg float %x
  %r = call float @cosf(float %neg)
  ret float %r
}

define float @cosf_negated_arg_FMF(float %x) {
; ANY-LABEL: @cosf_negated_arg_FMF(
; ANY-NEXT:    [[COS:%.*]] = call reassoc nnan float @cosf(float [[X:%.*]])
; ANY-NEXT:    ret float [[COS]]
;
  %neg = fsub float -0.0, %x
  %r = call nnan reassoc float @cosf(float %neg)
  ret float %r
}

define float @cosf_unary_negated_arg_FMF(float %x) {
; ANY-LABEL: @cosf_unary_negated_arg_FMF(
; ANY-NEXT:    [[COS:%.*]] = call reassoc nnan float @cosf(float [[X:%.*]])
; ANY-NEXT:    ret float [[COS]]
;
  %neg = fneg float %x
  %r = call nnan reassoc float @cosf(float %neg)
  ret float %r
}

; sin(-x) -> -sin(x);

define double @sin_negated_arg(double %x) {
; ANY-LABEL: @sin_negated_arg(
; ANY-NEXT:    [[TMP1:%.*]] = call double @sin(double [[X:%.*]])
; ANY-NEXT:    [[TMP2:%.*]] = fneg double [[TMP1]]
; ANY-NEXT:    ret double [[TMP2]]
;
  %neg = fsub double -0.0, %x
  %r = call double @sin(double %neg)
  ret double %r
}

define double @sin_unary_negated_arg(double %x) {
; ANY-LABEL: @sin_unary_negated_arg(
; ANY-NEXT:    [[TMP1:%.*]] = call double @sin(double [[X:%.*]])
; ANY-NEXT:    [[TMP2:%.*]] = fneg double [[TMP1]]
; ANY-NEXT:    ret double [[TMP2]]
;
  %neg = fneg double %x
  %r = call double @sin(double %neg)
  ret double %r
}

define double @sin_unary_negated_arg_musttail(double %x) {
; ANY-LABEL: @sin_unary_negated_arg_musttail(
; ANY-NEXT:    [[NEG:%.*]] = fneg double [[X:%.*]]
; ANY-NEXT:    [[R:%.*]] = musttail call double @sin(double [[NEG]])
; ANY-NEXT:    ret double [[R]]
;
  %neg = fneg double %x
  %r = musttail call double @sin(double %neg)
  ret double %r
}

define float @sinf_negated_arg(float %x) {
; ANY-LABEL: @sinf_negated_arg(
; ANY-NEXT:    [[TMP1:%.*]] = call float @sinf(float [[X:%.*]])
; ANY-NEXT:    [[TMP2:%.*]] = fneg float [[TMP1]]
; ANY-NEXT:    ret float [[TMP2]]
;
  %neg = fsub float -0.0, %x
  %r = call float @sinf(float %neg)
  ret float %r
}

define float @sinf_unary_negated_arg(float %x) {
; ANY-LABEL: @sinf_unary_negated_arg(
; ANY-NEXT:    [[TMP1:%.*]] = call float @sinf(float [[X:%.*]])
; ANY-NEXT:    [[TMP2:%.*]] = fneg float [[TMP1]]
; ANY-NEXT:    ret float [[TMP2]]
;
  %neg = fneg float %x
  %r = call float @sinf(float %neg)
  ret float %r
}

define float @sinf_negated_arg_FMF(float %x) {
; ANY-LABEL: @sinf_negated_arg_FMF(
; ANY-NEXT:    [[TMP1:%.*]] = call nnan afn float @sinf(float [[X:%.*]])
; ANY-NEXT:    [[TMP2:%.*]] = fneg nnan afn float [[TMP1]]
; ANY-NEXT:    ret float [[TMP2]]
;
  %neg = fsub ninf float -0.0, %x
  %r = call afn nnan float @sinf(float %neg)
  ret float %r
}

define float @sinf_unary_negated_arg_FMF(float %x) {
; ANY-LABEL: @sinf_unary_negated_arg_FMF(
; ANY-NEXT:    [[TMP1:%.*]] = call nnan afn float @sinf(float [[X:%.*]])
; ANY-NEXT:    [[TMP2:%.*]] = fneg nnan afn float [[TMP1]]
; ANY-NEXT:    ret float [[TMP2]]
;
  %neg = fneg ninf float %x
  %r = call afn nnan float @sinf(float %neg)
  ret float %r
}

declare void @use(double)

define double @sin_negated_arg_extra_use(double %x) {
; ANY-LABEL: @sin_negated_arg_extra_use(
; ANY-NEXT:    [[NEG:%.*]] = fneg double [[X:%.*]]
; ANY-NEXT:    [[R:%.*]] = call double @sin(double [[NEG]])
; ANY-NEXT:    call void @use(double [[NEG]])
; ANY-NEXT:    ret double [[R]]
;
  %neg = fsub double -0.0, %x
  %r = call double @sin(double %neg)
  call void @use(double %neg)
  ret double %r
}

define double @sin_unary_negated_arg_extra_use(double %x) {
; ANY-LABEL: @sin_unary_negated_arg_extra_use(
; ANY-NEXT:    [[NEG:%.*]] = fneg double [[X:%.*]]
; ANY-NEXT:    [[R:%.*]] = call double @sin(double [[NEG]])
; ANY-NEXT:    call void @use(double [[NEG]])
; ANY-NEXT:    ret double [[R]]
;
  %neg = fneg double %x
  %r = call double @sin(double %neg)
  call void @use(double %neg)
  ret double %r
}

; -sin(-x) --> sin(x)
; PR38458: https://bugs.llvm.org/show_bug.cgi?id=38458

define double @neg_sin_negated_arg(double %x) {
; ANY-LABEL: @neg_sin_negated_arg(
; ANY-NEXT:    [[TMP1:%.*]] = call double @sin(double [[X:%.*]])
; ANY-NEXT:    ret double [[TMP1]]
;
  %neg = fsub double -0.0, %x
  %r = call double @sin(double %neg)
  %rn = fsub double -0.0, %r
  ret double %rn
}

define double @unary_neg_sin_unary_negated_arg(double %x) {
; ANY-LABEL: @unary_neg_sin_unary_negated_arg(
; ANY-NEXT:    [[TMP1:%.*]] = call double @sin(double [[X:%.*]])
; ANY-NEXT:    ret double [[TMP1]]
;
  %neg = fneg double %x
  %r = call double @sin(double %neg)
  %rn = fneg double %r
  ret double %rn
}

define double @neg_sin_unary_negated_arg(double %x) {
; ANY-LABEL: @neg_sin_unary_negated_arg(
; ANY-NEXT:    [[TMP1:%.*]] = call double @sin(double [[X:%.*]])
; ANY-NEXT:    ret double [[TMP1]]
;
  %neg = fsub double -0.0, %x
  %r = call double @sin(double %neg)
  %rn = fneg double %r
  ret double %rn
}

define double @unary_neg_sin_negated_arg(double %x) {
; ANY-LABEL: @unary_neg_sin_negated_arg(
; ANY-NEXT:    [[TMP1:%.*]] = call double @sin(double [[X:%.*]])
; ANY-NEXT:    ret double [[TMP1]]
;
  %neg = fneg double %x
  %r = call double @sin(double %neg)
  %rn = fsub double -0.0, %r
  ret double %rn
}

; tan(-x) -> -tan(x);

define double @tan_negated_arg(double %x) {
; ANY-LABEL: @tan_negated_arg(
; ANY-NEXT:    [[TMP1:%.*]] = call double @tan(double [[X:%.*]])
; ANY-NEXT:    [[TMP2:%.*]] = fneg double [[TMP1]]
; ANY-NEXT:    ret double [[TMP2]]
;
  %neg = fsub double -0.0, %x
  %r = call double @tan(double %neg)
  ret double %r
}

define double @tan_negated_arg_tail(double %x) {
; ANY-LABEL: @tan_negated_arg_tail(
; ANY-NEXT:    [[TMP1:%.*]] = tail call double @tan(double [[X:%.*]])
; ANY-NEXT:    [[TMP2:%.*]] = fneg double [[TMP1]]
; ANY-NEXT:    ret double [[TMP2]]
;
  %neg = fsub double -0.0, %x
  %r = tail call double @tan(double %neg)
  ret double %r
}
define double @tan_negated_arg_musttail(double %x) {
; ANY-LABEL: @tan_negated_arg_musttail(
; ANY-NEXT:    [[NEG:%.*]] = fneg double [[X:%.*]]
; ANY-NEXT:    [[R:%.*]] = musttail call double @tan(double [[NEG]])
; ANY-NEXT:    ret double [[R]]
;
  %neg = fsub double -0.0, %x
  %r = musttail call double @tan(double %neg)
  ret double %r
}

define double @tan_unary_negated_arg(double %x) {
; ANY-LABEL: @tan_unary_negated_arg(
; ANY-NEXT:    [[TMP1:%.*]] = call double @tan(double [[X:%.*]])
; ANY-NEXT:    [[TMP2:%.*]] = fneg double [[TMP1]]
; ANY-NEXT:    ret double [[TMP2]]
;
  %neg = fneg double %x
  %r = call double @tan(double %neg)
  ret double %r
}

; tanl(-x) -> -tanl(x);

define fp128 @tanl_negated_arg(fp128 %x) {
; ANY-LABEL: @tanl_negated_arg(
; ANY-NEXT:    [[TMP1:%.*]] = call fp128 @tanl(fp128 [[X:%.*]])
; ANY-NEXT:    [[TMP2:%.*]] = fneg fp128 [[TMP1]]
; ANY-NEXT:    ret fp128 [[TMP2]]
;
  %neg = fsub fp128 0xL00000000000000008000000000000000, %x
  %r = call fp128 @tanl(fp128 %neg)
  ret fp128 %r
}

define fp128 @tanl_unary_negated_arg(fp128 %x) {
; ANY-LABEL: @tanl_unary_negated_arg(
; ANY-NEXT:    [[TMP1:%.*]] = call fp128 @tanl(fp128 [[X:%.*]])
; ANY-NEXT:    [[TMP2:%.*]] = fneg fp128 [[TMP1]]
; ANY-NEXT:    ret fp128 [[TMP2]]
;
  %neg = fneg fp128 %x
  %r = call fp128 @tanl(fp128 %neg)
  ret fp128 %r
}

define float @negated_and_shrinkable_libcall(float %f) {
; NO-FLOAT-SHRINK-LABEL: @negated_and_shrinkable_libcall(
; NO-FLOAT-SHRINK-NEXT:    [[CONV1:%.*]] = fpext float [[F:%.*]] to double
; NO-FLOAT-SHRINK-NEXT:    [[COS1:%.*]] = call double @cos(double [[CONV1]])
; NO-FLOAT-SHRINK-NEXT:    [[CONV2:%.*]] = fptrunc double [[COS1]] to float
; NO-FLOAT-SHRINK-NEXT:    ret float [[CONV2]]
;
; DO-FLOAT-SHRINK-LABEL: @negated_and_shrinkable_libcall(
; DO-FLOAT-SHRINK-NEXT:    [[COSF:%.*]] = call float @cosf(float [[F:%.*]])
; DO-FLOAT-SHRINK-NEXT:    ret float [[COSF]]
;
  %conv1 = fpext float %f to double
  %neg = fsub double -0.0, %conv1
  %cos = call double @cos(double %neg)
  %conv2 = fptrunc double %cos to float
  ret float %conv2
}

define float @unary_negated_and_shrinkable_libcall(float %f) {
; NO-FLOAT-SHRINK-LABEL: @unary_negated_and_shrinkable_libcall(
; NO-FLOAT-SHRINK-NEXT:    [[CONV1:%.*]] = fpext float [[F:%.*]] to double
; NO-FLOAT-SHRINK-NEXT:    [[COS1:%.*]] = call double @cos(double [[CONV1]])
; NO-FLOAT-SHRINK-NEXT:    [[CONV2:%.*]] = fptrunc double [[COS1]] to float
; NO-FLOAT-SHRINK-NEXT:    ret float [[CONV2]]
;
; DO-FLOAT-SHRINK-LABEL: @unary_negated_and_shrinkable_libcall(
; DO-FLOAT-SHRINK-NEXT:    [[COSF:%.*]] = call float @cosf(float [[F:%.*]])
; DO-FLOAT-SHRINK-NEXT:    ret float [[COSF]]
;
  %conv1 = fpext float %f to double
  %neg = fneg double %conv1
  %cos = call double @cos(double %neg)
  %conv2 = fptrunc double %cos to float
  ret float %conv2
}

; TODO: It was ok to shrink the libcall, so the intrinsic should shrink too?

define float @negated_and_shrinkable_intrinsic(float %f) {
; ANY-LABEL: @negated_and_shrinkable_intrinsic(
; ANY-NEXT:    [[CONV1:%.*]] = fpext float [[F:%.*]] to double
; ANY-NEXT:    [[COS:%.*]] = call double @llvm.cos.f64(double [[CONV1]])
; ANY-NEXT:    [[CONV2:%.*]] = fptrunc double [[COS]] to float
; ANY-NEXT:    ret float [[CONV2]]
;
  %conv1 = fpext float %f to double
  %neg = fsub double -0.0, %conv1
  %cos = call double @llvm.cos.f64(double %neg)
  %conv2 = fptrunc double %cos to float
  ret float %conv2
}

define float @unary_negated_and_shrinkable_intrinsic(float %f) {
; ANY-LABEL: @unary_negated_and_shrinkable_intrinsic(
; ANY-NEXT:    [[CONV1:%.*]] = fpext float [[F:%.*]] to double
; ANY-NEXT:    [[COS:%.*]] = call double @llvm.cos.f64(double [[CONV1]])
; ANY-NEXT:    [[CONV2:%.*]] = fptrunc double [[COS]] to float
; ANY-NEXT:    ret float [[CONV2]]
;
  %conv1 = fpext float %f to double
  %neg = fneg double %conv1
  %cos = call double @llvm.cos.f64(double %neg)
  %conv2 = fptrunc double %cos to float
  ret float %conv2
}
