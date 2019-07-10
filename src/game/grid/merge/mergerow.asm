PUBLIC mergerow
EXTERN mergenum:PROC

.code
; RCX = row ptr
; RDX = row size
mergerow PROC
	ENTER 32, 0
	PUSH R12
	PUSH R13
	PUSH R14
	MOV R12, RCX
	MOV R13, RDX
	MOV R14, 1

mloop:
	MOV RCX, R12
	MOV RDX, R14
	CALL mergenum
	INC R14
	CMP R14, R13
	JL mloop

	POP R14
	POP R13
	POP R12
	LEAVE
	RET
mergerow ENDP

END