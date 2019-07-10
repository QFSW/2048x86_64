PUBLIC addnum
EXTERN randn:PROC

.code
; RCX = grid ptr
; RDX = grid size
; R8 = grbuf
addnum PROC
	PUSH R12
	PUSH R13
	PUSH R14
	ENTER 32, 0
	MOV R12, RCX
	MOV R13, RDX
	MOV R14, R8
	MOV RCX, 0
	MOV RDX, 0

searchloop:
	MOV RAX, [R12 + RCX * 8]
	CMP RAX, 0
	JE numfound
searchloopr:
	INC RCX
	CMP RCX, R13
	JL searchloop

	MOV RCX, 0
	CALL randn
	MOV RCX, 2
	MOV RDX, [R14 + RAX * 8]
	MOV [R12 + RDX * 8], RCX

	LEAVE
	POP R14
	POP R13
	POP R12
	RET

numfound:
	MOV [R14 + RDX * 8], RCX
	INC RDX
	JMP searchloopr
addnum ENDP

END