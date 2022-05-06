; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -verify-machineinstrs < %s \
; RUN:   | FileCheck -check-prefix=RV32I %s
; RUN: llc -mtriple=riscv64 -verify-machineinstrs < %s \
; RUN:   | FileCheck -check-prefix=RV64I %s

; This file provides a simple test check of half operations for
; RV32I and RV64I. This is primarily intended to ensure that custom
; legalisation or DAG combines aren't incorrectly triggered when the Zfh
; extension isn't enabled.

define half @half_test(half %a, half %b) nounwind {
; RV32I-LABEL: half_test:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s1, 4(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s2, 0(sp) # 4-byte Folded Spill
; RV32I-NEXT:    mv s0, a1
; RV32I-NEXT:    lui a1, 16
; RV32I-NEXT:    addi s2, a1, -1
; RV32I-NEXT:    and a0, a0, s2
; RV32I-NEXT:    call __extendhfsf2@plt
; RV32I-NEXT:    mv s1, a0
; RV32I-NEXT:    and a0, s0, s2
; RV32I-NEXT:    call __extendhfsf2@plt
; RV32I-NEXT:    mv s0, a0
; RV32I-NEXT:    mv a0, s1
; RV32I-NEXT:    mv a1, s0
; RV32I-NEXT:    call __addsf3@plt
; RV32I-NEXT:    call __truncsfhf2@plt
; RV32I-NEXT:    and a0, a0, s2
; RV32I-NEXT:    call __extendhfsf2@plt
; RV32I-NEXT:    mv a1, s0
; RV32I-NEXT:    call __divsf3@plt
; RV32I-NEXT:    call __truncsfhf2@plt
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s1, 4(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s2, 0(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: half_test:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -32
; RV64I-NEXT:    sd ra, 24(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s0, 16(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s1, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s2, 0(sp) # 8-byte Folded Spill
; RV64I-NEXT:    mv s0, a1
; RV64I-NEXT:    lui a1, 16
; RV64I-NEXT:    addiw s2, a1, -1
; RV64I-NEXT:    and a0, a0, s2
; RV64I-NEXT:    call __extendhfsf2@plt
; RV64I-NEXT:    mv s1, a0
; RV64I-NEXT:    and a0, s0, s2
; RV64I-NEXT:    call __extendhfsf2@plt
; RV64I-NEXT:    mv s0, a0
; RV64I-NEXT:    mv a0, s1
; RV64I-NEXT:    mv a1, s0
; RV64I-NEXT:    call __addsf3@plt
; RV64I-NEXT:    call __truncsfhf2@plt
; RV64I-NEXT:    and a0, a0, s2
; RV64I-NEXT:    call __extendhfsf2@plt
; RV64I-NEXT:    mv a1, s0
; RV64I-NEXT:    call __divsf3@plt
; RV64I-NEXT:    call __truncsfhf2@plt
; RV64I-NEXT:    ld ra, 24(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s0, 16(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s1, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s2, 0(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 32
; RV64I-NEXT:    ret
  %1 = fadd half %a, %b
  %2 = fdiv half %1, %b
  ret half %2
}
