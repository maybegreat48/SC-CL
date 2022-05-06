; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --function-signature --check-globals
; RUN: opt -S -mtriple=amdgcn-amd- -amdgpu-attributor < %s | FileCheck %s

; Test to verify if the attribute gets propagated across nested function calls

; Added to prevent Attributor from deleting calls.
@x = global i32 0

;.
; CHECK: @[[X:[a-zA-Z0-9_$"\\.-]+]] = global i32 0
;.
define void @func1() #0 {
; CHECK-LABEL: define {{[^@]+}}@func1
; CHECK-SAME: () #[[ATTR0:[0-9]+]] {
; CHECK-NEXT:    store i32 0, i32* @x, align 4
; CHECK-NEXT:    ret void
;
  store i32 0, i32* @x
  ret void
}

define void @func2() #1 {
; CHECK-LABEL: define {{[^@]+}}@func2
; CHECK-SAME: () #[[ATTR0]] {
; CHECK-NEXT:    call void @func1()
; CHECK-NEXT:    ret void
;
  call void @func1()
  ret void
}

define amdgpu_kernel void @kernel3() #2 {
; CHECK-LABEL: define {{[^@]+}}@kernel3
; CHECK-SAME: () #[[ATTR1:[0-9]+]] {
; CHECK-NEXT:    call void @func2()
; CHECK-NEXT:    ret void
;
  call void @func2()
  ret void
}

attributes #2 = { "uniform-work-group-size"="true" }
;.
; CHECK: attributes #[[ATTR0]] = { "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "uniform-work-group-size"="false" }
; CHECK: attributes #[[ATTR1]] = { "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "uniform-work-group-size"="true" }
;.
