; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -fast-isel -mtriple=i686-unknown-unknown -O0 -mcpu=knl | FileCheck %s

; ModuleID = 'convert'
source_filename = "convert"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i8** @japi1_convert_690(i8**, i8***, i32) {
; CHECK-LABEL: japi1_convert_690:
; CHECK:       # %bb.0: # %top
; CHECK-NEXT:    subl $12, %esp
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    movl {{[0-9]+}}(%esp), %eax
; CHECK-NEXT:    movl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; CHECK-NEXT:    calll julia.gc_root_decl@PLT
; CHECK-NEXT:    movl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; CHECK-NEXT:    calll jl_get_ptls_states@PLT
; CHECK-NEXT:    # kill: def $ecx killed $eax
; CHECK-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %eax # 4-byte Reload
; CHECK-NEXT:    movl 4(%eax), %eax
; CHECK-NEXT:    movb (%eax), %al
; CHECK-NEXT:    andb $1, %al
; CHECK-NEXT:    movzbl %al, %eax
; CHECK-NEXT:    movl %eax, (%esp)
; CHECK-NEXT:    calll jl_box_int32@PLT
; CHECK-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %ecx # 4-byte Reload
; CHECK-NEXT:    movl %eax, (%ecx)
; CHECK-NEXT:    addl $12, %esp
; CHECK-NEXT:    .cfi_def_cfa_offset 4
; CHECK-NEXT:    retl
top:
  %3 = alloca i8***
  store volatile i8*** %1, i8**** %3
  %4 = call i8*** @julia.gc_root_decl()
  %5 = call i8**** @jl_get_ptls_states()
  %6 = bitcast i8**** %5 to i8***
  %7 = getelementptr i8**, i8*** %6, i64 3
  %8 = bitcast i8*** %7 to i64**
  %9 = load i64*, i64** %8
  %10 = getelementptr i8**, i8*** %1, i64 1
  %11 = load i8**, i8*** %10
  %12 = bitcast i8** %11 to i8*
  %13 = load i8, i8* %12
  %14 = trunc i8 %13 to i1
  %15 = zext i1 %14 to i8
  %16 = zext i8 %15 to i32
  %17 = call i8** @jl_box_int32(i32 signext %16)
  store i8** %17, i8*** %4
  ret i8** %17
}

declare i8**** @jl_get_ptls_states()

declare i8** @jl_box_int32(i32)

declare i8*** @julia.gc_root_decl()
