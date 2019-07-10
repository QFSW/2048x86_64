PUBLIC rotategrid

.code
; RCX = src ptr
; RDX = dest ptr
; R8 = grid size
rotategrid PROC
	MOV R9, 0
rloop:
	INC R9
	CMP R9, R8
	JL rloop

	RET
rotategrid ENDP

END