.include "general.mac"
.intel_mnemonic
.intel_syntax noprefix

.data
	r: .int 0x6f, 0x22
	abuf: .int 0
	cbuf: .int 0
 	msg1: .ascii "message one displayed"
 		.equ len1, .-msg1
.text
.global _start

	display_number r, 3
	read_data r,1
	display msg1, len1
	read_data r,1
	display msg1, len1
	exit
