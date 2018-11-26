.include "general.mac"

.intel_mnemonic
.intel_syntax noprefix

.data
 array: .byte 0,1,2,3,4,5,6,7,8,9
 array_odd: .ds 5
 array_even: .ds 5
 
.text
	.global _start

_start:
	mov cx,10
	lea esi, array
	lea edi, array_odd
	lea ebp, array_even
	
	repeat: mov al, [esi]
			rcr al, 1
			jc odd_no
			rcl al, 1
			mov [ebp], al
			inc ebp
			jmp nxt
			
	odd_no: rcl al, 1
			mov [edi], al
			inc edi
			
	nxt: inc esi
		 loop repeat
			
 exit
