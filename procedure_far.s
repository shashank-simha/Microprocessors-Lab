.include "general.mac"

.intel_mnemonic
.intel_syntax noprefix

.data
	number: .ds 1
	
	res: .ds 1
	
	msg1: .ascii "Enter the number: "
       .equ len1, .-msg1

 	msg2: .ascii "\nThe factorial of "
       .equ len2, .-msg2
  
 	msg3: .ascii " is : "
       .equ len3, .-msg3

	msg4: .ascii "\n"
       .equ len4, .-msg4
	
.text
	.global _start

_start:
	display msg1, len1
	read_data number, 1
	
	//factorial
	mov ecx, number
	sub ecx, 0x30
	call fact
	mov res, eax
	display msg2, len2
	display number, 1
	display msg3, len3
	display res, 1
	display msg4, len4
exit

