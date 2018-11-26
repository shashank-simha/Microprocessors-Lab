.include "general.mac"
.intel_mnemonic
.intel_syntax noprefix

.data
	store_data: .ds 2
	num: .ds 1
	ltable : .byte 0x00, 0x01, 0x04, 0x09, 0x16, 0x25, 0x36, 0x49, 0x64, 0x81
	nl: .ascii "\n"
		.equ lenl, .-nl

.text
.global _start

	_start:	read_data num, 1
			mov al, num
			sub al, 0X30
			lea ebx, ltable
			
			xlat
			
			mov bl, al
			
			and al, 0xf0
			ror al, 4
			or al, 0x30
			mov store_data, al
			mov al, bl
			and al, 0x0f
			or al, 0x30
			mov store_data+1, al
			display store_data,2
			display nl, 1
			
	exit
