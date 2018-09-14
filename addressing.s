.include "general.mac"
.intel_mnemonic
.intel_syntax noprefix

.data
	
	
	

.text
.global _start

	start:  mov al, 0x12
			mov ax, 0x1234
			mov eax, 0x12345678
			
			mov cl, 12
			mov cl, '5'
			mov dx, 0xabcd
			mov di, 0xefab
			
	exit
