PUBLIC memcpy

.code
memcpy PROC
memcpyloop:
	DEC R8
	MOV R9, [RCX + R8]
	MOV [RDX + R8], R9
	CMP R8, 0
	JNE memcpyloop
	RET
memcpy ENDP

END