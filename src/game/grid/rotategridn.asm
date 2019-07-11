PUBLIC rotategridn
EXTERN rotategrid:PROC
EXTERN memcpyw:PROC

.code
; rotates the grid n times
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

	MOV R12, RCX ; grid ptr
	MOV R13, RDX ; grbuf
	MOV R15, R9 ; rotations
	MOV RBX, R8 ; grid width

	MOV RAX, R8
	MUL R8
	MOV R14, RAX ; grid size

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
	JNZ rloop

	MOV RCX, R12
	MOV RDX, R13
	MOV R8, R14
	CALL memcpyw ; copies grid back from grbuf, can be optimised as not always needed

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