PUBLIC mergerow
EXTERN mergenum:PROC

.code
; RCX = row ptr
; RDX = row size
; RAX = 1 : moved
;		3 : merged
mergerow PROC
	ENTER 32, 0
	PUSH R12
	PUSH R13
	PUSH R14
	PUSH R15
	MOV R12, RCX
	MOV R13, RDX
	MOV R14, 1
	MOV R15, 0

mloop:
	MOV RCX, R12
	MOV RDX, R14
	CALL mergenum
	OR R15, RAX
	CMP RAX, 3
	JE antimerger
mloopr:
	INC R14
	CMP R14, R13
	JL mloop

	MOV RAX, R15
	POP R15
	POP R14
	POP R13
	POP R12
	LEAVE
	RET

antimerger:
	ADD RDX, 1
	SUB R14, RDX
	SUB R13, RDX
	MOV RAX, RDX
	MOV RCX, 8
	MUL RCX
	ADD R12, RAX
	JMP mloopr
mergerow ENDP

END