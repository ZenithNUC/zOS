; zOS
; TAB=4

		ORG		0x7c00			; �����?λ��

; ����?FAT12��?

		DB		0xeb, 0x4e, 0x90
		DB		"zOS__IPL"		; ��������(8�ַ�)
		DW		512				; ������С��512��?��
		DB		1				; cluster�ĸ���(��??1)
		DW		1				; FAT��ʼλ�ã�һ��?1��
		DB		2				; FAT��������??2��
		DW		224				; ��Ŀ?��С��һ��?224��
		DW		2880			; ��?��С����?��2880������
		DB		0xf0			; ��???����??0xf0��
		DW		9				; FAT?��(��??9)
		DW		18				; 1���ŵ��м�����������??18��
		DW		2				; ��?������??2��
		DD		0				; ��ʹ�÷�������??0��
		DD		2880			; ��д��?��С
		DB		0,0,0x29		; 
		DD		0xffffffff		; ��?��
		DB		"zOS-OS     "	; ��?��
		DB		"FAT12   "		; Ӳ?��ʽ
		RESB	18				; �ճ�18��?

; ��������

entry:
		AX = 0;			; ��ʼ���Ĵ���
		SS = AX;
		SP = 0x7c00;
		DS = AX;
		ES = AX;

		SI = msg;
putloop:
		AL = BYTE[SI];
        SI += 1;
        if(AL == 0){
            goto fin;
        }
        AH = 0x0e;
        BX = 15;
        INT 0x10;
        goto putloop;
fin:
		HLT;
        goto fin;

msg:
		DB		0x0a, 0x0a		; ?��2��
		DB		"zOS is in development."
		DB		0x0a			; ?��
		DB		"Last updata is 2019.09.18 19:39"
		DB		0

		RESB	0x7dfe-$		

		DB		0x55, 0xaa

; ??��֮��?��

		DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		RESB	4600
		DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		RESB	1469432
