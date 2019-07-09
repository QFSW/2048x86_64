PUBLIC memcpy

; RCX = src
; RDX = dest
; R8 = size
.code
memcpy PROC
mloop:
	DEC R8
	MOV R9B, [RCX + R8]
	MOV [RDX + R8], R9B
	CMP R8, 0
	JNE mloop
	RET
memcpy ENDP

END