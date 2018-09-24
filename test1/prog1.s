.include "general.mac"

.intel_mnemonic
.intel_syntax noprefix

.data
	choice: .ds 10
	
	msg1: .ascii "I am interested\n"
       .equ len1, .-msg1

 	msg2: .ascii "I am not\n"
       .equ len2, .-msg2
       
    msg3: .ascii "Enter your choice: "
       .equ len3, .-msg3
       
    msg4: .ascii "Invalid choice\n"
       .equ len4, .-msg4
       
.text
	.global _start

_start:
	display msg3, len3
	read_data choice, 1
	
	mov eax, choice
	
	cmp eax, 'Y'
	je ch_yes
	
	cmp eax, 'N'
	je ch_no
	
	jmp ch_invalid
	
  ch_yes: display msg1, len1
  		  jmp exit_prog
  ch_no:  display msg2, len2
  		  jmp exit_prog  		  
  ch_invalid: display msg4, len4
  
  exit_prog: exit
