PUBLIC rotategridn
EXTERN rotategrid:PROC
EXTERN memcpyw:PROC

.code
; RCX = grid ptr
; RDX = grbuf
; R8 = grid size
; R9 = rotations
rotategridn PROC
	CMP R9, 0
	JE skp

	PUSH R12
	PUSH R13
	PUSH R14
	PUSH R15
	ENTER 32, 0

	MOV R12, RCX
	MOV R13, RDX
	MOV R14, R8
	MOV R15, R9

rloop:
	MOV RCX, R12
	MOV RDX, R13
	MOV R8, R14
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
	POP R15
	POP R14
	POP R13
	POP R12
skp:
	RET
rotategridn ENDP

END