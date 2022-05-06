; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt -cost-model -analyze -mtriple=amdgcn-unknown-amdhsa -mcpu=kaveri < %s | FileCheck -check-prefixes=ALL %s
; RUN: opt -cost-model -cost-kind=code-size -analyze -mtriple=amdgcn-unknown-amdhsa -mcpu=kaveri < %s | FileCheck -check-prefixes=ALL-SIZE %s
; END.

define void @addrspacecast_global_to_flat() #0 {
; ALL-LABEL: 'addrspacecast_global_to_flat'
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %i8ptr = addrspacecast i8 addrspace(1)* undef to i8*
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2i8ptr = addrspacecast <2 x i8 addrspace(1)*> undef to <2 x i8*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3i8ptr = addrspacecast <3 x i8 addrspace(1)*> undef to <3 x i8*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4i8ptr = addrspacecast <4 x i8 addrspace(1)*> undef to <4 x i8*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v32i8ptr = addrspacecast <32 x i8 addrspace(1)*> undef to <32 x i8*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %i16ptr = addrspacecast i16 addrspace(1)* undef to i16*
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2i16ptr = addrspacecast <2 x i16 addrspace(1)*> undef to <2 x i16*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3i16ptr = addrspacecast <3 x i16 addrspace(1)*> undef to <3 x i16*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4i16ptr = addrspacecast <4 x i16 addrspace(1)*> undef to <4 x i16*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v32i16ptr = addrspacecast <32 x i16 addrspace(1)*> undef to <32 x i16*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %i32ptr = addrspacecast i32 addrspace(1)* undef to i32*
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2i32ptr = addrspacecast <2 x i32 addrspace(1)*> undef to <2 x i32*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3i32ptr = addrspacecast <3 x i32 addrspace(1)*> undef to <3 x i32*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4i32ptr = addrspacecast <4 x i32 addrspace(1)*> undef to <4 x i32*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v32i32ptr = addrspacecast <32 x i32 addrspace(1)*> undef to <32 x i32*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %i64ptr = addrspacecast i64 addrspace(1)* undef to i64*
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2i64ptr = addrspacecast <2 x i64 addrspace(1)*> undef to <2 x i64*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3i64ptr = addrspacecast <3 x i64 addrspace(1)*> undef to <3 x i64*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4i64ptr = addrspacecast <4 x i64 addrspace(1)*> undef to <4 x i64*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v32i64ptr = addrspacecast <32 x i64 addrspace(1)*> undef to <32 x i64*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; ALL-SIZE-LABEL: 'addrspacecast_global_to_flat'
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %i8ptr = addrspacecast i8 addrspace(1)* undef to i8*
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2i8ptr = addrspacecast <2 x i8 addrspace(1)*> undef to <2 x i8*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3i8ptr = addrspacecast <3 x i8 addrspace(1)*> undef to <3 x i8*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4i8ptr = addrspacecast <4 x i8 addrspace(1)*> undef to <4 x i8*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v32i8ptr = addrspacecast <32 x i8 addrspace(1)*> undef to <32 x i8*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %i16ptr = addrspacecast i16 addrspace(1)* undef to i16*
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2i16ptr = addrspacecast <2 x i16 addrspace(1)*> undef to <2 x i16*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3i16ptr = addrspacecast <3 x i16 addrspace(1)*> undef to <3 x i16*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4i16ptr = addrspacecast <4 x i16 addrspace(1)*> undef to <4 x i16*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v32i16ptr = addrspacecast <32 x i16 addrspace(1)*> undef to <32 x i16*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %i32ptr = addrspacecast i32 addrspace(1)* undef to i32*
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2i32ptr = addrspacecast <2 x i32 addrspace(1)*> undef to <2 x i32*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3i32ptr = addrspacecast <3 x i32 addrspace(1)*> undef to <3 x i32*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4i32ptr = addrspacecast <4 x i32 addrspace(1)*> undef to <4 x i32*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v32i32ptr = addrspacecast <32 x i32 addrspace(1)*> undef to <32 x i32*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %i64ptr = addrspacecast i64 addrspace(1)* undef to i64*
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2i64ptr = addrspacecast <2 x i64 addrspace(1)*> undef to <2 x i64*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3i64ptr = addrspacecast <3 x i64 addrspace(1)*> undef to <3 x i64*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4i64ptr = addrspacecast <4 x i64 addrspace(1)*> undef to <4 x i64*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v32i64ptr = addrspacecast <32 x i64 addrspace(1)*> undef to <32 x i64*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %i8ptr = addrspacecast i8 addrspace(1)* undef to i8*
  %v2i8ptr = addrspacecast <2 x i8 addrspace(1)*> undef to <2 x i8*>
  %v3i8ptr = addrspacecast <3 x i8 addrspace(1)*> undef to <3 x i8*>
  %v4i8ptr = addrspacecast <4 x i8 addrspace(1)*> undef to <4 x i8*>
  %v32i8ptr = addrspacecast <32 x i8 addrspace(1)*> undef to <32 x i8*>
  %i16ptr = addrspacecast i16 addrspace(1)* undef to i16*
  %v2i16ptr = addrspacecast <2 x i16 addrspace(1)*> undef to <2 x i16*>
  %v3i16ptr = addrspacecast <3 x i16 addrspace(1)*> undef to <3 x i16*>
  %v4i16ptr = addrspacecast <4 x i16 addrspace(1)*> undef to <4 x i16*>
  %v32i16ptr = addrspacecast <32 x i16 addrspace(1)*> undef to <32 x i16*>
  %i32ptr = addrspacecast i32 addrspace(1)* undef to i32*
  %v2i32ptr = addrspacecast <2 x i32 addrspace(1)*> undef to <2 x i32*>
  %v3i32ptr = addrspacecast <3 x i32 addrspace(1)*> undef to <3 x i32*>
  %v4i32ptr = addrspacecast <4 x i32 addrspace(1)*> undef to <4 x i32*>
  %v32i32ptr = addrspacecast <32 x i32 addrspace(1)*> undef to <32 x i32*>
  %i64ptr = addrspacecast i64 addrspace(1)* undef to i64*
  %v2i64ptr = addrspacecast <2 x i64 addrspace(1)*> undef to <2 x i64*>
  %v3i64ptr = addrspacecast <3 x i64 addrspace(1)*> undef to <3 x i64*>
  %v4i64ptr = addrspacecast <4 x i64 addrspace(1)*> undef to <4 x i64*>
  %v32i64ptr = addrspacecast <32 x i64 addrspace(1)*> undef to <32 x i64*>
  ret void
}

define void @addrspacecast_local_to_flat() #0 {
; ALL-LABEL: 'addrspacecast_local_to_flat'
; ALL-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8ptr = addrspacecast i8 addrspace(3)* undef to i8*
; ALL-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i8ptr = addrspacecast <2 x i8 addrspace(3)*> undef to <2 x i8*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i8ptr = addrspacecast <3 x i8 addrspace(3)*> undef to <3 x i8*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i8ptr = addrspacecast <4 x i8 addrspace(3)*> undef to <4 x i8*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %v32i8ptr = addrspacecast <32 x i8 addrspace(3)*> undef to <32 x i8*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16ptr = addrspacecast i16 addrspace(3)* undef to i16*
; ALL-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i16ptr = addrspacecast <2 x i16 addrspace(3)*> undef to <2 x i16*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i16ptr = addrspacecast <3 x i16 addrspace(3)*> undef to <3 x i16*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i16ptr = addrspacecast <4 x i16 addrspace(3)*> undef to <4 x i16*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %v32i16ptr = addrspacecast <32 x i16 addrspace(3)*> undef to <32 x i16*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32ptr = addrspacecast i32 addrspace(3)* undef to i32*
; ALL-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i32ptr = addrspacecast <2 x i32 addrspace(3)*> undef to <2 x i32*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i32ptr = addrspacecast <3 x i32 addrspace(3)*> undef to <3 x i32*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i32ptr = addrspacecast <4 x i32 addrspace(3)*> undef to <4 x i32*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %v32i32ptr = addrspacecast <32 x i32 addrspace(3)*> undef to <32 x i32*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i64ptr = addrspacecast i64 addrspace(3)* undef to i64*
; ALL-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i64ptr = addrspacecast <2 x i64 addrspace(3)*> undef to <2 x i64*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i64ptr = addrspacecast <3 x i64 addrspace(3)*> undef to <3 x i64*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i64ptr = addrspacecast <4 x i64 addrspace(3)*> undef to <4 x i64*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %v32i64ptr = addrspacecast <32 x i64 addrspace(3)*> undef to <32 x i64*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; ALL-SIZE-LABEL: 'addrspacecast_local_to_flat'
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8ptr = addrspacecast i8 addrspace(3)* undef to i8*
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i8ptr = addrspacecast <2 x i8 addrspace(3)*> undef to <2 x i8*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i8ptr = addrspacecast <3 x i8 addrspace(3)*> undef to <3 x i8*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i8ptr = addrspacecast <4 x i8 addrspace(3)*> undef to <4 x i8*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %v32i8ptr = addrspacecast <32 x i8 addrspace(3)*> undef to <32 x i8*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16ptr = addrspacecast i16 addrspace(3)* undef to i16*
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i16ptr = addrspacecast <2 x i16 addrspace(3)*> undef to <2 x i16*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i16ptr = addrspacecast <3 x i16 addrspace(3)*> undef to <3 x i16*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i16ptr = addrspacecast <4 x i16 addrspace(3)*> undef to <4 x i16*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %v32i16ptr = addrspacecast <32 x i16 addrspace(3)*> undef to <32 x i16*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32ptr = addrspacecast i32 addrspace(3)* undef to i32*
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i32ptr = addrspacecast <2 x i32 addrspace(3)*> undef to <2 x i32*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i32ptr = addrspacecast <3 x i32 addrspace(3)*> undef to <3 x i32*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i32ptr = addrspacecast <4 x i32 addrspace(3)*> undef to <4 x i32*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %v32i32ptr = addrspacecast <32 x i32 addrspace(3)*> undef to <32 x i32*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i64ptr = addrspacecast i64 addrspace(3)* undef to i64*
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i64ptr = addrspacecast <2 x i64 addrspace(3)*> undef to <2 x i64*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i64ptr = addrspacecast <3 x i64 addrspace(3)*> undef to <3 x i64*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i64ptr = addrspacecast <4 x i64 addrspace(3)*> undef to <4 x i64*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %v32i64ptr = addrspacecast <32 x i64 addrspace(3)*> undef to <32 x i64*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %i8ptr = addrspacecast i8 addrspace(3)* undef to i8*
  %v2i8ptr = addrspacecast <2 x i8 addrspace(3)*> undef to <2 x i8*>
  %v3i8ptr = addrspacecast <3 x i8 addrspace(3)*> undef to <3 x i8*>
  %v4i8ptr = addrspacecast <4 x i8 addrspace(3)*> undef to <4 x i8*>
  %v32i8ptr = addrspacecast <32 x i8 addrspace(3)*> undef to <32 x i8*>
  %i16ptr = addrspacecast i16 addrspace(3)* undef to i16*
  %v2i16ptr = addrspacecast <2 x i16 addrspace(3)*> undef to <2 x i16*>
  %v3i16ptr = addrspacecast <3 x i16 addrspace(3)*> undef to <3 x i16*>
  %v4i16ptr = addrspacecast <4 x i16 addrspace(3)*> undef to <4 x i16*>
  %v32i16ptr = addrspacecast <32 x i16 addrspace(3)*> undef to <32 x i16*>
  %i32ptr = addrspacecast i32 addrspace(3)* undef to i32*
  %v2i32ptr = addrspacecast <2 x i32 addrspace(3)*> undef to <2 x i32*>
  %v3i32ptr = addrspacecast <3 x i32 addrspace(3)*> undef to <3 x i32*>
  %v4i32ptr = addrspacecast <4 x i32 addrspace(3)*> undef to <4 x i32*>
  %v32i32ptr = addrspacecast <32 x i32 addrspace(3)*> undef to <32 x i32*>
  %i64ptr = addrspacecast i64 addrspace(3)* undef to i64*
  %v2i64ptr = addrspacecast <2 x i64 addrspace(3)*> undef to <2 x i64*>
  %v3i64ptr = addrspacecast <3 x i64 addrspace(3)*> undef to <3 x i64*>
  %v4i64ptr = addrspacecast <4 x i64 addrspace(3)*> undef to <4 x i64*>
  %v32i64ptr = addrspacecast <32 x i64 addrspace(3)*> undef to <32 x i64*>
  ret void
}

define void @addrspacecast_flat_to_local() #0 {
; ALL-LABEL: 'addrspacecast_flat_to_local'
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %i8ptr = addrspacecast i8* undef to i8 addrspace(3)*
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2i8ptr = addrspacecast <2 x i8*> undef to <2 x i8 addrspace(3)*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3i8ptr = addrspacecast <3 x i8*> undef to <3 x i8 addrspace(3)*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4i8ptr = addrspacecast <4 x i8*> undef to <4 x i8 addrspace(3)*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v32i8ptr = addrspacecast <32 x i8*> undef to <32 x i8 addrspace(3)*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %i16ptr = addrspacecast i16* undef to i16 addrspace(3)*
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2i16ptr = addrspacecast <2 x i16*> undef to <2 x i16 addrspace(3)*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3i16ptr = addrspacecast <3 x i16*> undef to <3 x i16 addrspace(3)*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4i16ptr = addrspacecast <4 x i16*> undef to <4 x i16 addrspace(3)*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v32i16ptr = addrspacecast <32 x i16*> undef to <32 x i16 addrspace(3)*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %i32ptr = addrspacecast i32* undef to i32 addrspace(3)*
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2i32ptr = addrspacecast <2 x i32*> undef to <2 x i32 addrspace(3)*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3i32ptr = addrspacecast <3 x i32*> undef to <3 x i32 addrspace(3)*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4i32ptr = addrspacecast <4 x i32*> undef to <4 x i32 addrspace(3)*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v32i32ptr = addrspacecast <32 x i32*> undef to <32 x i32 addrspace(3)*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %i64ptr = addrspacecast i64* undef to i64 addrspace(3)*
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2i64ptr = addrspacecast <2 x i64*> undef to <2 x i64 addrspace(3)*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3i64ptr = addrspacecast <3 x i64*> undef to <3 x i64 addrspace(3)*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4i64ptr = addrspacecast <4 x i64*> undef to <4 x i64 addrspace(3)*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v32i64ptr = addrspacecast <32 x i64*> undef to <32 x i64 addrspace(3)*>
; ALL-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; ALL-SIZE-LABEL: 'addrspacecast_flat_to_local'
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %i8ptr = addrspacecast i8* undef to i8 addrspace(3)*
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2i8ptr = addrspacecast <2 x i8*> undef to <2 x i8 addrspace(3)*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3i8ptr = addrspacecast <3 x i8*> undef to <3 x i8 addrspace(3)*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4i8ptr = addrspacecast <4 x i8*> undef to <4 x i8 addrspace(3)*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v32i8ptr = addrspacecast <32 x i8*> undef to <32 x i8 addrspace(3)*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %i16ptr = addrspacecast i16* undef to i16 addrspace(3)*
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2i16ptr = addrspacecast <2 x i16*> undef to <2 x i16 addrspace(3)*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3i16ptr = addrspacecast <3 x i16*> undef to <3 x i16 addrspace(3)*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4i16ptr = addrspacecast <4 x i16*> undef to <4 x i16 addrspace(3)*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v32i16ptr = addrspacecast <32 x i16*> undef to <32 x i16 addrspace(3)*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %i32ptr = addrspacecast i32* undef to i32 addrspace(3)*
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2i32ptr = addrspacecast <2 x i32*> undef to <2 x i32 addrspace(3)*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3i32ptr = addrspacecast <3 x i32*> undef to <3 x i32 addrspace(3)*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4i32ptr = addrspacecast <4 x i32*> undef to <4 x i32 addrspace(3)*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v32i32ptr = addrspacecast <32 x i32*> undef to <32 x i32 addrspace(3)*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %i64ptr = addrspacecast i64* undef to i64 addrspace(3)*
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2i64ptr = addrspacecast <2 x i64*> undef to <2 x i64 addrspace(3)*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3i64ptr = addrspacecast <3 x i64*> undef to <3 x i64 addrspace(3)*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4i64ptr = addrspacecast <4 x i64*> undef to <4 x i64 addrspace(3)*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v32i64ptr = addrspacecast <32 x i64*> undef to <32 x i64 addrspace(3)*>
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %i8ptr = addrspacecast i8* undef to i8 addrspace(3)*
  %v2i8ptr = addrspacecast <2 x i8*> undef to <2 x i8 addrspace(3)*>
  %v3i8ptr = addrspacecast <3 x i8*> undef to <3 x i8 addrspace(3)*>
  %v4i8ptr = addrspacecast <4 x i8*> undef to <4 x i8 addrspace(3)*>
  %v32i8ptr = addrspacecast <32 x i8*> undef to <32 x i8 addrspace(3)*>
  %i16ptr = addrspacecast i16* undef to i16 addrspace(3)*
  %v2i16ptr = addrspacecast <2 x i16*> undef to <2 x i16 addrspace(3)*>
  %v3i16ptr = addrspacecast <3 x i16*> undef to <3 x i16 addrspace(3)*>
  %v4i16ptr = addrspacecast <4 x i16*> undef to <4 x i16 addrspace(3)*>
  %v32i16ptr = addrspacecast <32 x i16*> undef to <32 x i16 addrspace(3)*>
  %i32ptr = addrspacecast i32* undef to i32 addrspace(3)*
  %v2i32ptr = addrspacecast <2 x i32*> undef to <2 x i32 addrspace(3)*>
  %v3i32ptr = addrspacecast <3 x i32*> undef to <3 x i32 addrspace(3)*>
  %v4i32ptr = addrspacecast <4 x i32*> undef to <4 x i32 addrspace(3)*>
  %v32i32ptr = addrspacecast <32 x i32*> undef to <32 x i32 addrspace(3)*>
  %i64ptr = addrspacecast i64* undef to i64 addrspace(3)*
  %v2i64ptr = addrspacecast <2 x i64*> undef to <2 x i64 addrspace(3)*>
  %v3i64ptr = addrspacecast <3 x i64*> undef to <3 x i64 addrspace(3)*>
  %v4i64ptr = addrspacecast <4 x i64*> undef to <4 x i64 addrspace(3)*>
  %v32i64ptr = addrspacecast <32 x i64*> undef to <32 x i64 addrspace(3)*>
  ret void
}

attributes #0 = { nounwind readnone }
