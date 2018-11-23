.include "general.mac"
.intel_mnemonic
.intel_syntax noprefix

.data
	r: .int 65
	abuf: .int 0
	cbuf: .int 0

.text
.global _start

	_start: mov al, r
			mov cx, 26
			up: display_and_load r, 1, abuf, cbuf
				inc al
				mov r, al
				dec cx
				jnz up
			
	exit
