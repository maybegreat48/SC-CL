; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -dse -S | FileCheck %s

@BUFFER = external dso_local local_unnamed_addr global [0 x i8], align 1

define void @MissedDSEOpportunity(i64 %idx, i1* noalias %cc) {
;
; The DSE pass will try to kill the store in the loop exit block using the
; store in the function exit block. The loop invariant check on the pointer
; used by the stores should trivially return true because a pointer defined
; in the entry block of a function is loop invariant by definition. In fact
; the entry block of a function cannot have predecessors or be part of a loop.
;
; CHECK-LABEL: @MissedDSEOpportunity(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[GEP:%.*]] = getelementptr inbounds [0 x i8], [0 x i8]* @BUFFER, i64 0, i64 [[IDX:%.*]]
; CHECK-NEXT:    [[BC:%.*]] = bitcast i8* [[GEP]] to i64*
; CHECK-NEXT:    [[CC0:%.*]] = load volatile i1, i1* [[CC:%.*]], align 1
; CHECK-NEXT:    br i1 [[CC0]], label [[HEAD:%.*]], label [[EXIT:%.*]]
; CHECK:       head:
; CHECK-NEXT:    [[CC1:%.*]] = load volatile i1, i1* [[CC]], align 1
; CHECK-NEXT:    br i1 [[CC1]], label [[HEAD]], label [[EXIT_LOOPEXIT:%.*]]
; CHECK:       exit.loopexit:
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    store i64 0, i64* [[BC]], align 4
; CHECK-NEXT:    ret void
;
entry:
  ; The entry block cannot have predecessors or be part of a loop
  %gep = getelementptr inbounds [0 x i8], [0 x i8]* @BUFFER, i64 0, i64 %idx
  %bc = bitcast i8* %gep to i64*
  %cc0 = load volatile i1, i1* %cc, align 1
  br i1 %cc0, label %head, label %exit

head:                                             ; preds = %entry, %head
  %cc1 = load volatile i1, i1* %cc, align 1
  br i1 %cc1, label %head, label %exit.loopexit

exit.loopexit:                                    ; preds = %head
  ; Dead store
  store i64 2, i64* %bc, align 4
  br label %exit

exit:                                             ; preds = %exit.loopexit, %entry
  ; Killer store
  store i64 0, i64* %bc, align 4
  ret void
}