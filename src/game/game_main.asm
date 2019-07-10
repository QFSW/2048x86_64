PUBLIC game_main
EXTERN printgrid:PROC, initgrid:PROC, mergegrid:PROC
EXTERN print:PROC, pinput:PROC
EXTERN puts:PROC, getchar:PROC
EXTERN rseedt:PROC

GRID_WIDTH EQU 4
GRID_SIZE EQU GRID_WIDTH * GRID_WIDTH

.data
	intro db "Welcome to 2048!", 0
	grid dq GRID_SIZE DUP(0)

.code
game_main PROC
	ENTER 16, 0

	CALL rseedt
	LEA RCX, grid
	MOV RDX, GRID_SIZE
	CALL initgrid

	LEA RCX, intro
	CALL print

gameloop:
	LEA RCX, grid
	MOV RDX, GRID_WIDTH
	CALL printgrid
	CALL pinput
	LEA RCX, grid
	MOV RDX, GRID_WIDTH
	CALL mergegrid
	JMP gameloop

	LEAVE
    RET
game_main ENDP

END