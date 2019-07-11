PUBLIC readl
EXTERN getchar:PROC

ASCII_LINE EQU 10

.code
; reads a line from the console into the specified buffer
; RCX = strbuf
; RDX = bufsize
readl PROC
	PUSH R12
	PUSH R13
	ENTER 32, 0
	MOV R12, RCX ; strbuf start
	MOV R13, RCX ; strbuf end
	ADD R13, RDX
	SUB R13, 1

rflush:
	CALL getchar
	CMP AL, ASCII_LINE
	JE rflush
	MOV [R12], AL
	INC R12

rloop:
	CALL getchar
	CMP AL, ASCII_LINE
	JE rend
	MOV [R12], AL
	INC R12
	CMP R12, R13
	CMOVGE R12, R13 ; moves ptr back if out of buffer space
	JMP rloop

rend:
	MOV RDX, 0
	MOV [R12], RDX
	LEAVE
	POP R13
	POP R12
	RET
readl ENDP

END