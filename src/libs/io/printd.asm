PUBLIC printd
EXTERN putchar:PROC

ASCII_0 EQU 48

.code
; prints a number in decimal format
; RCX = num
printd PROC
	PUSH R12
	MOV R12, 0 ; dig ctr

	MOV RAX, RCX
	MOV RCX, 10
digsplitloop:
	MOV RDX, 0
	DIV RCX
	PUSH DX
	INC R12
	CMP RAX, 0
	JNE digsplitloop

printloop:
	POP CX
	ADD CL, ASCII_0
	ENTER 32, 0
	CALL putchar
	LEAVE
	DEC R12
	JNZ printloop

	POP R12
	RET
printd ENDP

END