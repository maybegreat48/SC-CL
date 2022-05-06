; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=thumbv8.1m.main-none-none-eabi -mattr=+mve -verify-machineinstrs %s -o - | FileCheck %s

define arm_aapcs_vfpcc <4 x i32> @sext_v4i32_v4i32_v4i1(<4 x i32> %m) {
; CHECK-LABEL: sext_v4i32_v4i32_v4i1:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vshl.i32 q0, q0, #31
; CHECK-NEXT:    vshr.s32 q0, q0, #31
; CHECK-NEXT:    bx lr
entry:
  %shl = shl <4 x i32> %m, <i32 31, i32 31, i32 31, i32 31>
  %shr = ashr exact <4 x i32> %shl, <i32 31, i32 31, i32 31, i32 31>
  ret <4 x i32> %shr
}

define arm_aapcs_vfpcc <4 x i32> @sext_v4i32_v4i32_v4i8(<4 x i32> %m) {
; CHECK-LABEL: sext_v4i32_v4i32_v4i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmovlb.s8 q0, q0
; CHECK-NEXT:    vmovlb.s16 q0, q0
; CHECK-NEXT:    bx lr
entry:
  %shl = shl <4 x i32> %m, <i32 24, i32 24, i32 24, i32 24>
  %shr = ashr exact <4 x i32> %shl, <i32 24, i32 24, i32 24, i32 24>
  ret <4 x i32> %shr
}

define arm_aapcs_vfpcc <4 x i32> @sext_v4i32_v4i32_v4i16(<4 x i32> %m) {
; CHECK-LABEL: sext_v4i32_v4i32_v4i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmovlb.s16 q0, q0
; CHECK-NEXT:    bx lr
entry:
  %shl = shl <4 x i32> %m, <i32 16, i32 16, i32 16, i32 16>
  %shr = ashr exact <4 x i32> %shl, <i32 16, i32 16, i32 16, i32 16>
  ret <4 x i32> %shr
}

define arm_aapcs_vfpcc <8 x i16> @sext_v8i16_v8i16_v8i8(<8 x i16> %m) {
; CHECK-LABEL: sext_v8i16_v8i16_v8i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmovlb.s8 q0, q0
; CHECK-NEXT:    bx lr
entry:
  %shl = shl <8 x i16> %m, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %shr = ashr exact <8 x i16> %shl, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  ret <8 x i16> %shr
}

define arm_aapcs_vfpcc <8 x i16> @sext_v8i16_v8i16_v8i1(<8 x i16> %m) {
; CHECK-LABEL: sext_v8i16_v8i16_v8i1:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vshl.i16 q0, q0, #15
; CHECK-NEXT:    vshr.s16 q0, q0, #15
; CHECK-NEXT:    bx lr
entry:
  %shl = shl <8 x i16> %m, <i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15>
  %shr = ashr exact <8 x i16> %shl, <i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15>
  ret <8 x i16> %shr
}

define arm_aapcs_vfpcc <2 x i64> @sext_v2i64_v2i64_v2i32(<2 x i64> %m) {
; CHECK-LABEL: sext_v2i64_v2i64_v2i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov r0, s2
; CHECK-NEXT:    vmov r1, s0
; CHECK-NEXT:    vmov q0[2], q0[0], r1, r0
; CHECK-NEXT:    asrs r0, r0, #31
; CHECK-NEXT:    asrs r1, r1, #31
; CHECK-NEXT:    vmov q0[3], q0[1], r1, r0
; CHECK-NEXT:    bx lr
entry:
  %shl = shl <2 x i64> %m, <i64 32, i64 32>
  %shr = ashr exact <2 x i64> %shl, <i64 32, i64 32>
  ret <2 x i64> %shr
}

define arm_aapcs_vfpcc <2 x i64> @sext_v2i64_v2i64_v2i35(<2 x i64> %m) {
; CHECK-LABEL: sext_v2i64_v2i64_v2i35:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov r0, r1, d1
; CHECK-NEXT:    vmov r2, r3, d0
; CHECK-NEXT:    vmov q0[2], q0[0], r2, r0
; CHECK-NEXT:    sbfx r0, r1, #0, #3
; CHECK-NEXT:    sbfx r1, r3, #0, #3
; CHECK-NEXT:    vmov q0[3], q0[1], r1, r0
; CHECK-NEXT:    bx lr
entry:
  %shl = shl <2 x i64> %m, <i64 29, i64 29>
  %shr = ashr exact <2 x i64> %shl, <i64 29, i64 29>
  ret <2 x i64> %shr
}

define arm_aapcs_vfpcc <8 x i16> @sext_v8i8_v8i16(<8 x i8> %src) {
; CHECK-LABEL: sext_v8i8_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmovlb.s8 q0, q0
; CHECK-NEXT:    bx lr
entry:
  %0 = sext <8 x i8> %src to <8 x i16>
  ret <8 x i16> %0
}

define arm_aapcs_vfpcc <4 x i32> @sext_v4i16_v4i32(<4 x i16> %src) {
; CHECK-LABEL: sext_v4i16_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmovlb.s16 q0, q0
; CHECK-NEXT:    bx lr
entry:
  %0 = sext <4 x i16> %src to <4 x i32>
  ret <4 x i32> %0
}

define arm_aapcs_vfpcc <4 x i32> @sext_v4i8_v4i32(<4 x i8> %src) {
; CHECK-LABEL: sext_v4i8_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmovlb.s8 q0, q0
; CHECK-NEXT:    vmovlb.s16 q0, q0
; CHECK-NEXT:    bx lr
entry:
  %0 = sext <4 x i8> %src to <4 x i32>
  ret <4 x i32> %0
}

define arm_aapcs_vfpcc <16 x i16> @sext_v16i8_v16i16(<16 x i8> %src) {
; CHECK-LABEL: sext_v16i8_v16i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .pad #16
; CHECK-NEXT:    sub sp, #16
; CHECK-NEXT:    mov r0, sp
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    vldrb.s16 q0, [r0]
; CHECK-NEXT:    vldrb.s16 q1, [r0, #8]
; CHECK-NEXT:    add sp, #16
; CHECK-NEXT:    bx lr
entry:
  %0 = sext <16 x i8> %src to <16 x i16>
  ret <16 x i16> %0
}

define arm_aapcs_vfpcc <8 x i32> @sext_v8i16_v8i32(<8 x i16> %src) {
; CHECK-LABEL: sext_v8i16_v8i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .pad #16
; CHECK-NEXT:    sub sp, #16
; CHECK-NEXT:    mov r0, sp
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    vldrh.s32 q0, [r0]
; CHECK-NEXT:    vldrh.s32 q1, [r0, #8]
; CHECK-NEXT:    add sp, #16
; CHECK-NEXT:    bx lr
entry:
  %0 = sext <8 x i16> %src to <8 x i32>
  ret <8 x i32> %0
}

define arm_aapcs_vfpcc <16 x i32> @sext_v16i8_v16i32(<16 x i8> %src) {
; CHECK-LABEL: sext_v16i8_v16i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .pad #48
; CHECK-NEXT:    sub sp, #48
; CHECK-NEXT:    mov r0, sp
; CHECK-NEXT:    add r1, sp, #32
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    vldrb.s16 q0, [r0]
; CHECK-NEXT:    vstrw.32 q0, [r1]
; CHECK-NEXT:    vldrb.s16 q0, [r0, #8]
; CHECK-NEXT:    add r0, sp, #16
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    vldrh.s32 q0, [r1]
; CHECK-NEXT:    vldrh.s32 q1, [r1, #8]
; CHECK-NEXT:    vldrh.s32 q2, [r0]
; CHECK-NEXT:    vldrh.s32 q3, [r0, #8]
; CHECK-NEXT:    add sp, #48
; CHECK-NEXT:    bx lr
entry:
  %0 = sext <16 x i8> %src to <16 x i32>
  ret <16 x i32> %0
}

define arm_aapcs_vfpcc <2 x i64> @sext_v2i32_v2i64(<2 x i32> %src) {
; CHECK-LABEL: sext_v2i32_v2i64:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov r0, s2
; CHECK-NEXT:    vmov r1, s0
; CHECK-NEXT:    vmov q0[2], q0[0], r1, r0
; CHECK-NEXT:    asrs r0, r0, #31
; CHECK-NEXT:    asrs r1, r1, #31
; CHECK-NEXT:    vmov q0[3], q0[1], r1, r0
; CHECK-NEXT:    bx lr
entry:
  %0 = sext <2 x i32> %src to <2 x i64>
  ret <2 x i64> %0
}


define arm_aapcs_vfpcc <8 x i16> @zext_v8i8_v8i16(<8 x i8> %src) {
; CHECK-LABEL: zext_v8i8_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmovlb.u8 q0, q0
; CHECK-NEXT:    bx lr
entry:
  %0 = zext <8 x i8> %src to <8 x i16>
  ret <8 x i16> %0
}

define arm_aapcs_vfpcc <4 x i32> @zext_v4i16_v4i32(<4 x i16> %src) {
; CHECK-LABEL: zext_v4i16_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmovlb.u16 q0, q0
; CHECK-NEXT:    bx lr
entry:
  %0 = zext <4 x i16> %src to <4 x i32>
  ret <4 x i32> %0
}

define arm_aapcs_vfpcc <4 x i32> @zext_v4i8_v4i32(<4 x i8> %src) {
; CHECK-LABEL: zext_v4i8_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.i32 q1, #0xff
; CHECK-NEXT:    vand q0, q0, q1
; CHECK-NEXT:    bx lr
entry:
  %0 = zext <4 x i8> %src to <4 x i32>
  ret <4 x i32> %0
}

define arm_aapcs_vfpcc <16 x i16> @zext_v16i8_v16i16(<16 x i8> %src) {
; CHECK-LABEL: zext_v16i8_v16i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .pad #16
; CHECK-NEXT:    sub sp, #16
; CHECK-NEXT:    mov r0, sp
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    vldrb.u16 q0, [r0]
; CHECK-NEXT:    vldrb.u16 q1, [r0, #8]
; CHECK-NEXT:    add sp, #16
; CHECK-NEXT:    bx lr
entry:
  %0 = zext <16 x i8> %src to <16 x i16>
  ret <16 x i16> %0
}

define arm_aapcs_vfpcc <8 x i32> @zext_v8i16_v8i32(<8 x i16> %src) {
; CHECK-LABEL: zext_v8i16_v8i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .pad #16
; CHECK-NEXT:    sub sp, #16
; CHECK-NEXT:    mov r0, sp
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    vldrh.u32 q0, [r0]
; CHECK-NEXT:    vldrh.u32 q1, [r0, #8]
; CHECK-NEXT:    add sp, #16
; CHECK-NEXT:    bx lr
entry:
  %0 = zext <8 x i16> %src to <8 x i32>
  ret <8 x i32> %0
}

define arm_aapcs_vfpcc <16 x i32> @zext_v16i8_v16i32(<16 x i8> %src) {
; CHECK-LABEL: zext_v16i8_v16i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .pad #48
; CHECK-NEXT:    sub sp, #48
; CHECK-NEXT:    mov r0, sp
; CHECK-NEXT:    add r1, sp, #32
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    vldrb.u16 q0, [r0]
; CHECK-NEXT:    vstrw.32 q0, [r1]
; CHECK-NEXT:    vldrb.u16 q0, [r0, #8]
; CHECK-NEXT:    add r0, sp, #16
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    vldrh.u32 q0, [r1]
; CHECK-NEXT:    vldrh.u32 q1, [r1, #8]
; CHECK-NEXT:    vldrh.u32 q2, [r0]
; CHECK-NEXT:    vldrh.u32 q3, [r0, #8]
; CHECK-NEXT:    add sp, #48
; CHECK-NEXT:    bx lr
entry:
  %0 = zext <16 x i8> %src to <16 x i32>
  ret <16 x i32> %0
}

define arm_aapcs_vfpcc <2 x i64> @zext_v2i32_v2i64(<2 x i32> %src) {
; CHECK-LABEL: zext_v2i32_v2i64:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.i64 q1, #0xffffffff
; CHECK-NEXT:    vand q0, q0, q1
; CHECK-NEXT:    bx lr
entry:
  %0 = zext <2 x i32> %src to <2 x i64>
  ret <2 x i64> %0
}


define arm_aapcs_vfpcc <8 x i8> @trunc_v8i16_v8i8(<8 x i16> %src) {
; CHECK-LABEL: trunc_v8i16_v8i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <8 x i16> %src to <8 x i8>
  ret <8 x i8> %0
}

define arm_aapcs_vfpcc <4 x i16> @trunc_v4i32_v4i16(<4 x i32> %src) {
; CHECK-LABEL: trunc_v4i32_v4i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <4 x i32> %src to <4 x i16>
  ret <4 x i16> %0
}

define arm_aapcs_vfpcc <4 x i8> @trunc_v4i32_v4i8(<4 x i32> %src) {
; CHECK-LABEL: trunc_v4i32_v4i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <4 x i32> %src to <4 x i8>
  ret <4 x i8> %0
}

define arm_aapcs_vfpcc <16 x i8> @trunc_v16i16_v16i8(<16 x i16> %src) {
; CHECK-LABEL: trunc_v16i16_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .pad #16
; CHECK-NEXT:    sub sp, #16
; CHECK-NEXT:    mov r0, sp
; CHECK-NEXT:    vstrb.16 q1, [r0, #8]
; CHECK-NEXT:    vstrb.16 q0, [r0]
; CHECK-NEXT:    vldrw.u32 q0, [r0]
; CHECK-NEXT:    add sp, #16
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <16 x i16> %src to <16 x i8>
  ret <16 x i8> %0
}

define arm_aapcs_vfpcc <8 x i16> @trunc_v8i32_v8i16(<8 x i32> %src) {
; CHECK-LABEL: trunc_v8i32_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .pad #16
; CHECK-NEXT:    sub sp, #16
; CHECK-NEXT:    mov r0, sp
; CHECK-NEXT:    vstrh.32 q1, [r0, #8]
; CHECK-NEXT:    vstrh.32 q0, [r0]
; CHECK-NEXT:    vldrw.u32 q0, [r0]
; CHECK-NEXT:    add sp, #16
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <8 x i32> %src to <8 x i16>
  ret <8 x i16> %0
}

define arm_aapcs_vfpcc <16 x i8> @trunc_v16i32_v16i8(<16 x i32> %src) {
; CHECK-LABEL: trunc_v16i32_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .pad #16
; CHECK-NEXT:    sub sp, #16
; CHECK-NEXT:    mov r0, sp
; CHECK-NEXT:    vstrb.32 q3, [r0, #12]
; CHECK-NEXT:    vstrb.32 q2, [r0, #8]
; CHECK-NEXT:    vstrb.32 q1, [r0, #4]
; CHECK-NEXT:    vstrb.32 q0, [r0]
; CHECK-NEXT:    vldrw.u32 q0, [r0]
; CHECK-NEXT:    add sp, #16
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <16 x i32> %src to <16 x i8>
  ret <16 x i8> %0
}

define arm_aapcs_vfpcc <2 x i32> @trunc_v2i64_v2i32(<2 x i64> %src) {
; CHECK-LABEL: trunc_v2i64_v2i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <2 x i64> %src to <2 x i32>
  ret <2 x i32> %0
}

