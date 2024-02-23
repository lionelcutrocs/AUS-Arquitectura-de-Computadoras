; Este programa realiza la resta de dos productos cruzados.

%include "asm_io.inc"

segment .data
segment .bss

result		resb	1

segment .text
	global operation

operation:

	enter 	4,0		; reservo 4 bytes para la pila
	push	ebx	

	mov eax, [ebp +8]	; argumento a
	mov ebx, [ebp +12]	; argumento b
	mov ecx, [ebp +16]	; argumento c
	mov edx, [ebp +20]	; argumento d
	
	imul eax, ecx	
	imul ebx, edx

	mov [ebp -4], eax	; muevo el resultado de eax * ecx a pila -4
	mov [result], ebx	; muevo a [result], resultado de ebx * edx

	sub eax, [result]	; realizo resta 
	mov [ebp -8], eax	; muevo el resultado de sub en pila -8

	dump_stack 1,3,6
	call print_nl
	
	pop ebx
	leave
	ret
