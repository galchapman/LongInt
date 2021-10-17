BITS 64

section .text

global len
global cast_uint64

; return the length of the number
; @rcx: struct ptr
len:
	mov rax, [rcx]
	ret

; return the length of the number
; @rcx: struct ptr
cast_uint64:
	mov rax, qword [rcx+8]
	ret