.include "general.mac"

.intel_mnemonic
.intel_syntax noprefix

.data
	res: .ds 4
	
.text
	.global _start

_start:
	//daa
	mov eax, 9
	mov ebx, 9
	add eax, ebx
	daa
	
	//aaa
	mov eax, '9'
	mov ebx, '9'
	add eax, ebx
	aaa
	
	//aad
	mov ax, 0x0205
	aad
	
	//aam
	mov eax, 9
	mov ebx, 9
	mul ebx
	aam
	
	//das
	mov eax, 9
	mov ebx, 4
	sub eax, ebx
	das
	
	//aas
	mov eax, '9'
	mov ebx, '4'
	sub eax, ebx
	aas
	
exit
