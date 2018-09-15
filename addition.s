.include "general.mac"

.intel_mnemonic
.intel_syntax noprefix

.data
 first_no: .ds 1
 second_no: .ds 1
 sum: .ds 1
 
 msg1: .ascii "Enter two numbers (from 0 to 9) without spaces : "
       .equ len1, .-msg1

 msg2: .ascii "\nThe difference of two numbers is : "
       .equ len2, .-msg2

.text
	.global _start

_start:
	display msg1, len1
	read_data first_no, 1
	read_data second_no, 1
	mov ax, first_no
	mov bx, second_no
	add ax, bx
	sub ax, 0x30 
	mov sum, ax
	display msg2, len2
	display sum, 1
 exit
