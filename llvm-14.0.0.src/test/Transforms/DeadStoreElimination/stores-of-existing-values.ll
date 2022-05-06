; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -basic-aa -dse -dse-optimize-memoryssa=false -S %s | FileCheck --check-prefixes=CHECK,UNOPT %s
; RUN: opt -basic-aa -dse -dse-optimize-memoryssa -S %s | FileCheck --check-prefixes=CHECK,OPT %s
; RUN: opt -basic-aa -dse -S %s | FileCheck --check-prefixes=CHECK,OPT %s

target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"

@a = external global [32 x i8], align 16

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg)

; Test case for PR16520. The store in %if.then is redundant, because the same value
; has been stored earlier to the same location.
define void @test1_pr16520(i1 %b, i8* nocapture %r) {
; CHECK-LABEL: @test1_pr16520(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    store i8 1, i8* [[R:%.*]], align 1
; CHECK-NEXT:    br i1 [[B:%.*]], label [[IF_THEN:%.*]], label [[IF_ELSE:%.*]]
; CHECK:       if.then:
; CHECK-NEXT:    tail call void @fn_mayread_or_clobber()
; CHECK-NEXT:    br label [[IF_END:%.*]]
; CHECK:       if.else:
; CHECK-NEXT:    tail call void @fn_mayread_or_clobber()
; CHECK-NEXT:    br label [[IF_END]]
; CHECK:       if.end:
; CHECK-NEXT:    ret void
;
entry:
  store i8 1, i8* %r, align 1
  br i1 %b, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i8 1, i8* %r, align 1
  tail call void @fn_mayread_or_clobber()
  br label %if.end

if.else:                                          ; preds = %entry
  tail call void @fn_mayread_or_clobber()
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

declare void @fn_mayread_or_clobber()
declare void @fn_readonly() readonly

define void @test2(i1 %b, i8* nocapture %r) {
; CHECK-LABEL: @test2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    store i8 1, i8* [[R:%.*]], align 1
; CHECK-NEXT:    br i1 [[B:%.*]], label [[IF_THEN:%.*]], label [[IF_ELSE:%.*]]
; CHECK:       if.then:
; CHECK-NEXT:    tail call void @fn_readonly()
; CHECK-NEXT:    br label [[IF_END:%.*]]
; CHECK:       if.else:
; CHECK-NEXT:    tail call void @fn_readonly()
; CHECK-NEXT:    br label [[IF_END]]
; CHECK:       if.end:
; CHECK-NEXT:    ret void
;
entry:
  store i8 1, i8* %r, align 1
  br i1 %b, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  tail call void @fn_readonly()
  br label %if.end

if.else:                                          ; preds = %entry
  tail call void @fn_readonly()
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i8 1, i8* %r, align 1
  ret void
}

; Make sure volatile stores are not removed.
define void @test2_volatile(i1 %b, i8* nocapture %r) {
; CHECK-LABEL: @test2_volatile(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    store volatile i8 1, i8* [[R:%.*]], align 1
; CHECK-NEXT:    br i1 [[B:%.*]], label [[IF_THEN:%.*]], label [[IF_ELSE:%.*]]
; CHECK:       if.then:
; CHECK-NEXT:    tail call void @fn_readonly()
; CHECK-NEXT:    br label [[IF_END:%.*]]
; CHECK:       if.else:
; CHECK-NEXT:    tail call void @fn_readonly()
; CHECK-NEXT:    br label [[IF_END]]
; CHECK:       if.end:
; CHECK-NEXT:    store volatile i8 1, i8* [[R]], align 1
; CHECK-NEXT:    ret void
;
entry:
  store volatile i8 1, i8* %r, align 1
  br i1 %b, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  tail call void @fn_readonly()
  br label %if.end

if.else:                                          ; preds = %entry
  tail call void @fn_readonly()
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store volatile i8 1, i8* %r, align 1
  ret void
}

define void @test3(i1 %b, i8* nocapture %r) {
; CHECK-LABEL: @test3(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    store i8 1, i8* [[R:%.*]], align 1
; CHECK-NEXT:    br i1 [[B:%.*]], label [[IF_THEN:%.*]], label [[IF_ELSE:%.*]]
; CHECK:       if.then:
; CHECK-NEXT:    tail call void @fn_mayread_or_clobber()
; CHECK-NEXT:    br label [[IF_END:%.*]]
; CHECK:       if.else:
; CHECK-NEXT:    tail call void @fn_readonly()
; CHECK-NEXT:    br label [[IF_END]]
; CHECK:       if.end:
; CHECK-NEXT:    store i8 1, i8* [[R]], align 1
; CHECK-NEXT:    ret void
;
entry:
  store i8 1, i8* %r, align 1
  br i1 %b, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  tail call void @fn_mayread_or_clobber()
  br label %if.end

if.else:                                          ; preds = %entry
  tail call void @fn_readonly()
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i8 1, i8* %r, align 1
  ret void
}

define void @test4(i1 %b, i8* nocapture %r) {
; CHECK-LABEL: @test4(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    store i8 1, i8* [[R:%.*]], align 1
; CHECK-NEXT:    br i1 [[B:%.*]], label [[IF_THEN:%.*]], label [[IF_ELSE:%.*]]
; CHECK:       if.then:
; CHECK-NEXT:    tail call void @fn_readonly()
; CHECK-NEXT:    br label [[IF_END:%.*]]
; CHECK:       if.else:
; CHECK-NEXT:    tail call void @fn_mayread_or_clobber()
; CHECK-NEXT:    br label [[IF_END]]
; CHECK:       if.end:
; CHECK-NEXT:    store i8 1, i8* [[R]], align 1
; CHECK-NEXT:    ret void
;
entry:
  store i8 1, i8* %r, align 1
  br i1 %b, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  tail call void @fn_readonly()
  br label %if.end

if.else:                                          ; preds = %entry
  tail call void @fn_mayread_or_clobber()
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i8 1, i8* %r, align 1
  ret void
}

define void @test5(i1 %b, i8* nocapture %r) {
; CHECK-LABEL: @test5(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    store i8 1, i8* [[R:%.*]], align 1
; CHECK-NEXT:    br i1 [[B:%.*]], label [[IF_THEN:%.*]], label [[IF_ELSE:%.*]]
; CHECK:       if.then:
; CHECK-NEXT:    tail call void @fn_readonly()
; CHECK-NEXT:    br label [[IF_END:%.*]]
; CHECK:       if.else:
; CHECK-NEXT:    tail call void @fn_mayread_or_clobber()
; CHECK-NEXT:    br label [[IF_END]]
; CHECK:       if.end:
; CHECK-NEXT:    store i8 1, i8* [[R]], align 1
; CHECK-NEXT:    ret void
;
entry:
  store i8 1, i8* %r, align 1
  br i1 %b, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  tail call void @fn_readonly()
  br label %if.end

if.else:                                          ; preds = %entry
  tail call void @fn_mayread_or_clobber()
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i8 1, i8* %r, align 1
  ret void
}

declare i1 @cond() readnone

define void @test6(i32* noalias %P) {
; CHECK-LABEL: @test6(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[FOR_HEADER:%.*]]
; CHECK:       for.header:
; CHECK-NEXT:    store i32 1, i32* [[P:%.*]], align 4
; CHECK-NEXT:    [[C1:%.*]] = call i1 @cond()
; CHECK-NEXT:    br i1 [[C1]], label [[FOR_BODY:%.*]], label [[END:%.*]]
; CHECK:       for.body:
; CHECK-NEXT:    [[LV:%.*]] = load i32, i32* [[P]], align 4
; CHECK-NEXT:    br label [[FOR_HEADER]]
; CHECK:       end:
; CHECK-NEXT:    store i32 3, i32* [[P]], align 4
; CHECK-NEXT:    ret void
;
entry:
  br label %for.header

for.header:
  store i32 1, i32* %P, align 4
  %c1 = call i1 @cond()
  br i1 %c1, label %for.body, label %end

for.body:
  store i32 1, i32* %P, align 4
  %lv = load i32, i32* %P
  br label %for.header

end:
  store i32 3, i32* %P, align 4
  ret void
}

; Make sure the store in %bb3 can be eliminated in the presences of early returns.
define void @test7(i32* noalias %P) {
; CHECK-LABEL: @test7(
; CHECK-NEXT:    store i32 0, i32* [[P:%.*]], align 4
; CHECK-NEXT:    br i1 true, label [[BB1:%.*]], label [[BB2:%.*]]
; CHECK:       bb1:
; CHECK-NEXT:    br label [[BB3:%.*]]
; CHECK:       bb2:
; CHECK-NEXT:    ret void
; CHECK:       bb3:
; CHECK-NEXT:    ret void
;
  store i32 0, i32* %P
  br i1 true, label %bb1, label %bb2
bb1:
  br label %bb3
bb2:
  ret void
bb3:
  store i32 0, i32* %P
  ret void
}

; Make sure the store in %bb3 won't be eliminated because it may be clobbered before.
define void @test8(i32* %P) {
; CHECK-LABEL: @test8(
; CHECK-NEXT:    store i32 0, i32* [[P:%.*]], align 4
; CHECK-NEXT:    br i1 true, label [[BB1:%.*]], label [[BB2:%.*]]
; CHECK:       bb1:
; CHECK-NEXT:    call void @fn_mayread_or_clobber()
; CHECK-NEXT:    br label [[BB3:%.*]]
; CHECK:       bb2:
; CHECK-NEXT:    ret void
; CHECK:       bb3:
; CHECK-NEXT:    store i32 0, i32* [[P]], align 4
; CHECK-NEXT:    ret void
;
  store i32 0, i32* %P
  br i1 true, label %bb1, label %bb2
bb1:
  call void @fn_mayread_or_clobber()
  br label %bb3
bb2:
  ret void
bb3:
  store i32 0, i32* %P
  ret void
}

; Make sure the store in %bb3 will be eliminated because only the early exit path
; may be clobbered.
define void @test9(i32* noalias %P) {
; CHECK-LABEL: @test9(
; CHECK-NEXT:    store i32 0, i32* [[P:%.*]], align 4
; CHECK-NEXT:    br i1 true, label [[BB1:%.*]], label [[BB2:%.*]]
; CHECK:       bb1:
; CHECK-NEXT:    br label [[BB3:%.*]]
; CHECK:       bb2:
; CHECK-NEXT:    call void @fn_mayread_or_clobber()
; CHECK-NEXT:    ret void
; CHECK:       bb3:
; CHECK-NEXT:    ret void
;
  store i32 0, i32* %P
  br i1 true, label %bb1, label %bb2
bb1:
  br label %bb3
bb2:
  call void @fn_mayread_or_clobber()
  ret void
bb3:
  store i32 0, i32* %P
  ret void
}

; The store in bb3 can be eliminated, because the store in bb1 cannot alias it.
define void @test10(i32* noalias %P, i32* %Q, i1 %c) {
; UNOPT-LABEL: @test10(
; UNOPT-NEXT:    store i32 0, i32* [[P:%.*]], align 4
; UNOPT-NEXT:    br i1 [[C:%.*]], label [[BB1:%.*]], label [[BB2:%.*]]
; UNOPT:       bb1:
; UNOPT-NEXT:    store i32 10, i32* [[Q:%.*]], align 4
; UNOPT-NEXT:    br label [[BB3:%.*]]
; UNOPT:       bb2:
; UNOPT-NEXT:    ret void
; UNOPT:       bb3:
; UNOPT-NEXT:    store i32 0, i32* [[P]], align 4
; UNOPT-NEXT:    ret void
;
; OPT-LABEL: @test10(
; OPT-NEXT:    store i32 0, i32* [[P:%.*]], align 4
; OPT-NEXT:    br i1 [[C:%.*]], label [[BB1:%.*]], label [[BB2:%.*]]
; OPT:       bb1:
; OPT-NEXT:    store i32 10, i32* [[Q:%.*]], align 4
; OPT-NEXT:    br label [[BB3:%.*]]
; OPT:       bb2:
; OPT-NEXT:    ret void
; OPT:       bb3:
; OPT-NEXT:    ret void
;
  store i32 0, i32* %P
  br i1 %c, label %bb1, label %bb2

bb1:
  store i32 10, i32* %Q
  br label %bb3

bb2:
  ret void

bb3:
  store i32 0, i32* %P
  ret void
}

define void @test11_smaller_later_store(i32* noalias %P, i32* %Q, i1 %c) {
; CHECK-LABEL: @test11_smaller_later_store(
; CHECK-NEXT:    store i32 0, i32* [[P:%.*]], align 4
; CHECK-NEXT:    br i1 [[C:%.*]], label [[BB1:%.*]], label [[BB2:%.*]]
; CHECK:       bb1:
; CHECK-NEXT:    br label [[BB3:%.*]]
; CHECK:       bb2:
; CHECK-NEXT:    ret void
; CHECK:       bb3:
; CHECK-NEXT:    [[BC:%.*]] = bitcast i32* [[P]] to i8*
; CHECK-NEXT:    store i8 0, i8* [[BC]], align 1
; CHECK-NEXT:    ret void
;
  store i32 0, i32* %P
  br i1 %c, label %bb1, label %bb2

bb1:
  br label %bb3

bb2:
  ret void

bb3:
  %bc = bitcast i32* %P to i8*
  store i8 0, i8* %bc
  ret void
}

define void @test11_smaller_earlier_store(i32* noalias %P, i32* %Q, i1 %c) {
; CHECK-LABEL: @test11_smaller_earlier_store(
; CHECK-NEXT:    [[BC:%.*]] = bitcast i32* [[P:%.*]] to i8*
; CHECK-NEXT:    store i8 0, i8* [[BC]], align 1
; CHECK-NEXT:    br i1 [[C:%.*]], label [[BB1:%.*]], label [[BB2:%.*]]
; CHECK:       bb1:
; CHECK-NEXT:    br label [[BB3:%.*]]
; CHECK:       bb2:
; CHECK-NEXT:    ret void
; CHECK:       bb3:
; CHECK-NEXT:    store i32 0, i32* [[P]], align 4
; CHECK-NEXT:    ret void
;
  %bc = bitcast i32* %P to i8*
  store i8 0, i8* %bc
  br i1 %c, label %bb1, label %bb2

bb1:
  br label %bb3

bb2:
  ret void

bb3:
  store i32 0, i32* %P
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

define void @test12_memset_simple(i8* %ptr) {
; CHECK-LABEL: @test12_memset_simple(
; CHECK-NEXT:    call void @llvm.memset.p0i8.i64(i8* [[PTR:%.*]], i8 0, i64 10, i1 false)
; CHECK-NEXT:    ret void
;
  call void @llvm.memset.p0i8.i64(i8* %ptr, i8 0, i64 10, i1 false)
  %ptr.5 = getelementptr i8, i8* %ptr, i64 4
  store i8 0, i8* %ptr.5
  ret void
}

define void @test12_memset_other_store_in_between(i8* %ptr) {
; UNOPT-LABEL: @test12_memset_other_store_in_between(
; UNOPT-NEXT:    call void @llvm.memset.p0i8.i64(i8* [[PTR:%.*]], i8 0, i64 10, i1 false)
; UNOPT-NEXT:    [[PTR_4:%.*]] = getelementptr i8, i8* [[PTR]], i64 4
; UNOPT-NEXT:    store i8 8, i8* [[PTR_4]], align 1
; UNOPT-NEXT:    [[PTR_5:%.*]] = getelementptr i8, i8* [[PTR]], i64 5
; UNOPT-NEXT:    store i8 0, i8* [[PTR_5]], align 1
; UNOPT-NEXT:    ret void
;
; OPT-LABEL: @test12_memset_other_store_in_between(
; OPT-NEXT:    call void @llvm.memset.p0i8.i64(i8* [[PTR:%.*]], i8 0, i64 10, i1 false)
; OPT-NEXT:    [[PTR_4:%.*]] = getelementptr i8, i8* [[PTR]], i64 4
; OPT-NEXT:    store i8 8, i8* [[PTR_4]], align 1
; OPT-NEXT:    ret void
;
  call void @llvm.memset.p0i8.i64(i8* %ptr, i8 0, i64 10, i1 false)
  %ptr.4 = getelementptr i8, i8* %ptr, i64 4
  store i8 8, i8* %ptr.4
  %ptr.5 = getelementptr i8, i8* %ptr, i64 5
  store i8 0, i8* %ptr.5
  ret void
}

declare i8* @__memset_chk(i8* writeonly, i32, i64, i64) argmemonly writeonly nofree nounwind

define void @test12_memset_chk_other_store_in_between(i8* %ptr) {
; CHECK-LABEL: @test12_memset_chk_other_store_in_between(
; CHECK-NEXT:    [[CALL:%.*]] = tail call i8* @__memset_chk(i8* [[PTR:%.*]], i32 0, i64 10, i64 -1)
; CHECK-NEXT:    [[PTR_4:%.*]] = getelementptr i8, i8* [[PTR]], i64 4
; CHECK-NEXT:    store i8 8, i8* [[PTR_4]], align 1
; CHECK-NEXT:    [[PTR_5:%.*]] = getelementptr i8, i8* [[PTR]], i64 5
; CHECK-NEXT:    store i8 0, i8* [[PTR_5]], align 1
; CHECK-NEXT:    ret void
;
  %call = tail call i8* @__memset_chk(i8* %ptr, i32 0, i64 10, i64 -1)
  %ptr.4 = getelementptr i8, i8* %ptr, i64 4
  store i8 8, i8* %ptr.4
  %ptr.5 = getelementptr i8, i8* %ptr, i64 5
  store i8 0, i8* %ptr.5
  ret void
}

declare void @use(i8*)

define void @test12_memset_chk_other_store_in_between_stack_obj_escape_after(i64 %n) {
; CHECK-LABEL: @test12_memset_chk_other_store_in_between_stack_obj_escape_after(
; CHECK-NEXT:    [[OBJ:%.*]] = alloca [200 x i8], align 1
; CHECK-NEXT:    [[PTR:%.*]] = bitcast [200 x i8]* [[OBJ]] to i8*
; CHECK-NEXT:    [[CALL:%.*]] = tail call i8* @__memset_chk(i8* [[PTR]], i32 0, i64 10, i64 [[N:%.*]])
; CHECK-NEXT:    [[PTR_4:%.*]] = getelementptr i8, i8* [[PTR]], i64 4
; CHECK-NEXT:    store i8 8, i8* [[PTR_4]], align 1
; CHECK-NEXT:    [[PTR_5:%.*]] = getelementptr i8, i8* [[PTR]], i64 5
; CHECK-NEXT:    store i8 0, i8* [[PTR_5]], align 1
; CHECK-NEXT:    call void @use(i8* [[PTR]])
; CHECK-NEXT:    ret void
;
  %obj = alloca [200 x i8]
  %ptr = bitcast [200 x i8]* %obj to i8*
  %call = tail call i8* @__memset_chk(i8* %ptr, i32 0, i64 10, i64 %n)
  %ptr.4 = getelementptr i8, i8* %ptr, i64 4
  store i8 8, i8* %ptr.4
  %ptr.5 = getelementptr i8, i8* %ptr, i64 5
  store i8 0, i8* %ptr.5
  call void @use(i8* %ptr)
  ret void
}

define void @test12_memset_chk_other_store_in_between_stack_obj_escape_before(i64 %n) {
; CHECK-LABEL: @test12_memset_chk_other_store_in_between_stack_obj_escape_before(
; CHECK-NEXT:    [[OBJ:%.*]] = alloca [200 x i8], align 1
; CHECK-NEXT:    [[PTR:%.*]] = bitcast [200 x i8]* [[OBJ]] to i8*
; CHECK-NEXT:    call void @use(i8* [[PTR]])
; CHECK-NEXT:    [[CALL:%.*]] = tail call i8* @__memset_chk(i8* [[PTR]], i32 0, i64 10, i64 [[N:%.*]])
; CHECK-NEXT:    [[PTR_4:%.*]] = getelementptr i8, i8* [[PTR]], i64 4
; CHECK-NEXT:    store i8 8, i8* [[PTR_4]], align 1
; CHECK-NEXT:    [[PTR_5:%.*]] = getelementptr i8, i8* [[PTR]], i64 5
; CHECK-NEXT:    store i8 0, i8* [[PTR_5]], align 1
; CHECK-NEXT:    [[PTR_10:%.*]] = getelementptr i8, i8* [[PTR]], i64 10
; CHECK-NEXT:    store i8 0, i8* [[PTR_10]], align 1
; CHECK-NEXT:    call void @use(i8* [[PTR]])
; CHECK-NEXT:    ret void
;
  %obj = alloca [200 x i8]
  %ptr = bitcast [200 x i8]* %obj to i8*
  call void @use(i8* %ptr)
  %call = tail call i8* @__memset_chk(i8* %ptr, i32 0, i64 10, i64 %n)
  %ptr.4 = getelementptr i8, i8* %ptr, i64 4
  store i8 8, i8* %ptr.4
  %ptr.5 = getelementptr i8, i8* %ptr, i64 5
  store i8 0, i8* %ptr.5
  %ptr.10 = getelementptr i8, i8* %ptr, i64 10
  store i8 0, i8* %ptr.10
  call void @use(i8* %ptr)
  ret void
}

define void @test12_memset_other_store_in_between_partial_overlap(i8* %ptr) {
; CHECK-LABEL: @test12_memset_other_store_in_between_partial_overlap(
; CHECK-NEXT:    call void @llvm.memset.p0i8.i64(i8* [[PTR:%.*]], i8 0, i64 10, i1 false)
; CHECK-NEXT:    [[PTR_4:%.*]] = getelementptr i8, i8* [[PTR]], i64 4
; CHECK-NEXT:    [[BC_4:%.*]] = bitcast i8* [[PTR_4]] to i16*
; CHECK-NEXT:    store i16 8, i16* [[BC_4]], align 2
; CHECK-NEXT:    [[PTR_5:%.*]] = getelementptr i8, i8* [[PTR]], i64 5
; CHECK-NEXT:    [[BC_5:%.*]] = bitcast i8* [[PTR_5]] to i16*
; CHECK-NEXT:    store i16 0, i16* [[BC_5]], align 2
; CHECK-NEXT:    ret void
;
  call void @llvm.memset.p0i8.i64(i8* %ptr, i8 0, i64 10, i1 false)
  %ptr.4 = getelementptr i8, i8* %ptr, i64 4
  %bc.4 = bitcast i8* %ptr.4 to i16*
  store i16 8, i16* %bc.4
  %ptr.5 = getelementptr i8, i8* %ptr, i64 5
  %bc.5 = bitcast i8* %ptr.5 to i16*
  store i16 0, i16* %bc.5
  ret void
}

define void @test12_memset_later_store_exceeds_memset(i8* %ptr) {
; CHECK-LABEL: @test12_memset_later_store_exceeds_memset(
; CHECK-NEXT:    call void @llvm.memset.p0i8.i64(i8* align 1 [[PTR:%.*]], i8 0, i64 8, i1 false)
; CHECK-NEXT:    [[PTR_4:%.*]] = getelementptr i8, i8* [[PTR]], i64 4
; CHECK-NEXT:    store i8 8, i8* [[PTR_4]], align 1
; CHECK-NEXT:    [[PTR_5:%.*]] = getelementptr i8, i8* [[PTR]], i64 8
; CHECK-NEXT:    [[BC:%.*]] = bitcast i8* [[PTR_5]] to i64*
; CHECK-NEXT:    store i64 0, i64* [[BC]], align 8
; CHECK-NEXT:    ret void
;
  call void @llvm.memset.p0i8.i64(i8* %ptr, i8 0, i64 10, i1 false)
  %ptr.4 = getelementptr i8, i8* %ptr, i64 4
  store i8 8, i8* %ptr.4
  %ptr.5 = getelementptr i8, i8* %ptr, i64 8
  %bc = bitcast i8* %ptr.5 to i64*
  store i64 0, i64* %bc
  ret void
}

define void @test12_memset_later_store_before_memset(i8* %ptr) {
; CHECK-LABEL: @test12_memset_later_store_before_memset(
; CHECK-NEXT:    [[PTR_1:%.*]] = getelementptr i8, i8* [[PTR:%.*]], i64 1
; CHECK-NEXT:    [[TMP1:%.*]] = getelementptr inbounds i8, i8* [[PTR_1]], i64 7
; CHECK-NEXT:    call void @llvm.memset.p0i8.i64(i8* align 1 [[TMP1]], i8 0, i64 3, i1 false)
; CHECK-NEXT:    [[BC:%.*]] = bitcast i8* [[PTR]] to i64*
; CHECK-NEXT:    store i64 0, i64* [[BC]], align 8
; CHECK-NEXT:    ret void
;
  %ptr.1 = getelementptr i8, i8* %ptr, i64 1
  call void @llvm.memset.p0i8.i64(i8* %ptr.1, i8 0, i64 10, i1 false)
  %ptr.4 = getelementptr i8, i8* %ptr, i64 4
  store i8 8, i8* %ptr.4
  %bc = bitcast i8* %ptr to i64*
  store i64 0, i64* %bc
  ret void
}

; The memset will be shortened and the store will not be redundant afterwards.
; It cannot be eliminated.
define void @test13_memset_shortened(i64* %ptr) {
; CHECK-LABEL: @test13_memset_shortened(
; CHECK-NEXT:    [[PTR_I8:%.*]] = bitcast i64* [[PTR:%.*]] to i8*
; CHECK-NEXT:    [[TMP1:%.*]] = getelementptr inbounds i8, i8* [[PTR_I8]], i64 8
; CHECK-NEXT:    call void @llvm.memset.p0i8.i64(i8* align 1 [[TMP1]], i8 0, i64 16, i1 false)
; CHECK-NEXT:    store i64 0, i64* [[PTR]], align 8
; CHECK-NEXT:    ret void
;
  %ptr.i8 = bitcast i64* %ptr to i8*
  call void @llvm.memset.p0i8.i64(i8* %ptr.i8, i8 0, i64 24, i1 false)
  store i64 0, i64* %ptr
  ret void
}

declare i8* @strcat(i8*, i8*) nounwind argmemonly

define void @test14_strcat(i8* noalias %P, i8* noalias %Q) {
; CHECK-LABEL: @test14_strcat(
; CHECK-NEXT:    [[CALL1:%.*]] = call i8* @strcat(i8* [[P:%.*]], i8* [[Q:%.*]])
; CHECK-NEXT:    [[CALL2:%.*]] = call i8* @strcat(i8* [[P]], i8* [[Q]])
; CHECK-NEXT:    ret void
;
  %call1 = call i8* @strcat(i8* %P, i8* %Q)
  ; FIXME: Eliminate the second strcat as a "store of existing value" for this particular case, where both strcat's are identical (same source, not just same dest).
  %call2 = call i8* @strcat(i8* %P, i8* %Q)
  ret void
}

define void @pr49927(i32* %q, i32* %p) {
; CHECK-LABEL: @pr49927(
; CHECK-NEXT:    [[V:%.*]] = load i32, i32* [[P:%.*]], align 4
; CHECK-NEXT:    store i32 [[V]], i32* [[Q:%.*]], align 4
; CHECK-NEXT:    store i32 [[V]], i32* [[P]], align 4
; CHECK-NEXT:    ret void
;
  %v = load i32, i32* %p, align 4
  store i32 %v, i32* %q, align 4
  ; FIXME: this store can be eliminated
  store i32 %v, i32* %p, align 4
  ret void
}

define void @pr50339(i8* nocapture readonly %0) {
; CHECK-LABEL: @pr50339(
; CHECK-NEXT:    tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) getelementptr inbounds ([32 x i8], [32 x i8]* @a, i64 0, i64 0), i8* noundef nonnull align 1 dereferenceable(16) [[TMP0:%.*]], i64 16, i1 false)
; CHECK-NEXT:    tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) getelementptr inbounds ([32 x i8], [32 x i8]* @a, i64 0, i64 0), i8* noundef nonnull align 1 dereferenceable(16) [[TMP0]], i64 16, i1 false)
; CHECK-NEXT:    ret void
;
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) getelementptr inbounds ([32 x i8], [32 x i8]* @a, i64 0, i64 0), i8* noundef nonnull align 1 dereferenceable(16) %0, i64 16, i1 false)
  ; FIXME: Eliminate the second memcpy as a "store of existing value" for this particular case, where both memcpy's are identical (same source, not just same dest).
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) getelementptr inbounds ([32 x i8], [32 x i8]* @a, i64 0, i64 0), i8* noundef nonnull align 1 dereferenceable(16) %0, i64 16, i1 false)
  ret void
}

; Cannot remove the second memcpy as redundant store, because %src is modified
; in between.
define i8 @memset_optimized_access(i8* noalias %dst, i8* noalias %src) {
; CHECK-LABEL: @memset_optimized_access(
; CHECK-NEXT:    tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* [[DST:%.*]], i8* [[SRC:%.*]], i64 16, i1 false)
; CHECK-NEXT:    store i8 99, i8* [[SRC]], align 1
; CHECK-NEXT:    [[L:%.*]] = load i8, i8* [[DST]], align 1
; CHECK-NEXT:    tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* [[DST]], i8* [[SRC]], i64 16, i1 false)
; CHECK-NEXT:    ret i8 [[L]]
;
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %dst, i8* %src, i64 16, i1 false)
  store i8 99, i8* %src
  %l = load i8, i8* %dst
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %dst, i8* %src, i64 16, i1 false)
  ret i8 %l
}

; The @use() call is a later non-removable store, but should not affect the
; removal of the store in the if block.
define void @later_non_removable_store(i1 %c, i8* %p) {
; CHECK-LABEL: @later_non_removable_store(
; CHECK-NEXT:    store i8 1, i8* [[P:%.*]], align 1
; CHECK-NEXT:    br i1 [[C:%.*]], label [[IF:%.*]], label [[EXIT:%.*]]
; CHECK:       if:
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    call void @use(i8* [[P]]) #[[ATTR6:[0-9]+]]
; CHECK-NEXT:    ret void
;
  store i8 1, i8* %p
  br i1 %c, label %if, label %exit

if:
  store i8 1, i8* %p
  br label %exit

exit:
  call void @use(i8* %p) argmemonly
  ret void
}
