BITS 64

section .text

global inc
global _inc_offset
extern _reallocLongInt

; increment vector by 1 from offset
; @rcx: struct ptr
; @rdx: offset
_inc_offset:
	; rax = rcx + rdi * sizeof(uint64_t)
	mov rax, rdx
	sal rax, 3 ; mul rax, 8
	add rax, rcx
	jmp inc_loop

; increment vector by 1
; @rcx: struct ptr
inc:
	mov rax, rcx ; rax, data ptr
	mov rdx, 0 ; counter
inc_loop:
	cmp qword [rcx], rdx ; end of vector
	je append_one
	; increse varibales
	inc rdx
	add rax, 8
	; increment value
	inc qword[rax]
	; repet if carry
	jc inc_loop

	jmp exit

append_one:
	inc rdx
	mov rdi, rdx
	call _reallocLongInt
	sal rdi, 3
	mov qword[rax+rdi], 1
exit:
	ret