.include "general.mac"
.intel_mnemonic
.intel_syntax noprefix
.data

nb:
	.float -2.00
ta:
	.float 6.00
tc:
	.float -2.00
nb1:
	.float -2.00
nb2:
	.float -2.00
nb3:
	.float -2.00

x1:
	.float 0 
x2:
	.float 0 
	
.text
.global _start
	_start:lea ebx,nb
	       
               finit
	       fld dword ptr[ebx+0]
	       fld dword ptr[ebx+4]
	       fld dword ptr[ebx+8]
	       fmul st(0),st(1)		#4ac
	       fld dword ptr[ebx+12]
	       fmul st(0),st(3)		#b*b
	       fsub st(0),st(1)
	       fsqrt
	       fdiv st(0),st(2)
	       fld dword ptr[ebx+16]
	       fdiv st(0),st(3)
	       fld dword ptr[ebx+20]
	       fdiv st(0),st(4)
	       fadd st(0),st(2)
	       fstp dword ptr[ebx+24]
	       fsub st(0),st(1)
	       fstp dword ptr[ebx+28]
	       
	       exit
