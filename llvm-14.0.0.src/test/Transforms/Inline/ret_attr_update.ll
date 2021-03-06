; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -inline-threshold=0 -always-inline -S | FileCheck %s
; RUN: opt < %s -passes=always-inline -S | FileCheck %s

declare i8* @foo(i8*) nounwind willreturn

define i8* @callee(i8 *%p) alwaysinline {
; CHECK-LABEL: @callee(
; CHECK-NEXT:    [[R:%.*]] = call i8* @foo(i8* noalias [[P:%.*]])
; CHECK-NEXT:    ret i8* [[R]]
;
  %r = call i8* @foo(i8* noalias %p)
  ret i8* %r
}

define i8* @caller(i8* %ptr, i64 %x) {
; CHECK-LABEL: @caller(
; CHECK-NEXT:    [[GEP:%.*]] = getelementptr inbounds i8, i8* [[PTR:%.*]], i64 [[X:%.*]]
; CHECK-NEXT:    [[R_I:%.*]] = call nonnull i8* @foo(i8* noalias [[GEP]])
; CHECK-NEXT:    ret i8* [[R_I]]
;
  %gep = getelementptr inbounds i8, i8* %ptr, i64 %x
  %p = call nonnull i8* @callee(i8* %gep)
  ret i8* %p
}

declare void @llvm.experimental.guard(i1,...)
; Cannot add nonnull attribute to foo
; because the guard is a throwing call
define internal i8* @callee_with_throwable(i8* %p) alwaysinline {
  %r = call i8* @foo(i8* %p)
  %cond = icmp ne i8* %r, null
  call void (i1, ...) @llvm.experimental.guard(i1 %cond) [ "deopt"() ]
  ret i8* %r
}

declare i8* @bar(i8*) readonly nounwind
; Here also we cannot add nonnull attribute to the call bar.
define internal i8* @callee_with_explicit_control_flow(i8* %p) alwaysinline {
  %r = call i8* @bar(i8* %p)
  %cond = icmp ne i8* %r, null
  br i1 %cond, label %ret, label %orig

ret:
  ret i8* %r

orig:
  ret i8* %p
}

define i8* @caller2(i8* %ptr, i64 %x, i1 %cond) {
; CHECK-LABEL: @caller2(
; CHECK-NEXT:    [[GEP:%.*]] = getelementptr inbounds i8, i8* [[PTR:%.*]], i64 [[X:%.*]]
; CHECK-NEXT:    [[R_I:%.*]] = call i8* @foo(i8* [[GEP]])
; CHECK-NEXT:    [[COND_I:%.*]] = icmp ne i8* [[R_I]], null
; CHECK-NEXT:    call void (i1, ...) @llvm.experimental.guard(i1 [[COND_I]]) [ "deopt"() ]
; CHECK-NEXT:    [[R_I1:%.*]] = call i8* @bar(i8* [[GEP]])
; CHECK-NEXT:    [[COND_I2:%.*]] = icmp ne i8* [[R_I1]], null
; CHECK-NEXT:    br i1 [[COND_I2]], label [[RET_I:%.*]], label [[ORIG_I:%.*]]
; CHECK:       ret.i:
; CHECK-NEXT:    br label [[CALLEE_WITH_EXPLICIT_CONTROL_FLOW_EXIT:%.*]]
; CHECK:       orig.i:
; CHECK-NEXT:    br label [[CALLEE_WITH_EXPLICIT_CONTROL_FLOW_EXIT]]
; CHECK:       callee_with_explicit_control_flow.exit:
; CHECK-NEXT:    [[Q3:%.*]] = phi i8* [ [[R_I1]], [[RET_I]] ], [ [[GEP]], [[ORIG_I]] ]
; CHECK-NEXT:    br i1 [[COND:%.*]], label [[PRET:%.*]], label [[QRET:%.*]]
; CHECK:       pret:
; CHECK-NEXT:    ret i8* [[R_I]]
; CHECK:       qret:
; CHECK-NEXT:    ret i8* [[Q3]]
;
  %gep = getelementptr inbounds i8, i8* %ptr, i64 %x
  %p = call nonnull i8* @callee_with_throwable(i8* %gep)
  %q = call nonnull i8* @callee_with_explicit_control_flow(i8* %gep)
  br i1 %cond, label %pret, label %qret

pret:
  ret i8* %p

qret:
  ret i8* %q
}

define internal i8* @callee3(i8 *%p) alwaysinline {
  %r = call noalias i8* @foo(i8* %p)
  ret i8* %r
}

; add the deref attribute to the existing attributes on foo.
define i8* @caller3(i8* %ptr, i64 %x) {
; CHECK-LABEL: @caller3(
; CHECK-NEXT:    [[GEP:%.*]] = getelementptr inbounds i8, i8* [[PTR:%.*]], i64 [[X:%.*]]
; CHECK-NEXT:    [[R_I:%.*]] = call noalias dereferenceable_or_null(12) i8* @foo(i8* [[GEP]])
; CHECK-NEXT:    ret i8* [[R_I]]
;
  %gep = getelementptr inbounds i8, i8* %ptr, i64 %x
  %p = call dereferenceable_or_null(12) i8* @callee3(i8* %gep)
  ret i8* %p
}

declare i8* @inf_loop_call(i8*) nounwind
; We cannot propagate attributes to foo because we do not know whether inf_loop_call
; will return execution.
define internal i8* @callee_with_sideeffect_callsite(i8* %p) alwaysinline {
  %r = call i8* @foo(i8* %p)
  %v = call i8* @inf_loop_call(i8* %p)
  ret i8* %r
}

; do not add deref attribute to foo
define i8* @test4(i8* %ptr, i64 %x) {
; CHECK-LABEL: @test4(
; CHECK-NEXT:    [[GEP:%.*]] = getelementptr inbounds i8, i8* [[PTR:%.*]], i64 [[X:%.*]]
; CHECK-NEXT:    [[R_I:%.*]] = call i8* @foo(i8* [[GEP]])
; CHECK-NEXT:    [[V_I:%.*]] = call i8* @inf_loop_call(i8* [[GEP]])
; CHECK-NEXT:    ret i8* [[R_I]]
;
  %gep = getelementptr inbounds i8, i8* %ptr, i64 %x
  %p = call dereferenceable_or_null(12) i8* @callee_with_sideeffect_callsite(i8* %gep)
  ret i8* %p
}

declare i8* @baz(i8*) nounwind willreturn
define internal i8* @callee5(i8* %p) alwaysinline {
  %r = call i8* @foo(i8* %p)
  %v = call i8* @baz(i8* %p)
  ret i8* %r
}

; add the deref attribute to foo.
define i8* @test5(i8* %ptr, i64 %x) {
; CHECK-LABEL: @test5(
; CHECK-NEXT:    [[GEP:%.*]] = getelementptr inbounds i8, i8* [[PTR:%.*]], i64 [[X:%.*]]
; CHECK-NEXT:    [[R_I:%.*]] = call dereferenceable_or_null(12) i8* @foo(i8* [[GEP]])
; CHECK-NEXT:    [[V_I:%.*]] = call i8* @baz(i8* [[GEP]])
; CHECK-NEXT:    ret i8* [[R_I]]
;
  %gep = getelementptr inbounds i8, i8* %ptr, i64 %x
  %s = call dereferenceable_or_null(12) i8* @callee5(i8* %gep)
  ret i8* %s
}

; deref attributes have different values on the callee and the call feeding into
; the return.
; AttrBuilder overwrites the existing value.
define internal i8* @callee6(i8* %p) alwaysinline {
  %r = call dereferenceable_or_null(16) i8* @foo(i8* %p)
  %v = call i8* @baz(i8* %p)
  ret i8* %r
}


define i8* @test6(i8* %ptr, i64 %x) {
; CHECK-LABEL: @test6(
; CHECK-NEXT:    [[GEP:%.*]] = getelementptr inbounds i8, i8* [[PTR:%.*]], i64 [[X:%.*]]
; CHECK-NEXT:    [[R_I:%.*]] = call dereferenceable_or_null(12) i8* @foo(i8* [[GEP]])
; CHECK-NEXT:    [[V_I:%.*]] = call i8* @baz(i8* [[GEP]])
; CHECK-NEXT:    ret i8* [[R_I]]
;
  %gep = getelementptr inbounds i8, i8* %ptr, i64 %x
  %s = call dereferenceable_or_null(12) i8* @callee6(i8* %gep)
  ret i8* %s
}

; We add the attributes from the callee to both the calls below.
define internal i8* @callee7(i8 *%ptr, i1 %cond) alwaysinline {
  br i1 %cond, label %pass, label %fail

pass:
  %r = call i8* @foo(i8* noalias %ptr)
  ret i8* %r

fail:
  %s = call i8* @baz(i8* %ptr)
  ret i8* %s
}

define void @test7(i8* %ptr, i64 %x, i1 %cond) {
; CHECK-LABEL: @test7(
; CHECK-NEXT:    [[GEP:%.*]] = getelementptr inbounds i8, i8* [[PTR:%.*]], i64 [[X:%.*]]
; CHECK-NEXT:    br i1 [[COND:%.*]], label [[PASS_I:%.*]], label [[FAIL_I:%.*]]
; CHECK:       pass.i:
; CHECK-NEXT:    [[R_I:%.*]] = call nonnull i8* @foo(i8* noalias [[GEP]])
; CHECK-NEXT:    br label [[CALLEE7_EXIT:%.*]]
; CHECK:       fail.i:
; CHECK-NEXT:    [[S_I:%.*]] = call nonnull i8* @baz(i8* [[GEP]])
; CHECK-NEXT:    br label [[CALLEE7_EXIT]]
; CHECK:       callee7.exit:
; CHECK-NEXT:    [[T1:%.*]] = phi i8* [ [[R_I]], [[PASS_I]] ], [ [[S_I]], [[FAIL_I]] ]
; CHECK-NEXT:    call void @snort(i8* [[T1]])
; CHECK-NEXT:    ret void
;

  %gep = getelementptr inbounds i8, i8* %ptr, i64 %x
  %t = call nonnull i8* @callee7(i8* %gep, i1 %cond)
  call void @snort(i8* %t)
  ret void
}
declare void @snort(i8*)

declare i32 @intrinsic(i8*) nounwind argmemonly

define internal i32 @callee8(i8* %ptr) alwaysinline {
  %r = call i32 @intrinsic(i8* noalias %ptr)
  ret i32 %r
}


; signext is an attribute specific to the target ABI and not the
; callee/callsite.
; We cannot propagate that attribute to another call since it can be invalid at
; that call.
define i32 @test8(i8* %ptr, i64 %x) {
; CHECK-LABEL: @test8(
; CHECK-NEXT:    [[GEP:%.*]] = getelementptr inbounds i8, i8* [[PTR:%.*]], i64 [[X:%.*]]
; CHECK-NEXT:    [[R_I:%.*]] = call i32 @intrinsic(i8* noalias [[GEP]])
; CHECK-NEXT:    ret i32 [[R_I]]
;

  %gep = getelementptr inbounds i8, i8* %ptr, i64 %x
  %t = call signext i32 @callee8(i8* %gep)
  ret i32 %t
}
