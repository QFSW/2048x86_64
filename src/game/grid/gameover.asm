PUBLIC gameover

.code
; determines if the grid is in a gameover state
; RCX = grid ptr
; RAX = gameover status
gameover PROC
	MOV RAX, 0
	RET
gameover ENDP

END