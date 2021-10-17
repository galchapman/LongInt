BITS 64

section .text

global inc
extern _reallocLongInt

; increment vector by 1
; @rcx: struct ptr
inc:
	
	mov rax, rcx ; rax, data ptr
	mov rdi, 0 ; counter
inc_loop:
	cmp qword [rcx], rdi ; end of vector
	je append_one
	; increse varibales
	inc rdi
	add rax, 8
	; increment value
	inc qword[rax]
	; repet if carry
	jc inc_loop

	jmp exit

append_one:
	inc rdi
	mov rdx, rdi
	call _reallocLongInt
	sal rdi, 3
	mov qword[rax+rdi], 1
exit:
	ret