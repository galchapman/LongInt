BITS 64

section .text

global len

; return the length of the number
; @rcx: struct ptr
len:
	mov rax, [rcx]
	ret