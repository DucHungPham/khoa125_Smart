//Deviec:MS86Fxx02
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
		LJUMP 	499H 			//0009 	3C99
		LJUMP 	3E1H 			//000A 	3BE1
		LDWI 	10H 			//000B 	2A10
		ORG		000CH

		//;rfid125.c: 22: unsigned char RF_serial_55bits[11];
		//;rfid125.c: 23: unsigned int timeOutVal;
		//;rfid125.c: 24: unsigned char i,ii,j;
		//;rfid125.c: 25: unsigned char flag_RFID_syn, flag_RFID_last;
		//;rfid125.c: 26: unsigned char even_row, even_col;
		//;rfid125.c: 29: flag_RFID_syn = 0;
		CLRR 	49H 			//000C 	0149

		//;rfid125.c: 32: i=16;
		STR 	4DH 			//000D 	01CD

		//;rfid125.c: 34: {
		//;rfid125.c: 35: timeOutVal=timerOut(1,150);
		LDWI 	96H 			//000E 	2A96
		STR 	72H 			//000F 	01F2
		LDWI 	1H 			//0010 	2A01
		CLRR 	73H 			//0011 	0173
		LCALL 	350H 			//0012 	3350

		//;rfid125.c: 36: if(timeOutVal==0) return 0;
		LCALL 	143H 			//0013 	3143
		ORG		0014H
		BTSC 	STATUS,2 		//0014 	1503
		RETW 	0H 			//0015 	2100

		//;rfid125.c: 38: timeOutVal=timerOut(0,150);
		LDWI 	96H 			//0016 	2A96
		STR 	72H 			//0017 	01F2
		LDWI 	0H 			//0018 	2A00
		CLRR 	73H 			//0019 	0173
		LCALL 	350H 			//001A 	3350

		//;rfid125.c: 39: if(timeOutVal==0) return 0;
		LCALL 	143H 			//001B 	3143
		ORG		001CH
		BTSC 	STATUS,2 		//001C 	1503
		RETW 	0H 			//001D 	2100
		LDWI 	0H 			//001E 	2A00

		//;rfid125.c: 41: i--;
		DECR 	4DH,1 			//001F 	0DCD

		//;rfid125.c: 42: }
		//;rfid125.c: 43: while(timeOutVal<72 && i>0);
		SUBWR 	50H,0 			//0020 	0C50
		LDWI 	48H 			//0021 	2A48
		BTSC 	STATUS,2 		//0022 	1503
		SUBWR 	4FH,0 			//0023 	0C4F
		ORG		0024H
		BTSC 	STATUS,0 		//0024 	1403
		LJUMP 	29H 			//0025 	3829
		LDR 	4DH,1 			//0026 	08CD
		BTSS 	STATUS,2 		//0027 	1D03
		LJUMP 	0EH 			//0028 	380E

		//;rfid125.c: 44: flag_RFID_last = 1;
		CLRR 	4EH 			//0029 	014E
		INCR	4EH,1 			//002A 	09CE

		//;rfid125.c: 45: i = 0;
		CLRR 	4DH 			//002B 	014D
		ORG		002CH

		//;rfid125.c: 46: while(i<64)
		LDWI 	40H 			//002C 	2A40
		SUBWR 	4DH,0 			//002D 	0C4D
		BTSC 	STATUS,0 		//002E 	1403
		LJUMP 	84H 			//002F 	3884

		//;rfid125.c: 47: {
		//;rfid125.c: 48: for(ii=0;ii<9;ii++)
		CLRR 	51H 			//0030 	0151

		//;rfid125.c: 49: {
		//;rfid125.c: 50: timeOutVal=timerOut(flag_RFID_last,150);
		LCALL 	150H 			//0031 	3150
		LCALL 	350H 			//0032 	3350

		//;rfid125.c: 51: if(timeOutVal==0) return 0;
		LCALL 	143H 			//0033 	3143
		ORG		0034H
		BTSC 	STATUS,2 		//0034 	1503
		RETW 	0H 			//0035 	2100

		//;rfid125.c: 53: if(0==flag_RFID_last && timeOutVal<=72 ||
		//;rfid125.c: 54: 1==flag_RFID_last && timeOutVal>72)
		LDR 	4EH,1 			//0036 	08CE
		BTSS 	STATUS,2 		//0037 	1D03
		LJUMP 	40H 			//0038 	3840
		LDWI 	0H 			//0039 	2A00
		SUBWR 	50H,0 			//003A 	0C50
		LDWI 	49H 			//003B 	2A49
		ORG		003CH
		BTSC 	STATUS,2 		//003C 	1503
		SUBWR 	4FH,0 			//003D 	0C4F
		BTSS 	STATUS,0 		//003E 	1C03
		LJUMP 	49H 			//003F 	3849
		DECRSZ 	4EH,0 		//0040 	0E4E
		LJUMP 	57H 			//0041 	3857
		LDWI 	0H 			//0042 	2A00
		SUBWR 	50H,0 			//0043 	0C50
		ORG		0044H
		LDWI 	49H 			//0044 	2A49
		BTSC 	STATUS,2 		//0045 	1503
		SUBWR 	4FH,0 			//0046 	0C4F
		BTSS 	STATUS,0 		//0047 	1C03
		LJUMP 	57H 			//0048 	3857

		//;rfid125.c: 55: {
		//;rfid125.c: 56: if(!flag_RFID_last)
		LDR 	4EH,1 			//0049 	08CE
		BTSS 	STATUS,2 		//004A 	1D03
		LJUMP 	54H 			//004B 	3854
		ORG		004CH

		//;rfid125.c: 57: {
		//;rfid125.c: 58: timeOutVal=timerOut(1,72);
		LDWI 	48H 			//004C 	2A48
		STR 	72H 			//004D 	01F2
		LDWI 	1H 			//004E 	2A01
		CLRR 	73H 			//004F 	0173
		LCALL 	350H 			//0050 	3350

		//;rfid125.c: 59: if(timeOutVal==0) return 0;
		LCALL 	143H 			//0051 	3143
		BTSC 	STATUS,2 		//0052 	1503
		RETW 	0H 			//0053 	2100
		ORG		0054H

		//;rfid125.c: 60: }
		//;rfid125.c: 61: flag_RFID_last = 0;
		CLRR 	4EH 			//0054 	014E

		//;rfid125.c: 62: i++;
		INCR	4DH,1 			//0055 	09CD

		//;rfid125.c: 63: }
		LJUMP 	79H 			//0056 	3879

		//;rfid125.c: 64: else
		//;rfid125.c: 65: if(0==flag_RFID_last && timeOutVal>72 ||
		//;rfid125.c: 66: 1==flag_RFID_last && timeOutVal<=72)
		LDR 	4EH,1 			//0057 	08CE
		BTSS 	STATUS,2 		//0058 	1D03
		LJUMP 	61H 			//0059 	3861
		LDWI 	0H 			//005A 	2A00
		SUBWR 	50H,0 			//005B 	0C50
		ORG		005CH
		LDWI 	49H 			//005C 	2A49
		BTSC 	STATUS,2 		//005D 	1503
		SUBWR 	4FH,0 			//005E 	0C4F
		BTSC 	STATUS,0 		//005F 	1403
		LJUMP 	6AH 			//0060 	386A
		DECRSZ 	4EH,0 		//0061 	0E4E
		LJUMP 	79H 			//0062 	3879
		LDWI 	0H 			//0063 	2A00
		ORG		0064H
		SUBWR 	50H,0 			//0064 	0C50
		LDWI 	49H 			//0065 	2A49
		BTSC 	STATUS,2 		//0066 	1503
		SUBWR 	4FH,0 			//0067 	0C4F
		BTSC 	STATUS,0 		//0068 	1403
		LJUMP 	79H 			//0069 	3879

		//;rfid125.c: 67: {
		//;rfid125.c: 68: if(flag_RFID_last)
		LDR 	4EH,0 			//006A 	084E
		BTSC 	STATUS,2 		//006B 	1503
		ORG		006CH
		LJUMP 	75H 			//006C 	3875

		//;rfid125.c: 69: {
		//;rfid125.c: 70: timeOutVal=timerOut(0,72);
		LDWI 	48H 			//006D 	2A48
		STR 	72H 			//006E 	01F2
		LDWI 	0H 			//006F 	2A00
		CLRR 	73H 			//0070 	0173
		LCALL 	350H 			//0071 	3350

		//;rfid125.c: 71: if(timeOutVal==0) return 0;
		LCALL 	143H 			//0072 	3143
		BTSC 	STATUS,2 		//0073 	1503
		ORG		0074H
		RETW 	0H 			//0074 	2100

		//;rfid125.c: 72: }
		//;rfid125.c: 73: flag_RFID_last = 1;
		CLRR 	4EH 			//0075 	014E
		INCR	4EH,1 			//0076 	09CE

		//;rfid125.c: 74: i++;
		INCR	4DH,1 			//0077 	09CD

		//;rfid125.c: 76: break;
		LJUMP 	7EH 			//0078 	387E
		LDWI 	9H 			//0079 	2A09
		INCR	51H,1 			//007A 	09D1
		SUBWR 	51H,0 			//007B 	0C51
		ORG		007CH
		BTSS 	STATUS,0 		//007C 	1C03
		LJUMP 	31H 			//007D 	3831

		//;rfid125.c: 77: }
		//;rfid125.c: 79: }
		//;rfid125.c: 80: if(9==ii)
		LDR 	51H,0 			//007E 	0851
		XORWI 	9H 			//007F 	2609
		BTSS 	STATUS,2 		//0080 	1D03
		LJUMP 	2CH 			//0081 	382C

		//;rfid125.c: 81: {
		//;rfid125.c: 82: flag_RFID_syn = 1;
		CLRR 	49H 			//0082 	0149
		INCR	49H,1 			//0083 	09C9
		ORG		0084H

		//;rfid125.c: 83: break;
		//;rfid125.c: 84: }
		//;rfid125.c: 85: }
		//;rfid125.c: 87: if(!flag_RFID_syn)
		LDR 	49H,1 			//0084 	08C9
		BTSC 	STATUS,2 		//0085 	1503
		RETW 	0H 			//0086 	2100

		//;rfid125.c: 90: }
		//;rfid125.c: 91: for(ii=0;ii<55;ii++)
		CLRR 	51H 			//0087 	0151

		//;rfid125.c: 92: {
		//;rfid125.c: 93: i = ii/5;
		LDWI 	5H 			//0088 	2A05
		STR 	72H 			//0089 	01F2
		LDR 	51H,0 			//008A 	0851
		LCALL 	3ACH 			//008B 	33AC
		ORG		008CH
		STR 	4DH 			//008C 	01CD

		//;rfid125.c: 94: timeOutVal=timerOut(flag_RFID_last,150);
		LCALL 	150H 			//008D 	3150
		LCALL 	350H 			//008E 	3350

		//;rfid125.c: 95: if(timeOutVal==0) return 0;
		LCALL 	143H 			//008F 	3143
		BTSC 	STATUS,2 		//0090 	1503
		RETW 	0H 			//0091 	2100

		//;rfid125.c: 97: if(0==flag_RFID_last && timeOutVal<=72 ||
		//;rfid125.c: 98: 1==flag_RFID_last && timeOutVal>72)
		LDR 	4EH,1 			//0092 	08CE
		BTSS 	STATUS,2 		//0093 	1D03
		ORG		0094H
		LJUMP 	9CH 			//0094 	389C
		LDWI 	0H 			//0095 	2A00
		SUBWR 	50H,0 			//0096 	0C50
		LDWI 	49H 			//0097 	2A49
		BTSC 	STATUS,2 		//0098 	1503
		SUBWR 	4FH,0 			//0099 	0C4F
		BTSS 	STATUS,0 		//009A 	1C03
		LJUMP 	A5H 			//009B 	38A5
		ORG		009CH
		DECRSZ 	4EH,0 		//009C 	0E4E
		LJUMP 	B7H 			//009D 	38B7
		LDWI 	0H 			//009E 	2A00
		SUBWR 	50H,0 			//009F 	0C50
		LDWI 	49H 			//00A0 	2A49
		BTSC 	STATUS,2 		//00A1 	1503
		SUBWR 	4FH,0 			//00A2 	0C4F
		BTSS 	STATUS,0 		//00A3 	1C03
		ORG		00A4H
		LJUMP 	B7H 			//00A4 	38B7

		//;rfid125.c: 99: {
		//;rfid125.c: 100: if(!flag_RFID_last)
		LDR 	4EH,1 			//00A5 	08CE
		BTSS 	STATUS,2 		//00A6 	1D03
		LJUMP 	B0H 			//00A7 	38B0

		//;rfid125.c: 101: {
		//;rfid125.c: 102: timeOutVal=timerOut(1,72);
		LDWI 	48H 			//00A8 	2A48
		STR 	72H 			//00A9 	01F2
		LDWI 	1H 			//00AA 	2A01
		CLRR 	73H 			//00AB 	0173
		ORG		00ACH
		LCALL 	350H 			//00AC 	3350

		//;rfid125.c: 103: if(timeOutVal==0) return 0;
		LCALL 	143H 			//00AD 	3143
		BTSC 	STATUS,2 		//00AE 	1503
		RETW 	0H 			//00AF 	2100

		//;rfid125.c: 104: }
		//;rfid125.c: 105: flag_RFID_last = 0;
		CLRR 	4EH 			//00B0 	014E

		//;rfid125.c: 106: RF_serial_55bits[i] <<= 1;
		LCALL 	149H 			//00B1 	3149

		//;rfid125.c: 107: RF_serial_55bits[i] |= 0x01;
		LDR 	4DH,0 			//00B2 	084D
		ADDWI 	3EH 			//00B3 	273E
		ORG		00B4H
		STR 	FSR 			//00B4 	0184
		BSR 	INDF,0 			//00B5 	1800

		//;rfid125.c: 108: }
		LJUMP 	D8H 			//00B6 	38D8

		//;rfid125.c: 109: else
		//;rfid125.c: 110: if(0==flag_RFID_last && timeOutVal>72 ||
		//;rfid125.c: 111: 1==flag_RFID_last && timeOutVal<=72)
		LDR 	4EH,1 			//00B7 	08CE
		BTSS 	STATUS,2 		//00B8 	1D03
		LJUMP 	C1H 			//00B9 	38C1
		LDWI 	0H 			//00BA 	2A00
		SUBWR 	50H,0 			//00BB 	0C50
		ORG		00BCH
		LDWI 	49H 			//00BC 	2A49
		BTSC 	STATUS,2 		//00BD 	1503
		SUBWR 	4FH,0 			//00BE 	0C4F
		BTSC 	STATUS,0 		//00BF 	1403
		LJUMP 	CAH 			//00C0 	38CA
		DECRSZ 	4EH,0 		//00C1 	0E4E
		LJUMP 	D8H 			//00C2 	38D8
		LDWI 	0H 			//00C3 	2A00
		ORG		00C4H
		SUBWR 	50H,0 			//00C4 	0C50
		LDWI 	49H 			//00C5 	2A49
		BTSC 	STATUS,2 		//00C6 	1503
		SUBWR 	4FH,0 			//00C7 	0C4F
		BTSC 	STATUS,0 		//00C8 	1403
		LJUMP 	D8H 			//00C9 	38D8

		//;rfid125.c: 112: {
		//;rfid125.c: 113: if(flag_RFID_last)
		LDR 	4EH,0 			//00CA 	084E
		BTSC 	STATUS,2 		//00CB 	1503
		ORG		00CCH
		LJUMP 	D5H 			//00CC 	38D5

		//;rfid125.c: 114: {
		//;rfid125.c: 115: timeOutVal=timerOut(0,150);
		LDWI 	96H 			//00CD 	2A96
		STR 	72H 			//00CE 	01F2
		LDWI 	0H 			//00CF 	2A00
		CLRR 	73H 			//00D0 	0173
		LCALL 	350H 			//00D1 	3350

		//;rfid125.c: 116: if(timeOutVal==0) return 0;
		LCALL 	143H 			//00D2 	3143
		BTSC 	STATUS,2 		//00D3 	1503
		ORG		00D4H
		RETW 	0H 			//00D4 	2100

		//;rfid125.c: 117: }
		//;rfid125.c: 118: flag_RFID_last = 1;
		CLRR 	4EH 			//00D5 	014E
		INCR	4EH,1 			//00D6 	09CE

		//;rfid125.c: 119: RF_serial_55bits[i] <<= 1;
		LCALL 	149H 			//00D7 	3149
		LDWI 	37H 			//00D8 	2A37
		INCR	51H,1 			//00D9 	09D1
		SUBWR 	51H,0 			//00DA 	0C51
		BTSS 	STATUS,0 		//00DB 	1C03
		ORG		00DCH
		LJUMP 	88H 			//00DC 	3888

		//;rfid125.c: 120: }
		//;rfid125.c: 121: }
		//;rfid125.c: 122: if(55==ii)
		LDR 	51H,0 			//00DD 	0851
		XORWI 	37H 			//00DE 	2637
		BTSS 	STATUS,2 		//00DF 	1D03
		RETW 	0H 			//00E0 	2100

		//;rfid125.c: 123: {
		//;rfid125.c: 124: even_col = 0;
		CLRR 	4AH 			//00E1 	014A

		//;rfid125.c: 125: for(ii=0;ii<10;ii++)
		CLRR 	51H 			//00E2 	0151

		//;rfid125.c: 126: {
		//;rfid125.c: 127: even_row = (RF_serial_55bits[ii] & 0x01);
		LDR 	51H,0 			//00E3 	0851
		ORG		00E4H
		ADDWI 	3EH 			//00E4 	273E
		STR 	FSR 			//00E5 	0184
		BCR 	STATUS,7 		//00E6 	1383
		LDR 	INDF,0 			//00E7 	0800
		STR 	4BH 			//00E8 	01CB
		LDWI 	1H 			//00E9 	2A01
		ANDWR 	4BH,1 			//00EA 	02CB

		//;rfid125.c: 128: for(j=1;j<5;j++)
		CLRR 	4CH 			//00EB 	014C
		ORG		00ECH
		INCR	4CH,1 			//00EC 	09CC

		//;rfid125.c: 129: {
		//;rfid125.c: 130: even_row = even_row ^ ((RF_serial_55bits[ii]>>j) & 0x01);
		LDR 	51H,0 			//00ED 	0851
		ADDWI 	3EH 			//00EE 	273E
		STR 	FSR 			//00EF 	0184
		LDR 	INDF,0 			//00F0 	0800
		STR 	77H 			//00F1 	01F7
		INCR	4CH,0 			//00F2 	094C
		LJUMP 	F6H 			//00F3 	38F6
		ORG		00F4H
		BCR 	STATUS,0 		//00F4 	1003
		RRR	77H,1 			//00F5 	06F7
		ADDWI 	FFH 			//00F6 	27FF
		BTSS 	STATUS,2 		//00F7 	1D03
		LJUMP 	F4H 			//00F8 	38F4
		LDR 	77H,0 			//00F9 	0877
		ANDWI 	1H 			//00FA 	2401
		XORWR 	4BH,1 			//00FB 	04CB
		ORG		00FCH
		LDWI 	5H 			//00FC 	2A05
		INCR	4CH,1 			//00FD 	09CC
		SUBWR 	4CH,0 			//00FE 	0C4C
		BTSS 	STATUS,0 		//00FF 	1C03
		LJUMP 	EDH 			//0100 	38ED

		//;rfid125.c: 131: }
		//;rfid125.c: 132: if(even_row & 0x01)
		BTSC 	4BH,0 			//0101 	144B
		RETW 	0H 			//0102 	2100

		//;rfid125.c: 135: }
		//;rfid125.c: 137: RF_serial_55bits[ii] <<= 3;
		LDR 	51H,0 			//0103 	0851
		ORG		0104H
		ADDWI 	3EH 			//0104 	273E
		STR 	FSR 			//0105 	0184
		RLR 	INDF,1 			//0106 	0580
		RLR 	INDF,1 			//0107 	0580
		RLR 	INDF,0 			//0108 	0500
		ANDWI 	F8H 			//0109 	24F8
		STR 	INDF 			//010A 	0180

		//;rfid125.c: 139: i = RF_serial_55bits[ii];
		LDR 	51H,0 			//010B 	0851
		ORG		010CH
		ADDWI 	3EH 			//010C 	273E
		STR 	FSR 			//010D 	0184
		LDR 	INDF,0 			//010E 	0800
		STR 	4DH 			//010F 	01CD

		//;rfid125.c: 140: if( 0==ii%2 )
		BTSC 	51H,0 			//0110 	1451
		LJUMP 	11FH 			//0111 	391F

		//;rfid125.c: 141: {
		//;rfid125.c: 142: keyID[ii/2] = (i & 0xF0);
		BCR 	STATUS,0 		//0112 	1003
		RRR	51H,0 			//0113 	0651
		ORG		0114H
		ADDWI 	5EH 			//0114 	275E
		STR 	FSR 			//0115 	0184
		LDR 	4DH,0 			//0116 	084D
		STR 	INDF 			//0117 	0180
		BCR 	STATUS,0 		//0118 	1003
		RRR	51H,0 			//0119 	0651
		ADDWI 	5EH 			//011A 	275E
		STR 	FSR 			//011B 	0184
		ORG		011CH
		LDWI 	F0H 			//011C 	2AF0
		ANDWR 	INDF,1 		//011D 	0280

		//;rfid125.c: 143: }
		LJUMP 	129H 			//011E 	3929
		LDWI 	FH 			//011F 	2A0F

		//;rfid125.c: 144: else
		//;rfid125.c: 145: {
		//;rfid125.c: 146: i >>=4;
		SWAPR 	4DH,1 			//0120 	07CD
		ANDWR 	4DH,1 			//0121 	02CD

		//;rfid125.c: 147: keyID[ii/2] |= (i & 0x0F);
		BCR 	STATUS,0 		//0122 	1003
		RRR	51H,0 			//0123 	0651
		ORG		0124H
		ADDWI 	5EH 			//0124 	275E
		STR 	FSR 			//0125 	0184
		LDR 	4DH,0 			//0126 	084D
		ANDWI 	FH 			//0127 	240F
		IORWR 	INDF,1 		//0128 	0380

		//;rfid125.c: 148: }
		//;rfid125.c: 149: even_col ^= RF_serial_55bits[ii];
		LDR 	51H,0 			//0129 	0851
		ADDWI 	3EH 			//012A 	273E
		STR 	FSR 			//012B 	0184
		ORG		012CH
		LDR 	INDF,0 			//012C 	0800
		XORWR 	4AH,1 			//012D 	04CA
		LDWI 	AH 			//012E 	2A0A
		INCR	51H,1 			//012F 	09D1
		SUBWR 	51H,0 			//0130 	0C51
		BTSS 	STATUS,0 		//0131 	1C03
		LJUMP 	E3H 			//0132 	38E3

		//;rfid125.c: 150: }
		//;rfid125.c: 151: RF_serial_55bits[10] <<= 3;
		RLR 	48H,1 			//0133 	05C8
		ORG		0134H
		RLR 	48H,1 			//0134 	05C8
		RLR 	48H,0 			//0135 	0548
		ANDWI 	F8H 			//0136 	24F8
		STR 	48H 			//0137 	01C8
		LDWI 	F0H 			//0138 	2AF0

		//;rfid125.c: 152: keyID[0] =0x00;
		CLRR 	5EH 			//0139 	015E

		//;rfid125.c: 153: if(((RF_serial_55bits[10] & 0xf0)==(even_col & 0xf0)) && (0==(RF_serial
		//+                          _55bits[10]&0x08)))
		ANDWR 	4AH,0 			//013A 	024A
		STR 	77H 			//013B 	01F7
		ORG		013CH
		LDR 	48H,0 			//013C 	0848
		ANDWI 	F0H 			//013D 	24F0
		XORWR 	77H,0 			//013E 	0477
		BTSC 	STATUS,2 		//013F 	1503
		BTSC 	48H,3 			//0140 	15C8
		RETW 	0H 			//0141 	2100

		//;rfid125.c: 154: {
		//;rfid125.c: 156: return 1;
		RETW 	1H 			//0142 	2101
		LDR 	73H,0 			//0143 	0873
		ORG		0144H
		STR 	50H 			//0144 	01D0
		LDR 	72H,0 			//0145 	0872
		STR 	4FH 			//0146 	01CF
		IORWR 	50H,0 			//0147 	0350
		RET		 					//0148 	0004
		LDR 	4DH,0 			//0149 	084D
		ADDWI 	3EH 			//014A 	273E
		STR 	FSR 			//014B 	0184
		ORG		014CH
		BCR 	STATUS,7 		//014C 	1383
		BCR 	STATUS,0 		//014D 	1003
		RLR 	INDF,1 			//014E 	0580
		RET		 					//014F 	0004
		LDWI 	96H 			//0150 	2A96
		STR 	72H 			//0151 	01F2
		CLRR 	73H 			//0152 	0173
		LDR 	4EH,0 			//0153 	084E
		ORG		0154H
		RET		 					//0154 	0004

		//;MAIN.C: 195: unsigned int t;
		//;MAIN.C: 196: unsigned char buzFre = 0;
		CLRR 	55H 			//0155 	0155
		CLRWDT	 			//0156 	0001

		//;MAIN.C: 200: sys_init();
		LCALL 	482H 			//0157 	3482

		//;MAIN.C: 201: gpio_init();
		LCALL 	44FH 			//0158 	344F

		//;MAIN.C: 203: timer_init();
		LCALL 	4A0H 			//0159 	34A0

		//;MAIN.C: 204: int_init();
		LCALL 	46CH 			//015A 	346C

		//;MAIN.C: 210: eepromWriteByte(0xFF, 0xAA);
		LDWI 	AAH 			//015B 	2AAA
		ORG		015CH
		STR 	72H 			//015C 	01F2
		LDWI 	FFH 			//015D 	2AFF
		LCALL 	2F1H 			//015E 	32F1

		//;MAIN.C: 211: eepromWriteByte(0xFF, 0xAA);
		LDWI 	AAH 			//015F 	2AAA
		STR 	72H 			//0160 	01F2
		LDWI 	FFH 			//0161 	2AFF
		LCALL 	2F1H 			//0162 	32F1

		//;MAIN.C: 214: TRISC &= 0xfe;
		BSR 	STATUS,5 		//0163 	1A83
		ORG		0164H
		BCR 	7H,0 			//0164 	1007

		//;MAIN.C: 216: SET_EPWM_ON();
		LCALL 	331H 			//0165 	3331

		//;MAIN.C: 220: _delay((unsigned long)((20)*(8000000/4000.0)));
		LDWI 	34H 			//0166 	2A34
		BCR 	STATUS,5 		//0167 	1283
		STR 	53H 			//0168 	01D3
		LDWI 	F1H 			//0169 	2AF1
		STR 	52H 			//016A 	01D2
		DECRSZ 	52H,1 		//016B 	0ED2
		ORG		016CH
		LJUMP 	16BH 			//016C 	396B
		DECRSZ 	53H,1 		//016D 	0ED3
		LJUMP 	16BH 			//016E 	396B
		LJUMP 	170H 			//016F 	3970

		//;MAIN.C: 225: if (eepromReadByte(0x06) != 0) {
		LDWI 	6H 			//0170 	2A06
		LCALL 	48AH 			//0171 	348A
		XORWI 	0H 			//0172 	2600
		BTSC 	STATUS,2 		//0173 	1503
		ORG		0174H
		LJUMP 	187H 			//0174 	3987
		LDWI 	6H 			//0175 	2A06

		//;MAIN.C: 229: eepromWriteByte(0x06, 0);
		CLRR 	72H 			//0176 	0172
		LCALL 	2F1H 			//0177 	32F1
		LDWI 	7H 			//0178 	2A07

		//;MAIN.C: 230: eepromWriteByte(0x06 + 1, 0);
		CLRR 	72H 			//0179 	0172
		LCALL 	2F1H 			//017A 	32F1

		//;MAIN.C: 231: eepromWriteByte(0x06 + 2, 0x87);
		LDWI 	87H 			//017B 	2A87
		ORG		017CH
		STR 	72H 			//017C 	01F2
		LDWI 	8H 			//017D 	2A08
		LCALL 	2F1H 			//017E 	32F1

		//;MAIN.C: 232: eepromWriteByte(0x06 + 3, 0x3a);
		LDWI 	3AH 			//017F 	2A3A
		STR 	72H 			//0180 	01F2
		LDWI 	9H 			//0181 	2A09
		LCALL 	2F1H 			//0182 	32F1

		//;MAIN.C: 233: eepromWriteByte(0x06 + 4, 0xf8);
		LDWI 	F8H 			//0183 	2AF8
		ORG		0184H
		STR 	72H 			//0184 	01F2
		LDWI 	AH 			//0185 	2A0A
		LCALL 	2F1H 			//0186 	32F1

		//;MAIN.C: 235: }
		//;MAIN.C: 236: eepromReadBlock(0x06, buffTag, 5 * 5);
		LDWI 	25H 			//0187 	2A25
		STR 	74H 			//0188 	01F4
		LDWI 	19H 			//0189 	2A19
		STR 	75H 			//018A 	01F5
		LDWI 	6H 			//018B 	2A06
		ORG		018CH
		LCALL 	41FH 			//018C 	341F

		//;MAIN.C: 238: setState(1, 12);
		LDWI 	CH 			//018D 	2A0C
		STR 	72H 			//018E 	01F2
		LDWI 	1H 			//018F 	2A01
		CLRR 	73H 			//0190 	0173
		LCALL 	478H 			//0191 	3478

		//;MAIN.C: 242: tmp = 0;
		CLRR 	56H 			//0192 	0156

		//;MAIN.C: 246: if (kepTag == 0)
		LDR 	5CH,1 			//0193 	08DC
		ORG		0194H
		BTSS 	STATUS,2 		//0194 	1D03
		LJUMP 	198H 			//0195 	3998

		//;MAIN.C: 247: idop = get_RFID();
		LCALL 	BH 			//0196 	300B
		STR 	57H 			//0197 	01D7

		//;MAIN.C: 249: if (idop && (kepTag == 0)) {
		LDR 	57H,0 			//0198 	0857
		BTSC 	STATUS,2 		//0199 	1503
		LJUMP 	240H 			//019A 	3A40
		LDR 	5CH,1 			//019B 	08DC
		ORG		019CH
		BTSS 	STATUS,2 		//019C 	1D03
		LJUMP 	240H 			//019D 	3A40

		//;MAIN.C: 250: idop = id_search(keyID, buffTag);
		LDWI 	25H 			//019E 	2A25
		STR 	7AH 			//019F 	01FA
		LDWI 	5EH 			//01A0 	2A5E
		LCALL 	3C7H 			//01A1 	33C7
		STR 	57H 			//01A2 	01D7

		//;MAIN.C: 251: switch (mtState) {
		LJUMP 	228H 			//01A3 	3A28
		ORG		01A4H

		//;MAIN.C: 253: case 2:
		//;MAIN.C: 254: if ((idop > 1) && (idop < 6))
		LDWI 	2H 			//01A4 	2A02
		SUBWR 	57H,0 			//01A5 	0C57
		BTSS 	STATUS,0 		//01A6 	1C03
		LJUMP 	1B1H 			//01A7 	39B1
		LDWI 	6H 			//01A8 	2A06
		SUBWR 	57H,0 			//01A9 	0C57
		BTSC 	STATUS,0 		//01AA 	1403
		LJUMP 	1B1H 			//01AB 	39B1
		ORG		01ACH
		LDWI 	0H 			//01AC 	2A00

		//;MAIN.C: 255: {
		//;MAIN.C: 256: setState(0, 0);
		CLRR 	72H 			//01AD 	0172
		CLRR 	73H 			//01AE 	0173
		LCALL 	478H 			//01AF 	3478

		//;MAIN.C: 258: }
		LJUMP 	233H 			//01B0 	3A33

		//;MAIN.C: 259: else if (idop == 1)
		DECRSZ 	57H,0 		//01B1 	0E57
		LJUMP 	233H 			//01B2 	3A33

		//;MAIN.C: 260: {
		//;MAIN.C: 262: id_clear(2, 5);
		LDWI 	5H 			//01B3 	2A05
		ORG		01B4H
		STR 	42H 			//01B4 	01C2
		LDWI 	2H 			//01B5 	2A02
		LCALL 	312H 			//01B6 	3312
		LDWI 	3H 			//01B7 	2A03

		//;MAIN.C: 263: setState(3, 0);
		CLRR 	72H 			//01B8 	0172
		CLRR 	73H 			//01B9 	0173
		LCALL 	478H 			//01BA 	3478
		LDWI 	3H 			//01BB 	2A03
		ORG		01BCH

		//;MAIN.C: 264: tmp = 1;
		CLRR 	56H 			//01BC 	0156
		INCR	56H,1 			//01BD 	09D6

		//;MAIN.C: 266: beep2(0, 3);
		STR 	75H 			//01BE 	01F5
		LDWI 	0H 			//01BF 	2A00
		LCALL 	3F8H 			//01C0 	33F8
		LJUMP 	233H 			//01C1 	3A33

		//;MAIN.C: 277: if (idop == 1 && idState == 0) {
		DECRSZ 	57H,0 		//01C2 	0E57
		LJUMP 	1D6H 			//01C3 	39D6
		ORG		01C4H
		LDR 	55H,1 			//01C4 	08D5
		BTSS 	STATUS,2 		//01C5 	1D03
		LJUMP 	1D6H 			//01C6 	39D6

		//;MAIN.C: 279: id_clear(2, 5);
		LDWI 	5H 			//01C7 	2A05
		STR 	42H 			//01C8 	01C2
		LDWI 	2H 			//01C9 	2A02
		LCALL 	312H 			//01CA 	3312
		LDWI 	3H 			//01CB 	2A03
		ORG		01CCH

		//;MAIN.C: 280: setState(3, 0);
		CLRR 	72H 			//01CC 	0172
		CLRR 	73H 			//01CD 	0173
		LCALL 	478H 			//01CE 	3478
		LDWI 	3H 			//01CF 	2A03

		//;MAIN.C: 281: tmp = 1;
		CLRR 	56H 			//01D0 	0156
		INCR	56H,1 			//01D1 	09D6

		//;MAIN.C: 283: beep2(0, 3);
		STR 	75H 			//01D2 	01F5
		LDWI 	0H 			//01D3 	2A00
		ORG		01D4H
		LCALL 	3F8H 			//01D4 	33F8

		//;MAIN.C: 284: }
		LJUMP 	233H 			//01D5 	3A33

		//;MAIN.C: 285: else if (idop == 2 && idState == 0) {
		LDR 	57H,0 			//01D6 	0857
		XORWI 	2H 			//01D7 	2602
		BTSS 	STATUS,2 		//01D8 	1D03
		LJUMP 	233H 			//01D9 	3A33
		LDR 	55H,1 			//01DA 	08D5
		BTSS 	STATUS,2 		//01DB 	1D03
		ORG		01DCH
		LJUMP 	233H 			//01DC 	3A33

		//;MAIN.C: 287: id_clear(3, 5);
		LDWI 	5H 			//01DD 	2A05
		STR 	42H 			//01DE 	01C2
		LDWI 	3H 			//01DF 	2A03
		LCALL 	312H 			//01E0 	3312
		LDWI 	5H 			//01E1 	2A05

		//;MAIN.C: 288: setState(5, 0);
		CLRR 	72H 			//01E2 	0172
		CLRR 	73H 			//01E3 	0173
		ORG		01E4H
		LCALL 	478H 			//01E4 	3478

		//;MAIN.C: 289: tmp = 2;
		LDWI 	2H 			//01E5 	2A02
		STR 	56H 			//01E6 	01D6

		//;MAIN.C: 291: beep2(1, 2);
		STR 	75H 			//01E7 	01F5
		LDWI 	1H 			//01E8 	2A01
		LCALL 	3F8H 			//01E9 	33F8
		LJUMP 	233H 			//01EA 	3A33

		//;MAIN.C: 296: if (idState == 0) {
		LDR 	55H,1 			//01EB 	08D5
		ORG		01ECH
		BTSS 	STATUS,2 		//01EC 	1D03
		LJUMP 	204H 			//01ED 	3A04

		//;MAIN.C: 303: if ( idop != 1) {
		DECR 	57H,0 			//01EE 	0D57
		BTSC 	STATUS,2 		//01EF 	1503
		LJUMP 	233H 			//01F0 	3A33
		LDWI 	6H 			//01F1 	2A06

		//;MAIN.C: 304: tmp++;
		INCR	56H,1 			//01F2 	09D6

		//;MAIN.C: 306: if (tmp <= 5) {
		SUBWR 	56H,0 			//01F3 	0C56
		ORG		01F4H
		BTSC 	STATUS,0 		//01F4 	1403
		LJUMP 	233H 			//01F5 	3A33

		//;MAIN.C: 307: id_replate(tmp, keyID, buffTag);
		LDWI 	5EH 			//01F6 	2A5E
		STR 	3EH 			//01F7 	01BE
		LDWI 	25H 			//01F8 	2A25
		STR 	3FH 			//01F9 	01BF
		LDR 	56H,0 			//01FA 	0856
		LCALL 	292H 			//01FB 	3292
		ORG		01FCH
		LDWI 	2H 			//01FC 	2A02

		//;MAIN.C: 308: timeTick = 0;
		BCR 	STATUS,5 		//01FD 	1283
		CLRR 	5AH 			//01FE 	015A
		CLRR 	5BH 			//01FF 	015B

		//;MAIN.C: 310: beep2(1, 2);
		STR 	75H 			//0200 	01F5
		LDWI 	1H 			//0201 	2A01
		LCALL 	3F8H 			//0202 	33F8
		LJUMP 	233H 			//0203 	3A33
		ORG		0204H
		LDWI 	0H 			//0204 	2A00

		//;MAIN.C: 317: beep2(0, 1);
		CLRR 	75H 			//0205 	0175
		INCR	75H,1 			//0206 	09F5
		LCALL 	3F8H 			//0207 	33F8
		LJUMP 	233H 			//0208 	3A33

		//;MAIN.C: 322: if (idState == 0) {
		LDR 	55H,1 			//0209 	08D5
		BTSS 	STATUS,2 		//020A 	1D03
		LJUMP 	223H 			//020B 	3A23
		ORG		020CH

		//;MAIN.C: 323: if ( idop > 2) {
		LDWI 	3H 			//020C 	2A03
		SUBWR 	57H,0 			//020D 	0C57
		BTSS 	STATUS,0 		//020E 	1C03
		LJUMP 	233H 			//020F 	3A33
		LDWI 	6H 			//0210 	2A06

		//;MAIN.C: 324: tmp++;
		INCR	56H,1 			//0211 	09D6

		//;MAIN.C: 326: if (tmp <= 5) {
		SUBWR 	56H,0 			//0212 	0C56
		BTSC 	STATUS,0 		//0213 	1403
		ORG		0214H
		LJUMP 	233H 			//0214 	3A33

		//;MAIN.C: 327: id_replate(tmp, keyID, buffTag);
		LDWI 	5EH 			//0215 	2A5E
		STR 	3EH 			//0216 	01BE
		LDWI 	25H 			//0217 	2A25
		STR 	3FH 			//0218 	01BF
		LDR 	56H,0 			//0219 	0856
		LCALL 	292H 			//021A 	3292
		LDWI 	2H 			//021B 	2A02
		ORG		021CH

		//;MAIN.C: 328: timeTick = 0;
		BCR 	STATUS,5 		//021C 	1283
		CLRR 	5AH 			//021D 	015A
		CLRR 	5BH 			//021E 	015B

		//;MAIN.C: 330: beep2(1, 2);
		STR 	75H 			//021F 	01F5
		LDWI 	1H 			//0220 	2A01
		LCALL 	3F8H 			//0221 	33F8
		LJUMP 	233H 			//0222 	3A33
		LDWI 	0H 			//0223 	2A00
		ORG		0224H

		//;MAIN.C: 337: beep2(0, 1);
		CLRR 	75H 			//0224 	0175
		INCR	75H,1 			//0225 	09F5
		LCALL 	3F8H 			//0226 	33F8
		LJUMP 	233H 			//0227 	3A33
		LDR 	5DH,0 			//0228 	085D
		STR 	FSR 			//0229 	0184
		LDWI 	7H 			//022A 	2A07
		SUBWR 	FSR,0 			//022B 	0C04
		ORG		022CH
		BTSC 	STATUS,0 		//022C 	1403
		LJUMP 	233H 			//022D 	3A33
		LDWI 	4H 			//022E 	2A04
		STR 	PCLATH 			//022F 	018A
		LDWI 	92H 			//0230 	2A92
		ADDWR 	FSR,0 			//0231 	0B04
		STR 	PCL 			//0232 	0182
		LDWI 	9FH 			//0233 	2A9F
		ORG		0234H

		//;MAIN.C: 343: idState = 1;
		BCR 	STATUS,5 		//0234 	1283
		CLRR 	55H 			//0235 	0155
		INCR	55H,1 			//0236 	09D5

		//;MAIN.C: 344: _delay((unsigned long)((61)*(8000000/4000.0)));
		STR 	53H 			//0237 	01D3
		LDWI 	6FH 			//0238 	2A6F
		STR 	52H 			//0239 	01D2
		DECRSZ 	52H,1 		//023A 	0ED2
		LJUMP 	23AH 			//023B 	3A3A
		ORG		023CH
		DECRSZ 	53H,1 		//023C 	0ED3
		LJUMP 	23AH 			//023D 	3A3A
		LJUMP 	23FH 			//023E 	3A3F

		//;MAIN.C: 345: }
		LJUMP 	24DH 			//023F 	3A4D
		LDWI 	2H 			//0240 	2A02

		//;MAIN.C: 346: else {
		//;MAIN.C: 347: idState = 0;
		CLRR 	55H 			//0241 	0155

		//;MAIN.C: 348: _delay((unsigned long)((150)*(8000000/4000.0)));
		STR 	54H 			//0242 	01D4
		LDWI 	86H 			//0243 	2A86
		ORG		0244H
		STR 	53H 			//0244 	01D3
		LDWI 	99H 			//0245 	2A99
		STR 	52H 			//0246 	01D2
		DECRSZ 	52H,1 		//0247 	0ED2
		LJUMP 	247H 			//0248 	3A47
		DECRSZ 	53H,1 		//0249 	0ED3
		LJUMP 	247H 			//024A 	3A47
		DECRSZ 	54H,1 		//024B 	0ED4
		ORG		024CH
		LJUMP 	247H 			//024C 	3A47

		//;MAIN.C: 349: }
		//;MAIN.C: 353: if ((timeOut != 0) && ( timeTick > timeOut)) {
		BCR 	STATUS,5 		//024D 	1283
		LDR 	59H,0 			//024E 	0859
		IORWR 	58H,0 			//024F 	0358
		BTSC 	STATUS,2 		//0250 	1503
		LJUMP 	274H 			//0251 	3A74
		LDR 	5BH,0 			//0252 	085B
		SUBWR 	59H,0 			//0253 	0C59
		ORG		0254H
		BTSS 	STATUS,2 		//0254 	1D03
		LJUMP 	258H 			//0255 	3A58
		LDR 	5AH,0 			//0256 	085A
		SUBWR 	58H,0 			//0257 	0C58
		BTSS 	STATUS,0 		//0258 	1C03
		LJUMP 	269H 			//0259 	3A69
		LJUMP 	274H 			//025A 	3A74

		//;MAIN.C: 358: setState(2, 255);
		LDWI 	FFH 			//025B 	2AFF
		ORG		025CH
		STR 	72H 			//025C 	01F2
		LDWI 	2H 			//025D 	2A02
		CLRR 	73H 			//025E 	0173
		LCALL 	478H 			//025F 	3478

		//;MAIN.C: 360: break;
		LJUMP 	274H 			//0260 	3A74

		//;MAIN.C: 361: case 2:
		//;MAIN.C: 362: kepTag = 1;
		CLRR 	5CH 			//0261 	015C
		INCR	5CH,1 			//0262 	09DC

		//;MAIN.C: 364: break;
		LJUMP 	274H 			//0263 	3A74
		ORG		0264H
		LDWI 	2H 			//0264 	2A02

		//;MAIN.C: 366: setState(2, 0);
		CLRR 	72H 			//0265 	0172
		CLRR 	73H 			//0266 	0173
		LCALL 	478H 			//0267 	3478

		//;MAIN.C: 369: break;
		LJUMP 	274H 			//0268 	3A74
		LDR 	5DH,0 			//0269 	085D
		XORWI 	1H 			//026A 	2601
		BTSC 	STATUS,2 		//026B 	1503
		ORG		026CH
		LJUMP 	25BH 			//026C 	3A5B
		XORWI 	3H 			//026D 	2603
		BTSC 	STATUS,2 		//026E 	1503
		LJUMP 	261H 			//026F 	3A61
		XORWI 	4H 			//0270 	2604
		BTSC 	STATUS,2 		//0271 	1503
		LJUMP 	264H 			//0272 	3A64
		LJUMP 	274H 			//0273 	3A74
		ORG		0274H

		//;MAIN.C: 372: }
		//;MAIN.C: 375: if (mtState == 0) RA3 = 1;
		LDR 	5DH,1 			//0274 	08DD
		BTSS 	STATUS,2 		//0275 	1D03
		LJUMP 	279H 			//0276 	3A79
		BSR 	5H,3 			//0277 	1985
		LJUMP 	27AH 			//0278 	3A7A

		//;MAIN.C: 376: else RA3 = 0;
		BCR 	5H,3 			//0279 	1185

		//;MAIN.C: 392: if (mtState == 2) {
		LDR 	5DH,0 			//027A 	085D
		XORWI 	2H 			//027B 	2602
		ORG		027CH
		BTSS 	STATUS,2 		//027C 	1D03
		LJUMP 	28DH 			//027D 	3A8D

		//;MAIN.C: 395: if (timeTick % 3 == 0) {
		LDWI 	3H 			//027E 	2A03
		STR 	72H 			//027F 	01F2
		CLRR 	73H 			//0280 	0173
		LDR 	5BH,0 			//0281 	085B
		STR 	75H 			//0282 	01F5
		LDR 	5AH,0 			//0283 	085A
		ORG		0284H
		STR 	74H 			//0284 	01F4
		LCALL 	2CDH 			//0285 	32CD
		LDR 	73H,0 			//0286 	0873
		IORWR 	72H,0 			//0287 	0372
		BTSS 	STATUS,2 		//0288 	1D03
		LJUMP 	28EH 			//0289 	3A8E

		//;MAIN.C: 397: RC0 = ~RC0;
		LDWI 	1H 			//028A 	2A01
		XORWR 	7H,1 			//028B 	0487
		ORG		028CH
		LJUMP 	28EH 			//028C 	3A8E
		BCR 	7H,0 			//028D 	1007

		//;MAIN.C: 426: timeTick++;
		INCR	5AH,1 			//028E 	09DA
		BTSC 	STATUS,2 		//028F 	1503
		INCR	5BH,1 			//0290 	09DB
		LJUMP 	193H 			//0291 	3993
		STR 	7BH 			//0292 	01FB

		//;MAIN.C: 164: id = (id - 1) * 5;
		LDWI 	5H 			//0293 	2A05
		ORG		0294H
		STR 	72H 			//0294 	01F2
		LDR 	7BH,0 			//0295 	087B
		ADDWI 	FFH 			//0296 	27FF
		LCALL 	45EH 			//0297 	345E
		STR 	7BH 			//0298 	01FB

		//;MAIN.C: 165: {
		//;MAIN.C: 166: {
		//;MAIN.C: 167: *(buff + id) = *Cont;
		LDR 	3EH,0 			//0299 	083E
		STR 	FSR 			//029A 	0184
		BCR 	STATUS,7 		//029B 	1383
		ORG		029CH
		LDR 	INDF,0 			//029C 	0800
		STR 	40H 			//029D 	01C0
		LDR 	7BH,0 			//029E 	087B
		ADDWR 	3FH,0 			//029F 	0B3F
		STR 	41H 			//02A0 	01C1
		STR 	FSR 			//02A1 	0184
		LDR 	40H,0 			//02A2 	0840
		STR 	INDF 			//02A3 	0180
		ORG		02A4H

		//;MAIN.C: 168: *(buff + 1 + id) = *(Cont + 1);
		LDR 	3EH,0 			//02A4 	083E
		ADDWI 	1H 			//02A5 	2701
		LCALL 	2C6H 			//02A6 	32C6
		ADDWI 	1H 			//02A7 	2701
		STR 	FSR 			//02A8 	0184
		LDR 	40H,0 			//02A9 	0840
		STR 	INDF 			//02AA 	0180

		//;MAIN.C: 169: *(buff + 2 + id) = *(Cont + 2);
		LDR 	3EH,0 			//02AB 	083E
		ORG		02ACH
		ADDWI 	2H 			//02AC 	2702
		LCALL 	2C6H 			//02AD 	32C6
		ADDWI 	2H 			//02AE 	2702
		STR 	FSR 			//02AF 	0184
		LDR 	40H,0 			//02B0 	0840
		STR 	INDF 			//02B1 	0180

		//;MAIN.C: 170: *(buff + 3 + id) = *(Cont + 3);
		LDR 	3EH,0 			//02B2 	083E
		ADDWI 	3H 			//02B3 	2703
		ORG		02B4H
		LCALL 	2C6H 			//02B4 	32C6
		ADDWI 	3H 			//02B5 	2703
		STR 	FSR 			//02B6 	0184
		LDR 	40H,0 			//02B7 	0840
		STR 	INDF 			//02B8 	0180

		//;MAIN.C: 171: *(buff + 4 + id) = *(Cont + 4);
		LDR 	3EH,0 			//02B9 	083E
		ADDWI 	4H 			//02BA 	2704
		LCALL 	2C6H 			//02BB 	32C6
		ORG		02BCH
		ADDWI 	4H 			//02BC 	2704
		STR 	FSR 			//02BD 	0184
		LDR 	40H,0 			//02BE 	0840
		STR 	INDF 			//02BF 	0180

		//;MAIN.C: 172: }
		//;MAIN.C: 173: }
		//;MAIN.C: 175: eepromWriteBlock(0x06, buffTag, 25);
		LDWI 	25H 			//02C0 	2A25
		STR 	76H 			//02C1 	01F6
		LDWI 	19H 			//02C2 	2A19
		STR 	77H 			//02C3 	01F7
		ORG		02C4H
		LDWI 	6H 			//02C4 	2A06
		LJUMP 	40DH 			//02C5 	3C0D
		STR 	FSR 			//02C6 	0184
		LDR 	INDF,0 			//02C7 	0800
		STR 	40H 			//02C8 	01C0
		LDR 	7BH,0 			//02C9 	087B
		ADDWR 	3FH,0 			//02CA 	0B3F
		STR 	41H 			//02CB 	01C1
		ORG		02CCH
		RET		 					//02CC 	0004
		LDR 	73H,0 			//02CD 	0873
		IORWR 	72H,0 			//02CE 	0372
		BTSC 	STATUS,2 		//02CF 	1503
		LJUMP 	2ECH 			//02D0 	3AEC
		CLRR 	76H 			//02D1 	0176
		INCR	76H,1 			//02D2 	09F6
		BTSC 	73H,7 			//02D3 	17F3
		ORG		02D4H
		LJUMP 	2D9H 			//02D4 	3AD9
		BCR 	STATUS,0 		//02D5 	1003
		RLR 	72H,1 			//02D6 	05F2
		RLR 	73H,1 			//02D7 	05F3
		LJUMP 	2D2H 			//02D8 	3AD2
		LDR 	73H,0 			//02D9 	0873
		SUBWR 	75H,0 			//02DA 	0C75
		BTSS 	STATUS,2 		//02DB 	1D03
		ORG		02DCH
		LJUMP 	2DFH 			//02DC 	3ADF
		LDR 	72H,0 			//02DD 	0872
		SUBWR 	74H,0 			//02DE 	0C74
		BTSS 	STATUS,0 		//02DF 	1C03
		LJUMP 	2E8H 			//02E0 	3AE8
		LDR 	72H,0 			//02E1 	0872
		SUBWR 	74H,1 			//02E2 	0CF4
		LDR 	73H,0 			//02E3 	0873
		ORG		02E4H
		BTSS 	STATUS,0 		//02E4 	1C03
		DECR 	75H,1 			//02E5 	0DF5
		SUBWR 	75H,1 			//02E6 	0CF5
		BCR 	STATUS,0 		//02E7 	1003
		RRR	73H,1 			//02E8 	06F3
		RRR	72H,1 			//02E9 	06F2
		DECRSZ 	76H,1 		//02EA 	0EF6
		LJUMP 	2D9H 			//02EB 	3AD9
		ORG		02ECH
		LDR 	75H,0 			//02EC 	0875
		STR 	73H 			//02ED 	01F3
		LDR 	74H,0 			//02EE 	0874
		STR 	72H 			//02EF 	01F2
		RET		 					//02F0 	0004
		STR 	75H 			//02F1 	01F5

		//;ms82_eeprom.c: 27: GIE = 0;
		BCR 	INTCON,7 		//02F2 	138B

		//;ms82_eeprom.c: 29: {
		//;ms82_eeprom.c: 30: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//02F3 	1F8B
		ORG		02F4H
		LJUMP 	2F7H 			//02F4 	3AF7
		CLRWDT	 			//02F5 	0001
		LJUMP 	2F3H 			//02F6 	3AF3

		//;ms82_eeprom.c: 31: EEADR = EEAddr;
		LDR 	75H,0 			//02F7 	0875
		BSR 	STATUS,5 		//02F8 	1A83
		STR 	1BH 			//02F9 	019B

		//;ms82_eeprom.c: 32: EEDAT = EEData;
		LDR 	72H,0 			//02FA 	0872
		STR 	1AH 			//02FB 	019A
		ORG		02FCH
		LDWI 	34H 			//02FC 	2A34

		//;ms82_eeprom.c: 33: EEIF = 0;
		BCR 	STATUS,5 		//02FD 	1283
		BCR 	CH,7 			//02FE 	138C

		//;ms82_eeprom.c: 34: EECON1 = 0x34;
		BSR 	STATUS,5 		//02FF 	1A83
		STR 	1CH 			//0300 	019C

		//;ms82_eeprom.c: 35: WR = 1;
		BSR 	1DH,0 			//0301 	181D

		//;ms82_eeprom.c: 36: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//0302 	1A83
		BTSS 	1DH,0 			//0303 	1C1D
		ORG		0304H
		LJUMP 	307H 			//0304 	3B07
		CLRWDT	 			//0305 	0001
		LJUMP 	302H 			//0306 	3B02

		//;ms82_eeprom.c: 37: _delay((unsigned long)((2)*(8000000/4000.0)));
		LDWI 	6H 			//0307 	2A06
		STR 	74H 			//0308 	01F4
		LDWI 	30H 			//0309 	2A30
		STR 	73H 			//030A 	01F3
		DECRSZ 	73H,1 		//030B 	0EF3
		ORG		030CH
		LJUMP 	30BH 			//030C 	3B0B
		DECRSZ 	74H,1 		//030D 	0EF4
		LJUMP 	30BH 			//030E 	3B0B
		CLRWDT	 			//030F 	0001

		//;ms82_eeprom.c: 38: }
		//;ms82_eeprom.c: 39: GIE = 1;
		BSR 	INTCON,7 		//0310 	1B8B
		RET		 					//0311 	0004
		STR 	48H 			//0312 	01C8

		//;MAIN.C: 178: unsigned char tmp[5] = {0xff, 0xff, 0xff, 0xff, 0xff};
		LDWI 	43H 			//0313 	2A43
		ORG		0314H
		STR 	FSR 			//0314 	0184
		LDR 	20H,0 			//0315 	0820
		BCR 	STATUS,7 		//0316 	1383
		STR 	INDF 			//0317 	0180
		INCR	FSR,1 			//0318 	0984
		LDR 	21H,0 			//0319 	0821
		STR 	INDF 			//031A 	0180
		INCR	FSR,1 			//031B 	0984
		ORG		031CH
		LDR 	22H,0 			//031C 	0822
		STR 	INDF 			//031D 	0180
		INCR	FSR,1 			//031E 	0984
		LDR 	23H,0 			//031F 	0823
		STR 	INDF 			//0320 	0180
		INCR	FSR,1 			//0321 	0984
		LDR 	24H,0 			//0322 	0824
		STR 	INDF 			//0323 	0180
		ORG		0324H
		LDR 	48H,0 			//0324 	0848
		SUBWR 	42H,0 			//0325 	0C42
		BTSS 	STATUS,0 		//0326 	1C03
		RET		 					//0327 	0004

		//;MAIN.C: 180: id_replate(idMin, tmp, buffTag);
		LDWI 	43H 			//0328 	2A43
		STR 	3EH 			//0329 	01BE
		LDWI 	25H 			//032A 	2A25
		STR 	3FH 			//032B 	01BF
		ORG		032CH
		LDR 	48H,0 			//032C 	0848
		LCALL 	292H 			//032D 	3292
		BCR 	STATUS,5 		//032E 	1283
		INCR	48H,1 			//032F 	09C8
		LJUMP 	324H 			//0330 	3B24

		//;ms82_pwm.c: 12: TRISC |= 0B00100000;
		BSR 	7H,5 			//0331 	1A87

		//;ms82_pwm.c: 13: T2CON0 = 0B00000001;
		LDWI 	1H 			//0332 	2A01
		BCR 	STATUS,5 		//0333 	1283
		ORG		0334H
		STR 	12H 			//0334 	0192

		//;ms82_pwm.c: 14: T2CON1 = 0B00000000;
		BSR 	STATUS,5 		//0335 	1A83
		CLRR 	1EH 			//0336 	011E

		//;ms82_pwm.c: 15: PR2H = 0;
		CLRR 	12H 			//0337 	0112

		//;ms82_pwm.c: 16: PR2L = 7;
		LDWI 	7H 			//0338 	2A07
		STR 	11H 			//0339 	0191

		//;ms82_pwm.c: 17: P1ADTH = 0;
		BCR 	STATUS,5 		//033A 	1283
		CLRR 	14H 			//033B 	0114
		ORG		033CH

		//;ms82_pwm.c: 18: P1ADTL = 4;
		LDWI 	4H 			//033C 	2A04
		STR 	EH 			//033D 	018E

		//;ms82_pwm.c: 20: P1OE = 0B00000001;
		LDWI 	1H 			//033E 	2A01
		BSR 	STATUS,5 		//033F 	1A83
		STR 	10H 			//0340 	0190

		//;ms82_pwm.c: 21: P1POL = 0B00000000;
		CLRR 	19H 			//0341 	0119

		//;ms82_pwm.c: 22: P1CON = 0B00000000;
		BCR 	STATUS,5 		//0342 	1283
		CLRR 	16H 			//0343 	0116
		ORG		0344H

		//;ms82_pwm.c: 24: TMR2H = 0;
		CLRR 	13H 			//0344 	0113

		//;ms82_pwm.c: 25: TMR2L = 0;
		CLRR 	11H 			//0345 	0111

		//;ms82_pwm.c: 26: TMR2IF = 0;
		BCR 	CH,1 			//0346 	108C

		//;ms82_pwm.c: 27: TMR2ON = 1;
		BSR 	12H,2 			//0347 	1912

		//;ms82_pwm.c: 28: while(TMR2IF==0) asm("clrwdt");
		BCR 	STATUS,5 		//0348 	1283
		BTSC 	CH,1 			//0349 	148C
		LJUMP 	34DH 			//034A 	3B4D
		CLRWDT	 			//034B 	0001
		ORG		034CH
		LJUMP 	348H 			//034C 	3B48

		//;ms82_pwm.c: 29: TRISC &= 0B11011111;
		BSR 	STATUS,5 		//034D 	1A83
		BCR 	7H,5 			//034E 	1287
		RET		 					//034F 	0004
		STR 	74H 			//0350 	01F4

		//;rfid125.c: 7: unsigned int CurTimer;
		//;rfid125.c: 8: T0ON = 0;
		BCR 	1FH,3 			//0351 	119F

		//;rfid125.c: 9: TMR0 = 0;
		CLRR 	1H 			//0352 	0101

		//;rfid125.c: 10: T0IF = 0;
		BCR 	INTCON,2 		//0353 	110B
		ORG		0354H

		//;rfid125.c: 11: T0ON = 1;
		BSR 	1FH,3 			//0354 	199F

		//;rfid125.c: 12: while(RA5==Logic){
		LDWI 	0H 			//0355 	2A00
		BTSC 	5H,5 			//0356 	1685
		LDWI 	1H 			//0357 	2A01
		XORWR 	74H,0 			//0358 	0474
		BTSS 	STATUS,2 		//0359 	1D03
		LJUMP 	36AH 			//035A 	3B6A

		//;rfid125.c: 13: CurTimer= (0 <<8 )| TMR0;
		CLRR 	75H 			//035B 	0175
		ORG		035CH
		CLRR 	76H 			//035C 	0176
		LDR 	1H,0 			//035D 	0801
		IORWR 	75H,1 			//035E 	03F5

		//;rfid125.c: 14: if(CurTimer>time)
		LDR 	76H,0 			//035F 	0876
		SUBWR 	73H,0 			//0360 	0C73
		BTSS 	STATUS,2 		//0361 	1D03
		LJUMP 	365H 			//0362 	3B65
		LDR 	75H,0 			//0363 	0875
		ORG		0364H
		SUBWR 	72H,0 			//0364 	0C72
		BTSC 	STATUS,0 		//0365 	1403
		LJUMP 	355H 			//0366 	3B55

		//;rfid125.c: 15: return 0;
		CLRR 	72H 			//0367 	0172
		CLRR 	73H 			//0368 	0173
		RET		 					//0369 	0004

		//;rfid125.c: 16: }
		//;rfid125.c: 17: return CurTimer;
		LDR 	76H,0 			//036A 	0876
		STR 	73H 			//036B 	01F3
		ORG		036CH
		LDR 	75H,0 			//036C 	0875
		STR 	72H 			//036D 	01F2
		RET		 					//036E 	0004
		STR 	78H 			//036F 	01F8

		//;ms82_eeprom.c: 53: unsigned char i;
		//;ms82_eeprom.c: 55: if(len1!=len2)
		LDR 	73H,0 			//0370 	0873
		XORWR 	74H,0 			//0371 	0474
		BTSS 	STATUS,2 		//0372 	1D03

		//;ms82_eeprom.c: 56: return 0;
		RETW 	0H 			//0373 	2100
		ORG		0374H

		//;ms82_eeprom.c: 57: else{
		//;ms82_eeprom.c: 58: for(i=0;i<len1;i++){
		CLRR 	79H 			//0374 	0179
		LDR 	73H,0 			//0375 	0873
		SUBWR 	79H,0 			//0376 	0C79

		//;ms82_eeprom.c: 59: if(*(arr1+i) != *(arr2+i)){
		LDR 	79H,0 			//0377 	0879
		BTSC 	STATUS,0 		//0378 	1403
		LJUMP 	38AH 			//0379 	3B8A
		ADDWR 	72H,0 			//037A 	0B72
		STR 	75H 			//037B 	01F5
		ORG		037CH
		STR 	FSR 			//037C 	0184
		BCR 	STATUS,7 		//037D 	1383
		LDR 	INDF,0 			//037E 	0800
		STR 	76H 			//037F 	01F6
		LDR 	79H,0 			//0380 	0879
		ADDWR 	78H,0 			//0381 	0B78
		STR 	77H 			//0382 	01F7
		STR 	FSR 			//0383 	0184
		ORG		0384H
		LDR 	INDF,0 			//0384 	0800
		XORWR 	76H,0 			//0385 	0476
		BTSS 	STATUS,2 		//0386 	1D03
		RETW 	0H 			//0387 	2100
		INCR	79H,1 			//0388 	09F9
		LJUMP 	375H 			//0389 	3B75

		//;ms82_eeprom.c: 61: }
		//;ms82_eeprom.c: 62: }
		//;ms82_eeprom.c: 63: if(i==len1)
		XORWR 	73H,0 			//038A 	0473
		BTSC 	STATUS,2 		//038B 	1503
		ORG		038CH

		//;ms82_eeprom.c: 64: return 1;
		RETW 	1H 			//038C 	2101
		RETW 	0H 			//038D 	2100
		RETW 	FFH 			//038E 	21FF
		RETW 	FFH 			//038F 	21FF
		RETW 	FFH 			//0390 	21FF
		RETW 	FFH 			//0391 	21FF
		RETW 	FFH 			//0392 	21FF
		RETW 	0H 			//0393 	2100
		ORG		0394H
		RETW 	0H 			//0394 	2100
		RETW 	11H 			//0395 	2111
		RETW 	BH 			//0396 	210B
		RETW 	4FH 			//0397 	214F
		RETW 	0H 			//0398 	2100
		RETW 	0H 			//0399 	2100
		RETW 	81H 			//039A 	2181
		RETW 	2FH 			//039B 	212F
		ORG		039CH
		RETW 	22H 			//039C 	2122
		RETW 	0H 			//039D 	2100
		RETW 	0H 			//039E 	2100
		RETW 	7DH 			//039F 	217D
		RETW 	67H 			//03A0 	2167
		RETW 	5H 			//03A1 	2105
		RETW 	0H 			//03A2 	2100
		RETW 	0H 			//03A3 	2100
		ORG		03A4H
		RETW 	7EH 			//03A4 	217E
		RETW 	31H 			//03A5 	2131
		RETW 	E7H 			//03A6 	21E7
		RETW 	0H 			//03A7 	2100
		RETW 	0H 			//03A8 	2100
		RETW 	7EH 			//03A9 	217E
		RETW 	51H 			//03AA 	2151
		RETW 	E6H 			//03AB 	21E6
		ORG		03ACH
		STR 	73H 			//03AC 	01F3
		CLRR 	75H 			//03AD 	0175
		LDR 	72H,0 			//03AE 	0872
		BTSC 	STATUS,2 		//03AF 	1503
		LJUMP 	3C5H 			//03B0 	3BC5
		CLRR 	74H 			//03B1 	0174
		INCR	74H,1 			//03B2 	09F4
		BTSC 	72H,7 			//03B3 	17F2
		ORG		03B4H
		LJUMP 	3B8H 			//03B4 	3BB8
		BCR 	STATUS,0 		//03B5 	1003
		RLR 	72H,1 			//03B6 	05F2
		LJUMP 	3B2H 			//03B7 	3BB2
		BCR 	STATUS,0 		//03B8 	1003
		RLR 	75H,1 			//03B9 	05F5
		LDR 	72H,0 			//03BA 	0872
		SUBWR 	73H,0 			//03BB 	0C73
		ORG		03BCH
		BTSS 	STATUS,0 		//03BC 	1C03
		LJUMP 	3C2H 			//03BD 	3BC2
		LDR 	72H,0 			//03BE 	0872
		SUBWR 	73H,1 			//03BF 	0CF3
		BSR 	75H,0 			//03C0 	1875
		BCR 	STATUS,0 		//03C1 	1003
		RRR	72H,1 			//03C2 	06F2
		DECRSZ 	74H,1 		//03C3 	0EF4
		ORG		03C4H
		LJUMP 	3B8H 			//03C4 	3BB8
		LDR 	75H,0 			//03C5 	0875
		RET		 					//03C6 	0004
		STR 	3EH 			//03C7 	01BE

		//;MAIN.C: 156: unsigned char i;
		//;MAIN.C: 157: for (i = 0; i < 21; i += 5) {
		CLRR 	3FH 			//03C8 	013F

		//;MAIN.C: 158: if (comArr(id_input, buff + i, 5, 5))
		LDR 	3FH,0 			//03C9 	083F
		ADDWR 	7AH,0 			//03CA 	0B7A
		STR 	72H 			//03CB 	01F2
		ORG		03CCH
		LDWI 	5H 			//03CC 	2A05
		STR 	73H 			//03CD 	01F3
		STR 	74H 			//03CE 	01F4
		LDR 	3EH,0 			//03CF 	083E
		LCALL 	36FH 			//03D0 	336F
		XORWI 	0H 			//03D1 	2600

		//;MAIN.C: 159: return i / 5 + 1;
		LDWI 	5H 			//03D2 	2A05
		BTSC 	STATUS,2 		//03D3 	1503
		ORG		03D4H
		LJUMP 	3DBH 			//03D4 	3BDB
		STR 	72H 			//03D5 	01F2
		LDR 	3FH,0 			//03D6 	083F
		LCALL 	3ACH 			//03D7 	33AC
		STR 	7BH 			//03D8 	01FB
		INCR	7BH,0 			//03D9 	097B
		RET		 					//03DA 	0004
		ADDWR 	3FH,1 			//03DB 	0BBF
		ORG		03DCH
		LDWI 	15H 			//03DC 	2A15
		SUBWR 	3FH,0 			//03DD 	0C3F
		BTSC 	STATUS,0 		//03DE 	1403

		//;MAIN.C: 160: }
		//;MAIN.C: 161: return 255;
		RETW 	FFH 			//03DF 	21FF
		LJUMP 	3C9H 			//03E0 	3BC9
		LDWI 	3EH 			//03E1 	2A3E
		CLRR 	58H 			//03E2 	0158
		CLRR 	59H 			//03E3 	0159
		ORG		03E4H
		CLRR 	5AH 			//03E4 	015A
		CLRR 	5BH 			//03E5 	015B
		CLRR 	5CH 			//03E6 	015C
		CLRR 	5DH 			//03E7 	015D
		CLRR 	5EH 			//03E8 	015E
		CLRR 	5FH 			//03E9 	015F
		CLRR 	60H 			//03EA 	0160
		CLRR 	61H 			//03EB 	0161
		ORG		03ECH
		CLRR 	62H 			//03EC 	0162
		BCR 	STATUS,7 		//03ED 	1383
		STR 	7DH 			//03EE 	01FD
		LDWI 	3H 			//03EF 	2A03
		STR 	7EH 			//03F0 	01FE
		LDWI 	8EH 			//03F1 	2A8E
		STR 	7FH 			//03F2 	01FF
		LDWI 	20H 			//03F3 	2A20
		ORG		03F4H
		STR 	FSR 			//03F4 	0184
		LCALL 	444H 			//03F5 	3444
		CLRR 	STATUS 			//03F6 	0103
		LJUMP 	155H 			//03F7 	3955
		STR 	76H 			//03F8 	01F6

		//;MAIN.C: 184: while (rep--) {
		DECR 	75H,1 			//03F9 	0DF5
		LDR 	75H,0 			//03FA 	0875
		XORWI 	FFH 			//03FB 	26FF
		ORG		03FCH
		BTSC 	STATUS,2 		//03FC 	1503
		RET		 					//03FD 	0004

		//;MAIN.C: 185: RC0 = 1; if (sel)RA3 = 1;
		BCR 	STATUS,5 		//03FE 	1283
		BSR 	7H,0 			//03FF 	1807
		LDR 	76H,0 			//0400 	0876
		BTSS 	STATUS,2 		//0401 	1D03
		BSR 	5H,3 			//0402 	1985

		//;MAIN.C: 186: delay_x10ms(20);
		LDWI 	14H 			//0403 	2A14
		ORG		0404H
		LCALL 	430H 			//0404 	3430

		//;MAIN.C: 187: RC0 = 0; if (sel)RA3 = 0;
		BCR 	STATUS,5 		//0405 	1283
		BCR 	7H,0 			//0406 	1007
		LDR 	76H,0 			//0407 	0876
		BTSS 	STATUS,2 		//0408 	1D03
		BCR 	5H,3 			//0409 	1185

		//;MAIN.C: 188: delay_x10ms(20);
		LDWI 	14H 			//040A 	2A14
		LCALL 	430H 			//040B 	3430
		ORG		040CH
		LJUMP 	3F9H 			//040C 	3BF9
		STR 	79H 			//040D 	01F9

		//;ms82_eeprom.c: 44: unsigned char i;
		//;ms82_eeprom.c: 45: for(i=0;i<len;i++){
		CLRR 	7AH 			//040E 	017A
		LDR 	77H,0 			//040F 	0877
		SUBWR 	7AH,0 			//0410 	0C7A
		BTSC 	STATUS,0 		//0411 	1403
		RET		 					//0412 	0004

		//;ms82_eeprom.c: 46: eepromWriteByte(addStart+i,buff[i]);
		LDR 	7AH,0 			//0413 	087A
		ORG		0414H
		ADDWR 	76H,0 			//0414 	0B76
		STR 	78H 			//0415 	01F8
		STR 	FSR 			//0416 	0184
		BCR 	STATUS,7 		//0417 	1383
		LDR 	INDF,0 			//0418 	0800
		STR 	72H 			//0419 	01F2
		LDR 	7AH,0 			//041A 	087A
		ADDWR 	79H,0 			//041B 	0B79
		ORG		041CH
		LCALL 	2F1H 			//041C 	32F1
		INCR	7AH,1 			//041D 	09FA
		LJUMP 	40FH 			//041E 	3C0F
		STR 	77H 			//041F 	01F7

		//;ms82_eeprom.c: 19: unsigned char i;
		//;ms82_eeprom.c: 20: for(i=0;i<len;i++){
		CLRR 	78H 			//0420 	0178
		LDR 	75H,0 			//0421 	0875
		SUBWR 	78H,0 			//0422 	0C78
		BTSC 	STATUS,0 		//0423 	1403
		ORG		0424H
		RET		 					//0424 	0004

		//;ms82_eeprom.c: 21: buff[i] = eepromReadByte(addStart+i);
		LDR 	78H,0 			//0425 	0878
		ADDWR 	74H,0 			//0426 	0B74
		STR 	76H 			//0427 	01F6
		STR 	FSR 			//0428 	0184
		LDR 	78H,0 			//0429 	0878
		ADDWR 	77H,0 			//042A 	0B77
		LCALL 	48AH 			//042B 	348A
		ORG		042CH
		BCR 	STATUS,7 		//042C 	1383
		STR 	INDF 			//042D 	0180
		INCR	78H,1 			//042E 	09F8
		LJUMP 	421H 			//042F 	3C21
		STR 	74H 			//0430 	01F4

		//;MAIN.C: 56: while (t--)
		DECR 	74H,1 			//0431 	0DF4
		LDR 	74H,0 			//0432 	0874
		XORWI 	FFH 			//0433 	26FF
		ORG		0434H
		BTSC 	STATUS,2 		//0434 	1503
		RET		 					//0435 	0004

		//;MAIN.C: 57: _delay((unsigned long)((10)*(8000000/4000.0)));
		LDWI 	1AH 			//0436 	2A1A
		STR 	73H 			//0437 	01F3
		LDWI 	F8H 			//0438 	2AF8
		STR 	72H 			//0439 	01F2
		DECRSZ 	72H,1 		//043A 	0EF2
		LJUMP 	43AH 			//043B 	3C3A
		ORG		043CH
		DECRSZ 	73H,1 		//043C 	0EF3
		LJUMP 	43AH 			//043D 	3C3A
		CLRWDT	 			//043E 	0001
		LJUMP 	431H 			//043F 	3C31
		LDR 	7EH,0 			//0440 	087E
		STR 	PCLATH 			//0441 	018A
		LDR 	7FH,0 			//0442 	087F
		STR 	PCL 			//0443 	0182
		ORG		0444H
		LCALL 	440H 			//0444 	3440
		STR 	INDF 			//0445 	0180
		INCR	FSR,1 			//0446 	0984
		LDR 	FSR,0 			//0447 	0804
		XORWR 	7DH,0 			//0448 	047D
		BTSC 	STATUS,2 		//0449 	1503
		RETW 	0H 			//044A 	2100
		INCR	7FH,1 			//044B 	09FF
		ORG		044CH
		BTSC 	STATUS,2 		//044C 	1503
		INCR	7EH,1 			//044D 	09FE
		LJUMP 	444H 			//044E 	3C44

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//044F 	1283
		CLRR 	5H 			//0450 	0105

		//;sysinit.c: 35: TRISA = 0B01110011;
		LDWI 	73H 			//0451 	2A73
		BSR 	STATUS,5 		//0452 	1A83
		STR 	5H 			//0453 	0185
		ORG		0454H

		//;sysinit.c: 36: WPUA = 0B10000000;
		LDWI 	80H 			//0454 	2A80
		STR 	15H 			//0455 	0195

		//;sysinit.c: 37: PORTC = 0B00000010;
		LDWI 	2H 			//0456 	2A02
		BCR 	STATUS,5 		//0457 	1283
		STR 	7H 			//0458 	0187

		//;sysinit.c: 38: TRISC = 0B11111110;
		LDWI 	FEH 			//0459 	2AFE
		BSR 	STATUS,5 		//045A 	1A83
		STR 	7H 			//045B 	0187
		ORG		045CH

		//;sysinit.c: 39: WPUC = 0B00000000;
		CLRR 	13H 			//045C 	0113
		RET		 					//045D 	0004
		STR 	74H 			//045E 	01F4
		CLRR 	73H 			//045F 	0173
		LDR 	72H,0 			//0460 	0872
		BTSC 	74H,0 			//0461 	1474
		ADDWR 	73H,1 			//0462 	0BF3
		BCR 	STATUS,0 		//0463 	1003
		ORG		0464H
		RLR 	72H,1 			//0464 	05F2
		BCR 	STATUS,0 		//0465 	1003
		RRR	74H,1 			//0466 	06F4
		LDR 	74H,1 			//0467 	08F4
		BTSS 	STATUS,2 		//0468 	1D03
		LJUMP 	460H 			//0469 	3C60
		LDR 	73H,0 			//046A 	0873
		RET		 					//046B 	0004
		ORG		046CH

		//;sysinit.c: 72: INTCON = 0B00000000;
		CLRR 	INTCON 			//046C 	010B

		//;sysinit.c: 73: PIE1 = 0B00000000;
		CLRR 	CH 			//046D 	010C

		//;sysinit.c: 74: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//046E 	1283
		CLRR 	CH 			//046F 	010C

		//;sysinit.c: 87: T0IF = 0;
		BCR 	INTCON,2 		//0470 	110B

		//;sysinit.c: 88: T0IE = 0;
		BCR 	INTCON,5 		//0471 	128B

		//;sysinit.c: 92: TMR2IF = 0;
		BCR 	CH,1 			//0472 	108C

		//;sysinit.c: 93: TMR2IE = 1;
		BSR 	STATUS,5 		//0473 	1A83
		ORG		0474H
		BSR 	CH,1 			//0474 	188C

		//;sysinit.c: 99: PEIE = 0;
		BCR 	INTCON,6 		//0475 	130B

		//;sysinit.c: 101: GIE = 1;
		BSR 	INTCON,7 		//0476 	1B8B
		RET		 					//0477 	0004
		STR 	74H 			//0478 	01F4

		//;MAIN.C: 150: mtState = stt;
		BCR 	STATUS,5 		//0479 	1283
		STR 	5DH 			//047A 	01DD

		//;MAIN.C: 151: timeTick = 0;
		CLRR 	5AH 			//047B 	015A
		ORG		047CH
		CLRR 	5BH 			//047C 	015B

		//;MAIN.C: 152: timeOut = _tOut;
		LDR 	73H,0 			//047D 	0873
		STR 	59H 			//047E 	01D9
		LDR 	72H,0 			//047F 	0872
		STR 	58H 			//0480 	01D8
		RET		 					//0481 	0004

		//;sysinit.c: 21: OSCCON = 0B01100001;
		LDWI 	61H 			//0482 	2A61
		BSR 	STATUS,5 		//0483 	1A83
		ORG		0484H
		STR 	FH 			//0484 	018F

		//;sysinit.c: 22: _nop();
		NOP		 					//0485 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//0486 	1A83
		BTSC 	FH,2 			//0487 	150F
		RET		 					//0488 	0004
		LJUMP 	486H 			//0489 	3C86
		STR 	72H 			//048A 	01F2

		//;ms82_eeprom.c: 8: unsigned char ReEepromData;
		//;ms82_eeprom.c: 10: EEADR = EEAddr;
		BSR 	STATUS,5 		//048B 	1A83
		ORG		048CH
		STR 	1BH 			//048C 	019B

		//;ms82_eeprom.c: 11: RD = 1;
		BSR 	1CH,0 			//048D 	181C

		//;ms82_eeprom.c: 12: ReEepromData = EEDAT;
		LDR 	1AH,0 			//048E 	081A
		STR 	73H 			//048F 	01F3

		//;ms82_eeprom.c: 13: RD = 0;
		BCR 	1CH,0 			//0490 	101C

		//;ms82_eeprom.c: 14: return ReEepromData;
		RET		 					//0491 	0004
		LJUMP 	233H 			//0492 	3A33
		LJUMP 	1A4H 			//0493 	39A4
		ORG		0494H
		LJUMP 	1A4H 			//0494 	39A4
		LJUMP 	1EBH 			//0495 	39EB
		LJUMP 	233H 			//0496 	3A33
		LJUMP 	209H 			//0497 	3A09
		LJUMP 	1C2H 			//0498 	39C2
		LDR 	71H,0 			//0499 	0871
		STR 	PCLATH 			//049A 	018A
		SWAPR 	70H,0 			//049B 	0770
		ORG		049CH
		STR 	STATUS 			//049C 	0183
		SWAPR 	7EH,1 			//049D 	07FE
		SWAPR 	7EH,0 			//049E 	077E
		RETI		 			//049F 	0009

		//;sysinit.c: 46: OPTION = 0B00000011;
		LDWI 	3H 			//04A0 	2A03
		STR 	1H 			//04A1 	0181
		RET		 					//04A2 	0004
			END
