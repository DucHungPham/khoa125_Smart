//Deviec:MS82Fxx02
//-----------------------Variable---------------------------------
		_kepTag		EQU		5CH
		_timeOut		EQU		58H
		_timeTick		EQU		5AH
		_mtState		EQU		5DH
		_keyID		EQU		5EH
		_buffTag		EQU		25H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	48AH 			//0009 	3C8A
		LJUMP 	3EBH 			//000A 	3BEB
		LDWI 	10H 			//000B 	2A10
		ORG		000CH

		//;rfid125.c: 23: unsigned char RF_serial_55bits[11];
		//;rfid125.c: 24: unsigned int timeOutVal;
		//;rfid125.c: 25: unsigned char i,ii,j;
		//;rfid125.c: 26: unsigned char flag_RFID_syn, flag_RFID_last;
		//;rfid125.c: 27: unsigned char even_row, even_col;
		//;rfid125.c: 30: flag_RFID_syn = 0;
		CLRR 	49H 			//000C 	0149

		//;rfid125.c: 33: i=16;
		STR 	4DH 			//000D 	01CD

		//;rfid125.c: 35: {
		//;rfid125.c: 36: timeOutVal=timerOut(1,600);
		LDWI 	58H 			//000E 	2A58
		STR 	72H 			//000F 	01F2
		LDWI 	2H 			//0010 	2A02
		STR 	73H 			//0011 	01F3
		LDWI 	1H 			//0012 	2A01
		LCALL 	320H 			//0013 	3320
		ORG		0014H

		//;rfid125.c: 37: if(timeOutVal==0) return 0;
		LCALL 	141H 			//0014 	3141
		BTSC 	STATUS,2 		//0015 	1503
		RETW 	0H 			//0016 	2100

		//;rfid125.c: 39: timeOutVal=timerOut(0,600);
		LDWI 	58H 			//0017 	2A58
		LCALL 	154H 			//0018 	3154
		LCALL 	320H 			//0019 	3320

		//;rfid125.c: 40: if(timeOutVal==0) return 0;
		LCALL 	141H 			//001A 	3141
		BTSC 	STATUS,2 		//001B 	1503
		ORG		001CH
		RETW 	0H 			//001C 	2100
		LDWI 	1H 			//001D 	2A01

		//;rfid125.c: 42: i--;
		DECR 	4DH,1 			//001E 	0DCD

		//;rfid125.c: 43: }
		//;rfid125.c: 44: while(timeOutVal<290 && i>0);
		SUBWR 	50H,0 			//001F 	0C50
		LDWI 	22H 			//0020 	2A22
		BTSC 	STATUS,2 		//0021 	1503
		SUBWR 	4FH,0 			//0022 	0C4F
		BTSC 	STATUS,0 		//0023 	1403
		ORG		0024H
		LJUMP 	28H 			//0024 	3828
		LDR 	4DH,1 			//0025 	08CD
		BTSS 	STATUS,2 		//0026 	1D03
		LJUMP 	0EH 			//0027 	380E

		//;rfid125.c: 45: flag_RFID_last = 1;
		CLRR 	4EH 			//0028 	014E
		INCR	4EH,1 			//0029 	09CE

		//;rfid125.c: 46: i = 0;
		CLRR 	4DH 			//002A 	014D

		//;rfid125.c: 47: while(i<64)
		LDWI 	40H 			//002B 	2A40
		ORG		002CH
		SUBWR 	4DH,0 			//002C 	0C4D
		BTSC 	STATUS,0 		//002D 	1403
		LJUMP 	84H 			//002E 	3884

		//;rfid125.c: 48: {
		//;rfid125.c: 49: for(ii=0;ii<9;ii++)
		CLRR 	51H 			//002F 	0151

		//;rfid125.c: 50: {
		//;rfid125.c: 51: timeOutVal=timerOut(flag_RFID_last,600);
		LCALL 	14EH 			//0030 	314E
		LCALL 	320H 			//0031 	3320

		//;rfid125.c: 52: if(timeOutVal==0) return 0;
		LCALL 	141H 			//0032 	3141
		BTSC 	STATUS,2 		//0033 	1503
		ORG		0034H
		RETW 	0H 			//0034 	2100

		//;rfid125.c: 54: if(0==flag_RFID_last && timeOutVal<=290 ||
		//;rfid125.c: 55: 1==flag_RFID_last && timeOutVal>290)
		LDR 	4EH,1 			//0035 	08CE
		BTSS 	STATUS,2 		//0036 	1D03
		LJUMP 	3FH 			//0037 	383F
		LDWI 	1H 			//0038 	2A01
		SUBWR 	50H,0 			//0039 	0C50
		LDWI 	23H 			//003A 	2A23
		BTSC 	STATUS,2 		//003B 	1503
		ORG		003CH
		SUBWR 	4FH,0 			//003C 	0C4F
		BTSS 	STATUS,0 		//003D 	1C03
		LJUMP 	48H 			//003E 	3848
		DECRSZ 	4EH,0 		//003F 	0E4E
		LJUMP 	56H 			//0040 	3856
		LDWI 	1H 			//0041 	2A01
		SUBWR 	50H,0 			//0042 	0C50
		LDWI 	23H 			//0043 	2A23
		ORG		0044H
		BTSC 	STATUS,2 		//0044 	1503
		SUBWR 	4FH,0 			//0045 	0C4F
		BTSS 	STATUS,0 		//0046 	1C03
		LJUMP 	56H 			//0047 	3856

		//;rfid125.c: 56: {
		//;rfid125.c: 57: if(!flag_RFID_last)
		LDR 	4EH,1 			//0048 	08CE
		BTSS 	STATUS,2 		//0049 	1D03
		LJUMP 	53H 			//004A 	3853

		//;rfid125.c: 58: {
		//;rfid125.c: 59: timeOutVal=timerOut(1,290);
		LDWI 	22H 			//004B 	2A22
		ORG		004CH
		STR 	72H 			//004C 	01F2
		LDWI 	1H 			//004D 	2A01
		STR 	73H 			//004E 	01F3
		LCALL 	320H 			//004F 	3320

		//;rfid125.c: 60: if(timeOutVal==0) return 0;
		LCALL 	141H 			//0050 	3141
		BTSC 	STATUS,2 		//0051 	1503
		RETW 	0H 			//0052 	2100

		//;rfid125.c: 61: }
		//;rfid125.c: 62: flag_RFID_last = 0;
		CLRR 	4EH 			//0053 	014E
		ORG		0054H

		//;rfid125.c: 63: i++;
		INCR	4DH,1 			//0054 	09CD

		//;rfid125.c: 64: }
		LJUMP 	79H 			//0055 	3879

		//;rfid125.c: 65: else
		//;rfid125.c: 66: if(0==flag_RFID_last && timeOutVal>290 ||
		//;rfid125.c: 67: 1==flag_RFID_last && timeOutVal<=290)
		LDR 	4EH,1 			//0056 	08CE
		BTSS 	STATUS,2 		//0057 	1D03
		LJUMP 	60H 			//0058 	3860
		LDWI 	1H 			//0059 	2A01
		SUBWR 	50H,0 			//005A 	0C50
		LDWI 	23H 			//005B 	2A23
		ORG		005CH
		BTSC 	STATUS,2 		//005C 	1503
		SUBWR 	4FH,0 			//005D 	0C4F
		BTSC 	STATUS,0 		//005E 	1403
		LJUMP 	69H 			//005F 	3869
		DECRSZ 	4EH,0 		//0060 	0E4E
		LJUMP 	79H 			//0061 	3879
		LDWI 	1H 			//0062 	2A01
		SUBWR 	50H,0 			//0063 	0C50
		ORG		0064H
		LDWI 	23H 			//0064 	2A23
		BTSC 	STATUS,2 		//0065 	1503
		SUBWR 	4FH,0 			//0066 	0C4F
		BTSC 	STATUS,0 		//0067 	1403
		LJUMP 	79H 			//0068 	3879

		//;rfid125.c: 68: {
		//;rfid125.c: 69: if(flag_RFID_last)
		LDR 	4EH,0 			//0069 	084E
		BTSC 	STATUS,2 		//006A 	1503
		LJUMP 	75H 			//006B 	3875
		ORG		006CH

		//;rfid125.c: 70: {
		//;rfid125.c: 71: timeOutVal=timerOut(0,290);
		LDWI 	22H 			//006C 	2A22
		STR 	72H 			//006D 	01F2
		LDWI 	1H 			//006E 	2A01
		STR 	73H 			//006F 	01F3
		LDWI 	0H 			//0070 	2A00
		LCALL 	320H 			//0071 	3320

		//;rfid125.c: 72: if(timeOutVal==0) return 0;
		LCALL 	141H 			//0072 	3141
		BTSC 	STATUS,2 		//0073 	1503
		ORG		0074H
		RETW 	0H 			//0074 	2100

		//;rfid125.c: 73: }
		//;rfid125.c: 74: flag_RFID_last = 1;
		CLRR 	4EH 			//0075 	014E
		INCR	4EH,1 			//0076 	09CE

		//;rfid125.c: 75: i++;
		INCR	4DH,1 			//0077 	09CD

		//;rfid125.c: 77: break;
		LJUMP 	7EH 			//0078 	387E
		LDWI 	9H 			//0079 	2A09
		INCR	51H,1 			//007A 	09D1
		SUBWR 	51H,0 			//007B 	0C51
		ORG		007CH
		BTSS 	STATUS,0 		//007C 	1C03
		LJUMP 	30H 			//007D 	3830

		//;rfid125.c: 78: }
		//;rfid125.c: 80: }
		//;rfid125.c: 81: if(9==ii)
		LDR 	51H,0 			//007E 	0851
		XORWI 	9H 			//007F 	2609
		BTSS 	STATUS,2 		//0080 	1D03
		LJUMP 	2BH 			//0081 	382B

		//;rfid125.c: 82: {
		//;rfid125.c: 83: flag_RFID_syn = 1;
		CLRR 	49H 			//0082 	0149
		INCR	49H,1 			//0083 	09C9
		ORG		0084H

		//;rfid125.c: 84: break;
		//;rfid125.c: 85: }
		//;rfid125.c: 86: }
		//;rfid125.c: 88: if(!flag_RFID_syn)
		LDR 	49H,1 			//0084 	08C9
		BTSC 	STATUS,2 		//0085 	1503
		RETW 	0H 			//0086 	2100

		//;rfid125.c: 91: }
		//;rfid125.c: 92: for(ii=0;ii<55;ii++)
		CLRR 	51H 			//0087 	0151

		//;rfid125.c: 93: {
		//;rfid125.c: 94: i = ii/5;
		LDWI 	5H 			//0088 	2A05
		STR 	72H 			//0089 	01F2
		LDR 	51H,0 			//008A 	0851
		LCALL 	39EH 			//008B 	339E
		ORG		008CH
		STR 	4DH 			//008C 	01CD

		//;rfid125.c: 95: timeOutVal=timerOut(flag_RFID_last,600);
		LCALL 	14EH 			//008D 	314E
		LCALL 	320H 			//008E 	3320

		//;rfid125.c: 96: if(timeOutVal==0) return 0;
		LCALL 	141H 			//008F 	3141
		BTSC 	STATUS,2 		//0090 	1503
		RETW 	0H 			//0091 	2100

		//;rfid125.c: 98: if(0==flag_RFID_last && timeOutVal<=290 ||
		//;rfid125.c: 99: 1==flag_RFID_last && timeOutVal>290)
		LDR 	4EH,1 			//0092 	08CE
		BTSS 	STATUS,2 		//0093 	1D03
		ORG		0094H
		LJUMP 	9CH 			//0094 	389C
		LDWI 	1H 			//0095 	2A01
		SUBWR 	50H,0 			//0096 	0C50
		LDWI 	23H 			//0097 	2A23
		BTSC 	STATUS,2 		//0098 	1503
		SUBWR 	4FH,0 			//0099 	0C4F
		BTSS 	STATUS,0 		//009A 	1C03
		LJUMP 	A5H 			//009B 	38A5
		ORG		009CH
		DECRSZ 	4EH,0 		//009C 	0E4E
		LJUMP 	B7H 			//009D 	38B7
		LDWI 	1H 			//009E 	2A01
		SUBWR 	50H,0 			//009F 	0C50
		LDWI 	23H 			//00A0 	2A23
		BTSC 	STATUS,2 		//00A1 	1503
		SUBWR 	4FH,0 			//00A2 	0C4F
		BTSS 	STATUS,0 		//00A3 	1C03
		ORG		00A4H
		LJUMP 	B7H 			//00A4 	38B7

		//;rfid125.c: 100: {
		//;rfid125.c: 101: if(!flag_RFID_last)
		LDR 	4EH,1 			//00A5 	08CE
		BTSS 	STATUS,2 		//00A6 	1D03
		LJUMP 	B0H 			//00A7 	38B0

		//;rfid125.c: 102: {
		//;rfid125.c: 103: timeOutVal=timerOut(1,290);
		LDWI 	22H 			//00A8 	2A22
		STR 	72H 			//00A9 	01F2
		LDWI 	1H 			//00AA 	2A01
		STR 	73H 			//00AB 	01F3
		ORG		00ACH
		LCALL 	320H 			//00AC 	3320

		//;rfid125.c: 104: if(timeOutVal==0) return 0;
		LCALL 	141H 			//00AD 	3141
		BTSC 	STATUS,2 		//00AE 	1503
		RETW 	0H 			//00AF 	2100

		//;rfid125.c: 105: }
		//;rfid125.c: 106: flag_RFID_last = 0;
		CLRR 	4EH 			//00B0 	014E

		//;rfid125.c: 107: RF_serial_55bits[i] <<= 1;
		LCALL 	147H 			//00B1 	3147

		//;rfid125.c: 108: RF_serial_55bits[i] |= 0x01;
		LDR 	4DH,0 			//00B2 	084D
		ADDWI 	3EH 			//00B3 	273E
		ORG		00B4H
		STR 	FSR 			//00B4 	0184
		BSR 	INDF,0 			//00B5 	1800

		//;rfid125.c: 109: }
		LJUMP 	D6H 			//00B6 	38D6

		//;rfid125.c: 110: else
		//;rfid125.c: 111: if(0==flag_RFID_last && timeOutVal>290 ||
		//;rfid125.c: 112: 1==flag_RFID_last && timeOutVal<=290)
		LDR 	4EH,1 			//00B7 	08CE
		BTSS 	STATUS,2 		//00B8 	1D03
		LJUMP 	C1H 			//00B9 	38C1
		LDWI 	1H 			//00BA 	2A01
		SUBWR 	50H,0 			//00BB 	0C50
		ORG		00BCH
		LDWI 	23H 			//00BC 	2A23
		BTSC 	STATUS,2 		//00BD 	1503
		SUBWR 	4FH,0 			//00BE 	0C4F
		BTSC 	STATUS,0 		//00BF 	1403
		LJUMP 	CAH 			//00C0 	38CA
		DECRSZ 	4EH,0 		//00C1 	0E4E
		LJUMP 	D6H 			//00C2 	38D6
		LDWI 	1H 			//00C3 	2A01
		ORG		00C4H
		SUBWR 	50H,0 			//00C4 	0C50
		LDWI 	23H 			//00C5 	2A23
		BTSC 	STATUS,2 		//00C6 	1503
		SUBWR 	4FH,0 			//00C7 	0C4F
		BTSC 	STATUS,0 		//00C8 	1403
		LJUMP 	D6H 			//00C9 	38D6

		//;rfid125.c: 113: {
		//;rfid125.c: 114: if(flag_RFID_last)
		LDR 	4EH,0 			//00CA 	084E
		BTSC 	STATUS,2 		//00CB 	1503
		ORG		00CCH
		LJUMP 	D3H 			//00CC 	38D3

		//;rfid125.c: 115: {
		//;rfid125.c: 116: timeOutVal=timerOut(0,600);
		LDWI 	58H 			//00CD 	2A58
		LCALL 	154H 			//00CE 	3154
		LCALL 	320H 			//00CF 	3320

		//;rfid125.c: 117: if(timeOutVal==0) return 0;
		LCALL 	141H 			//00D0 	3141
		BTSC 	STATUS,2 		//00D1 	1503
		RETW 	0H 			//00D2 	2100

		//;rfid125.c: 118: }
		//;rfid125.c: 119: flag_RFID_last = 1;
		CLRR 	4EH 			//00D3 	014E
		ORG		00D4H
		INCR	4EH,1 			//00D4 	09CE

		//;rfid125.c: 120: RF_serial_55bits[i] <<= 1;
		LCALL 	147H 			//00D5 	3147
		LDWI 	37H 			//00D6 	2A37
		INCR	51H,1 			//00D7 	09D1
		SUBWR 	51H,0 			//00D8 	0C51
		BTSS 	STATUS,0 		//00D9 	1C03
		LJUMP 	88H 			//00DA 	3888

		//;rfid125.c: 121: }
		//;rfid125.c: 122: }
		//;rfid125.c: 123: if(55==ii)
		LDR 	51H,0 			//00DB 	0851
		ORG		00DCH
		XORWI 	37H 			//00DC 	2637
		BTSS 	STATUS,2 		//00DD 	1D03
		RETW 	0H 			//00DE 	2100

		//;rfid125.c: 124: {
		//;rfid125.c: 125: even_col = 0;
		CLRR 	4AH 			//00DF 	014A

		//;rfid125.c: 126: for(ii=0;ii<10;ii++)
		CLRR 	51H 			//00E0 	0151

		//;rfid125.c: 127: {
		//;rfid125.c: 128: even_row = (RF_serial_55bits[ii] & 0x01);
		LDR 	51H,0 			//00E1 	0851
		ADDWI 	3EH 			//00E2 	273E
		STR 	FSR 			//00E3 	0184
		ORG		00E4H
		BCR 	STATUS,7 		//00E4 	1383
		LDR 	INDF,0 			//00E5 	0800
		STR 	4BH 			//00E6 	01CB
		LDWI 	1H 			//00E7 	2A01
		ANDWR 	4BH,1 			//00E8 	02CB

		//;rfid125.c: 129: for(j=1;j<5;j++)
		CLRR 	4CH 			//00E9 	014C
		INCR	4CH,1 			//00EA 	09CC

		//;rfid125.c: 130: {
		//;rfid125.c: 131: even_row = even_row ^ ((RF_serial_55bits[ii]>>j) & 0x01);
		LDR 	51H,0 			//00EB 	0851
		ORG		00ECH
		ADDWI 	3EH 			//00EC 	273E
		STR 	FSR 			//00ED 	0184
		LDR 	INDF,0 			//00EE 	0800
		STR 	77H 			//00EF 	01F7
		INCR	4CH,0 			//00F0 	094C
		LJUMP 	F4H 			//00F1 	38F4
		BCR 	STATUS,0 		//00F2 	1003
		RRR	77H,1 			//00F3 	06F7
		ORG		00F4H
		ADDWI 	FFH 			//00F4 	27FF
		BTSS 	STATUS,2 		//00F5 	1D03
		LJUMP 	F2H 			//00F6 	38F2
		LDR 	77H,0 			//00F7 	0877
		ANDWI 	1H 			//00F8 	2401
		XORWR 	4BH,1 			//00F9 	04CB
		LDWI 	5H 			//00FA 	2A05
		INCR	4CH,1 			//00FB 	09CC
		ORG		00FCH
		SUBWR 	4CH,0 			//00FC 	0C4C
		BTSS 	STATUS,0 		//00FD 	1C03
		LJUMP 	EBH 			//00FE 	38EB

		//;rfid125.c: 132: }
		//;rfid125.c: 133: if(even_row & 0x01)
		BTSC 	4BH,0 			//00FF 	144B
		RETW 	0H 			//0100 	2100

		//;rfid125.c: 136: }
		//;rfid125.c: 138: RF_serial_55bits[ii] <<= 3;
		LDR 	51H,0 			//0101 	0851
		ADDWI 	3EH 			//0102 	273E
		STR 	FSR 			//0103 	0184
		ORG		0104H
		RLR 	INDF,1 			//0104 	0580
		RLR 	INDF,1 			//0105 	0580
		RLR 	INDF,0 			//0106 	0500
		ANDWI 	F8H 			//0107 	24F8
		STR 	INDF 			//0108 	0180

		//;rfid125.c: 140: i = RF_serial_55bits[ii];
		LDR 	51H,0 			//0109 	0851
		ADDWI 	3EH 			//010A 	273E
		STR 	FSR 			//010B 	0184
		ORG		010CH
		LDR 	INDF,0 			//010C 	0800
		STR 	4DH 			//010D 	01CD

		//;rfid125.c: 141: if( 0==ii%2 )
		BTSC 	51H,0 			//010E 	1451
		LJUMP 	11DH 			//010F 	391D

		//;rfid125.c: 142: {
		//;rfid125.c: 143: keyID[ii/2] = (i & 0xF0);
		BCR 	STATUS,0 		//0110 	1003
		RRR	51H,0 			//0111 	0651
		ADDWI 	5EH 			//0112 	275E
		STR 	FSR 			//0113 	0184
		ORG		0114H
		LDR 	4DH,0 			//0114 	084D
		STR 	INDF 			//0115 	0180
		BCR 	STATUS,0 		//0116 	1003
		RRR	51H,0 			//0117 	0651
		ADDWI 	5EH 			//0118 	275E
		STR 	FSR 			//0119 	0184
		LDWI 	F0H 			//011A 	2AF0
		ANDWR 	INDF,1 		//011B 	0280
		ORG		011CH

		//;rfid125.c: 144: }
		LJUMP 	127H 			//011C 	3927
		LDWI 	FH 			//011D 	2A0F

		//;rfid125.c: 145: else
		//;rfid125.c: 146: {
		//;rfid125.c: 147: i >>=4;
		SWAPR 	4DH,1 			//011E 	07CD
		ANDWR 	4DH,1 			//011F 	02CD

		//;rfid125.c: 148: keyID[ii/2] |= (i & 0x0F);
		BCR 	STATUS,0 		//0120 	1003
		RRR	51H,0 			//0121 	0651
		ADDWI 	5EH 			//0122 	275E
		STR 	FSR 			//0123 	0184
		ORG		0124H
		LDR 	4DH,0 			//0124 	084D
		ANDWI 	FH 			//0125 	240F
		IORWR 	INDF,1 		//0126 	0380

		//;rfid125.c: 149: }
		//;rfid125.c: 150: even_col ^= RF_serial_55bits[ii];
		LDR 	51H,0 			//0127 	0851
		ADDWI 	3EH 			//0128 	273E
		STR 	FSR 			//0129 	0184
		LDR 	INDF,0 			//012A 	0800
		XORWR 	4AH,1 			//012B 	04CA
		ORG		012CH
		LDWI 	AH 			//012C 	2A0A
		INCR	51H,1 			//012D 	09D1
		SUBWR 	51H,0 			//012E 	0C51
		BTSS 	STATUS,0 		//012F 	1C03
		LJUMP 	E1H 			//0130 	38E1

		//;rfid125.c: 151: }
		//;rfid125.c: 152: RF_serial_55bits[10] <<= 3;
		RLR 	48H,1 			//0131 	05C8
		RLR 	48H,1 			//0132 	05C8
		RLR 	48H,0 			//0133 	0548
		ORG		0134H
		ANDWI 	F8H 			//0134 	24F8
		STR 	48H 			//0135 	01C8
		LDWI 	F0H 			//0136 	2AF0

		//;rfid125.c: 153: keyID[0] =0x00;
		CLRR 	5EH 			//0137 	015E

		//;rfid125.c: 154: if(((RF_serial_55bits[10] & 0xf0)==(even_col & 0xf0)) && (0==(RF_serial
		//+                          _55bits[10]&0x08)))
		ANDWR 	4AH,0 			//0138 	024A
		STR 	77H 			//0139 	01F7
		LDR 	48H,0 			//013A 	0848
		ANDWI 	F0H 			//013B 	24F0
		ORG		013CH
		XORWR 	77H,0 			//013C 	0477
		BTSC 	STATUS,2 		//013D 	1503
		BTSC 	48H,3 			//013E 	15C8
		RETW 	0H 			//013F 	2100

		//;rfid125.c: 155: {
		//;rfid125.c: 157: return 1;
		RETW 	1H 			//0140 	2101
		LDR 	73H,0 			//0141 	0873
		STR 	50H 			//0142 	01D0
		LDR 	72H,0 			//0143 	0872
		ORG		0144H
		STR 	4FH 			//0144 	01CF
		IORWR 	50H,0 			//0145 	0350
		RET		 					//0146 	0004
		LDR 	4DH,0 			//0147 	084D
		ADDWI 	3EH 			//0148 	273E
		STR 	FSR 			//0149 	0184
		BCR 	STATUS,7 		//014A 	1383
		BCR 	STATUS,0 		//014B 	1003
		ORG		014CH
		RLR 	INDF,1 			//014C 	0580
		RET		 					//014D 	0004
		LDWI 	58H 			//014E 	2A58
		STR 	72H 			//014F 	01F2
		LDWI 	2H 			//0150 	2A02
		STR 	73H 			//0151 	01F3
		LDR 	4EH,0 			//0152 	084E
		RET		 					//0153 	0004
		ORG		0154H
		STR 	72H 			//0154 	01F2
		LDWI 	2H 			//0155 	2A02
		STR 	73H 			//0156 	01F3
		RETW 	0H 			//0157 	2100
		LDWI 	7H 			//0158 	2A07
		STR 	19H 			//0159 	0199

		//;MAIN.C: 197: unsigned char idop,tmp,idState=0;
		BCR 	STATUS,5 		//015A 	1283
		BCR 	STATUS,6 		//015B 	1303
		ORG		015CH
		CLRR 	55H 			//015C 	0155
		CLRWDT	 			//015D 	0001

		//;MAIN.C: 200: sys_init();
		LCALL 	4A3H 			//015E 	34A3

		//;MAIN.C: 201: gpio_init();
		LCALL 	46DH 			//015F 	346D

		//;MAIN.C: 203: timer_init();
		LCALL 	4ADH 			//0160 	34AD

		//;MAIN.C: 204: int_init();
		LCALL 	42BH 			//0161 	342B

		//;MAIN.C: 210: eepromWriteByte(0x7F,0xAA);
		LDWI 	AAH 			//0162 	2AAA
		STR 	72H 			//0163 	01F2
		ORG		0164H
		LDWI 	7FH 			//0164 	2A7F
		LCALL 	2FDH 			//0165 	32FD

		//;MAIN.C: 211: eepromWriteByte(0x7F,0xAA);
		LDWI 	AAH 			//0166 	2AAA
		STR 	72H 			//0167 	01F2
		LDWI 	7FH 			//0168 	2A7F
		LCALL 	2FDH 			//0169 	32FD

		//;MAIN.C: 214: TRISC &=0xfe;
		BSR 	STATUS,5 		//016A 	1A83
		BCR 	STATUS,6 		//016B 	1303
		ORG		016CH
		BCR 	7H,0 			//016C 	1007

		//;MAIN.C: 216: SET_EPWM_ON();
		LCALL 	3D3H 			//016D 	33D3

		//;MAIN.C: 220: _delay((unsigned long)((20)*(8000000/4000.0)));
		LDWI 	34H 			//016E 	2A34
		BCR 	STATUS,5 		//016F 	1283
		STR 	53H 			//0170 	01D3
		LDWI 	F1H 			//0171 	2AF1
		STR 	52H 			//0172 	01D2
		DECRSZ 	52H,1 		//0173 	0ED2
		ORG		0174H
		LJUMP 	173H 			//0174 	3973
		DECRSZ 	53H,1 		//0175 	0ED3
		LJUMP 	173H 			//0176 	3973
		LJUMP 	178H 			//0177 	3978

		//;MAIN.C: 225: if(eepromReadByte(0x06)!=0){
		LDWI 	6H 			//0178 	2A06
		LCALL 	4B7H 			//0179 	34B7
		XORWI 	0H 			//017A 	2600
		BTSC 	STATUS,2 		//017B 	1503
		ORG		017CH
		LJUMP 	18FH 			//017C 	398F
		LDWI 	6H 			//017D 	2A06

		//;MAIN.C: 229: eepromWriteByte(0x06,0);
		CLRR 	72H 			//017E 	0172
		LCALL 	2FDH 			//017F 	32FD
		LDWI 	7H 			//0180 	2A07

		//;MAIN.C: 230: eepromWriteByte(0x06+1,0);
		CLRR 	72H 			//0181 	0172
		LCALL 	2FDH 			//0182 	32FD

		//;MAIN.C: 231: eepromWriteByte(0x06+2,0x87);
		LDWI 	87H 			//0183 	2A87
		ORG		0184H
		STR 	72H 			//0184 	01F2
		LDWI 	8H 			//0185 	2A08
		LCALL 	2FDH 			//0186 	32FD

		//;MAIN.C: 232: eepromWriteByte(0x06+3,0x3a);
		LDWI 	3AH 			//0187 	2A3A
		STR 	72H 			//0188 	01F2
		LDWI 	9H 			//0189 	2A09
		LCALL 	2FDH 			//018A 	32FD

		//;MAIN.C: 233: eepromWriteByte(0x06+4,0xf8);
		LDWI 	F8H 			//018B 	2AF8
		ORG		018CH
		STR 	72H 			//018C 	01F2
		LDWI 	AH 			//018D 	2A0A
		LCALL 	2FDH 			//018E 	32FD

		//;MAIN.C: 235: }
		//;MAIN.C: 236: eepromReadBlock(0x06,buffTag,5*5);
		LDWI 	25H 			//018F 	2A25
		STR 	74H 			//0190 	01F4
		LDWI 	19H 			//0191 	2A19
		STR 	75H 			//0192 	01F5
		LDWI 	6H 			//0193 	2A06
		ORG		0194H
		LCALL 	43DH 			//0194 	343D

		//;MAIN.C: 238: setState(1,45);
		LDWI 	2DH 			//0195 	2A2D
		STR 	72H 			//0196 	01F2
		LDWI 	1H 			//0197 	2A01
		CLRR 	73H 			//0198 	0173
		LCALL 	498H 			//0199 	3498

		//;MAIN.C: 242: tmp=0;
		CLRR 	56H 			//019A 	0156

		//;MAIN.C: 246: if(kepTag==0)
		LDR 	5CH,1 			//019B 	08DC
		ORG		019CH
		BTSS 	STATUS,2 		//019C 	1D03
		LJUMP 	1A0H 			//019D 	39A0

		//;MAIN.C: 247: idop = get_RFID();
		LCALL 	BH 			//019E 	300B
		STR 	57H 			//019F 	01D7

		//;MAIN.C: 249: if(idop&&(kepTag==0)){
		LDR 	57H,0 			//01A0 	0857
		BTSC 	STATUS,2 		//01A1 	1503
		LJUMP 	24BH 			//01A2 	3A4B
		LDR 	5CH,1 			//01A3 	08DC
		ORG		01A4H
		BTSS 	STATUS,2 		//01A4 	1D03
		LJUMP 	24BH 			//01A5 	3A4B

		//;MAIN.C: 250: idop = id_search(keyID,buffTag);
		LDWI 	25H 			//01A6 	2A25
		STR 	7AH 			//01A7 	01FA
		LDWI 	5EH 			//01A8 	2A5E
		LCALL 	3B9H 			//01A9 	33B9
		STR 	57H 			//01AA 	01D7

		//;MAIN.C: 251: switch (mtState){
		LJUMP 	232H 			//01AB 	3A32
		ORG		01ACH

		//;MAIN.C: 253: case 2:
		//;MAIN.C: 254: if((idop>1) && (idop <6))
		LDWI 	2H 			//01AC 	2A02
		SUBWR 	57H,0 			//01AD 	0C57
		BTSS 	STATUS,0 		//01AE 	1C03
		LJUMP 	1B9H 			//01AF 	39B9
		LDWI 	6H 			//01B0 	2A06
		SUBWR 	57H,0 			//01B1 	0C57
		BTSC 	STATUS,0 		//01B2 	1403
		LJUMP 	1B9H 			//01B3 	39B9
		ORG		01B4H
		LDWI 	0H 			//01B4 	2A00

		//;MAIN.C: 255: {
		//;MAIN.C: 256: setState(0,0);
		CLRR 	72H 			//01B5 	0172
		CLRR 	73H 			//01B6 	0173
		LCALL 	498H 			//01B7 	3498

		//;MAIN.C: 258: }
		LJUMP 	23DH 			//01B8 	3A3D

		//;MAIN.C: 259: else if(idop==1)
		DECRSZ 	57H,0 		//01B9 	0E57
		LJUMP 	23DH 			//01BA 	3A3D

		//;MAIN.C: 260: {
		//;MAIN.C: 262: id_clear(2,5);
		LDWI 	5H 			//01BB 	2A05
		ORG		01BCH
		STR 	42H 			//01BC 	01C2
		LDWI 	2H 			//01BD 	2A02
		LCALL 	341H 			//01BE 	3341
		LDWI 	3H 			//01BF 	2A03

		//;MAIN.C: 263: setState(3,0);
		CLRR 	72H 			//01C0 	0172
		CLRR 	73H 			//01C1 	0173
		LCALL 	498H 			//01C2 	3498
		LDWI 	3H 			//01C3 	2A03
		ORG		01C4H

		//;MAIN.C: 264: tmp=1;
		CLRR 	56H 			//01C4 	0156
		INCR	56H,1 			//01C5 	09D6

		//;MAIN.C: 266: beep2(0,3);
		STR 	75H 			//01C6 	01F5
		LDWI 	0H 			//01C7 	2A00
		LCALL 	402H 			//01C8 	3402
		LJUMP 	23DH 			//01C9 	3A3D

		//;MAIN.C: 277: if(idop==1 && idState == 0){
		DECRSZ 	57H,0 		//01CA 	0E57
		LJUMP 	1DEH 			//01CB 	39DE
		ORG		01CCH
		LDR 	55H,1 			//01CC 	08D5
		BTSS 	STATUS,2 		//01CD 	1D03
		LJUMP 	1DEH 			//01CE 	39DE

		//;MAIN.C: 279: id_clear(2,5);
		LDWI 	5H 			//01CF 	2A05
		STR 	42H 			//01D0 	01C2
		LDWI 	2H 			//01D1 	2A02
		LCALL 	341H 			//01D2 	3341
		LDWI 	3H 			//01D3 	2A03
		ORG		01D4H

		//;MAIN.C: 280: setState(3,0);
		CLRR 	72H 			//01D4 	0172
		CLRR 	73H 			//01D5 	0173
		LCALL 	498H 			//01D6 	3498
		LDWI 	3H 			//01D7 	2A03

		//;MAIN.C: 281: tmp=1;
		CLRR 	56H 			//01D8 	0156
		INCR	56H,1 			//01D9 	09D6

		//;MAIN.C: 283: beep2(0,3);
		STR 	75H 			//01DA 	01F5
		LDWI 	0H 			//01DB 	2A00
		ORG		01DCH
		LCALL 	402H 			//01DC 	3402

		//;MAIN.C: 284: }
		LJUMP 	23DH 			//01DD 	3A3D

		//;MAIN.C: 285: else if(idop==2 && idState == 0){
		LDR 	57H,0 			//01DE 	0857
		XORWI 	2H 			//01DF 	2602
		BTSS 	STATUS,2 		//01E0 	1D03
		LJUMP 	23DH 			//01E1 	3A3D
		LDR 	55H,1 			//01E2 	08D5
		BTSS 	STATUS,2 		//01E3 	1D03
		ORG		01E4H
		LJUMP 	23DH 			//01E4 	3A3D

		//;MAIN.C: 287: id_clear(3,5);
		LDWI 	5H 			//01E5 	2A05
		STR 	42H 			//01E6 	01C2
		LDWI 	3H 			//01E7 	2A03
		LCALL 	341H 			//01E8 	3341
		LDWI 	5H 			//01E9 	2A05

		//;MAIN.C: 288: setState(5,0);
		CLRR 	72H 			//01EA 	0172
		CLRR 	73H 			//01EB 	0173
		ORG		01ECH
		LCALL 	498H 			//01EC 	3498

		//;MAIN.C: 289: tmp=2;
		LDWI 	2H 			//01ED 	2A02
		STR 	56H 			//01EE 	01D6

		//;MAIN.C: 291: beep2(1,2);
		STR 	75H 			//01EF 	01F5
		LDWI 	1H 			//01F0 	2A01
		LCALL 	402H 			//01F1 	3402
		LJUMP 	23DH 			//01F2 	3A3D

		//;MAIN.C: 296: if (idState == 0){
		LDR 	55H,1 			//01F3 	08D5
		ORG		01F4H
		BTSS 	STATUS,2 		//01F4 	1D03
		LJUMP 	20DH 			//01F5 	3A0D

		//;MAIN.C: 303: if( idop !=1){
		DECR 	57H,0 			//01F6 	0D57
		BTSC 	STATUS,2 		//01F7 	1503
		LJUMP 	23DH 			//01F8 	3A3D
		LDWI 	6H 			//01F9 	2A06

		//;MAIN.C: 304: tmp++;
		INCR	56H,1 			//01FA 	09D6

		//;MAIN.C: 306: if(tmp <=5){
		SUBWR 	56H,0 			//01FB 	0C56
		ORG		01FCH
		BTSC 	STATUS,0 		//01FC 	1403
		LJUMP 	23DH 			//01FD 	3A3D

		//;MAIN.C: 307: id_replate(tmp,keyID,buffTag);
		LDWI 	5EH 			//01FE 	2A5E
		STR 	3EH 			//01FF 	01BE
		LDWI 	25H 			//0200 	2A25
		STR 	3FH 			//0201 	01BF
		LDR 	56H,0 			//0202 	0856
		LCALL 	29EH 			//0203 	329E
		ORG		0204H
		LDWI 	2H 			//0204 	2A02

		//;MAIN.C: 308: timeTick=0;
		BCR 	STATUS,5 		//0205 	1283
		BCR 	STATUS,6 		//0206 	1303
		CLRR 	5AH 			//0207 	015A
		CLRR 	5BH 			//0208 	015B

		//;MAIN.C: 310: beep2(1,2);
		STR 	75H 			//0209 	01F5
		LDWI 	1H 			//020A 	2A01
		LCALL 	402H 			//020B 	3402
		ORG		020CH
		LJUMP 	23DH 			//020C 	3A3D
		LDWI 	0H 			//020D 	2A00

		//;MAIN.C: 317: beep2(0,1);
		CLRR 	75H 			//020E 	0175
		INCR	75H,1 			//020F 	09F5
		LCALL 	402H 			//0210 	3402
		LJUMP 	23DH 			//0211 	3A3D

		//;MAIN.C: 322: if(idState == 0){
		LDR 	55H,1 			//0212 	08D5
		BTSS 	STATUS,2 		//0213 	1D03
		ORG		0214H
		LJUMP 	22DH 			//0214 	3A2D

		//;MAIN.C: 323: if( idop >2){
		LDWI 	3H 			//0215 	2A03
		SUBWR 	57H,0 			//0216 	0C57
		BTSS 	STATUS,0 		//0217 	1C03
		LJUMP 	23DH 			//0218 	3A3D
		LDWI 	6H 			//0219 	2A06

		//;MAIN.C: 324: tmp++;
		INCR	56H,1 			//021A 	09D6

		//;MAIN.C: 326: if(tmp <=5){
		SUBWR 	56H,0 			//021B 	0C56
		ORG		021CH
		BTSC 	STATUS,0 		//021C 	1403
		LJUMP 	23DH 			//021D 	3A3D

		//;MAIN.C: 327: id_replate(tmp,keyID,buffTag);
		LDWI 	5EH 			//021E 	2A5E
		STR 	3EH 			//021F 	01BE
		LDWI 	25H 			//0220 	2A25
		STR 	3FH 			//0221 	01BF
		LDR 	56H,0 			//0222 	0856
		LCALL 	29EH 			//0223 	329E
		ORG		0224H
		LDWI 	2H 			//0224 	2A02

		//;MAIN.C: 328: timeTick=0;
		BCR 	STATUS,5 		//0225 	1283
		BCR 	STATUS,6 		//0226 	1303
		CLRR 	5AH 			//0227 	015A
		CLRR 	5BH 			//0228 	015B

		//;MAIN.C: 330: beep2(1,2);
		STR 	75H 			//0229 	01F5
		LDWI 	1H 			//022A 	2A01
		LCALL 	402H 			//022B 	3402
		ORG		022CH
		LJUMP 	23DH 			//022C 	3A3D
		LDWI 	0H 			//022D 	2A00

		//;MAIN.C: 337: beep2(0,1);
		CLRR 	75H 			//022E 	0175
		INCR	75H,1 			//022F 	09F5
		LCALL 	402H 			//0230 	3402
		LJUMP 	23DH 			//0231 	3A3D
		LDR 	5DH,0 			//0232 	085D
		STR 	FSR 			//0233 	0184
		ORG		0234H
		LDWI 	7H 			//0234 	2A07
		SUBWR 	FSR,0 			//0235 	0C04
		BTSC 	STATUS,0 		//0236 	1403
		LJUMP 	23DH 			//0237 	3A3D
		LDWI 	4H 			//0238 	2A04
		STR 	PCLATH 			//0239 	018A
		LDWI 	C0H 			//023A 	2AC0
		ADDWR 	FSR,0 			//023B 	0B04
		ORG		023CH
		STR 	PCL 			//023C 	0182
		LDWI 	9FH 			//023D 	2A9F

		//;MAIN.C: 343: idState = 1;
		BCR 	STATUS,5 		//023E 	1283
		BCR 	STATUS,6 		//023F 	1303
		CLRR 	55H 			//0240 	0155
		INCR	55H,1 			//0241 	09D5

		//;MAIN.C: 344: _delay((unsigned long)((61)*(8000000/4000.0)));
		STR 	53H 			//0242 	01D3
		LDWI 	6FH 			//0243 	2A6F
		ORG		0244H
		STR 	52H 			//0244 	01D2
		DECRSZ 	52H,1 		//0245 	0ED2
		LJUMP 	245H 			//0246 	3A45
		DECRSZ 	53H,1 		//0247 	0ED3
		LJUMP 	245H 			//0248 	3A45
		LJUMP 	24AH 			//0249 	3A4A

		//;MAIN.C: 345: }
		LJUMP 	258H 			//024A 	3A58
		LDWI 	2H 			//024B 	2A02
		ORG		024CH

		//;MAIN.C: 346: else{
		//;MAIN.C: 347: idState =0;
		CLRR 	55H 			//024C 	0155

		//;MAIN.C: 348: _delay((unsigned long)((150)*(8000000/4000.0)));
		STR 	54H 			//024D 	01D4
		LDWI 	86H 			//024E 	2A86
		STR 	53H 			//024F 	01D3
		LDWI 	99H 			//0250 	2A99
		STR 	52H 			//0251 	01D2
		DECRSZ 	52H,1 		//0252 	0ED2
		LJUMP 	252H 			//0253 	3A52
		ORG		0254H
		DECRSZ 	53H,1 		//0254 	0ED3
		LJUMP 	252H 			//0255 	3A52
		DECRSZ 	54H,1 		//0256 	0ED4
		LJUMP 	252H 			//0257 	3A52

		//;MAIN.C: 349: }
		//;MAIN.C: 353: if((timeOut!=0)&&( timeTick > timeOut)){
		BCR 	STATUS,5 		//0258 	1283
		BCR 	STATUS,6 		//0259 	1303
		LDR 	59H,0 			//025A 	0859
		IORWR 	58H,0 			//025B 	0358
		ORG		025CH
		BTSC 	STATUS,2 		//025C 	1503
		LJUMP 	280H 			//025D 	3A80
		LDR 	5BH,0 			//025E 	085B
		SUBWR 	59H,0 			//025F 	0C59
		BTSS 	STATUS,2 		//0260 	1D03
		LJUMP 	264H 			//0261 	3A64
		LDR 	5AH,0 			//0262 	085A
		SUBWR 	58H,0 			//0263 	0C58
		ORG		0264H
		BTSS 	STATUS,0 		//0264 	1C03
		LJUMP 	275H 			//0265 	3A75
		LJUMP 	280H 			//0266 	3A80

		//;MAIN.C: 358: setState(2,255);
		LDWI 	FFH 			//0267 	2AFF
		STR 	72H 			//0268 	01F2
		LDWI 	2H 			//0269 	2A02
		CLRR 	73H 			//026A 	0173
		LCALL 	498H 			//026B 	3498
		ORG		026CH

		//;MAIN.C: 360: break;
		LJUMP 	280H 			//026C 	3A80

		//;MAIN.C: 361: case 2:
		//;MAIN.C: 362: kepTag=1;
		CLRR 	5CH 			//026D 	015C
		INCR	5CH,1 			//026E 	09DC

		//;MAIN.C: 364: break;
		LJUMP 	280H 			//026F 	3A80
		LDWI 	2H 			//0270 	2A02

		//;MAIN.C: 366: setState(2,0);
		CLRR 	72H 			//0271 	0172
		CLRR 	73H 			//0272 	0173
		LCALL 	498H 			//0273 	3498
		ORG		0274H

		//;MAIN.C: 369: break;
		LJUMP 	280H 			//0274 	3A80
		LDR 	5DH,0 			//0275 	085D
		XORWI 	1H 			//0276 	2601
		BTSC 	STATUS,2 		//0277 	1503
		LJUMP 	267H 			//0278 	3A67
		XORWI 	3H 			//0279 	2603
		BTSC 	STATUS,2 		//027A 	1503
		LJUMP 	26DH 			//027B 	3A6D
		ORG		027CH
		XORWI 	4H 			//027C 	2604
		BTSC 	STATUS,2 		//027D 	1503
		LJUMP 	270H 			//027E 	3A70
		LJUMP 	280H 			//027F 	3A80

		//;MAIN.C: 372: }
		//;MAIN.C: 375: if(mtState==0) RA3 = 1;
		LDR 	5DH,1 			//0280 	08DD
		BTSS 	STATUS,2 		//0281 	1D03
		LJUMP 	285H 			//0282 	3A85
		BSR 	5H,3 			//0283 	1985
		ORG		0284H
		LJUMP 	286H 			//0284 	3A86

		//;MAIN.C: 376: else RA3 =0;
		BCR 	5H,3 			//0285 	1185

		//;MAIN.C: 393: if(mtState == 2) {
		LDR 	5DH,0 			//0286 	085D
		XORWI 	2H 			//0287 	2602
		BTSS 	STATUS,2 		//0288 	1D03
		LJUMP 	299H 			//0289 	3A99

		//;MAIN.C: 396: if(timeTick%3==0){
		LDWI 	3H 			//028A 	2A03
		STR 	72H 			//028B 	01F2
		ORG		028CH
		CLRR 	73H 			//028C 	0173
		LDR 	5BH,0 			//028D 	085B
		STR 	75H 			//028E 	01F5
		LDR 	5AH,0 			//028F 	085A
		STR 	74H 			//0290 	01F4
		LCALL 	2D9H 			//0291 	32D9
		LDR 	73H,0 			//0292 	0873
		IORWR 	72H,0 			//0293 	0372
		ORG		0294H
		BTSS 	STATUS,2 		//0294 	1D03
		LJUMP 	29AH 			//0295 	3A9A

		//;MAIN.C: 398: RC0=~RC0;
		LDWI 	1H 			//0296 	2A01
		XORWR 	7H,1 			//0297 	0487
		LJUMP 	29AH 			//0298 	3A9A
		BCR 	7H,0 			//0299 	1007

		//;MAIN.C: 405: timeTick++;
		INCR	5AH,1 			//029A 	09DA
		BTSC 	STATUS,2 		//029B 	1503
		ORG		029CH
		INCR	5BH,1 			//029C 	09DB
		LJUMP 	19BH 			//029D 	399B
		STR 	7BH 			//029E 	01FB

		//;MAIN.C: 161: id=(id-1)*5;
		LDWI 	5H 			//029F 	2A05
		STR 	72H 			//02A0 	01F2
		LDR 	7BH,0 			//02A1 	087B
		ADDWI 	FFH 			//02A2 	27FF
		LCALL 	47CH 			//02A3 	347C
		ORG		02A4H
		STR 	7BH 			//02A4 	01FB

		//;MAIN.C: 162: {
		//;MAIN.C: 163: {
		//;MAIN.C: 164: *(buff+id) = *Cont;
		LDR 	3EH,0 			//02A5 	083E
		STR 	FSR 			//02A6 	0184
		BCR 	STATUS,7 		//02A7 	1383
		LDR 	INDF,0 			//02A8 	0800
		STR 	40H 			//02A9 	01C0
		LDR 	7BH,0 			//02AA 	087B
		ADDWR 	3FH,0 			//02AB 	0B3F
		ORG		02ACH
		STR 	41H 			//02AC 	01C1
		STR 	FSR 			//02AD 	0184
		LDR 	40H,0 			//02AE 	0840
		STR 	INDF 			//02AF 	0180

		//;MAIN.C: 165: *(buff+1+id) = *(Cont+1);
		LDR 	3EH,0 			//02B0 	083E
		ADDWI 	1H 			//02B1 	2701
		LCALL 	2D2H 			//02B2 	32D2
		ADDWI 	1H 			//02B3 	2701
		ORG		02B4H
		STR 	FSR 			//02B4 	0184
		LDR 	40H,0 			//02B5 	0840
		STR 	INDF 			//02B6 	0180

		//;MAIN.C: 166: *(buff+2+id) = *(Cont+2);
		LDR 	3EH,0 			//02B7 	083E
		ADDWI 	2H 			//02B8 	2702
		LCALL 	2D2H 			//02B9 	32D2
		ADDWI 	2H 			//02BA 	2702
		STR 	FSR 			//02BB 	0184
		ORG		02BCH
		LDR 	40H,0 			//02BC 	0840
		STR 	INDF 			//02BD 	0180

		//;MAIN.C: 167: *(buff+3+id) = *(Cont+3);
		LDR 	3EH,0 			//02BE 	083E
		ADDWI 	3H 			//02BF 	2703
		LCALL 	2D2H 			//02C0 	32D2
		ADDWI 	3H 			//02C1 	2703
		STR 	FSR 			//02C2 	0184
		LDR 	40H,0 			//02C3 	0840
		ORG		02C4H
		STR 	INDF 			//02C4 	0180

		//;MAIN.C: 168: *(buff+4+id) = *(Cont+4);
		LDR 	3EH,0 			//02C5 	083E
		ADDWI 	4H 			//02C6 	2704
		LCALL 	2D2H 			//02C7 	32D2
		ADDWI 	4H 			//02C8 	2704
		STR 	FSR 			//02C9 	0184
		LDR 	40H,0 			//02CA 	0840
		STR 	INDF 			//02CB 	0180
		ORG		02CCH

		//;MAIN.C: 169: }
		//;MAIN.C: 170: }
		//;MAIN.C: 172: eepromWriteBlock(0x06,buffTag,25);
		LDWI 	25H 			//02CC 	2A25
		STR 	76H 			//02CD 	01F6
		LDWI 	19H 			//02CE 	2A19
		STR 	77H 			//02CF 	01F7
		LDWI 	6H 			//02D0 	2A06
		LJUMP 	419H 			//02D1 	3C19
		STR 	FSR 			//02D2 	0184
		LDR 	INDF,0 			//02D3 	0800
		ORG		02D4H
		STR 	40H 			//02D4 	01C0
		LDR 	7BH,0 			//02D5 	087B
		ADDWR 	3FH,0 			//02D6 	0B3F
		STR 	41H 			//02D7 	01C1
		RET		 					//02D8 	0004
		LDR 	73H,0 			//02D9 	0873
		IORWR 	72H,0 			//02DA 	0372
		BTSC 	STATUS,2 		//02DB 	1503
		ORG		02DCH
		LJUMP 	2F8H 			//02DC 	3AF8
		CLRR 	76H 			//02DD 	0176
		INCR	76H,1 			//02DE 	09F6
		BTSC 	73H,7 			//02DF 	17F3
		LJUMP 	2E5H 			//02E0 	3AE5
		BCR 	STATUS,0 		//02E1 	1003
		RLR 	72H,1 			//02E2 	05F2
		RLR 	73H,1 			//02E3 	05F3
		ORG		02E4H
		LJUMP 	2DEH 			//02E4 	3ADE
		LDR 	73H,0 			//02E5 	0873
		SUBWR 	75H,0 			//02E6 	0C75
		BTSS 	STATUS,2 		//02E7 	1D03
		LJUMP 	2EBH 			//02E8 	3AEB
		LDR 	72H,0 			//02E9 	0872
		SUBWR 	74H,0 			//02EA 	0C74
		BTSS 	STATUS,0 		//02EB 	1C03
		ORG		02ECH
		LJUMP 	2F4H 			//02EC 	3AF4
		LDR 	72H,0 			//02ED 	0872
		SUBWR 	74H,1 			//02EE 	0CF4
		LDR 	73H,0 			//02EF 	0873
		BTSS 	STATUS,0 		//02F0 	1C03
		DECR 	75H,1 			//02F1 	0DF5
		SUBWR 	75H,1 			//02F2 	0CF5
		BCR 	STATUS,0 		//02F3 	1003
		ORG		02F4H
		RRR	73H,1 			//02F4 	06F3
		RRR	72H,1 			//02F5 	06F2
		DECRSZ 	76H,1 		//02F6 	0EF6
		LJUMP 	2E5H 			//02F7 	3AE5
		LDR 	75H,0 			//02F8 	0875
		STR 	73H 			//02F9 	01F3
		LDR 	74H,0 			//02FA 	0874
		STR 	72H 			//02FB 	01F2
		ORG		02FCH
		RET		 					//02FC 	0004
		STR 	75H 			//02FD 	01F5

		//;ms82_eeprom.c: 27: GIE = 0;
		BCR 	INTCON,7 		//02FE 	138B

		//;ms82_eeprom.c: 29: {
		//;ms82_eeprom.c: 30: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//02FF 	1F8B
		LJUMP 	303H 			//0300 	3B03
		CLRWDT	 			//0301 	0001
		LJUMP 	2FFH 			//0302 	3AFF

		//;ms82_eeprom.c: 31: EEADR = EEAddr;
		LDR 	75H,0 			//0303 	0875
		ORG		0304H
		BSR 	STATUS,5 		//0304 	1A83
		BCR 	STATUS,6 		//0305 	1303
		STR 	1BH 			//0306 	019B

		//;ms82_eeprom.c: 32: EEDAT = EEData;
		LDR 	72H,0 			//0307 	0872
		STR 	1AH 			//0308 	019A
		LDWI 	34H 			//0309 	2A34

		//;ms82_eeprom.c: 33: EEIF = 0;
		BCR 	STATUS,5 		//030A 	1283
		BCR 	CH,7 			//030B 	138C
		ORG		030CH

		//;ms82_eeprom.c: 34: EECON1 = 0x34;
		BSR 	STATUS,5 		//030C 	1A83
		STR 	1CH 			//030D 	019C

		//;ms82_eeprom.c: 35: WR = 1;
		BSR 	1DH,0 			//030E 	181D

		//;ms82_eeprom.c: 36: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//030F 	1A83
		BCR 	STATUS,6 		//0310 	1303
		BTSS 	1DH,0 			//0311 	1C1D
		LJUMP 	315H 			//0312 	3B15
		CLRWDT	 			//0313 	0001
		ORG		0314H
		LJUMP 	30FH 			//0314 	3B0F

		//;ms82_eeprom.c: 37: _delay((unsigned long)((2)*(8000000/4000.0)));
		LDWI 	6H 			//0315 	2A06
		STR 	74H 			//0316 	01F4
		LDWI 	30H 			//0317 	2A30
		STR 	73H 			//0318 	01F3
		DECRSZ 	73H,1 		//0319 	0EF3
		LJUMP 	319H 			//031A 	3B19
		DECRSZ 	74H,1 		//031B 	0EF4
		ORG		031CH
		LJUMP 	319H 			//031C 	3B19
		CLRWDT	 			//031D 	0001

		//;ms82_eeprom.c: 38: }
		//;ms82_eeprom.c: 39: GIE = 1;
		BSR 	INTCON,7 		//031E 	1B8B
		RET		 					//031F 	0004
		STR 	74H 			//0320 	01F4

		//;rfid125.c: 7: unsigned int CurTimer;
		//;rfid125.c: 8: TMR1ON = 0;
		BCR 	10H,0 			//0321 	1010

		//;rfid125.c: 9: TMR1H = 0;
		CLRR 	FH 			//0322 	010F

		//;rfid125.c: 10: TMR1L = 0;
		CLRR 	EH 			//0323 	010E
		ORG		0324H

		//;rfid125.c: 11: TMR1IF = 0;
		BCR 	CH,0 			//0324 	100C

		//;rfid125.c: 12: TMR1ON = 1;
		BSR 	10H,0 			//0325 	1810

		//;rfid125.c: 13: while(RA4==Logic){
		LDWI 	0H 			//0326 	2A00
		BTSC 	5H,4 			//0327 	1605
		LDWI 	1H 			//0328 	2A01
		XORWR 	74H,0 			//0329 	0474
		BTSS 	STATUS,2 		//032A 	1D03
		LJUMP 	33CH 			//032B 	3B3C
		ORG		032CH

		//;rfid125.c: 14: CurTimer= (TMR1H <<8 )| TMR1L;
		LDR 	FH,0 			//032C 	080F
		STR 	76H 			//032D 	01F6
		CLRR 	75H 			//032E 	0175
		LDR 	EH,0 			//032F 	080E
		IORWR 	75H,1 			//0330 	03F5

		//;rfid125.c: 15: if(CurTimer>time)
		LDR 	76H,0 			//0331 	0876
		SUBWR 	73H,0 			//0332 	0C73
		BTSS 	STATUS,2 		//0333 	1D03
		ORG		0334H
		LJUMP 	337H 			//0334 	3B37
		LDR 	75H,0 			//0335 	0875
		SUBWR 	72H,0 			//0336 	0C72
		BTSC 	STATUS,0 		//0337 	1403
		LJUMP 	326H 			//0338 	3B26

		//;rfid125.c: 16: return 0;
		CLRR 	72H 			//0339 	0172
		CLRR 	73H 			//033A 	0173
		RET		 					//033B 	0004
		ORG		033CH

		//;rfid125.c: 17: }
		//;rfid125.c: 18: return CurTimer;
		LDR 	76H,0 			//033C 	0876
		STR 	73H 			//033D 	01F3
		LDR 	75H,0 			//033E 	0875
		STR 	72H 			//033F 	01F2
		RET		 					//0340 	0004
		STR 	48H 			//0341 	01C8

		//;MAIN.C: 175: unsigned char tmp[5]={0xff,0xff,0xff,0xff,0xff};
		LDWI 	43H 			//0342 	2A43
		STR 	FSR 			//0343 	0184
		ORG		0344H
		LDR 	20H,0 			//0344 	0820
		BCR 	STATUS,7 		//0345 	1383
		STR 	INDF 			//0346 	0180
		INCR	FSR,1 			//0347 	0984
		LDR 	21H,0 			//0348 	0821
		STR 	INDF 			//0349 	0180
		INCR	FSR,1 			//034A 	0984
		LDR 	22H,0 			//034B 	0822
		ORG		034CH
		STR 	INDF 			//034C 	0180
		INCR	FSR,1 			//034D 	0984
		LDR 	23H,0 			//034E 	0823
		STR 	INDF 			//034F 	0180
		INCR	FSR,1 			//0350 	0984
		LDR 	24H,0 			//0351 	0824
		STR 	INDF 			//0352 	0180
		LDR 	48H,0 			//0353 	0848
		ORG		0354H
		SUBWR 	42H,0 			//0354 	0C42
		BTSS 	STATUS,0 		//0355 	1C03
		RET		 					//0356 	0004

		//;MAIN.C: 177: id_replate(idMin,tmp,buffTag);
		LDWI 	43H 			//0357 	2A43
		STR 	3EH 			//0358 	01BE
		LDWI 	25H 			//0359 	2A25
		STR 	3FH 			//035A 	01BF
		LDR 	48H,0 			//035B 	0848
		ORG		035CH
		LCALL 	29EH 			//035C 	329E
		BCR 	STATUS,5 		//035D 	1283
		BCR 	STATUS,6 		//035E 	1303
		INCR	48H,1 			//035F 	09C8
		LJUMP 	353H 			//0360 	3B53
		STR 	78H 			//0361 	01F8

		//;ms82_eeprom.c: 53: unsigned char i;
		//;ms82_eeprom.c: 55: if(len1!=len2)
		LDR 	73H,0 			//0362 	0873
		XORWR 	74H,0 			//0363 	0474
		ORG		0364H
		BTSS 	STATUS,2 		//0364 	1D03

		//;ms82_eeprom.c: 56: return 0;
		RETW 	0H 			//0365 	2100

		//;ms82_eeprom.c: 57: else{
		//;ms82_eeprom.c: 58: for(i=0;i<len1;i++){
		CLRR 	79H 			//0366 	0179
		LDR 	73H,0 			//0367 	0873
		SUBWR 	79H,0 			//0368 	0C79

		//;ms82_eeprom.c: 59: if(*(arr1+i) != *(arr2+i)){
		LDR 	79H,0 			//0369 	0879
		BTSC 	STATUS,0 		//036A 	1403
		LJUMP 	37CH 			//036B 	3B7C
		ORG		036CH
		ADDWR 	72H,0 			//036C 	0B72
		STR 	75H 			//036D 	01F5
		STR 	FSR 			//036E 	0184
		BCR 	STATUS,7 		//036F 	1383
		LDR 	INDF,0 			//0370 	0800
		STR 	76H 			//0371 	01F6
		LDR 	79H,0 			//0372 	0879
		ADDWR 	78H,0 			//0373 	0B78
		ORG		0374H
		STR 	77H 			//0374 	01F7
		STR 	FSR 			//0375 	0184
		LDR 	INDF,0 			//0376 	0800
		XORWR 	76H,0 			//0377 	0476
		BTSS 	STATUS,2 		//0378 	1D03
		RETW 	0H 			//0379 	2100
		INCR	79H,1 			//037A 	09F9
		LJUMP 	367H 			//037B 	3B67
		ORG		037CH

		//;ms82_eeprom.c: 61: }
		//;ms82_eeprom.c: 62: }
		//;ms82_eeprom.c: 63: if(i==len1)
		XORWR 	73H,0 			//037C 	0473
		BTSC 	STATUS,2 		//037D 	1503

		//;ms82_eeprom.c: 64: return 1;
		RETW 	1H 			//037E 	2101
		RETW 	0H 			//037F 	2100
		RETW 	FFH 			//0380 	21FF
		RETW 	FFH 			//0381 	21FF
		RETW 	FFH 			//0382 	21FF
		RETW 	FFH 			//0383 	21FF
		ORG		0384H
		RETW 	FFH 			//0384 	21FF
		RETW 	0H 			//0385 	2100
		RETW 	0H 			//0386 	2100
		RETW 	11H 			//0387 	2111
		RETW 	BH 			//0388 	210B
		RETW 	4FH 			//0389 	214F
		RETW 	0H 			//038A 	2100
		RETW 	0H 			//038B 	2100
		ORG		038CH
		RETW 	81H 			//038C 	2181
		RETW 	2FH 			//038D 	212F
		RETW 	22H 			//038E 	2122
		RETW 	0H 			//038F 	2100
		RETW 	0H 			//0390 	2100
		RETW 	7DH 			//0391 	217D
		RETW 	67H 			//0392 	2167
		RETW 	5H 			//0393 	2105
		ORG		0394H
		RETW 	0H 			//0394 	2100
		RETW 	0H 			//0395 	2100
		RETW 	7EH 			//0396 	217E
		RETW 	31H 			//0397 	2131
		RETW 	E7H 			//0398 	21E7
		RETW 	0H 			//0399 	2100
		RETW 	0H 			//039A 	2100
		RETW 	7EH 			//039B 	217E
		ORG		039CH
		RETW 	51H 			//039C 	2151
		RETW 	E6H 			//039D 	21E6
		STR 	73H 			//039E 	01F3
		CLRR 	75H 			//039F 	0175
		LDR 	72H,0 			//03A0 	0872
		BTSC 	STATUS,2 		//03A1 	1503
		LJUMP 	3B7H 			//03A2 	3BB7
		CLRR 	74H 			//03A3 	0174
		ORG		03A4H
		INCR	74H,1 			//03A4 	09F4
		BTSC 	72H,7 			//03A5 	17F2
		LJUMP 	3AAH 			//03A6 	3BAA
		BCR 	STATUS,0 		//03A7 	1003
		RLR 	72H,1 			//03A8 	05F2
		LJUMP 	3A4H 			//03A9 	3BA4
		BCR 	STATUS,0 		//03AA 	1003
		RLR 	75H,1 			//03AB 	05F5
		ORG		03ACH
		LDR 	72H,0 			//03AC 	0872
		SUBWR 	73H,0 			//03AD 	0C73
		BTSS 	STATUS,0 		//03AE 	1C03
		LJUMP 	3B4H 			//03AF 	3BB4
		LDR 	72H,0 			//03B0 	0872
		SUBWR 	73H,1 			//03B1 	0CF3
		BSR 	75H,0 			//03B2 	1875
		BCR 	STATUS,0 		//03B3 	1003
		ORG		03B4H
		RRR	72H,1 			//03B4 	06F2
		DECRSZ 	74H,1 		//03B5 	0EF4
		LJUMP 	3AAH 			//03B6 	3BAA
		LDR 	75H,0 			//03B7 	0875
		RET		 					//03B8 	0004
		STR 	3EH 			//03B9 	01BE

		//;MAIN.C: 153: unsigned char i;
		//;MAIN.C: 154: for(i=0;i<21;i+=5){
		CLRR 	3FH 			//03BA 	013F

		//;MAIN.C: 155: if(comArr(id_input,buff+i,5,5))
		LDR 	3FH,0 			//03BB 	083F
		ORG		03BCH
		ADDWR 	7AH,0 			//03BC 	0B7A
		STR 	72H 			//03BD 	01F2
		LDWI 	5H 			//03BE 	2A05
		STR 	73H 			//03BF 	01F3
		STR 	74H 			//03C0 	01F4
		LDR 	3EH,0 			//03C1 	083E
		LCALL 	361H 			//03C2 	3361
		XORWI 	0H 			//03C3 	2600
		ORG		03C4H

		//;MAIN.C: 156: return i/5 +1;
		LDWI 	5H 			//03C4 	2A05
		BTSC 	STATUS,2 		//03C5 	1503
		LJUMP 	3CDH 			//03C6 	3BCD
		STR 	72H 			//03C7 	01F2
		LDR 	3FH,0 			//03C8 	083F
		LCALL 	39EH 			//03C9 	339E
		STR 	7BH 			//03CA 	01FB
		INCR	7BH,0 			//03CB 	097B
		ORG		03CCH
		RET		 					//03CC 	0004
		ADDWR 	3FH,1 			//03CD 	0BBF
		LDWI 	15H 			//03CE 	2A15
		SUBWR 	3FH,0 			//03CF 	0C3F
		BTSC 	STATUS,0 		//03D0 	1403

		//;MAIN.C: 157: }
		//;MAIN.C: 158: return 255;
		RETW 	FFH 			//03D1 	21FF
		LJUMP 	3BBH 			//03D2 	3BBB

		//;ms82_pwm.c: 12: TRISC |= 0b00000100;
		BSR 	7H,2 			//03D3 	1907
		ORG		03D4H

		//;ms82_pwm.c: 13: PR2 = 15;
		LDWI 	FH 			//03D4 	2A0F
		STR 	12H 			//03D5 	0192

		//;ms82_pwm.c: 14: EPWMR1L =0;
		BCR 	STATUS,5 		//03D6 	1283
		CLRR 	13H 			//03D7 	0113

		//;ms82_pwm.c: 15: EPWM1CON = 0b10011100;
		LDWI 	9CH 			//03D8 	2A9C
		STR 	15H 			//03D9 	0195

		//;ms82_pwm.c: 16: TMR2 = 0;
		CLRR 	11H 			//03DA 	0111
		LDWI 	4H 			//03DB 	2A04
		ORG		03DCH

		//;ms82_pwm.c: 17: TMR2IF = 0;
		BCR 	CH,1 			//03DC 	108C

		//;ms82_pwm.c: 18: T2CON = 0B00000100;
		STR 	12H 			//03DD 	0192

		//;ms82_pwm.c: 19: while(TMR2IF==1) asm("clrwdt");
		BCR 	STATUS,5 		//03DE 	1283
		BCR 	STATUS,6 		//03DF 	1303
		BTSS 	CH,1 			//03E0 	1C8C
		LJUMP 	3E4H 			//03E1 	3BE4
		CLRWDT	 			//03E2 	0001
		LJUMP 	3DEH 			//03E3 	3BDE
		ORG		03E4H

		//;ms82_pwm.c: 20: PWM1CON = 0b00010000;
		LDWI 	10H 			//03E4 	2A10
		STR 	16H 			//03E5 	0196

		//;ms82_pwm.c: 21: EPWM1AUX = 0b10001000;
		LDWI 	88H 			//03E6 	2A88
		BSR 	STATUS,5 		//03E7 	1A83
		STR 	10H 			//03E8 	0190

		//;ms82_pwm.c: 22: TRISC &= 0b11111011;
		BCR 	7H,2 			//03E9 	1107
		RET		 					//03EA 	0004
		LDWI 	3EH 			//03EB 	2A3E
		ORG		03ECH
		CLRR 	58H 			//03EC 	0158
		CLRR 	59H 			//03ED 	0159
		CLRR 	5AH 			//03EE 	015A
		CLRR 	5BH 			//03EF 	015B
		CLRR 	5CH 			//03F0 	015C
		CLRR 	5DH 			//03F1 	015D
		CLRR 	5EH 			//03F2 	015E
		CLRR 	5FH 			//03F3 	015F
		ORG		03F4H
		CLRR 	60H 			//03F4 	0160
		CLRR 	61H 			//03F5 	0161
		CLRR 	62H 			//03F6 	0162
		BCR 	STATUS,7 		//03F7 	1383
		STR 	7DH 			//03F8 	01FD
		LDWI 	3H 			//03F9 	2A03
		STR 	7EH 			//03FA 	01FE
		LDWI 	80H 			//03FB 	2A80
		ORG		03FCH
		STR 	7FH 			//03FC 	01FF
		LDWI 	20H 			//03FD 	2A20
		STR 	FSR 			//03FE 	0184
		LCALL 	462H 			//03FF 	3462
		CLRR 	STATUS 			//0400 	0103
		LJUMP 	158H 			//0401 	3958
		STR 	76H 			//0402 	01F6

		//;MAIN.C: 181: while(rep--){
		DECR 	75H,1 			//0403 	0DF5
		ORG		0404H
		LDR 	75H,0 			//0404 	0875
		XORWI 	FFH 			//0405 	26FF
		BTSC 	STATUS,2 		//0406 	1503
		RET		 					//0407 	0004

		//;MAIN.C: 182: RC0 =1;if(sel)RA3 = 1;
		BCR 	STATUS,5 		//0408 	1283
		BCR 	STATUS,6 		//0409 	1303
		BSR 	7H,0 			//040A 	1807
		LDR 	76H,0 			//040B 	0876
		ORG		040CH
		BTSS 	STATUS,2 		//040C 	1D03
		BSR 	5H,3 			//040D 	1985

		//;MAIN.C: 183: delay_x10ms(20);
		LDWI 	14H 			//040E 	2A14
		LCALL 	44EH 			//040F 	344E

		//;MAIN.C: 184: RC0 =0;if(sel)RA3 = 0;
		BCR 	STATUS,5 		//0410 	1283
		BCR 	STATUS,6 		//0411 	1303
		BCR 	7H,0 			//0412 	1007
		LDR 	76H,0 			//0413 	0876
		ORG		0414H
		BTSS 	STATUS,2 		//0414 	1D03
		BCR 	5H,3 			//0415 	1185

		//;MAIN.C: 185: delay_x10ms(20);
		LDWI 	14H 			//0416 	2A14
		LCALL 	44EH 			//0417 	344E
		LJUMP 	403H 			//0418 	3C03
		STR 	79H 			//0419 	01F9

		//;ms82_eeprom.c: 44: unsigned char i;
		//;ms82_eeprom.c: 45: for(i=0;i<len;i++){
		CLRR 	7AH 			//041A 	017A
		LDR 	77H,0 			//041B 	0877
		ORG		041CH
		SUBWR 	7AH,0 			//041C 	0C7A
		BTSC 	STATUS,0 		//041D 	1403
		RET		 					//041E 	0004

		//;ms82_eeprom.c: 46: eepromWriteByte(addStart+i,buff[i]);
		LDR 	7AH,0 			//041F 	087A
		ADDWR 	76H,0 			//0420 	0B76
		STR 	78H 			//0421 	01F8
		STR 	FSR 			//0422 	0184
		BCR 	STATUS,7 		//0423 	1383
		ORG		0424H
		LDR 	INDF,0 			//0424 	0800
		STR 	72H 			//0425 	01F2
		LDR 	7AH,0 			//0426 	087A
		ADDWR 	79H,0 			//0427 	0B79
		LCALL 	2FDH 			//0428 	32FD
		INCR	7AH,1 			//0429 	09FA
		LJUMP 	41BH 			//042A 	3C1B

		//;sysinit.c: 71: INTCON = 0B00000000;
		CLRR 	INTCON 			//042B 	010B
		ORG		042CH

		//;sysinit.c: 72: PIE1 = 0B00000000;
		BSR 	STATUS,5 		//042C 	1A83
		CLRR 	CH 			//042D 	010C

		//;sysinit.c: 73: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//042E 	1283
		CLRR 	CH 			//042F 	010C

		//;sysinit.c: 85: T0IF = 0;
		BCR 	INTCON,2 		//0430 	110B

		//;sysinit.c: 86: T0IE = 0;
		BCR 	INTCON,5 		//0431 	128B

		//;sysinit.c: 87: TMR1ON = 0;
		BCR 	10H,0 			//0432 	1010

		//;sysinit.c: 89: TMR2IF = 0;
		BCR 	CH,1 			//0433 	108C
		ORG		0434H

		//;sysinit.c: 90: TMR2IE = 0;
		BSR 	STATUS,5 		//0434 	1A83
		BCR 	CH,1 			//0435 	108C

		//;sysinit.c: 93: TMR1IF = 0;
		BCR 	STATUS,5 		//0436 	1283
		BCR 	CH,0 			//0437 	100C

		//;sysinit.c: 94: TMR1IE = 0;
		BSR 	STATUS,5 		//0438 	1A83
		BCR 	CH,0 			//0439 	100C

		//;sysinit.c: 96: PEIE = 0;
		BCR 	INTCON,6 		//043A 	130B

		//;sysinit.c: 98: GIE = 1;
		BSR 	INTCON,7 		//043B 	1B8B
		ORG		043CH
		RET		 					//043C 	0004
		STR 	77H 			//043D 	01F7

		//;ms82_eeprom.c: 19: unsigned char i;
		//;ms82_eeprom.c: 20: for(i=0;i<len;i++){
		CLRR 	78H 			//043E 	0178
		LDR 	75H,0 			//043F 	0875
		SUBWR 	78H,0 			//0440 	0C78
		BTSC 	STATUS,0 		//0441 	1403
		RET		 					//0442 	0004

		//;ms82_eeprom.c: 21: buff[i] = eepromReadByte(addStart+i);
		LDR 	78H,0 			//0443 	0878
		ORG		0444H
		ADDWR 	74H,0 			//0444 	0B74
		STR 	76H 			//0445 	01F6
		STR 	FSR 			//0446 	0184
		LDR 	78H,0 			//0447 	0878
		ADDWR 	77H,0 			//0448 	0B77
		LCALL 	4B7H 			//0449 	34B7
		BCR 	STATUS,7 		//044A 	1383
		STR 	INDF 			//044B 	0180
		ORG		044CH
		INCR	78H,1 			//044C 	09F8
		LJUMP 	43FH 			//044D 	3C3F
		STR 	74H 			//044E 	01F4

		//;MAIN.C: 55: while(t--)
		DECR 	74H,1 			//044F 	0DF4
		LDR 	74H,0 			//0450 	0874
		XORWI 	FFH 			//0451 	26FF
		BTSC 	STATUS,2 		//0452 	1503
		RET		 					//0453 	0004
		ORG		0454H

		//;MAIN.C: 56: _delay((unsigned long)((10)*(8000000/4000.0)));
		LDWI 	1AH 			//0454 	2A1A
		STR 	73H 			//0455 	01F3
		LDWI 	F8H 			//0456 	2AF8
		STR 	72H 			//0457 	01F2
		DECRSZ 	72H,1 		//0458 	0EF2
		LJUMP 	458H 			//0459 	3C58
		DECRSZ 	73H,1 		//045A 	0EF3
		LJUMP 	458H 			//045B 	3C58
		ORG		045CH
		CLRWDT	 			//045C 	0001
		LJUMP 	44FH 			//045D 	3C4F
		LDR 	7EH,0 			//045E 	087E
		STR 	PCLATH 			//045F 	018A
		LDR 	7FH,0 			//0460 	087F
		STR 	PCL 			//0461 	0182
		LCALL 	45EH 			//0462 	345E
		STR 	INDF 			//0463 	0180
		ORG		0464H
		INCR	FSR,1 			//0464 	0984
		LDR 	FSR,0 			//0465 	0804
		XORWR 	7DH,0 			//0466 	047D
		BTSC 	STATUS,2 		//0467 	1503
		RETW 	0H 			//0468 	2100
		INCR	7FH,1 			//0469 	09FF
		BTSC 	STATUS,2 		//046A 	1503
		INCR	7EH,1 			//046B 	09FE
		ORG		046CH
		LJUMP 	462H 			//046C 	3C62

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//046D 	1283
		CLRR 	5H 			//046E 	0105

		//;sysinit.c: 35: TRISA = 0B01110111;
		LDWI 	77H 			//046F 	2A77
		BSR 	STATUS,5 		//0470 	1A83
		STR 	5H 			//0471 	0185

		//;sysinit.c: 36: WPUA = 0B10010000;
		LDWI 	90H 			//0472 	2A90
		STR 	15H 			//0473 	0195
		ORG		0474H

		//;sysinit.c: 37: PORTC = 0B00000010;
		LDWI 	2H 			//0474 	2A02
		BCR 	STATUS,5 		//0475 	1283
		STR 	7H 			//0476 	0187

		//;sysinit.c: 38: TRISC = 0B11111110;
		LDWI 	FEH 			//0477 	2AFE
		BSR 	STATUS,5 		//0478 	1A83
		STR 	7H 			//0479 	0187

		//;sysinit.c: 39: WPUC = 0B00000000;
		CLRR 	8H 			//047A 	0108
		RET		 					//047B 	0004
		ORG		047CH
		STR 	74H 			//047C 	01F4
		CLRR 	73H 			//047D 	0173
		LDR 	72H,0 			//047E 	0872
		BTSC 	74H,0 			//047F 	1474
		ADDWR 	73H,1 			//0480 	0BF3
		BCR 	STATUS,0 		//0481 	1003
		RLR 	72H,1 			//0482 	05F2
		BCR 	STATUS,0 		//0483 	1003
		ORG		0484H
		RRR	74H,1 			//0484 	06F4
		LDR 	74H,1 			//0485 	08F4
		BTSS 	STATUS,2 		//0486 	1D03
		LJUMP 	47EH 			//0487 	3C7E
		LDR 	73H,0 			//0488 	0873
		RET		 					//0489 	0004

		//;MAIN.C: 110: if(T0IE&&T0IF)
		BTSC 	INTCON,5 		//048A 	168B
		BTSS 	INTCON,2 		//048B 	1D0B
		ORG		048CH
		LJUMP 	491H 			//048C 	3C91

		//;MAIN.C: 111: {
		//;MAIN.C: 112: T0IF = 0;
		BCR 	INTCON,2 		//048D 	110B

		//;MAIN.C: 118: RC0 = 0;
		BCR 	STATUS,5 		//048E 	1283
		BCR 	STATUS,6 		//048F 	1303
		BCR 	7H,0 			//0490 	1007

		//;MAIN.C: 120: return;
		LDR 	71H,0 			//0491 	0871
		STR 	PCLATH 			//0492 	018A
		SWAPR 	70H,0 			//0493 	0770
		ORG		0494H
		STR 	STATUS 			//0494 	0183
		SWAPR 	7EH,1 			//0495 	07FE
		SWAPR 	7EH,0 			//0496 	077E
		RETI		 			//0497 	0009
		STR 	74H 			//0498 	01F4

		//;MAIN.C: 147: mtState = stt;
		BCR 	STATUS,5 		//0499 	1283
		BCR 	STATUS,6 		//049A 	1303
		STR 	5DH 			//049B 	01DD
		ORG		049CH

		//;MAIN.C: 148: timeTick =0;
		CLRR 	5AH 			//049C 	015A
		CLRR 	5BH 			//049D 	015B

		//;MAIN.C: 149: timeOut = _tOut;
		LDR 	73H,0 			//049E 	0873
		STR 	59H 			//049F 	01D9
		LDR 	72H,0 			//04A0 	0872
		STR 	58H 			//04A1 	01D8
		RET		 					//04A2 	0004

		//;sysinit.c: 21: OSCCON = 0B01100001;
		LDWI 	61H 			//04A3 	2A61
		ORG		04A4H
		BSR 	STATUS,5 		//04A4 	1A83
		BCR 	STATUS,6 		//04A5 	1303
		STR 	FH 			//04A6 	018F

		//;sysinit.c: 22: _nop();
		NOP		 					//04A7 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//04A8 	1A83
		BCR 	STATUS,6 		//04A9 	1303
		BTSC 	FH,2 			//04AA 	150F
		RET		 					//04AB 	0004
		ORG		04ACH
		LJUMP 	4A8H 			//04AC 	3CA8

		//;sysinit.c: 46: OPTION = 0B00000001;
		LDWI 	1H 			//04AD 	2A01
		STR 	1H 			//04AE 	0181

		//;sysinit.c: 59: TMR1H = -5000>>8;
		LDWI 	ECH 			//04AF 	2AEC
		BCR 	STATUS,5 		//04B0 	1283
		STR 	FH 			//04B1 	018F

		//;sysinit.c: 60: TMR1L = -5000;
		LDWI 	78H 			//04B2 	2A78
		STR 	EH 			//04B3 	018E
		ORG		04B4H

		//;sysinit.c: 61: T1CON = 0B00100001;
		LDWI 	21H 			//04B4 	2A21
		STR 	10H 			//04B5 	0190
		RET		 					//04B6 	0004
		STR 	72H 			//04B7 	01F2

		//;ms82_eeprom.c: 8: unsigned char ReEepromData;
		//;ms82_eeprom.c: 10: EEADR = EEAddr;
		BSR 	STATUS,5 		//04B8 	1A83
		BCR 	STATUS,6 		//04B9 	1303
		STR 	1BH 			//04BA 	019B

		//;ms82_eeprom.c: 11: RD = 1;
		BSR 	1CH,0 			//04BB 	181C
		ORG		04BCH

		//;ms82_eeprom.c: 12: ReEepromData = EEDAT;
		LDR 	1AH,0 			//04BC 	081A
		STR 	73H 			//04BD 	01F3

		//;ms82_eeprom.c: 13: RD = 0;
		BCR 	1CH,0 			//04BE 	101C

		//;ms82_eeprom.c: 14: return ReEepromData;
		RET		 					//04BF 	0004
		LJUMP 	23DH 			//04C0 	3A3D
		LJUMP 	1ACH 			//04C1 	39AC
		LJUMP 	1ACH 			//04C2 	39AC
		LJUMP 	1F3H 			//04C3 	39F3
		ORG		04C4H
		LJUMP 	23DH 			//04C4 	3A3D
		LJUMP 	212H 			//04C5 	3A12
		LJUMP 	1CAH 			//04C6 	39CA
			END
