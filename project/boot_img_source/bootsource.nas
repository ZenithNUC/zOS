[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
[FILE "bootsource.c"]
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EBP,ESP
L2:
	JMP	L2