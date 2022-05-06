; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -loop-vectorize -force-vector-width=2 -S -prefer-predicate-over-epilogue=predicate-dont-vectorize %s | FileCheck %s


; Test case for PR46525. There are two candidates to pick for
; `udiv i64 %y, %add` when expanding SCEV expressions. Make sure we pick %div,
; which dominates the vector loop.

define void @test(i16 %x, i64 %y, i32* %ptr) {
; CHECK-LABEL: @test(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CONV19:%.*]] = sext i16 [[X:%.*]] to i64
; CHECK-NEXT:    [[ADD:%.*]] = add i64 [[CONV19]], 492802768830814067
; CHECK-NEXT:    br label [[LOOP_PREHEADER:%.*]]
; CHECK:       loop.preheader:
; CHECK-NEXT:    [[DIV:%.*]] = udiv i64 [[Y:%.*]], [[ADD]]
; CHECK-NEXT:    [[INC:%.*]] = add i64 [[DIV]], 1
; CHECK-NEXT:    [[TMP0:%.*]] = add nuw nsw i64 [[DIV]], 4
; CHECK-NEXT:    [[TMP1:%.*]] = udiv i64 [[TMP0]], [[INC]]
; CHECK-NEXT:    [[TMP2:%.*]] = add nuw nsw i64 [[TMP1]], 1
; CHECK-NEXT:    br i1 false, label [[SCALAR_PH:%.*]], label [[VECTOR_PH:%.*]]
; CHECK:       vector.ph:
; CHECK-NEXT:    [[N_RND_UP:%.*]] = add i64 [[TMP2]], 1
; CHECK-NEXT:    [[N_MOD_VF:%.*]] = urem i64 [[N_RND_UP]], 2
; CHECK-NEXT:    [[N_VEC:%.*]] = sub i64 [[N_RND_UP]], [[N_MOD_VF]]
; CHECK-NEXT:    [[IND_END:%.*]] = mul i64 [[N_VEC]], [[INC]]
; CHECK-NEXT:    [[TRIP_COUNT_MINUS_1:%.*]] = sub i64 [[TMP2]], 1
; CHECK-NEXT:    [[BROADCAST_SPLATINSERT:%.*]] = insertelement <2 x i64> poison, i64 [[TRIP_COUNT_MINUS_1]], i32 0
; CHECK-NEXT:    [[BROADCAST_SPLAT:%.*]] = shufflevector <2 x i64> [[BROADCAST_SPLATINSERT]], <2 x i64> poison, <2 x i32> zeroinitializer
; CHECK-NEXT:    br label [[VECTOR_BODY:%.*]]
; CHECK:       vector.body:
; CHECK-NEXT:    [[INDEX:%.*]] = phi i64 [ 0, [[VECTOR_PH]] ], [ [[INDEX_NEXT:%.*]], [[PRED_STORE_CONTINUE12:%.*]] ]
; CHECK-NEXT:    [[OFFSET_IDX:%.*]] = mul i64 [[INDEX]], [[INC]]
; CHECK-NEXT:    [[TMP4:%.*]] = mul i64 0, [[INC]]
; CHECK-NEXT:    [[TMP5:%.*]] = add i64 [[OFFSET_IDX]], [[TMP4]]
; CHECK-NEXT:    [[OFFSET_IDX3:%.*]] = mul i64 [[INDEX]], [[INC]]
; CHECK-NEXT:    [[TMP6:%.*]] = trunc i64 [[OFFSET_IDX3]] to i8
; CHECK-NEXT:    [[TMP7:%.*]] = trunc i64 [[INC]] to i8
; CHECK-NEXT:    [[TMP9:%.*]] = mul i8 0, [[TMP7]]
; CHECK-NEXT:    [[TMP10:%.*]] = add i8 [[TMP6]], [[TMP9]]
; CHECK-NEXT:    [[BROADCAST_SPLATINSERT9:%.*]] = insertelement <2 x i64> poison, i64 [[INDEX]], i32 0
; CHECK-NEXT:    [[BROADCAST_SPLAT10:%.*]] = shufflevector <2 x i64> [[BROADCAST_SPLATINSERT9]], <2 x i64> poison, <2 x i32> zeroinitializer
; CHECK-NEXT:    [[VEC_IV:%.*]] = add <2 x i64> [[BROADCAST_SPLAT10]], <i64 0, i64 1>
; CHECK-NEXT:    [[TMP11:%.*]] = icmp ule <2 x i64> [[VEC_IV]], [[BROADCAST_SPLAT]]
; CHECK-NEXT:    [[TMP12:%.*]] = extractelement <2 x i1> [[TMP11]], i32 0
; CHECK-NEXT:    br i1 [[TMP12]], label [[PRED_STORE_IF:%.*]], label [[PRED_STORE_CONTINUE:%.*]]
; CHECK:       pred.store.if:
; CHECK-NEXT:    store i32 0, i32* [[PTR:%.*]], align 4
; CHECK-NEXT:    br label [[PRED_STORE_CONTINUE]]
; CHECK:       pred.store.continue:
; CHECK-NEXT:    [[TMP13:%.*]] = extractelement <2 x i1> [[TMP11]], i32 1
; CHECK-NEXT:    br i1 [[TMP13]], label [[PRED_STORE_IF11:%.*]], label [[PRED_STORE_CONTINUE12]]
; CHECK:       pred.store.if4:
; CHECK-NEXT:    store i32 0, i32* [[PTR]], align 4
; CHECK-NEXT:    br label [[PRED_STORE_CONTINUE12]]
; CHECK:       pred.store.continue5:
; CHECK-NEXT:    [[TMP14:%.*]] = add i8 [[TMP10]], 1
; CHECK-NEXT:    [[INDEX_NEXT]] = add i64 [[INDEX]], 2
; CHECK-NEXT:    [[TMP15:%.*]] = icmp eq i64 [[INDEX_NEXT]], [[N_VEC]]
; CHECK-NEXT:    br i1 [[TMP15]], label [[MIDDLE_BLOCK:%.*]], label [[VECTOR_BODY]], !llvm.loop [[LOOP0:![0-9]+]]
; CHECK:       middle.block:
; CHECK-NEXT:    br i1 true, label [[LOOP_EXIT:%.*]], label [[SCALAR_PH]]
; CHECK:       scalar.ph:
; CHECK-NEXT:    [[BC_RESUME_VAL:%.*]] = phi i64 [ [[IND_END]], [[MIDDLE_BLOCK]] ], [ 0, [[LOOP_PREHEADER]] ]
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[IV:%.*]] = phi i64 [ [[IV_NEXT:%.*]], [[LOOP]] ], [ [[BC_RESUME_VAL]], [[SCALAR_PH]] ]
; CHECK-NEXT:    store i32 0, i32* [[PTR]], align 4
; CHECK-NEXT:    [[V2:%.*]] = trunc i64 [[IV]] to i8
; CHECK-NEXT:    [[V3:%.*]] = add i8 [[V2]], 1
; CHECK-NEXT:    [[CMP15:%.*]] = icmp slt i8 [[V3]], 5
; CHECK-NEXT:    [[IV_NEXT]] = add i64 [[IV]], [[INC]]
; CHECK-NEXT:    br i1 [[CMP15]], label [[LOOP]], label [[LOOP_EXIT]], !llvm.loop [[LOOP2:![0-9]+]]
; CHECK:       loop.exit:
; CHECK-NEXT:    [[DIV_1:%.*]] = udiv i64 [[Y]], [[ADD]]
; CHECK-NEXT:    [[V1:%.*]] = add i64 [[DIV_1]], 1
; CHECK-NEXT:    br label [[LOOP_2:%.*]]
; CHECK:       loop.2:
; CHECK-NEXT:    [[IV_1:%.*]] = phi i64 [ [[IV_NEXT_1:%.*]], [[LOOP_2]] ], [ 0, [[LOOP_EXIT]] ]
; CHECK-NEXT:    [[IV_NEXT_1]] = add i64 [[IV_1]], [[V1]]
; CHECK-NEXT:    call void @use(i64 [[IV_NEXT_1]])
; CHECK-NEXT:    [[EC:%.*]] = icmp ult i64 [[IV_NEXT_1]], 200
; CHECK-NEXT:    br i1 [[EC]], label [[LOOP_2]], label [[LOOP_2_EXIT:%.*]]
; CHECK:       loop.2.exit:
; CHECK-NEXT:    [[C:%.*]] = call i1 @cond()
; CHECK-NEXT:    br i1 [[C]], label [[LOOP_PREHEADER]], label [[EXIT:%.*]]
; CHECK:       exit:
; CHECK-NEXT:    ret void
;
entry:
  %conv19 = sext i16 %x to i64
  %add = add i64 %conv19, 492802768830814067
  br label %loop.preheader

loop.preheader:
  %div = udiv i64 %y, %add
  %inc = add i64 %div, 1
  br label %loop

loop:
  %iv = phi i64 [ %iv.next, %loop ], [ 0, %loop.preheader ]
  store i32 0, i32* %ptr, align 4
  %v2 = trunc i64 %iv to i8
  %v3 = add i8 %v2, 1
  %cmp15 = icmp slt i8 %v3, 5
  %iv.next = add i64 %iv, %inc
  br i1 %cmp15, label %loop, label %loop.exit

loop.exit:
  %div.1 = udiv i64 %y, %add
  %v1 = add i64 %div.1, 1
  br label %loop.2

loop.2:
  %iv.1 = phi i64 [ %iv.next.1, %loop.2 ], [ 0, %loop.exit ]
  %iv.next.1 = add i64 %iv.1, %v1
  call void @use(i64 %iv.next.1)
  %ec = icmp ult i64 %iv.next.1, 200
  br i1 %ec, label %loop.2, label %loop.2.exit

loop.2.exit:
  %c = call i1 @cond()
  br i1 %c, label %loop.preheader, label %exit

exit:
  ret void
}

declare void @use(i64)
declare i1 @cond()
