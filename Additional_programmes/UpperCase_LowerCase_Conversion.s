.include "general.mac"
.intel_mnemonic
.intel_syntax noprefix

.data
	store_data: .ds 2
	
	msg1: .ascii "Enter the upper/lower  case character: "
		  .equ len1, .-msg1
		  
	msg2: .ascii "The equivalent upper case letter is: "
		  .equ len2, .-msg2
		
	msg3: .ascii "The equivalent lower case letter is: "
		  .equ len3, .-msg3
		  
	nl:   .ascii "\n"
		  .equ lennl, .-nl	

.text
.global _start

	_start: display msg1, len1
			read_data store_data, 2
			display nl, lennl
			mov al, byte ptr store_data
			cmp al, 'Z'
			jbe small 
			sub al, 0x20
			mov store_data, al
			display msg2, len2
			jmp nxt
	 small: add al, 0x20
	 		mov store_data, al
	 		display msg3, len3
	   nxt: display store_data, 1
	   		display nl, lennl
						
	exit
