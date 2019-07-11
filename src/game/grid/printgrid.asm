PUBLIC printgrid
EXTERN putchar:PROC
EXTERN print:PROC, printdp:PROC

DIG_COUNT EQU 4
LINE_COUNT EQU 2
ASCII_SPACE EQU 32
ASCII_LINE EQU 10

.data
	linespacing db LINE_COUNT DUP(ASCII_LINE), 0

.code
; prints the grid
; RCX = grid ptr
; RDX = grid width
printgrid PROC
	PUSH R12
	PUSH R13
	PUSH R14
	PUSH R15
	ENTER 32, 0
	MOV R12, RCX ; grid ptr
	MOV R13, RDX ; grid width
	MOV R15, -1 ; y index

cloop:
	MOV R14, 0 ; x index
	INC R15
	CMP R15, R13
	JE pend
	LEA RCX, linespacing
	CALL print
rloop:
	MOV RAX, R15
	MUL R13
	ADD RAX, R14
	MOV RCX, [R12 + RAX * 8]
	MOV RDX, DIG_COUNT
	CALL printdp

	MOV RCX, ASCII_SPACE
	CALL putchar
	INC R14
	CMP R14, R13
	JE cloop
	JL rloop

pend:
	MOV RCX, ASCII_LINE
	CALL putchar
	LEAVE
	POP R15
	POP R14
	POP R13
	POP R12
	RET
printgrid ENDP

END