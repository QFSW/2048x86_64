PUBLIC memset

.code
; sets a block of memory to the specified value
; RCX = mem
; DL = val
; R8 = size
memset PROC
mloop:
	DEC R8
	MOV [RCX + R8], DL
	CMP R8, 0
	JNE mloop
	RET
memset ENDP

END