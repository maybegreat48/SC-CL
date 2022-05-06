; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -o -| FileCheck %s

target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

; This test covers a case where an AArch64 DUP instruction is generated with an
; invalid encoding, resulting in a crash. We don't care about the specific output
; here, only that this case no longer causes said crash.
define dso_local i32 @dupext_crashtest(i32 %e) local_unnamed_addr {
; CHECK-LABEL: dupext_crashtest:
; CHECK:       // %bb.0: // %for.body.lr.ph
; CHECK-NEXT:    mov w8, w0
; CHECK-NEXT:    dup v0.2s, w8
; CHECK-NEXT:  .LBB0_1: // %vector.body
; CHECK-NEXT:    // =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ldr d1, [x8]
; CHECK-NEXT:    smull v1.2d, v0.2s, v1.2s
; CHECK-NEXT:    xtn v1.2s, v1.2d
; CHECK-NEXT:    str d1, [x8]
; CHECK-NEXT:    b .LBB0_1
for.body.lr.ph:
  %conv314 = zext i32 %e to i64
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.lr.ph
  br label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x i64> poison, i64 %conv314, i32 0
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> poison, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %wide.load = load <2 x i32>, <2 x i32>* undef, align 4
  %0 = zext <2 x i32> %wide.load to <2 x i64>
  %1 = mul nuw <2 x i64> %broadcast.splat, %0
  %2 = trunc <2 x i64> %1 to <2 x i32>
  %3 = select <2 x i1> undef, <2 x i32> undef, <2 x i32> %2
  %4 = bitcast i32* undef to <2 x i32>*
  store <2 x i32> %3, <2 x i32>* %4, align 4
  br label %vector.body
}
