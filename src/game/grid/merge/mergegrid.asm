PUBLIC mergegrid
EXTERN mergerow:PROC

.code
; RCX = grid ptr
; RDX = grid width
mergegrid PROC
	ENTER 32, 0
	PUSH R12
	PUSH R13
	PUSH R14
	MOV R12, RCX
	MOV R13, RDX
	MOV R14, 0

mloop:
	MOV RAX, R14
	MUL R13
	MOV RCX, 8
	MUL RCX
	MOV RCX, R12
	ADD RCX, RAX
	MOV RDX, R13
	CALL mergerow
	INC R14
	CMP R14, R13
	JL mloop

	POP R14
	POP R13
	POP R12
	LEAVE
	RET
mergegrid ENDP

END