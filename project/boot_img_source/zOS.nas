; zOS
; TAB=4

		ORG		0x7c00			; ������?�ʒu

; �ȉ�?FAT12��?

		DB		0xeb, 0x4e, 0x90
		DB		"zOS__IPL"		; ��於��(8����)
		DW		512				; ���召�i512��?�j
		DB		1				; cluster�I����(�K??1)
		DW		1				; FAT�N�n�ʒu�i���?1�j
		DB		2				; FAT�����i�K??2�j
		DW		224				; ����?�召�i���?224�j
		DW		2880			; ��?�召�i�K?��2880���j
		DB		0xf0			; ��???�i�K??0xf0�j
		DW		9				; FAT?�x(�K??9)
		DW		18				; 1�������L�{�����i�K??18�j
		DW		2				; ��?���i�K??2�j
		DD		0				; �s�g�p����i�K??0�j
		DD		2880			; �d�ʎ�?�召
		DB		0,0,0x29		; 
		DD		0xffffffff		; ��?��
		DB		"zOS-OS     "	; ��?��
		DB		"FAT12   "		; �d?�i��
		RESB	18				; ��o18��?

; �������

entry:
		MOV		AX,0			; ���n���񑶊�
		MOV		SS,AX
		MOV		SP,0x7c00
		MOV		DS,AX
		MOV		ES,AX

		MOV		SI,msg
putloop:
		MOV		AL,[SI]
		ADD		SI,1			; ?ST+1
		CMP		AL,0
		JE		fin
		MOV		AH,0x0e			; ?������
		MOV		BX,15			; ����?�F
		INT		0x10			; ?�p??BIOS
		JMP		putloop
fin:
		HLT						; CPU��~���Ҏw��
		JMP		fin				; ���z?

msg:
		DB		0x0a, 0x0a		; ?�s2��
		DB		"zOS is in development."
		DB		0x0a			; ?�s
		DB		"Last updata is 2019.09.18 19:39"
		DB		0

		RESB	0x7dfe-$		

		DB		0x55, 0xaa

; ??��V�O?�o

		DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		RESB	4600
		DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		RESB	1469432
