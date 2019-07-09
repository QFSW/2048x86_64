PUBLIC printgrid
EXTERN putchar:PROC, printd:PROC

ASCII_SPACE EQU 32
ASCII_LINE EQU 10

.code
; RCX = grid ptr
; RDX = grid width
printgrid PROC
	PUSH R12
	PUSH R13
	PUSH R14
	PUSH R15
	ENTER 32, 0
	MOV R12, RCX
	MOV R13, RDX
	MOV R15, -1

cloop:
	MOV R14, 0
	INC R15
	CMP R15, R13
	JE pend
	MOV RCX, ASCII_LINE
	CALL putchar
rloop:
	MOV RAX, R15
	MUL R13
	ADD RAX, R14
	MOV RCX, [R12 + RAX * 8]
	CALL printd

	MOV RCX, ASCII_SPACE
	CALL putchar
	INC R14
	CMP R14, R13
	JE cloop
	JL rloop

pend:
	LEAVE
	POP R15
	POP R14
	POP R13
	POP R12
	RET
printgrid ENDP

END