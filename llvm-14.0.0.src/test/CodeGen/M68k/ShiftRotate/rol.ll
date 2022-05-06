; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=m68k-linux -verify-machineinstrs | FileCheck %s

declare i8 @llvm.fshl.i8(i8, i8, i8)
declare i16 @llvm.fshl.i16(i16, i16, i16)
declare i32 @llvm.fshl.i32(i32, i32, i32)

; op reg, reg

define zeroext i8 @rolb(i8 zeroext %a, i8 zeroext %b) nounwind {
; CHECK-LABEL: rolb:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    move.b (11,%sp), %d0
; CHECK-NEXT:    move.b (7,%sp), %d1
; CHECK-NEXT:    rol.b %d0, %d1
; CHECK-NEXT:    move.l %d1, %d0
; CHECK-NEXT:    and.l #255, %d0
; CHECK-NEXT:    rts
  %1 = tail call i8 @llvm.fshl.i8(i8 %a, i8 %a, i8 %b)
  ret i8 %1
}

define zeroext i16 @rolw(i16 zeroext %a, i16 zeroext %b) nounwind {
; CHECK-LABEL: rolw:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    move.w (10,%sp), %d0
; CHECK-NEXT:    move.w (6,%sp), %d1
; CHECK-NEXT:    rol.w %d0, %d1
; CHECK-NEXT:    move.l %d1, %d0
; CHECK-NEXT:    and.l #65535, %d0
; CHECK-NEXT:    rts
  %1 = tail call i16 @llvm.fshl.i16(i16 %a, i16 %a, i16 %b)
  ret i16 %1
}

define i32 @roll(i32 %a, i32 %b) nounwind {
; CHECK-LABEL: roll:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    move.l (8,%sp), %d1
; CHECK-NEXT:    move.l (4,%sp), %d0
; CHECK-NEXT:    rol.l %d1, %d0
; CHECK-NEXT:    rts
  %1 = tail call i32 @llvm.fshl.i32(i32 %a, i32 %a, i32 %b)
  ret i32 %1
}

; op reg, imm

define zeroext i8 @rolib(i8 zeroext %a) nounwind {
; CHECK-LABEL: rolib:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    move.b (7,%sp), %d0
; CHECK-NEXT:    rol.b #3, %d0
; CHECK-NEXT:    and.l #255, %d0
; CHECK-NEXT:    rts
  %1 = tail call i8 @llvm.fshl.i8(i8 %a, i8 %a, i8 3)
  ret i8 %1
}

define zeroext i16 @roliw(i16 zeroext %a) nounwind {
; CHECK-LABEL: roliw:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    move.w (6,%sp), %d0
; CHECK-NEXT:    rol.w #5, %d0
; CHECK-NEXT:    and.l #65535, %d0
; CHECK-NEXT:    rts
  %1 = tail call i16 @llvm.fshl.i16(i16 %a, i16 %a, i16 5)
  ret i16 %1
}

define i32 @rolil(i32 %a) nounwind {
; CHECK-LABEL: rolil:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    move.l (4,%sp), %d0
; CHECK-NEXT:    rol.l #7, %d0
; CHECK-NEXT:    rts
  %1 = tail call i32 @llvm.fshl.i32(i32 %a, i32 %a, i32 7)
  ret i32 %1
}
