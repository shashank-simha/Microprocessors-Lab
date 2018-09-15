//.include "general.mac"

//.intel_mnemonic
//.intel_syntax noprefix

//.data
// array1: .byte 1,2,3,4,5
// array2: .word 1,2,3,4,5
// array3: .int 1,2,3,4,5
// array4: .long 1,2,3,4,5
 
// result_array: .long 0,0,0,0,0
 
//.text
//	.global _start

//_start:
//	lea esi, array1
//	mov eax, esi
	
// exit

.include "general.mac"

.intel_mnemonic
.intel_syntax noprefix

.data
 first_no: .ds 1
 second_no: .ds 1
 result: .ds 1
 
 msg1: .ascii "Enter two numbers (from 0 to 9) without spaces : "
       .equ len1, .-msg1

 msg2: .ascii "\nThe sum of two numbers is : "
       .equ len2, .-msg2
  
 msg3: .ascii "\nThe difference of two numbers is : "
       .equ len3, .-msg3

 msg4: .ascii "\nThe product of two numbers is : "
       .equ len4, .-msg4
       
 msg5: .ascii "\nThe quotient is : "
       .equ len5, .-msg5
       
.text
	.global _start

_start:
	display msg1, len1
	read_data first_no, 1
	read_data second_no, 1
	
	//addtion
	load_numbers
	add ax, bx 
	add ax, 0x30 
	mov result, ax
	display msg2, len2
	display result, 1
	
	//subtraction
	load_numbers
	sub ax, bx
	add ax, 0x30 
	mov result, ax
	display msg3, len3
	display result, 1
	
	//multiplication
	load_numbers
	mul bx
	add ax, 0x30 
	mov result, ax
	display msg4, len4
	display_hex result, 1
	
	//division
	load_numbers
	div bx
	add ax, 0x30 
	mov result, ax
	display msg4, len4
	display result, 1
	
 exit
