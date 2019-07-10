PUBLIC randn
EXTERN rand:PROC

.code
; RAX = max excl
randn PROC
	PUSH R12
	MOV R12, RCX
	CALL rand
	MOV RDX, 0
	DIV R12
	MOV RAX, RDX
	POP R12
	RET
randn ENDP

END