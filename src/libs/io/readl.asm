PUBLIC readl
EXTERN getchar:PROC

ASCII_LINE EQU 10

.code
; RCX = strbuf
readl PROC
	PUSH R12
	ENTER 32, 0
	MOV R12, RCX
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
	JMP rloop
rend:
	MOV RDX, 0
	MOV [R12], RDX
	LEAVE
	POP R12
	RET
readl ENDP

END