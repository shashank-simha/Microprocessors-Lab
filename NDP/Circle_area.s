.include "general.mac"
.intel_mnemonic
.intel_syntax noprefix

.data
	msg1: .ascii "Enter the radius: "
		  .equ len1, .-msg1
	msg2: .ascii "The area is: "
		  .equ len2, .-msg2
	r: .float 0
	p: .float 3.14
	
	area: .float 0		

.text
.global _start

	_start: display msg1, len1
			read_data r, 1
	
			lea ebx, r
			
			finit
			fld dword ptr[ebx+0]
			fld dword ptr[ebx+4]
			
			fmul st(0), st(1)
			fdiv st(0), st(1)
			
			fstp dword ptr[ebx+8]
			
	exit
