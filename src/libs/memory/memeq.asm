PUBLIC memeq

; RCX = mem1
; RDX = mem2
; R8 = size
; RAX = eq
.code
memeq PROC
mloop:
	DEC R8
	MOV R9B, [RCX + R8]
	CMP [RDX + R8], R9B
	JNE mend
	CMP R8, 0
	JNE mloop

	MOV RAX, 1
	RET
mend:
	MOV RAX, 0
	RET
memeq ENDP

END