.include "general.mac"
.intel_mnemonic
.intel_syntax noprefix

.data
	msg1: .ascii "Enter L: "
		  .equ len1, .-msg1
	msg2: .ascii "Enter C: "
		  .equ len2, .-msg2
	msg3: .ascii "Frequency is: "
		  .equ len3, .-msg3
	
	L: 	  .float 0.008 #8 milli henry
	C: 	  .float 0.0001 #10 micro farad
	num:  .float 0.159235 # numerator value (1/2pi)
	freq: .float 0		

.text
.global _start

	_start: lea ebx, L
			
			finit
			fld dword ptr[ebx+0]
			fld dword ptr[ebx+4]
			
			fmul st(0), st(1)
			fsqrt
			
			fld dword ptr[ebx+8]
			fdiv st(0), st(1)
					
			fstp dword ptr[ebx+12]
			
	exit
