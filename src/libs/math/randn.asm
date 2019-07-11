PUBLIC randn
EXTERN rand:PROC

.code
; gets a random number in the specified range
; RCX = min incl
; RDX = max excl
randn PROC
	PUSH R12
	PUSH R13
	MOV R12, RDX ; max
	MOV R13, RCX ; min

	SUB R12, R13
	CALL rand
	MOV RDX, 0
	DIV R12
	MOV RAX, RDX
	ADD RAX, R13

	POP R13
	POP R12
	RET
randn ENDP

END