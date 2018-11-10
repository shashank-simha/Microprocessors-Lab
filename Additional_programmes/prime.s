.include "general.mac"

.intel_mnemonic
.intel_syntax noprefix

.data
 array: .byte 5,6,7,8,9
 primes: .ds 5
 positions: .ds 5

 msg1: .ascii "Prime numbers are:\n"
 		.equ len1, .-msg1
 
 msg2: .ascii "\n"
 		.equ len2, .-msg2
 		
 msg3: .ascii " at "
 		.equ len3, .-msg3		
 
.text
	.global _start

_start:
	mov dx,10
	lea esi, array
	lea edi, primes
	lea ebp, positions
	
	loop1: mov cx, [esi]
		  mov bx, cx 
		  dec bx
	      inc esi
	
	repeat: mov ax, cx
			and ax, bx
			jz nxt
			dec bx
			cmp bx, 1
			je nxt
			loop repeat
			
	display msg1, len1
	
	nxt: dec dx
		 cmp dx, 0
		 je ext
		 jmp loop1 
 ext: exit
