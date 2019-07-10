PUBLIC memcpyw

; RCX = src
; RDX = dest
; R8 = size
.code
memcpyw PROC
mloop:
	DEC R8
	MOV R9, [RCX + R8 * 8]
	MOV [RDX + R8 * 8], R9
	CMP R8, 0
	JNE mloop
	RET
memcpyw ENDP

END