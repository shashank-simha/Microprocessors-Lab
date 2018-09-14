.include "general.mac"
.intel_mnemonic
.intel_syntax noprefix

.data
	store_data: .ds 10
		

.text
.global _start

	start:  #direct
			
			#mov word ptr store_data, 0x1111
			#mov word ptr store_data+2, 0x2222
			#mov word ptr store_data+4, 0x3333
			
			
			#indirect
			
			#lea esi, store_data
			#mov byte ptr[esi], 0x12
			#mov byte ptr[esi+1], 0x34
			#mov byte ptr[esi+2], 0x56
			
			#counter
			
			lea esi, store_data
			mov cx,10
			mov al, 0xab
			up: mov [esi], al
				inc esi
				loop up
			
	exit
