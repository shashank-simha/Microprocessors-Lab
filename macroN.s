.include "general.mac"

.intel_mnemonic
.intel_syntax noprefix

.data
	msg1: .ascii "First message\n"
	      .equ len1, .-msg1

	msg2: .ascii "Second message\n"
	      .equ len2, .-msg2 

	msg3: .ascii "I have no clue what I'm doing\n"
	      .equ len3, .-msg3

	msg4: .ascii "Fourth message\n"
	      .equ len4, .-msg4 

	msg5: .ascii "Fifth message\n"
	      .equ len5, .-msg5 

	msg6: .ascii "Enter a string with 10 characters\n"
	      .equ len6, .-msg6 
	      
	stored_data: .ds 10

	.text
	.global _start

start:
	display msg6, len6
	read_data stored_data, 10
	display stored_data, 10
	exit

