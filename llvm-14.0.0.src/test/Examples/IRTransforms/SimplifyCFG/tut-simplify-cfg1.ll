; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -tut-simplifycfg -tut-simplifycfg-version=v1 -enable-new-pm=0 -S < %s | FileCheck %s
; RUN: opt -tut-simplifycfg -tut-simplifycfg-version=v2 -enable-new-pm=0 -S < %s | FileCheck %s
; RUN: opt -tut-simplifycfg -tut-simplifycfg-version=v3 -enable-new-pm=0 -S < %s | FileCheck %s

define i32 @simp1() {
; CHECK-LABEL: @simp1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    ret i32 10
;
entry:
  br i1 true, label %if.then, label %if.else

if.then:
  ret i32 10

if.else:
  ret i32 12
}

define i32 @simp2() {
; CHECK-LABEL: @simp2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    ret i32 200
;
entry:
  br i1 false, label %if.then, label %if.else

if.then:
  ret i32 99

if.else:
  ret i32 200
}

declare void @foo(i64)

define i64 @merge_into_predecessor(i64 %a, i64 %b) {
; CHECK-LABEL: @merge_into_predecessor(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[R:%.*]] = add i64 [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    call void @foo(i64 [[R]])
; CHECK-NEXT:    call void @foo(i64 [[A]])
; CHECK-NEXT:    ret i64 [[R]]
;
entry:
  br label %bb.next

bb.next:
  %r = add i64 %a, %b
  call void @foo(i64 %r)
  call void @foo(i64 %a)
  br label %bb.next.next

bb.next.next:
  ret i64 %r
}

define i64 @merge_into_predecessor_with_phi(i64 %a, i64 %b, i1 %c) {
; CHECK-LABEL: @merge_into_predecessor_with_phi(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    call void @foo(i64 [[B:%.*]])
; CHECK-NEXT:    [[R:%.*]] = add i64 [[A:%.*]], [[B]]
; CHECK-NEXT:    call void @foo(i64 [[R]])
; CHECK-NEXT:    call void @foo(i64 [[A]])
; CHECK-NEXT:    br i1 [[C:%.*]], label [[BB_NEXT_NEXT:%.*]], label [[BB_EXIT:%.*]]
; CHECK:       bb.next.next:
; CHECK-NEXT:    br label [[BB_EXIT]]
; CHECK:       bb.exit:
; CHECK-NEXT:    [[RET:%.*]] = phi i64 [ [[R]], [[ENTRY:%.*]] ], [ 10, [[BB_NEXT_NEXT]] ]
; CHECK-NEXT:    ret i64 [[RET]]
;
entry:
  call void @foo(i64 %b)
  br label %bb.next

bb.next:
  %r = add i64 %a, %b
  call void @foo(i64 %r)
  call void @foo(i64 %a)
  br i1 %c, label %bb.next.next, label %bb.exit

bb.next.next:
  br label %bb.exit

bb.exit:
  %ret = phi i64 [ %r, %bb.next], [ 10, %bb.next.next]
  ret i64 %ret

}