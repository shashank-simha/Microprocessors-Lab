.include "general.mac"
.intel_mnemonic
.intel_syntax noprefix

.data
	n1: .float 3.5
	n2: .float 3.4
	
	res: .float 0
	n3: .float 1259.125
		

.text
.global _start

	_start: lea ebx, n1
			
			finit
			fld dword ptr[ebx+0]
			fld dword ptr[ebx+4]
			
			#fadd st(0), st(1)
			#fsub st(0), st(1)
			#fmul st(0), st(1)
			fdiv st(0), st(1)
			
			fstp dword ptr[ebx+8]
			
	exit
