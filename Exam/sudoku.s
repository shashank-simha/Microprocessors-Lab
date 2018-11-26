.include "general.mac"
.intel_mnemonic
.intel_syntax noprefix

.data
	sud: .byte 1,2,3,4, 4,3,2,1, 2,1,4,3, 3,4,1,2
	
	sud1: .byte 1,2,3,0, 4,0,2,0, 0,1,0,3, 3,0,1,2
	
	sud_print: .ascii "1 2 3 x\n4 x 2 x\nx 1 x 3\n3 x 1 2\n"
			   .equ sud_len, .-sud_print

	msg1: .ascii "Instructions\n1. The sudoku will be 4x4\n2. X denotes the missing number\n3. Enter your answer in a single line separated by spaces\n\n"
			   .equ len1, .-msg1

	msg2: .ascii "\nEnter your answer: "
			   .equ len2, .-msg2			   

	msg3: .ascii "\nEntered answer is correct\n"
			   .equ len3, .-msg3

	msg4: .ascii "\nEntered answer is wrong\n"
			   .equ len4, .-msg4
	
	wrong_1: .ascii "First row is wrong\n"
			 .equ len_wrong_1, .-wrong_1

	wrong_2: .ascii "Second row is wrong\n"
			 .equ len_wrong_2, .-wrong_2
			 
	wrong_3: .ascii "Third row is wrong\n"
			 .equ len_wrong_3, .-wrong_3

	wrong_4: .ascii "Fourth row is wrong\n"
			 .equ len_wrong_4, .-wrong_4
			   
	clues: .ascii "\nMake use of the clues given below\n1. first x is the square of 2\n2. second x is one less than first x\n3. third x is the first natural number\n4. fourth x is the square root of first x\n5. fifth x is the sum of second and third x\n6. last x is same as first\n"
	.equ clues_len, .-clues
	
    read_answer: .ds 11

.text
.global _start

	_start:	display msg1, len1
			display sud_print, sud_len
			display clues, clues_len
			display msg2, len2
			read_data read_answer, 11
			
			lea esi, sud1
			lea edi, read_answer		
			mov cx, 16
			
		up: mov al, [esi]
			cmp al, 0
			je add_jmp
			jmp nxt
			
			
		add_jmp:mov bl, [edi]
				sub bl, 0x30
				mov [esi], bl
				add edi, 2	
		nxt: inc esi
			 dec cx
			 jnz up		
			 
		lea esi, sud1
		mov bl, 0
		
		mov al, [esi]
		add al,[esi+1]
		add al,[esi+2]
		add al,[esi+3]
		cmp al, 10
		je row2
		display wrong_1, len_wrong_1
		inc bl
		
   row2:mov al, [esi+4]
		add al,[esi+5]
		add al,[esi+6]
		add al,[esi+7]
		cmp al, 10
		je row3
		display wrong_2, len_wrong_2
		inc bl

   row3:mov al, [esi+8]
		add al,[esi+9]
		add al,[esi+10]
		add al,[esi+11]
		cmp al, 10
		je row4
		display wrong_3, len_wrong_3
		inc bl
   
   row4:mov al, [esi+12]
		add al,[esi+13]
		add al,[esi+14]
		add al,[esi+15]
		cmp al, 10
		je result
		display wrong_4, len_wrong_4
		inc bl
   
   result: cmp bl, 0
   		   jne wrong
   		   display msg3, len3
   		   jmp ext
   		   
   wrong: display msg4, len4
   
   ext: exit
