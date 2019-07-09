PUBLIC strlen

.code
strlen PROC
	MOV RAX, -1

sloop:
	INC RAX
	MOV DL, [RCX + RAX]
	CMP DL, 0
	JNE sloop

    RET
strlen ENDP

END