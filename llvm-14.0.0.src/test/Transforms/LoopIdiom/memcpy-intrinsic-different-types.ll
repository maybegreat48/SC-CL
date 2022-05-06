; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -loop-idiom < %s -S | FileCheck %s

; #include <vector>
;
; class SDValue {
;     int A;
;     int B;
;     unsigned C;
; };
;
; class SDUse {
;     SDValue Val;
;     SDUse **Prev = nullptr;
;     SDUse *Next = nullptr;
;
; public:
;     operator const SDValue&() const { return Val; }
; };
;
; void foo(SDUse *S, int N) {
;     // Should not hoist memcpy because source and destination are of different types
;     std::vector<SDValue> Ops(S, S + N);
; }

; ModuleID = 'different_types.cpp'
source_filename = "different_types.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%class.SDUse = type { %class.SDValue, %class.SDUse**, %class.SDUse* }
%class.SDValue = type { i32, i32, i32 }

declare dso_local i32 @__gxx_personality_v0(...)

; Function Attrs: uwtable mustprogress
define linkonce_odr dso_local %class.SDValue* @_ZNSt20__uninitialized_copyILb0EE13__uninit_copyIP5SDUseP7SDValueEET0_T_S7_S6_(%class.SDUse* %__first, %class.SDUse* %__last, %class.SDValue* %__result) local_unnamed_addr #0  align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
; CHECK-LABEL: @_ZNSt20__uninitialized_copyILb0EE13__uninit_copyIP5SDUseP7SDValueEET0_T_S7_S6_(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP_NOT15:%.*]] = icmp eq %class.SDUse* [[__FIRST:%.*]], [[__LAST:%.*]]
; CHECK-NEXT:    br i1 [[CMP_NOT15]], label [[FOR_END:%.*]], label [[FOR_INC_PREHEADER:%.*]]
; CHECK:       for.inc.preheader:
; CHECK-NEXT:    br label [[FOR_INC:%.*]]
; CHECK:       for.inc:
; CHECK-NEXT:    [[__CUR_017:%.*]] = phi %class.SDValue* [ [[INCDEC_PTR1:%.*]], [[FOR_INC]] ], [ [[__RESULT:%.*]], [[FOR_INC_PREHEADER]] ]
; CHECK-NEXT:    [[__FIRST_ADDR_016:%.*]] = phi %class.SDUse* [ [[INCDEC_PTR:%.*]], [[FOR_INC]] ], [ [[__FIRST]], [[FOR_INC_PREHEADER]] ]
; CHECK-NEXT:    [[TMP0:%.*]] = bitcast %class.SDValue* [[__CUR_017]] to i8*
; CHECK-NEXT:    [[TMP1:%.*]] = bitcast %class.SDUse* [[__FIRST_ADDR_016]] to i8*
; CHECK-NEXT:    tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(12) [[TMP0]], i8* noundef nonnull align 8 dereferenceable(12) [[TMP1]], i64 12, i1 false)
; CHECK-NEXT:    [[INCDEC_PTR]] = getelementptr inbounds [[CLASS_SDUSE:%.*]], %class.SDUse* [[__FIRST_ADDR_016]], i64 1
; CHECK-NEXT:    [[INCDEC_PTR1]] = getelementptr inbounds [[CLASS_SDVALUE:%.*]], %class.SDValue* [[__CUR_017]], i64 1
; CHECK-NEXT:    [[CMP_NOT:%.*]] = icmp eq %class.SDUse* [[INCDEC_PTR]], [[__LAST]]
; CHECK-NEXT:    br i1 [[CMP_NOT]], label [[FOR_END_LOOPEXIT:%.*]], label [[FOR_INC]]
; CHECK:       for.end.loopexit:
; CHECK-NEXT:    [[INCDEC_PTR1_LCSSA:%.*]] = phi %class.SDValue* [ [[INCDEC_PTR1]], [[FOR_INC]] ]
; CHECK-NEXT:    br label [[FOR_END]]
; CHECK:       for.end:
; CHECK-NEXT:    [[__CUR_0_LCSSA:%.*]] = phi %class.SDValue* [ [[__RESULT]], [[ENTRY:%.*]] ], [ [[INCDEC_PTR1_LCSSA]], [[FOR_END_LOOPEXIT]] ]
; CHECK-NEXT:    ret %class.SDValue* [[__CUR_0_LCSSA]]
;
entry:
  %cmp.not15 = icmp eq %class.SDUse* %__first, %__last
  br i1 %cmp.not15, label %for.end, label %for.inc.preheader

for.inc.preheader:                                ; preds = %entry
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %__cur.017 = phi %class.SDValue* [ %incdec.ptr1, %for.inc ], [ %__result, %for.inc.preheader ]
  %__first.addr.016 = phi %class.SDUse* [ %incdec.ptr, %for.inc ], [ %__first, %for.inc.preheader ]
  %0 = bitcast %class.SDValue* %__cur.017 to i8*
  %1 = bitcast %class.SDUse* %__first.addr.016 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(12) %0, i8* noundef nonnull align 8 dereferenceable(12) %1, i64 12, i1 false)
  %incdec.ptr = getelementptr inbounds %class.SDUse, %class.SDUse* %__first.addr.016, i64 1
  %incdec.ptr1 = getelementptr inbounds %class.SDValue, %class.SDValue* %__cur.017, i64 1
  %cmp.not = icmp eq %class.SDUse* %incdec.ptr, %__last
  br i1 %cmp.not, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  %incdec.ptr1.lcssa = phi %class.SDValue* [ %incdec.ptr1, %for.inc ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %__cur.0.lcssa = phi %class.SDValue* [ %__result, %entry ], [ %incdec.ptr1.lcssa, %for.end.loopexit ]
  ret %class.SDValue* %__cur.0.lcssa
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1
