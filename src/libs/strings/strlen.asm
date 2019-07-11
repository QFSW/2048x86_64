PUBLIC strlen

.code
; gets the length of a string
; RCX = str
strlen PROC
	MOV RAX, -1 ; length ctr

sloop:
	INC RAX
	MOV DL, [RCX + RAX]
	CMP DL, 0
	JNE sloop

    RET
strlen ENDP

END