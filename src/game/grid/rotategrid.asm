PUBLIC rotategrid

.code
; RCX = src ptr
; RDX = dest ptr
; R8 = grid size
rotategrid PROC
	MOV R9, 0
rloop:
	MOV RAX, [RCX + R9 * 8]
	MOV [RDX + R9 * 8], RAX
	INC R9
	CMP R9, R8
	JL rloop

	RET
rotategrid ENDP

END