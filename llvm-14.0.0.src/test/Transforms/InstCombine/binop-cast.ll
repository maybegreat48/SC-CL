; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instcombine -S | FileCheck %s

declare void @use(i32)

define i32 @testAdd(i32 %X, i32 %Y) {
; CHECK-LABEL: @testAdd(
; CHECK-NEXT:    [[T:%.*]] = add i32 [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    ret i32 [[T]]
;
  %t = add i32 %X, %Y
  %tl = bitcast i32 %t to i32
  ret i32 %tl
}

define i32 @and_sext_to_sel(i32 %x, i1 %y) {
; CHECK-LABEL: @and_sext_to_sel(
; CHECK-NEXT:    [[R:%.*]] = select i1 [[Y:%.*]], i32 [[X:%.*]], i32 0
; CHECK-NEXT:    ret i32 [[R]]
;
  %sext = sext i1 %y to i32
  %r = and i32 %sext, %x
  ret i32 %r
}

define <2 x i32> @and_sext_to_sel_constant_vec(<2 x i1> %y) {
; CHECK-LABEL: @and_sext_to_sel_constant_vec(
; CHECK-NEXT:    [[R:%.*]] = select <2 x i1> [[Y:%.*]], <2 x i32> <i32 42, i32 -7>, <2 x i32> zeroinitializer
; CHECK-NEXT:    ret <2 x i32> [[R]]
;
  %sext = sext <2 x i1> %y to <2 x i32>
  %r = and <2 x i32> <i32 42, i32 -7>, %sext
  ret <2 x i32> %r
}

define <2 x i32> @and_sext_to_sel_swap(<2 x i32> %px, <2 x i1> %y) {
; CHECK-LABEL: @and_sext_to_sel_swap(
; CHECK-NEXT:    [[X:%.*]] = mul <2 x i32> [[PX:%.*]], [[PX]]
; CHECK-NEXT:    [[R:%.*]] = select <2 x i1> [[Y:%.*]], <2 x i32> [[X]], <2 x i32> zeroinitializer
; CHECK-NEXT:    ret <2 x i32> [[R]]
;
  %x = mul <2 x i32> %px, %px ; thwart complexity-based canonicalization
  %sext = sext <2 x i1> %y to <2 x i32>
  %r = and <2 x i32> %x, %sext
  ret <2 x i32> %r
}

define i32 @and_sext_to_sel_multi_use(i32 %x, i1 %y) {
; CHECK-LABEL: @and_sext_to_sel_multi_use(
; CHECK-NEXT:    [[SEXT:%.*]] = sext i1 [[Y:%.*]] to i32
; CHECK-NEXT:    call void @use(i32 [[SEXT]])
; CHECK-NEXT:    [[R:%.*]] = and i32 [[SEXT]], [[X:%.*]]
; CHECK-NEXT:    ret i32 [[R]]
;
  %sext = sext i1 %y to i32
  call void @use(i32 %sext)
  %r = and i32 %sext, %x
  ret i32 %r
}

define i32 @and_sext_to_sel_multi_use_constant_mask(i1 %y) {
; CHECK-LABEL: @and_sext_to_sel_multi_use_constant_mask(
; CHECK-NEXT:    [[SEXT:%.*]] = sext i1 [[Y:%.*]] to i32
; CHECK-NEXT:    call void @use(i32 [[SEXT]])
; CHECK-NEXT:    [[R:%.*]] = select i1 [[Y]], i32 42, i32 0
; CHECK-NEXT:    ret i32 [[R]]
;
  %sext = sext i1 %y to i32
  call void @use(i32 %sext)
  %r = and i32 %sext, 42
  ret i32 %r
}

define i32 @or_sext_to_sel(i32 %x, i1 %y) {
; CHECK-LABEL: @or_sext_to_sel(
; CHECK-NEXT:    [[R:%.*]] = select i1 [[Y:%.*]], i32 -1, i32 [[X:%.*]]
; CHECK-NEXT:    ret i32 [[R]]
;
  %sext = sext i1 %y to i32
  %r = or i32 %sext, %x
  ret i32 %r
}

define <2 x i32> @or_sext_to_sel_constant_vec(<2 x i1> %y) {
; CHECK-LABEL: @or_sext_to_sel_constant_vec(
; CHECK-NEXT:    [[R:%.*]] = select <2 x i1> [[Y:%.*]], <2 x i32> <i32 -1, i32 -1>, <2 x i32> <i32 42, i32 -7>
; CHECK-NEXT:    ret <2 x i32> [[R]]
;
  %sext = sext <2 x i1> %y to <2 x i32>
  %r = or <2 x i32> <i32 42, i32 -7>, %sext
  ret <2 x i32> %r
}

define <2 x i32> @or_sext_to_sel_swap(<2 x i32> %px, <2 x i1> %y) {
; CHECK-LABEL: @or_sext_to_sel_swap(
; CHECK-NEXT:    [[X:%.*]] = mul <2 x i32> [[PX:%.*]], [[PX]]
; CHECK-NEXT:    [[R:%.*]] = select <2 x i1> [[Y:%.*]], <2 x i32> <i32 -1, i32 -1>, <2 x i32> [[X]]
; CHECK-NEXT:    ret <2 x i32> [[R]]
;
  %x = mul <2 x i32> %px, %px ; thwart complexity-based canonicalization
  %sext = sext <2 x i1> %y to <2 x i32>
  %r = or <2 x i32> %x, %sext
  ret <2 x i32> %r
}

define i32 @or_sext_to_sel_multi_use(i32 %x, i1 %y) {
; CHECK-LABEL: @or_sext_to_sel_multi_use(
; CHECK-NEXT:    [[SEXT:%.*]] = sext i1 [[Y:%.*]] to i32
; CHECK-NEXT:    call void @use(i32 [[SEXT]])
; CHECK-NEXT:    [[R:%.*]] = or i32 [[SEXT]], [[X:%.*]]
; CHECK-NEXT:    ret i32 [[R]]
;
  %sext = sext i1 %y to i32
  call void @use(i32 %sext)
  %r = or i32 %sext, %x
  ret i32 %r
}

define i32 @or_sext_to_sel_multi_use_constant_mask(i1 %y) {
; CHECK-LABEL: @or_sext_to_sel_multi_use_constant_mask(
; CHECK-NEXT:    [[SEXT:%.*]] = sext i1 [[Y:%.*]] to i32
; CHECK-NEXT:    call void @use(i32 [[SEXT]])
; CHECK-NEXT:    [[R:%.*]] = select i1 [[Y]], i32 -1, i32 42
; CHECK-NEXT:    ret i32 [[R]]
;
  %sext = sext i1 %y to i32
  call void @use(i32 %sext)
  %r = or i32 %sext, 42
  ret i32 %r
}

define i32 @xor_sext_to_sel(i32 %x, i1 %y) {
; CHECK-LABEL: @xor_sext_to_sel(
; CHECK-NEXT:    [[SEXT:%.*]] = sext i1 [[Y:%.*]] to i32
; CHECK-NEXT:    [[R:%.*]] = xor i32 [[SEXT]], [[X:%.*]]
; CHECK-NEXT:    ret i32 [[R]]
;
  %sext = sext i1 %y to i32
  %r = xor i32 %sext, %x
  ret i32 %r
}

define <2 x i32> @xor_sext_to_sel_constant_vec(<2 x i1> %y) {
; CHECK-LABEL: @xor_sext_to_sel_constant_vec(
; CHECK-NEXT:    [[SEXT:%.*]] = sext <2 x i1> [[Y:%.*]] to <2 x i32>
; CHECK-NEXT:    [[R:%.*]] = xor <2 x i32> [[SEXT]], <i32 42, i32 -7>
; CHECK-NEXT:    ret <2 x i32> [[R]]
;
  %sext = sext <2 x i1> %y to <2 x i32>
  %r = xor <2 x i32> <i32 42, i32 -7>, %sext
  ret <2 x i32> %r
}

define <2 x i32> @xor_sext_to_sel_swap(<2 x i32> %px, <2 x i1> %y) {
; CHECK-LABEL: @xor_sext_to_sel_swap(
; CHECK-NEXT:    [[X:%.*]] = mul <2 x i32> [[PX:%.*]], [[PX]]
; CHECK-NEXT:    [[SEXT:%.*]] = sext <2 x i1> [[Y:%.*]] to <2 x i32>
; CHECK-NEXT:    [[R:%.*]] = xor <2 x i32> [[X]], [[SEXT]]
; CHECK-NEXT:    ret <2 x i32> [[R]]
;
  %x = mul <2 x i32> %px, %px ; thwart complexity-based canonicalization
  %sext = sext <2 x i1> %y to <2 x i32>
  %r = xor <2 x i32> %x, %sext
  ret <2 x i32> %r
}

define i32 @xor_sext_to_sel_multi_use(i32 %x, i1 %y) {
; CHECK-LABEL: @xor_sext_to_sel_multi_use(
; CHECK-NEXT:    [[SEXT:%.*]] = sext i1 [[Y:%.*]] to i32
; CHECK-NEXT:    call void @use(i32 [[SEXT]])
; CHECK-NEXT:    [[R:%.*]] = xor i32 [[SEXT]], [[X:%.*]]
; CHECK-NEXT:    ret i32 [[R]]
;
  %sext = sext i1 %y to i32
  call void @use(i32 %sext)
  %r = xor i32 %sext, %x
  ret i32 %r
}

define i32 @xor_sext_to_sel_multi_use_constant_mask(i1 %y) {
; CHECK-LABEL: @xor_sext_to_sel_multi_use_constant_mask(
; CHECK-NEXT:    [[SEXT:%.*]] = sext i1 [[Y:%.*]] to i32
; CHECK-NEXT:    call void @use(i32 [[SEXT]])
; CHECK-NEXT:    [[R:%.*]] = xor i32 [[SEXT]], 42
; CHECK-NEXT:    ret i32 [[R]]
;
  %sext = sext i1 %y to i32
  call void @use(i32 %sext)
  %r = xor i32 %sext, 42
  ret i32 %r
}
