PUBLIC rotategridn
EXTERN rotategrid:PROC
EXTERN memcpyw:PROC

.code
; RCX = grid ptr
; RDX = grbuf
; R8 = grid width
; R9 = rotations
rotategridn PROC
	CMP R9, 0
	JE skp

	PUSH R12
	PUSH R13
	PUSH R14
	PUSH R15
	PUSH RBX
	ENTER 32, 0

	MOV R12, RCX
	MOV R13, RDX
	MOV R15, R9
	MOV RBX, R8

	MOV RAX, R8
	MUL R8
	MOV R14, RAX

rloop:
	MOV RCX, R12
	MOV RDX, R13
	MOV R8, R14
	MOV R9, RBX
	CALL rotategrid
	MOV RAX, R12
	MOV R12, R13
	MOV R13, RAX
	DEC R15
	CMP R15, 0
	JG rloop

	MOV RCX, R12
	MOV RDX, R13
	MOV R8, R14
	CALL memcpyw

rdone:
	LEAVE
	POP RBX
	POP R15
	POP R14
	POP R13
	POP R12
skp:
	RET
rotategridn ENDP

END