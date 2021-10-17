BITS 64

section .text
global newLongInt
global _allocLongInt
global _reallocLongInt
extern malloc
extern realloc

newLongInt:
	sub rsp, 40
	mov ecx, 8
	call malloc
	mov qword[rax], 0
	add rsp, 40
	ret

_allocLongInt:
	sub rsp, 16
	sal rcx, 3 ; arg *= sizeof(uint64_t)
	add rcx, 8 ; malloc(arg + sizeof(size_t))
	call malloc
	add rsp, 16
	mov qword[rax], 0
	ret

_reallocLongInt:
	sub rsp, 32
	mov rbx, rdx
	sal rdx, 3 ; arg *= sizeof(uint64_t)
	add rdx, 8 ; set size to <arg + sizeof(size_t)>
	call realloc
	mov qword [rax], rbx
	add rsp, 32
	ret