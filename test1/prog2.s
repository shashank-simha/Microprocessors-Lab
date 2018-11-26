.include "general.mac"

.intel_mnemonic
.intel_syntax noprefix

.data
	choice: .ds 1
	
	mem_loc: .ds 10
	
	msg1: .ascii "Enter a number : "
       .equ len1, .-msg1

 	msg2: .ascii "Number inserted\n"
       .equ len2, .-msg2
       
.text
	.global _start

_start:
	display msg1, len1
	read_data choice, 1
	
	mov ecx, 0x0A
	mov eax, choice
	lea esi, mem_loc
	
	up:
		mov byte ptr[esi], al
		inc esi
		loop up
		
	display msg2, len2
	exit
