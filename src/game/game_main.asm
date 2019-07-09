PUBLIC game_main
EXTERN print:PROC, strlen:PROC, printgrid:PROC, puts:PROC

GRID_WIDTH EQU 4
GRID_SIZE EQU GRID_WIDTH * GRID_WIDTH

.data
	intro db "Welcome to 2048!", 0
	grid dq GRID_SIZE DUP(0)

.code
game_main PROC
	ENTER 16, 0

	LEA RCX, intro
	CALL print

	LEA RCX, grid
	MOV RDX, GRID_WIDTH
	CALL printgrid
	
	LEAVE
    RET
game_main ENDP

END