BITS 64

section .text

global inc
extern _reallocLongInt
extern printf

; increment vector by 1
; @rcx: struct ptr
inc:


case_zero:
	push rcx
	push rdx
	call _reallocLongInt
	mov qword[rcx+8], 1
exit:
	ret