opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F685
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_sys_init
	FNCALL	_main,_gpio_init
	FNCALL	_main,_timer_init
	FNCALL	_main,_int_init
	FNCALL	_main,_eepromWriteByte
	FNCALL	_main,_SET_EPWM_ON
	FNCALL	_main,_eepromReadByte
	FNCALL	_main,_eepromReadBlock
	FNCALL	_main,_setState
	FNCALL	_main,_get_RFID
	FNCALL	_main,_id_search
	FNCALL	_main,_id_clear
	FNCALL	_main,_beep2
	FNCALL	_main,_id_replate
	FNCALL	_main,___lwmod
	FNCALL	_id_clear,_id_replate
	FNCALL	_id_replate,___bmul
	FNCALL	_id_replate,_eepromWriteBlock
	FNCALL	_beep2,_delay_x10ms
	FNCALL	_eepromWriteBlock,_eepromWriteByte
	FNCALL	_id_search,_comArr
	FNCALL	_id_search,___lbdiv
	FNCALL	_get_RFID,_timerOut
	FNCALL	_get_RFID,___lbdiv
	FNCALL	_eepromReadBlock,_eepromReadByte
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	id_clear@F1098
	global	_buffTag
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"MAIN.C"
	line	178

;initializer for id_clear@F1098
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh
	line	42

;initializer for _buffTag
	retlw	0
	retlw	0
	retlw	011h
	retlw	0Bh
	retlw	04Fh
	retlw	0
	retlw	0
	retlw	081h
	retlw	02Fh
	retlw	022h
	retlw	0
	retlw	0
	retlw	07Dh
	retlw	067h
	retlw	05h
	retlw	0
	retlw	0
	retlw	07Eh
	retlw	031h
	retlw	0E7h
	retlw	0
	retlw	0
	retlw	07Eh
	retlw	051h
	retlw	0E6h
	global	_timeOut
	global	_timeTick
	global	_kepTag
	global	_mtState
	global	_keyID
	global	_ANSEL
_ANSEL	set	286
	DABS	1,286,1	;_ANSEL

	global	_ANSELH
_ANSELH	set	287
	DABS	1,287,1	;_ANSELH

	global	_CM1CON0
_CM1CON0	set	281
	DABS	1,281,1	;_CM1CON0

	global	_CM2CON0
_CM2CON0	set	282
	DABS	1,282,1	;_CM2CON0

	global	_CM2CON1
_CM2CON1	set	283
	DABS	1,283,1	;_CM2CON1

	global	_EEADRH
_EEADRH	set	271
	DABS	1,271,1	;_EEADRH

	global	_EEDATH
_EEDATH	set	270
	DABS	1,270,1	;_EEDATH

	global	_IOCB
_IOCB	set	278
	DABS	1,278,1	;_IOCB

	global	_PSTRCON
_PSTRCON	set	413
	DABS	1,413,1	;_PSTRCON

	global	_SRCON
_SRCON	set	414
	DABS	1,414,1	;_SRCON

	global	_VRCON
_VRCON	set	280
	DABS	1,280,1	;_VRCON

	global	_WPUB
_WPUB	set	277
	DABS	1,277,1	;_WPUB

	global	_ANS0
_ANS0	set	2288
	DABS	1,286,1	;_ANS0

	global	_ANS1
_ANS1	set	2289
	DABS	1,286,1	;_ANS1

	global	_ANS10
_ANS10	set	2298
	DABS	1,287,1	;_ANS10

	global	_ANS11
_ANS11	set	2299
	DABS	1,287,1	;_ANS11

	global	_ANS2
_ANS2	set	2290
	DABS	1,286,1	;_ANS2

	global	_ANS3
_ANS3	set	2291
	DABS	1,286,1	;_ANS3

	global	_ANS4
_ANS4	set	2292
	DABS	1,286,1	;_ANS4

	global	_ANS5
_ANS5	set	2293
	DABS	1,286,1	;_ANS5

	global	_ANS6
_ANS6	set	2294
	DABS	1,286,1	;_ANS6

	global	_ANS7
_ANS7	set	2295
	DABS	1,286,1	;_ANS7

	global	_ANS8
_ANS8	set	2296
	DABS	1,287,1	;_ANS8

	global	_ANS9
_ANS9	set	2297
	DABS	1,287,1	;_ANS9

	global	_C1CH0
_C1CH0	set	2248
	DABS	1,281,1	;_C1CH0

	global	_C1CH1
_C1CH1	set	2249
	DABS	1,281,1	;_C1CH1

	global	_C1OE
_C1OE	set	2253
	DABS	1,281,1	;_C1OE

	global	_C1ON
_C1ON	set	2255
	DABS	1,281,1	;_C1ON

	global	_C1OUT
_C1OUT	set	2254
	DABS	1,281,1	;_C1OUT

	global	_C1POL
_C1POL	set	2252
	DABS	1,281,1	;_C1POL

	global	_C1R
_C1R	set	2250
	DABS	1,281,1	;_C1R

	global	_C1SEN
_C1SEN	set	3317
	DABS	1,414,1	;_C1SEN

	global	_C1VREN
_C1VREN	set	2247
	DABS	1,280,1	;_C1VREN

	global	_C2CH0
_C2CH0	set	2256
	DABS	1,282,1	;_C2CH0

	global	_C2CH1
_C2CH1	set	2257
	DABS	1,282,1	;_C2CH1

	global	_C2OE
_C2OE	set	2261
	DABS	1,282,1	;_C2OE

	global	_C2ON
_C2ON	set	2263
	DABS	1,282,1	;_C2ON

	global	_C2OUT
_C2OUT	set	2262
	DABS	1,282,1	;_C2OUT

	global	_C2POL
_C2POL	set	2260
	DABS	1,282,1	;_C2POL

	global	_C2R
_C2R	set	2258
	DABS	1,282,1	;_C2R

	global	_C2REN
_C2REN	set	3316
	DABS	1,414,1	;_C2REN

	global	_C2SYNC
_C2SYNC	set	2264
	DABS	1,283,1	;_C2SYNC

	global	_C2VREN
_C2VREN	set	2246
	DABS	1,280,1	;_C2VREN

	global	_EEPGD
_EEPGD	set	3175
	DABS	1,396,1	;_EEPGD

	global	_IOCB4
_IOCB4	set	2228
	DABS	1,278,1	;_IOCB4

	global	_IOCB5
_IOCB5	set	2229
	DABS	1,278,1	;_IOCB5

	global	_IOCB6
_IOCB6	set	2230
	DABS	1,278,1	;_IOCB6

	global	_IOCB7
_IOCB7	set	2231
	DABS	1,278,1	;_IOCB7

	global	_MC1OUT
_MC1OUT	set	2271
	DABS	1,283,1	;_MC1OUT

	global	_MC2OUT
_MC2OUT	set	2270
	DABS	1,283,1	;_MC2OUT

	global	_PULSR
_PULSR	set	3314
	DABS	1,414,1	;_PULSR

	global	_PULSS
_PULSS	set	3315
	DABS	1,414,1	;_PULSS

	global	_SR0
_SR0	set	3318
	DABS	1,414,1	;_SR0

	global	_SR1
_SR1	set	3319
	DABS	1,414,1	;_SR1

	global	_STRA
_STRA	set	3304
	DABS	1,413,1	;_STRA

	global	_STRB
_STRB	set	3305
	DABS	1,413,1	;_STRB

	global	_STRC
_STRC	set	3306
	DABS	1,413,1	;_STRC

	global	_STRD
_STRD	set	3307
	DABS	1,413,1	;_STRD

	global	_STRSYNC
_STRSYNC	set	3308
	DABS	1,413,1	;_STRSYNC

	global	_T1GSS
_T1GSS	set	2265
	DABS	1,283,1	;_T1GSS

	global	_VP6EN
_VP6EN	set	2244
	DABS	1,280,1	;_VP6EN

	global	_VR0
_VR0	set	2240
	DABS	1,280,1	;_VR0

	global	_VR1
_VR1	set	2241
	DABS	1,280,1	;_VR1

	global	_VR2
_VR2	set	2242
	DABS	1,280,1	;_VR2

	global	_VR3
_VR3	set	2243
	DABS	1,280,1	;_VR3

	global	_VRR
_VRR	set	2245
	DABS	1,280,1	;_VRR

	global	_WPUB4
_WPUB4	set	2220
	DABS	1,277,1	;_WPUB4

	global	_WPUB5
_WPUB5	set	2221
	DABS	1,277,1	;_WPUB5

	global	_WPUB6
_WPUB6	set	2222
	DABS	1,277,1	;_WPUB6

	global	_WPUB7
_WPUB7	set	2223
	DABS	1,277,1	;_WPUB7

	global	_WREN
_WREN	set	3170
	DABS	1,396,1	;_WREN

	global	_INTCON
_INTCON	set	11
	global	_P1ADTH
_P1ADTH	set	20
	global	_P1ADTL
_P1ADTL	set	14
	global	_P1CON
_P1CON	set	22
	global	_PIR1
_PIR1	set	12
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_T2CON0
_T2CON0	set	18
	global	_TMR2H
_TMR2H	set	19
	global	_TMR2L
_TMR2L	set	17
	global	_EEIF
_EEIF	set	103
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RA3
_RA3	set	43
	global	_RA5
_RA5	set	45
	global	_RC0
_RC0	set	56
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_T0ON
_T0ON	set	251
	global	_TMR2IF
_TMR2IF	set	97
	global	_TMR2ON
_TMR2ON	set	146
	global	_EEADR
_EEADR	set	155
	global	_EECON1
_EECON1	set	156
	global	_EEDAT
_EEDAT	set	154
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_P1OE
_P1OE	set	144
	global	_P1POL
_P1POL	set	153
	global	_PIE1
_PIE1	set	140
	global	_PR2H
_PR2H	set	146
	global	_PR2L
_PR2L	set	145
	global	_T2CON1
_T2CON1	set	158
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WPUA
_WPUA	set	149
	global	_WPUC
_WPUC	set	147
	global	_HTS
_HTS	set	1146
	global	_RD
_RD	set	1248
	global	_TMR2IE
_TMR2IE	set	1121
	global	_WR
_WR	set	1256
	global	_TMR0
_TMR0	set	1
	file	"smartkey.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_timeOut:
       ds      2

_timeTick:
       ds      2

_kepTag:
       ds      1

_mtState:
       ds      1

_keyID:
       ds      5

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"MAIN.C"
	line	178
id_clear@F1098:
       ds      5

psect	dataBANK0
	file	"MAIN.C"
	line	42
_buffTag:
       ds      25

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
	clrf	((__pbssBANK0)+9)&07Fh
	clrf	((__pbssBANK0)+10)&07Fh
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+30)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_sys_init
?_sys_init:	; 0 bytes @ 0x0
	global	?_gpio_init
?_gpio_init:	; 0 bytes @ 0x0
	global	?_timer_init
?_timer_init:	; 0 bytes @ 0x0
	global	?_int_init
?_int_init:	; 0 bytes @ 0x0
	global	?_SET_EPWM_ON
?_SET_EPWM_ON:	; 0 bytes @ 0x0
	global	?_delay_x10ms
?_delay_x10ms:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_eepromReadByte
?_eepromReadByte:	; 1 bytes @ 0x0
	global	?_get_RFID
?_get_RFID:	; 1 bytes @ 0x0
	ds	2
	global	??_sys_init
??_sys_init:	; 0 bytes @ 0x2
	global	??_gpio_init
??_gpio_init:	; 0 bytes @ 0x2
	global	??_timer_init
??_timer_init:	; 0 bytes @ 0x2
	global	??_int_init
??_int_init:	; 0 bytes @ 0x2
	global	??_eepromReadByte
??_eepromReadByte:	; 0 bytes @ 0x2
	global	?_eepromWriteByte
?_eepromWriteByte:	; 0 bytes @ 0x2
	global	??_SET_EPWM_ON
??_SET_EPWM_ON:	; 0 bytes @ 0x2
	global	??_delay_x10ms
??_delay_x10ms:	; 0 bytes @ 0x2
	global	?_setState
?_setState:	; 0 bytes @ 0x2
	global	?_comArr
?_comArr:	; 1 bytes @ 0x2
	global	?___bmul
?___bmul:	; 1 bytes @ 0x2
	global	?___lbdiv
?___lbdiv:	; 1 bytes @ 0x2
	global	?_timerOut
?_timerOut:	; 2 bytes @ 0x2
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x2
	global	eepromReadByte@EEAddr
eepromReadByte@EEAddr:	; 1 bytes @ 0x2
	global	eepromWriteByte@EEData
eepromWriteByte@EEData:	; 1 bytes @ 0x2
	global	comArr@arr2
comArr@arr2:	; 1 bytes @ 0x2
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x2
	global	___lbdiv@divisor
___lbdiv@divisor:	; 1 bytes @ 0x2
	global	timerOut@time
timerOut@time:	; 2 bytes @ 0x2
	global	setState@_tOut
setState@_tOut:	; 2 bytes @ 0x2
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x2
	ds	1
	global	??_eepromWriteByte
??_eepromWriteByte:	; 0 bytes @ 0x3
	global	??___bmul
??___bmul:	; 0 bytes @ 0x3
	global	??___lbdiv
??___lbdiv:	; 0 bytes @ 0x3
	global	eepromReadByte@ReEepromData
eepromReadByte@ReEepromData:	; 1 bytes @ 0x3
	global	comArr@len1
comArr@len1:	; 1 bytes @ 0x3
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x3
	global	___lbdiv@dividend
___lbdiv@dividend:	; 1 bytes @ 0x3
	ds	1
	global	?_eepromReadBlock
?_eepromReadBlock:	; 0 bytes @ 0x4
	global	??_timerOut
??_timerOut:	; 0 bytes @ 0x4
	global	??_setState
??_setState:	; 0 bytes @ 0x4
	global	eepromReadBlock@buff
eepromReadBlock@buff:	; 1 bytes @ 0x4
	global	comArr@len2
comArr@len2:	; 1 bytes @ 0x4
	global	timerOut@Logic
timerOut@Logic:	; 1 bytes @ 0x4
	global	delay_x10ms@t
delay_x10ms@t:	; 1 bytes @ 0x4
	global	setState@stt
setState@stt:	; 1 bytes @ 0x4
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x4
	global	___lbdiv@counter
___lbdiv@counter:	; 1 bytes @ 0x4
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x4
	ds	1
	global	??_comArr
??_comArr:	; 0 bytes @ 0x5
	global	?_beep2
?_beep2:	; 0 bytes @ 0x5
	global	eepromReadBlock@len
eepromReadBlock@len:	; 1 bytes @ 0x5
	global	eepromWriteByte@EEAddr
eepromWriteByte@EEAddr:	; 1 bytes @ 0x5
	global	beep2@rep
beep2@rep:	; 1 bytes @ 0x5
	global	___lbdiv@quotient
___lbdiv@quotient:	; 1 bytes @ 0x5
	global	timerOut@CurTimer
timerOut@CurTimer:	; 2 bytes @ 0x5
	ds	1
	global	??_eepromReadBlock
??_eepromReadBlock:	; 0 bytes @ 0x6
	global	?_eepromWriteBlock
?_eepromWriteBlock:	; 0 bytes @ 0x6
	global	??_beep2
??_beep2:	; 0 bytes @ 0x6
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x6
	global	eepromWriteBlock@buff
eepromWriteBlock@buff:	; 1 bytes @ 0x6
	global	beep2@sel
beep2@sel:	; 1 bytes @ 0x6
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x6
	ds	1
	global	??_get_RFID
??_get_RFID:	; 0 bytes @ 0x7
	global	eepromReadBlock@addStart
eepromReadBlock@addStart:	; 1 bytes @ 0x7
	global	eepromWriteBlock@len
eepromWriteBlock@len:	; 1 bytes @ 0x7
	ds	1
	global	??_eepromWriteBlock
??_eepromWriteBlock:	; 0 bytes @ 0x8
	global	eepromReadBlock@i
eepromReadBlock@i:	; 1 bytes @ 0x8
	global	comArr@arr1
comArr@arr1:	; 1 bytes @ 0x8
	ds	1
	global	eepromWriteBlock@addStart
eepromWriteBlock@addStart:	; 1 bytes @ 0x9
	global	comArr@i
comArr@i:	; 1 bytes @ 0x9
	ds	1
	global	?_id_search
?_id_search:	; 1 bytes @ 0xA
	global	eepromWriteBlock@i
eepromWriteBlock@i:	; 1 bytes @ 0xA
	global	id_search@buff
id_search@buff:	; 1 bytes @ 0xA
	ds	1
	global	??_id_search
??_id_search:	; 0 bytes @ 0xB
	global	id_replate@id
id_replate@id:	; 1 bytes @ 0xB
	ds	1
	global	??_id_clear
??_id_clear:	; 0 bytes @ 0xC
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_id_replate
?_id_replate:	; 0 bytes @ 0x0
	global	id_search@id_input
id_search@id_input:	; 1 bytes @ 0x0
	global	id_replate@Cont
id_replate@Cont:	; 1 bytes @ 0x0
	global	get_RFID@RF_serial_55bits
get_RFID@RF_serial_55bits:	; 11 bytes @ 0x0
	ds	1
	global	id_search@i
id_search@i:	; 1 bytes @ 0x1
	global	id_replate@buff
id_replate@buff:	; 1 bytes @ 0x1
	ds	1
	global	??_id_replate
??_id_replate:	; 0 bytes @ 0x2
	ds	2
	global	?_id_clear
?_id_clear:	; 0 bytes @ 0x4
	global	id_clear@idMax
id_clear@idMax:	; 1 bytes @ 0x4
	ds	1
	global	id_clear@tmp
id_clear@tmp:	; 5 bytes @ 0x5
	ds	5
	global	id_clear@idMin
id_clear@idMin:	; 1 bytes @ 0xA
	ds	1
	global	get_RFID@flag_RFID_syn
get_RFID@flag_RFID_syn:	; 1 bytes @ 0xB
	ds	1
	global	get_RFID@even_col
get_RFID@even_col:	; 1 bytes @ 0xC
	ds	1
	global	get_RFID@even_row
get_RFID@even_row:	; 1 bytes @ 0xD
	ds	1
	global	get_RFID@j
get_RFID@j:	; 1 bytes @ 0xE
	ds	1
	global	get_RFID@i
get_RFID@i:	; 1 bytes @ 0xF
	ds	1
	global	get_RFID@flag_RFID_last
get_RFID@flag_RFID_last:	; 1 bytes @ 0x10
	ds	1
	global	get_RFID@timeOutVal
get_RFID@timeOutVal:	; 2 bytes @ 0x11
	ds	2
	global	get_RFID@ii
get_RFID@ii:	; 1 bytes @ 0x13
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x14
	ds	3
	global	main@idState
main@idState:	; 1 bytes @ 0x17
	ds	1
	global	main@tmp
main@tmp:	; 1 bytes @ 0x18
	ds	1
	global	main@idop
main@idop:	; 1 bytes @ 0x19
	ds	1
;;Data sizes: Strings 0, constant 0, data 30, bss 11, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      12
;; BANK0           80     26      67
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?_timerOut	unsigned int  size(1) Largest target is 1
;;		 -> TMR0(BITSFR0[1]), 
;;
;; id_replate@Cont	PTR unsigned char  size(1) Largest target is 5
;;		 -> id_clear@tmp(BANK0[5]), keyID(BANK0[5]), 
;;
;; id_replate@buff	PTR unsigned char  size(1) Largest target is 25
;;		 -> buffTag(BANK0[25]), 
;;
;; id_search@buff	PTR unsigned char  size(1) Largest target is 25
;;		 -> buffTag(BANK0[25]), 
;;
;; id_search@id_input	PTR unsigned char  size(1) Largest target is 5
;;		 -> keyID(BANK0[5]), 
;;
;; comArr@arr2	PTR unsigned char  size(1) Largest target is 25
;;		 -> buffTag(BANK0[25]), 
;;
;; comArr@arr1	PTR unsigned char  size(1) Largest target is 5
;;		 -> keyID(BANK0[5]), 
;;
;; eepromWriteBlock@buff	PTR unsigned char  size(1) Largest target is 25
;;		 -> buffTag(BANK0[25]), 
;;
;; eepromReadBlock@buff	PTR unsigned char  size(1) Largest target is 25
;;		 -> buffTag(BANK0[25]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_id_search
;;   _main->_id_replate
;;   _id_clear->_id_replate
;;   _id_replate->_eepromWriteBlock
;;   _beep2->_delay_x10ms
;;   _eepromWriteBlock->_eepromWriteByte
;;   _id_search->_comArr
;;   _get_RFID->_timerOut
;;   _eepromReadBlock->_eepromReadByte
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_get_RFID
;;   _id_clear->_id_replate
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                10    10      0    4698
;;                                             20 BANK0      6     6      0
;;                           _sys_init
;;                          _gpio_init
;;                         _timer_init
;;                           _int_init
;;                    _eepromWriteByte
;;                        _SET_EPWM_ON
;;                     _eepromReadByte
;;                    _eepromReadBlock
;;                           _setState
;;                           _get_RFID
;;                          _id_search
;;                           _id_clear
;;                              _beep2
;;                         _id_replate
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (1) _id_clear                                             7     6      1     718
;;                                              4 BANK0      7     6      1
;;                         _id_replate
;; ---------------------------------------------------------------------------------
;; (1) _id_replate                                           5     3      2     623
;;                                             11 COMMON     1     1      0
;;                                              0 BANK0      4     2      2
;;                             ___bmul
;;                   _eepromWriteBlock
;; ---------------------------------------------------------------------------------
;; (1) _beep2                                                2     1      1      88
;;                                              5 COMMON     2     1      1
;;                        _delay_x10ms
;; ---------------------------------------------------------------------------------
;; (2) _eepromWriteBlock                                     5     3      2     178
;;                                              6 COMMON     5     3      2
;;                    _eepromWriteByte
;; ---------------------------------------------------------------------------------
;; (1) _id_search                                            4     3      1     518
;;                                             10 COMMON     2     1      1
;;                                              0 BANK0      2     2      0
;;                             _comArr
;;                            ___lbdiv
;; ---------------------------------------------------------------------------------
;; (2) _delay_x10ms                                          3     3      0      22
;;                                              2 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _get_RFID                                            21    21      0    1917
;;                                              7 COMMON     1     1      0
;;                                              0 BANK0     20    20      0
;;                           _timerOut
;;                            ___lbdiv
;; ---------------------------------------------------------------------------------
;; (3) _eepromWriteByte                                      4     3      1      44
;;                                              2 COMMON     4     3      1
;; ---------------------------------------------------------------------------------
;; (1) _eepromReadBlock                                      5     3      2     179
;;                                              4 COMMON     5     3      2
;;                     _eepromReadByte
;; ---------------------------------------------------------------------------------
;; (1) _sys_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) ___lbdiv                                              4     3      1     162
;;                                              2 COMMON     4     3      1
;; ---------------------------------------------------------------------------------
;; (1) ___lwmod                                              5     1      4     159
;;                                              2 COMMON     5     1      4
;; ---------------------------------------------------------------------------------
;; (2) ___bmul                                               3     2      1      92
;;                                              2 COMMON     3     2      1
;; ---------------------------------------------------------------------------------
;; (1) _setState                                             3     1      2      44
;;                                              2 COMMON     3     1      2
;; ---------------------------------------------------------------------------------
;; (1) _SET_EPWM_ON                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _timerOut                                             5     3      2      90
;;                                              2 COMMON     5     3      2
;; ---------------------------------------------------------------------------------
;; (2) _comArr                                               8     5      3     222
;;                                              2 COMMON     8     5      3
;; ---------------------------------------------------------------------------------
;; (2) _eepromReadByte                                       2     2      0      45
;;                                              2 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _int_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _timer_init                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _gpio_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _ISR                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _sys_init
;;   _gpio_init
;;   _timer_init
;;   _int_init
;;   _eepromWriteByte
;;   _SET_EPWM_ON
;;   _eepromReadByte
;;   _eepromReadBlock
;;     _eepromReadByte
;;   _setState
;;   _get_RFID
;;     _timerOut
;;     ___lbdiv
;;   _id_search
;;     _comArr
;;     ___lbdiv
;;   _id_clear
;;     _id_replate
;;       ___bmul
;;       _eepromWriteBlock
;;         _eepromWriteByte
;;   _beep2
;;     _delay_x10ms
;;   _id_replate
;;     ___bmul
;;     _eepromWriteBlock
;;       _eepromWriteByte
;;   ___lwmod
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               20      0       0       5        0.0%
;;BITBANK1            20      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      53       8        0.0%
;;ABS                  0      0      4F       6        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       4       2        0.0%
;;BANK0               50     1A      43       4       83.8%
;;BITBANK0            50      0       0       3        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      C       C       1       85.7%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 193 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  t               2    0        unsigned int 
;;  idop            1   25[BANK0 ] unsigned char 
;;  tmp             1   24[BANK0 ] unsigned char 
;;  idState         1   23[BANK0 ] unsigned char 
;;  t1              1    0        unsigned char 
;;  buzFre          1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 20/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       3       0
;;      Temps:          0       3       0
;;      Totals:         0       6       0
;;Total ram usage:        6 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_sys_init
;;		_gpio_init
;;		_timer_init
;;		_int_init
;;		_eepromWriteByte
;;		_SET_EPWM_ON
;;		_eepromReadByte
;;		_eepromReadBlock
;;		_setState
;;		_get_RFID
;;		_id_search
;;		_id_clear
;;		_beep2
;;		_id_replate
;;		___lwmod
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"MAIN.C"
	line	193
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	194
	
l6502:	
;MAIN.C: 195: unsigned int t;
;MAIN.C: 196: unsigned char buzFre = 0;
	clrf	(main@idState)
	line	198
	
l6504:	
# 198 "MAIN.C"
clrwdt ;#
psect	maintext
	line	200
	
l6506:	
;MAIN.C: 200: sys_init();
	fcall	_sys_init
	line	201
	
l6508:	
;MAIN.C: 201: gpio_init();
	fcall	_gpio_init
	line	203
	
l6510:	
;MAIN.C: 203: timer_init();
	fcall	_timer_init
	line	204
	
l6512:	
;MAIN.C: 204: int_init();
	fcall	_int_init
	line	210
	
l6514:	
;MAIN.C: 210: eepromWriteByte(0xFF, 0xAA);
	movlw	(0AAh)
	movwf	(?_eepromWriteByte)
	movlw	(0FFh)
	fcall	_eepromWriteByte
	line	211
	
l6516:	
;MAIN.C: 211: eepromWriteByte(0xFF, 0xAA);
	movlw	(0AAh)
	movwf	(?_eepromWriteByte)
	movlw	(0FFh)
	fcall	_eepromWriteByte
	line	214
	
l6518:	
;MAIN.C: 214: TRISC &= 0xfe;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(135)^080h+(0/8),(0)&7	;volatile
	line	216
	
l6520:	
;MAIN.C: 216: SET_EPWM_ON();
	fcall	_SET_EPWM_ON
	line	220
	
l6522:	
;MAIN.C: 220: _delay((unsigned long)((20)*(8000000/4000.0)));
	opt asmopt_off
movlw	52
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	241
movwf	((??_main+0)+0),f
u1897:
	decfsz	((??_main+0)+0),f
	goto	u1897
	decfsz	((??_main+0)+0+1),f
	goto	u1897
	nop2
opt asmopt_on

	line	225
	
l6524:	
;MAIN.C: 225: if (eepromReadByte(0x06) != 0) {
	movlw	(06h)
	fcall	_eepromReadByte
	xorlw	0
	skipnz
	goto	u1671
	goto	u1670
u1671:
	goto	l6528
u1670:
	line	229
	
l6526:	
;MAIN.C: 229: eepromWriteByte(0x06, 0);
	clrf	(?_eepromWriteByte)
	movlw	(06h)
	fcall	_eepromWriteByte
	line	230
;MAIN.C: 230: eepromWriteByte(0x06 + 1, 0);
	clrf	(?_eepromWriteByte)
	movlw	(07h)
	fcall	_eepromWriteByte
	line	231
;MAIN.C: 231: eepromWriteByte(0x06 + 2, 0x87);
	movlw	(087h)
	movwf	(?_eepromWriteByte)
	movlw	(08h)
	fcall	_eepromWriteByte
	line	232
;MAIN.C: 232: eepromWriteByte(0x06 + 3, 0x3a);
	movlw	(03Ah)
	movwf	(?_eepromWriteByte)
	movlw	(09h)
	fcall	_eepromWriteByte
	line	233
;MAIN.C: 233: eepromWriteByte(0x06 + 4, 0xf8);
	movlw	(0F8h)
	movwf	(?_eepromWriteByte)
	movlw	(0Ah)
	fcall	_eepromWriteByte
	line	236
	
l6528:	
;MAIN.C: 235: }
;MAIN.C: 236: eepromReadBlock(0x06, buffTag, 5 * 5);
	movlw	(_buffTag)&0ffh
	movwf	(?_eepromReadBlock)
	movlw	(019h)
	movwf	0+(?_eepromReadBlock)+01h
	movlw	(06h)
	fcall	_eepromReadBlock
	line	238
	
l6530:	
;MAIN.C: 238: setState(1, 12);
	movlw	0Ch
	movwf	(?_setState)
	clrf	(?_setState+1)
	movlw	(01h)
	fcall	_setState
	line	242
	
l6532:	
;MAIN.C: 242: tmp = 0;
	clrf	(main@tmp)
	line	246
	
l6534:	
;MAIN.C: 246: if (kepTag == 0)
	movf	(_kepTag),f
	skipz
	goto	u1681
	goto	u1680
u1681:
	goto	l6538
u1680:
	line	247
	
l6536:	
;MAIN.C: 247: idop = get_RFID();
	fcall	_get_RFID
	movwf	(main@idop)
	line	249
	
l6538:	
;MAIN.C: 249: if (idop && (kepTag == 0)) {
	movf	(main@idop),w
	skipz
	goto	u1690
	goto	l6622
u1690:
	
l6540:	
	movf	(_kepTag),f
	skipz
	goto	u1701
	goto	u1700
u1701:
	goto	l6622
u1700:
	line	250
	
l6542:	
;MAIN.C: 250: idop = id_search(keyID, buffTag);
	movlw	(_buffTag)&0ffh
	movwf	(?_id_search)
	movlw	(_keyID)&0ffh
	fcall	_id_search
	movwf	(main@idop)
	line	251
;MAIN.C: 251: switch (mtState) {
	goto	l6618
	line	254
	
l6544:	
;MAIN.C: 253: case 2:
;MAIN.C: 254: if ((idop > 1) && (idop < 6))
	movlw	(02h)
	subwf	(main@idop),w
	skipc
	goto	u1711
	goto	u1710
u1711:
	goto	l6550
u1710:
	
l6546:	
	movlw	(06h)
	subwf	(main@idop),w
	skipnc
	goto	u1721
	goto	u1720
u1721:
	goto	l6550
u1720:
	line	256
	
l6548:	
;MAIN.C: 255: {
;MAIN.C: 256: setState(0, 0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	258
;MAIN.C: 258: }
	goto	l4171
	line	259
	
l6550:	
;MAIN.C: 259: else if (idop == 1)
	decf	(main@idop),w
	skipz
	goto	u1731
	goto	u1730
u1731:
	goto	l4171
u1730:
	line	262
	
l6552:	
;MAIN.C: 260: {
;MAIN.C: 262: id_clear(2, 5);
	movlw	(05h)
	movwf	(?_id_clear)
	movlw	(02h)
	fcall	_id_clear
	line	263
	
l6554:	
;MAIN.C: 263: setState(3, 0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(03h)
	fcall	_setState
	line	264
	
l6556:	
;MAIN.C: 264: tmp = 1;
	clrf	(main@tmp)
	incf	(main@tmp),f
	line	266
	
l6558:	
;MAIN.C: 266: beep2(0, 3);
	movlw	(03h)
	movwf	(?_beep2)
	movlw	(0)
	fcall	_beep2
	goto	l4171
	line	277
	
l6560:	
;MAIN.C: 277: if (idop == 1 && idState == 0) {
	decf	(main@idop),w
	skipz
	goto	u1741
	goto	u1740
u1741:
	goto	l6572
u1740:
	
l6562:	
	movf	(main@idState),f
	skipz
	goto	u1751
	goto	u1750
u1751:
	goto	l6572
u1750:
	line	279
	
l6564:	
;MAIN.C: 279: id_clear(2, 5);
	movlw	(05h)
	movwf	(?_id_clear)
	movlw	(02h)
	fcall	_id_clear
	line	280
	
l6566:	
;MAIN.C: 280: setState(3, 0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(03h)
	fcall	_setState
	line	281
	
l6568:	
;MAIN.C: 281: tmp = 1;
	clrf	(main@tmp)
	incf	(main@tmp),f
	line	283
	
l6570:	
;MAIN.C: 283: beep2(0, 3);
	movlw	(03h)
	movwf	(?_beep2)
	movlw	(0)
	fcall	_beep2
	line	284
;MAIN.C: 284: }
	goto	l4171
	line	285
	
l6572:	
;MAIN.C: 285: else if (idop == 2 && idState == 0) {
	movf	(main@idop),w
	xorlw	02h
	skipz
	goto	u1761
	goto	u1760
u1761:
	goto	l4171
u1760:
	
l6574:	
	movf	(main@idState),f
	skipz
	goto	u1771
	goto	u1770
u1771:
	goto	l4171
u1770:
	line	287
	
l6576:	
;MAIN.C: 287: id_clear(3, 5);
	movlw	(05h)
	movwf	(?_id_clear)
	movlw	(03h)
	fcall	_id_clear
	line	288
	
l6578:	
;MAIN.C: 288: setState(5, 0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(05h)
	fcall	_setState
	line	289
	
l6580:	
;MAIN.C: 289: tmp = 2;
	movlw	(02h)
	movwf	(main@tmp)
	line	291
	
l6582:	
;MAIN.C: 291: beep2(1, 2);
	movlw	(02h)
	movwf	(?_beep2)
	movlw	(01h)
	fcall	_beep2
	goto	l4171
	line	296
	
l6584:	
;MAIN.C: 296: if (idState == 0) {
	movf	(main@idState),f
	skipz
	goto	u1781
	goto	u1780
u1781:
	goto	l6598
u1780:
	line	303
	
l6586:	
;MAIN.C: 303: if ( idop != 1) {
	decf	(main@idop),w
	skipnz
	goto	u1791
	goto	u1790
u1791:
	goto	l4171
u1790:
	line	304
	
l6588:	
;MAIN.C: 304: tmp++;
	incf	(main@tmp),f
	line	306
	
l6590:	
;MAIN.C: 306: if (tmp <= 5) {
	movlw	(06h)
	subwf	(main@tmp),w
	skipnc
	goto	u1801
	goto	u1800
u1801:
	goto	l4171
u1800:
	line	307
	
l6592:	
;MAIN.C: 307: id_replate(tmp, keyID, buffTag);
	movlw	(_keyID)&0ffh
	movwf	(?_id_replate)
	movlw	(_buffTag)&0ffh
	movwf	(0+?_id_replate+01h)
	movf	(main@tmp),w
	fcall	_id_replate
	line	308
	
l6594:	
;MAIN.C: 308: timeTick = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	310
	
l6596:	
;MAIN.C: 310: beep2(1, 2);
	movlw	(02h)
	movwf	(?_beep2)
	movlw	(01h)
	fcall	_beep2
	goto	l4171
	line	317
	
l6598:	
;MAIN.C: 317: beep2(0, 1);
	clrf	(?_beep2)
	incf	(?_beep2),f
	movlw	(0)
	fcall	_beep2
	goto	l4171
	line	322
	
l6600:	
;MAIN.C: 322: if (idState == 0) {
	movf	(main@idState),f
	skipz
	goto	u1811
	goto	u1810
u1811:
	goto	l6614
u1810:
	line	323
	
l6602:	
;MAIN.C: 323: if ( idop > 2) {
	movlw	(03h)
	subwf	(main@idop),w
	skipc
	goto	u1821
	goto	u1820
u1821:
	goto	l4171
u1820:
	line	324
	
l6604:	
;MAIN.C: 324: tmp++;
	incf	(main@tmp),f
	line	326
	
l6606:	
;MAIN.C: 326: if (tmp <= 5) {
	movlw	(06h)
	subwf	(main@tmp),w
	skipnc
	goto	u1831
	goto	u1830
u1831:
	goto	l4171
u1830:
	line	327
	
l6608:	
;MAIN.C: 327: id_replate(tmp, keyID, buffTag);
	movlw	(_keyID)&0ffh
	movwf	(?_id_replate)
	movlw	(_buffTag)&0ffh
	movwf	(0+?_id_replate+01h)
	movf	(main@tmp),w
	fcall	_id_replate
	line	328
	
l6610:	
;MAIN.C: 328: timeTick = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	330
	
l6612:	
;MAIN.C: 330: beep2(1, 2);
	movlw	(02h)
	movwf	(?_beep2)
	movlw	(01h)
	fcall	_beep2
	goto	l4171
	line	337
	
l6614:	
;MAIN.C: 337: beep2(0, 1);
	clrf	(?_beep2)
	incf	(?_beep2),f
	movlw	(0)
	fcall	_beep2
	goto	l4171
	line	251
	
l6618:	
	movf	(_mtState),w
	; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 0 to 6
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           13     6 (fixed)
; simple_byte           19    10 (average)
; jumptable            260     6 (fixed)
; rangetable            11     6 (fixed)
; spacedrange           20     9 (fixed)
; locatedrange           7     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	7
	subwf	fsr,w
skipnc
goto l4171
movlw high(S6688)
movwf pclath
	movlw low(S6688)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S6688:
	ljmp	l4171
	ljmp	l6544
	ljmp	l6544
	ljmp	l6584
	ljmp	l4171
	ljmp	l6600
	ljmp	l6560
psect	maintext

	line	341
	
l4171:	
	line	343
;MAIN.C: 343: idState = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@idState)
	incf	(main@idState),f
	line	344
	
l6620:	
;MAIN.C: 344: _delay((unsigned long)((61)*(8000000/4000.0)));
	opt asmopt_off
movlw	159
movwf	((??_main+0)+0+1),f
	movlw	111
movwf	((??_main+0)+0),f
u1907:
	decfsz	((??_main+0)+0),f
	goto	u1907
	decfsz	((??_main+0)+0+1),f
	goto	u1907
	nop2
opt asmopt_on

	line	345
;MAIN.C: 345: }
	goto	l6626
	line	347
	
l6622:	
;MAIN.C: 346: else {
;MAIN.C: 347: idState = 0;
	clrf	(main@idState)
	line	348
	
l6624:	
;MAIN.C: 348: _delay((unsigned long)((150)*(8000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	134
movwf	((??_main+0)+0+1),f
	movlw	153
movwf	((??_main+0)+0),f
u1917:
	decfsz	((??_main+0)+0),f
	goto	u1917
	decfsz	((??_main+0)+0+1),f
	goto	u1917
	decfsz	((??_main+0)+0+2),f
	goto	u1917
opt asmopt_on

	line	353
	
l6626:	
;MAIN.C: 349: }
;MAIN.C: 353: if ((timeOut != 0) && ( timeTick > timeOut)) {
	bcf	status, 5	;RP0=0, select bank0
	movf	(_timeOut+1),w
	iorwf	(_timeOut),w
	skipnz
	goto	u1841
	goto	u1840
u1841:
	goto	l6640
u1840:
	
l6628:	
	movf	(_timeTick+1),w
	subwf	(_timeOut+1),w
	skipz
	goto	u1855
	movf	(_timeTick),w
	subwf	(_timeOut),w
u1855:
	skipnc
	goto	u1851
	goto	u1850
u1851:
	goto	l6640
u1850:
	goto	l6638
	line	358
	
l6632:	
;MAIN.C: 358: setState(2, 255);
	movlw	0FFh
	movwf	(?_setState)
	clrf	(?_setState+1)
	movlw	(02h)
	fcall	_setState
	line	360
;MAIN.C: 360: break;
	goto	l6640
	line	361
;MAIN.C: 361: case 2:
	
l4194:	
	line	362
;MAIN.C: 362: kepTag = 1;
	clrf	(_kepTag)
	incf	(_kepTag),f
	line	364
;MAIN.C: 364: break;
	goto	l6640
	line	366
	
l6634:	
;MAIN.C: 366: setState(2, 0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(02h)
	fcall	_setState
	line	369
;MAIN.C: 369: break;
	goto	l6640
	line	355
	
l6638:	
	movf	(_mtState),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 1 to 6
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           15     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l6632
	xorlw	2^1	; case 2
	skipnz
	goto	l4194
	xorlw	6^2	; case 6
	skipnz
	goto	l6634
	goto	l6640
	opt asmopt_on

	line	375
	
l6640:	
;MAIN.C: 372: }
;MAIN.C: 375: if (mtState == 0) RA3 = 1;
	movf	(_mtState),f
	skipz
	goto	u1861
	goto	u1860
u1861:
	goto	l4196
u1860:
	
l6642:	
	bsf	(43/8),(43)&7
	goto	l6644
	line	376
	
l4196:	
;MAIN.C: 376: else RA3 = 0;
	bcf	(43/8),(43)&7
	line	392
	
l6644:	
;MAIN.C: 392: if (mtState == 2) {
	movf	(_mtState),w
	xorlw	02h
	skipz
	goto	u1871
	goto	u1870
u1871:
	goto	l4198
u1870:
	line	395
	
l6646:	
;MAIN.C: 395: if (timeTick % 3 == 0) {
	movlw	03h
	movwf	(?___lwmod)
	clrf	(?___lwmod+1)
	movf	(_timeTick+1),w
	movwf	1+(?___lwmod)+02h
	movf	(_timeTick),w
	movwf	0+(?___lwmod)+02h
	fcall	___lwmod
	movf	((1+(?___lwmod))),w
	iorwf	((0+(?___lwmod))),w
	skipz
	goto	u1881
	goto	u1880
u1881:
	goto	l6650
u1880:
	line	397
	
l6648:	
;MAIN.C: 397: RC0 = ~RC0;
	movlw	1<<((56)&7)
	xorwf	((56)/8),f
	goto	l6650
	line	400
	
l4198:	
	bcf	(56/8),(56)&7
	line	426
	
l6650:	
;MAIN.C: 426: timeTick++;
	incf	(_timeTick),f
	skipnz
	incf	(_timeTick+1),f
	goto	l6534
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	430
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_id_clear
psect	text502,local,class=CODE,delta=2
global __ptext502
__ptext502:

;; *************** function _id_clear *****************
;; Defined at:
;;		line 177 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;  idMin           1    wreg     unsigned char 
;;  idMax           1    4[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  idMin           1   10[BANK0 ] unsigned char 
;;  tmp             5    5[BANK0 ] unsigned char [5]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       1       0
;;      Locals:         0       6       0
;;      Temps:          0       0       0
;;      Totals:         0       7       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_id_replate
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text502
	file	"MAIN.C"
	line	177
	global	__size_of_id_clear
	__size_of_id_clear	equ	__end_of_id_clear-_id_clear
	
_id_clear:	
	opt	stack 3
; Regs used in _id_clear: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;id_clear@idMin stored from wreg
	line	178
	movwf	(id_clear@idMin)
	
l6494:	
;MAIN.C: 178: unsigned char tmp[5] = {0xff, 0xff, 0xff, 0xff, 0xff};
	movlw	(id_clear@tmp)&0ffh
	movwf	fsr0
	movf	(id_clear@F1098),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(id_clear@F1098)+1,w
	movwf	indf
	incf	fsr0,f
	movf	(id_clear@F1098)+2,w
	movwf	indf
	incf	fsr0,f
	movf	(id_clear@F1098)+3,w
	movwf	indf
	incf	fsr0,f
	movf	(id_clear@F1098)+4,w
	movwf	indf
	line	179
	goto	l6500
	line	180
	
l6496:	
;MAIN.C: 180: id_replate(idMin, tmp, buffTag);
	movlw	(id_clear@tmp)&0ffh
	movwf	(?_id_replate)
	movlw	(_buffTag)&0ffh
	movwf	(0+?_id_replate+01h)
	movf	(id_clear@idMin),w
	fcall	_id_replate
	line	179
	
l6498:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(id_clear@idMin),f
	
l6500:	
	movf	(id_clear@idMin),w
	subwf	(id_clear@idMax),w
	skipnc
	goto	u1661
	goto	u1660
u1661:
	goto	l6496
u1660:
	line	181
	
l4150:	
	return
	opt stack 0
GLOBAL	__end_of_id_clear
	__end_of_id_clear:
;; =============== function _id_clear ends ============

	signat	_id_clear,8312
	global	_id_replate
psect	text503,local,class=CODE,delta=2
global __ptext503
__ptext503:

;; *************** function _id_replate *****************
;; Defined at:
;;		line 163 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;  id              1    wreg     unsigned char 
;;  Cont            1    0[BANK0 ] PTR unsigned char 
;;		 -> id_clear@tmp(5), keyID(5), 
;;  buff            1    1[BANK0 ] PTR unsigned char 
;;		 -> buffTag(25), 
;; Auto vars:     Size  Location     Type
;;  id              1   11[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         1       0       0
;;      Temps:          0       2       0
;;      Totals:         1       4       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___bmul
;;		_eepromWriteBlock
;; This function is called by:
;;		_id_clear
;;		_main
;; This function uses a non-reentrant model
;;
psect	text503
	file	"MAIN.C"
	line	163
	global	__size_of_id_replate
	__size_of_id_replate	equ	__end_of_id_replate-_id_replate
	
_id_replate:	
	opt	stack 4
; Regs used in _id_replate: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;id_replate@id stored from wreg
	movwf	(id_replate@id)
	line	164
	
l6480:	
;MAIN.C: 164: id = (id - 1) * 5;
	movlw	(05h)
	movwf	(?___bmul)
	movf	(id_replate@id),w
	addlw	0FFh
	fcall	___bmul
	movwf	(id_replate@id)
	line	167
	
l6482:	
;MAIN.C: 165: {
;MAIN.C: 166: {
;MAIN.C: 167: *(buff + id) = *Cont;
	movf	(id_replate@Cont),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_id_replate+0)+0
	movf	(id_replate@id),w
	addwf	(id_replate@buff),w
	movwf	(??_id_replate+1)+0
	movf	0+(??_id_replate+1)+0,w
	movwf	fsr0
	movf	(??_id_replate+0)+0,w
	movwf	indf
	line	168
	
l6484:	
;MAIN.C: 168: *(buff + 1 + id) = *(Cont + 1);
	movf	(id_replate@Cont),w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	movwf	(??_id_replate+0)+0
	movf	(id_replate@id),w
	addwf	(id_replate@buff),w
	movwf	(??_id_replate+1)+0
	movf	0+(??_id_replate+1)+0,w
	addlw	01h
	movwf	fsr0
	movf	(??_id_replate+0)+0,w
	movwf	indf
	line	169
	
l6486:	
;MAIN.C: 169: *(buff + 2 + id) = *(Cont + 2);
	movf	(id_replate@Cont),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_id_replate+0)+0
	movf	(id_replate@id),w
	addwf	(id_replate@buff),w
	movwf	(??_id_replate+1)+0
	movf	0+(??_id_replate+1)+0,w
	addlw	02h
	movwf	fsr0
	movf	(??_id_replate+0)+0,w
	movwf	indf
	line	170
	
l6488:	
;MAIN.C: 170: *(buff + 3 + id) = *(Cont + 3);
	movf	(id_replate@Cont),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	movwf	(??_id_replate+0)+0
	movf	(id_replate@id),w
	addwf	(id_replate@buff),w
	movwf	(??_id_replate+1)+0
	movf	0+(??_id_replate+1)+0,w
	addlw	03h
	movwf	fsr0
	movf	(??_id_replate+0)+0,w
	movwf	indf
	line	171
	
l6490:	
;MAIN.C: 171: *(buff + 4 + id) = *(Cont + 4);
	movf	(id_replate@Cont),w
	addlw	04h
	movwf	fsr0
	movf	indf,w
	movwf	(??_id_replate+0)+0
	movf	(id_replate@id),w
	addwf	(id_replate@buff),w
	movwf	(??_id_replate+1)+0
	movf	0+(??_id_replate+1)+0,w
	addlw	04h
	movwf	fsr0
	movf	(??_id_replate+0)+0,w
	movwf	indf
	line	175
	
l6492:	
;MAIN.C: 172: }
;MAIN.C: 173: }
;MAIN.C: 175: eepromWriteBlock(0x06, buffTag, 25);
	movlw	(_buffTag)&0ffh
	movwf	(?_eepromWriteBlock)
	movlw	(019h)
	movwf	0+(?_eepromWriteBlock)+01h
	movlw	(06h)
	fcall	_eepromWriteBlock
	line	176
	
l4142:	
	return
	opt stack 0
GLOBAL	__end_of_id_replate
	__end_of_id_replate:
;; =============== function _id_replate ends ============

	signat	_id_replate,12408
	global	_beep2
psect	text504,local,class=CODE,delta=2
global __ptext504
__ptext504:

;; *************** function _beep2 *****************
;; Defined at:
;;		line 183 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;  sel             1    wreg     unsigned char 
;;  rep             1    5[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  sel             1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay_x10ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text504
	file	"MAIN.C"
	line	183
	global	__size_of_beep2
	__size_of_beep2	equ	__end_of_beep2-_beep2
	
_beep2:	
	opt	stack 5
; Regs used in _beep2: [wreg+status,2+status,0+pclath+cstack]
;beep2@sel stored from wreg
	movwf	(beep2@sel)
	line	184
	
l6462:	
;MAIN.C: 184: while (rep--) {
	goto	l6478
	
l4154:	
	line	185
;MAIN.C: 185: RC0 = 1; if (sel)RA3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	
l6464:	
	movf	(beep2@sel),w
	skipz
	goto	u1630
	goto	l6468
u1630:
	
l6466:	
	bsf	(43/8),(43)&7
	line	186
	
l6468:	
;MAIN.C: 186: delay_x10ms(20);
	movlw	(014h)
	fcall	_delay_x10ms
	line	187
	
l6470:	
;MAIN.C: 187: RC0 = 0; if (sel)RA3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	
l6472:	
	movf	(beep2@sel),w
	skipz
	goto	u1640
	goto	l6476
u1640:
	
l6474:	
	bcf	(43/8),(43)&7
	line	188
	
l6476:	
;MAIN.C: 188: delay_x10ms(20);
	movlw	(014h)
	fcall	_delay_x10ms
	line	184
	
l6478:	
	decf	(beep2@rep),f
	movf	((beep2@rep)),w
	xorlw	0FFh
	skipz
	goto	u1651
	goto	u1650
u1651:
	goto	l4154
u1650:
	line	190
	
l4158:	
	return
	opt stack 0
GLOBAL	__end_of_beep2
	__end_of_beep2:
;; =============== function _beep2 ends ============

	signat	_beep2,8312
	global	_eepromWriteBlock
psect	text505,local,class=CODE,delta=2
global __ptext505
__ptext505:

;; *************** function _eepromWriteBlock *****************
;; Defined at:
;;		line 43 in file "ms82_eeprom.c"
;; Parameters:    Size  Location     Type
;;  addStart        1    wreg     unsigned char 
;;  buff            1    6[COMMON] PTR unsigned char 
;;		 -> buffTag(25), 
;;  len             1    7[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addStart        1    9[COMMON] unsigned char 
;;  i               1   10[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 120/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         2       0       0
;;      Temps:          1       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_eepromWriteByte
;; This function is called by:
;;		_id_replate
;; This function uses a non-reentrant model
;;
psect	text505
	file	"ms82_eeprom.c"
	line	43
	global	__size_of_eepromWriteBlock
	__size_of_eepromWriteBlock	equ	__end_of_eepromWriteBlock-_eepromWriteBlock
	
_eepromWriteBlock:	
	opt	stack 4
; Regs used in _eepromWriteBlock: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;eepromWriteBlock@addStart stored from wreg
	line	45
	movwf	(eepromWriteBlock@addStart)
	
l6454:	
;ms82_eeprom.c: 44: unsigned char i;
;ms82_eeprom.c: 45: for(i=0;i<len;i++){
	clrf	(eepromWriteBlock@i)
	goto	l6460
	line	46
	
l6456:	
;ms82_eeprom.c: 46: eepromWriteByte(addStart+i,buff[i]);
	movf	(eepromWriteBlock@i),w
	addwf	(eepromWriteBlock@buff),w
	movwf	(??_eepromWriteBlock+0)+0
	movf	0+(??_eepromWriteBlock+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(?_eepromWriteByte)
	movf	(eepromWriteBlock@i),w
	addwf	(eepromWriteBlock@addStart),w
	fcall	_eepromWriteByte
	line	45
	
l6458:	
	incf	(eepromWriteBlock@i),f
	
l6460:	
	movf	(eepromWriteBlock@len),w
	subwf	(eepromWriteBlock@i),w
	skipc
	goto	u1621
	goto	u1620
u1621:
	goto	l6456
u1620:
	line	49
	
l1609:	
	return
	opt stack 0
GLOBAL	__end_of_eepromWriteBlock
	__end_of_eepromWriteBlock:
;; =============== function _eepromWriteBlock ends ============

	signat	_eepromWriteBlock,12408
	global	_id_search
psect	text506,local,class=CODE,delta=2
global __ptext506
__ptext506:

;; *************** function _id_search *****************
;; Defined at:
;;		line 155 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;  id_input        1    wreg     PTR unsigned char 
;;		 -> keyID(5), 
;;  buff            1   10[COMMON] PTR unsigned char 
;;		 -> buffTag(25), 
;; Auto vars:     Size  Location     Type
;;  id_input        1    0[BANK0 ] PTR unsigned char 
;;		 -> keyID(5), 
;;  i               1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFEDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         0       2       0
;;      Temps:          1       0       0
;;      Totals:         2       2       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_comArr
;;		___lbdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text506
	file	"MAIN.C"
	line	155
	global	__size_of_id_search
	__size_of_id_search	equ	__end_of_id_search-_id_search
	
_id_search:	
	opt	stack 5
; Regs used in _id_search: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;id_search@id_input stored from wreg
	line	157
	movwf	(id_search@id_input)
	
l6434:	
;MAIN.C: 156: unsigned char i;
;MAIN.C: 157: for (i = 0; i < 21; i += 5) {
	clrf	(id_search@i)
	line	158
	
l6440:	
;MAIN.C: 158: if (comArr(id_input, buff + i, 5, 5))
	movf	(id_search@i),w
	addwf	(id_search@buff),w
	movwf	(?_comArr)
	movlw	(05h)
	movwf	0+(?_comArr)+01h
	movlw	(05h)
	movwf	0+(?_comArr)+02h
	movf	(id_search@id_input),w
	fcall	_comArr
	xorlw	0
	skipnz
	goto	u1601
	goto	u1600
u1601:
	goto	l6446
u1600:
	line	159
	
l6442:	
;MAIN.C: 159: return i / 5 + 1;
	movlw	(05h)
	movwf	(?___lbdiv)
	movf	(id_search@i),w
	fcall	___lbdiv
	movwf	(??_id_search+0)+0
	incf	0+(??_id_search+0)+0,w
	goto	l4139
	line	157
	
l6446:	
	movlw	(05h)
	addwf	(id_search@i),f
	
l6448:	
	movlw	(015h)
	subwf	(id_search@i),w
	skipc
	goto	u1611
	goto	u1610
u1611:
	goto	l6440
u1610:
	line	161
	
l6450:	
;MAIN.C: 160: }
;MAIN.C: 161: return 255;
	movlw	(0FFh)
	line	162
	
l4139:	
	return
	opt stack 0
GLOBAL	__end_of_id_search
	__end_of_id_search:
;; =============== function _id_search ends ============

	signat	_id_search,8313
	global	_delay_x10ms
psect	text507,local,class=CODE,delta=2
global __ptext507
__ptext507:

;; *************** function _delay_x10ms *****************
;; Defined at:
;;		line 55 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;  t               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  t               1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          2       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_beep2
;; This function uses a non-reentrant model
;;
psect	text507
	file	"MAIN.C"
	line	55
	global	__size_of_delay_x10ms
	__size_of_delay_x10ms	equ	__end_of_delay_x10ms-_delay_x10ms
	
_delay_x10ms:	
	opt	stack 5
; Regs used in _delay_x10ms: [wreg+status,2+status,0]
;delay_x10ms@t stored from wreg
	movwf	(delay_x10ms@t)
	line	56
	
l6428:	
;MAIN.C: 56: while (t--)
	goto	l6432
	line	57
	
l6430:	
;MAIN.C: 57: _delay((unsigned long)((10)*(8000000/4000.0)));
	opt asmopt_off
movlw	26
movwf	((??_delay_x10ms+0)+0+1),f
	movlw	248
movwf	((??_delay_x10ms+0)+0),f
u1927:
	decfsz	((??_delay_x10ms+0)+0),f
	goto	u1927
	decfsz	((??_delay_x10ms+0)+0+1),f
	goto	u1927
	clrwdt
opt asmopt_on

	line	56
	
l6432:	
	decf	(delay_x10ms@t),f
	movf	((delay_x10ms@t)),w
	xorlw	0FFh
	skipz
	goto	u1591
	goto	u1590
u1591:
	goto	l6430
u1590:
	line	58
	
l4121:	
	return
	opt stack 0
GLOBAL	__end_of_delay_x10ms
	__end_of_delay_x10ms:
;; =============== function _delay_x10ms ends ============

	signat	_delay_x10ms,4216
	global	_get_RFID
psect	text508,local,class=CODE,delta=2
global __ptext508
__ptext508:

;; *************** function _get_RFID *****************
;; Defined at:
;;		line 20 in file "rfid125.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  RF_serial_55   11    0[BANK0 ] unsigned char [11]
;;  timeOutVal      2   17[BANK0 ] unsigned int 
;;  ii              1   19[BANK0 ] unsigned char 
;;  flag_RFID_la    1   16[BANK0 ] unsigned char 
;;  i               1   15[BANK0 ] unsigned char 
;;  j               1   14[BANK0 ] unsigned char 
;;  even_row        1   13[BANK0 ] unsigned char 
;;  even_col        1   12[BANK0 ] unsigned char 
;;  flag_RFID_sy    1   11[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFEDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0      20       0
;;      Temps:          1       0       0
;;      Totals:         1      20       0
;;Total ram usage:       21 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_timerOut
;;		___lbdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text508
	file	"rfid125.c"
	line	20
	global	__size_of_get_RFID
	__size_of_get_RFID	equ	__end_of_get_RFID-_get_RFID
	
_get_RFID:	
	opt	stack 5
; Regs used in _get_RFID: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	29
	
l6206:	
;rfid125.c: 22: unsigned char RF_serial_55bits[11];
;rfid125.c: 23: unsigned int timeOutVal;
;rfid125.c: 24: unsigned char i,ii,j;
;rfid125.c: 25: unsigned char flag_RFID_syn, flag_RFID_last;
;rfid125.c: 26: unsigned char even_row, even_col;
;rfid125.c: 29: flag_RFID_syn = 0;
	clrf	(get_RFID@flag_RFID_syn)
	line	32
	
l6208:	
;rfid125.c: 32: i=16;
	movlw	(010h)
	movwf	(get_RFID@i)
	line	35
	
l6210:	
;rfid125.c: 34: {
;rfid125.c: 35: timeOutVal=timerOut(1,150);
	movlw	096h
	movwf	(?_timerOut)
	clrf	(?_timerOut+1)
	movlw	(01h)
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	36
	
l6212:	
;rfid125.c: 36: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1161
	goto	u1160
u1161:
	goto	l6218
u1160:
	
l6214:	
	movlw	(0)
	goto	l2455
	line	38
	
l6218:	
;rfid125.c: 38: timeOutVal=timerOut(0,150);
	movlw	096h
	movwf	(?_timerOut)
	clrf	(?_timerOut+1)
	movlw	(0)
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	39
	
l6220:	
;rfid125.c: 39: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1171
	goto	u1170
u1171:
	goto	l6226
u1170:
	goto	l6214
	line	41
	
l6226:	
;rfid125.c: 41: i--;
	decf	(get_RFID@i),f
	line	43
	
l6228:	
;rfid125.c: 42: }
;rfid125.c: 43: while(timeOutVal<72 && i>0);
	movlw	high(048h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(048h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipnc
	goto	u1181
	goto	u1180
u1181:
	goto	l2459
u1180:
	
l6230:	
	movf	(get_RFID@i),f
	skipz
	goto	u1191
	goto	u1190
u1191:
	goto	l6210
u1190:
	
l2459:	
	line	44
;rfid125.c: 44: flag_RFID_last = 1;
	clrf	(get_RFID@flag_RFID_last)
	incf	(get_RFID@flag_RFID_last),f
	line	45
	
l6232:	
;rfid125.c: 45: i = 0;
	clrf	(get_RFID@i)
	line	46
;rfid125.c: 46: while(i<64)
	goto	l6298
	line	48
	
l6234:	
;rfid125.c: 47: {
;rfid125.c: 48: for(ii=0;ii<9;ii++)
	clrf	(get_RFID@ii)
	line	50
	
l6240:	
;rfid125.c: 49: {
;rfid125.c: 50: timeOutVal=timerOut(flag_RFID_last,150);
	movlw	096h
	movwf	(?_timerOut)
	clrf	(?_timerOut+1)
	movf	(get_RFID@flag_RFID_last),w
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	51
	
l6242:	
;rfid125.c: 51: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1201
	goto	u1200
u1201:
	goto	l6248
u1200:
	goto	l6214
	line	54
	
l6248:	
;rfid125.c: 53: if(0==flag_RFID_last && timeOutVal<=72 ||
;rfid125.c: 54: 1==flag_RFID_last && timeOutVal>72)
	movf	(get_RFID@flag_RFID_last),f
	skipz
	goto	u1211
	goto	u1210
u1211:
	goto	l6252
u1210:
	
l6250:	
	movlw	high(049h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(049h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipc
	goto	u1221
	goto	u1220
u1221:
	goto	l6256
u1220:
	
l6252:	
	decf	(get_RFID@flag_RFID_last),w
	skipz
	goto	u1231
	goto	u1230
u1231:
	goto	l6270
u1230:
	
l6254:	
	movlw	high(049h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(049h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipc
	goto	u1241
	goto	u1240
u1241:
	goto	l6270
u1240:
	line	56
	
l6256:	
;rfid125.c: 55: {
;rfid125.c: 56: if(!flag_RFID_last)
	movf	(get_RFID@flag_RFID_last),f
	skipz
	goto	u1251
	goto	u1250
u1251:
	goto	l6266
u1250:
	line	58
	
l6258:	
;rfid125.c: 57: {
;rfid125.c: 58: timeOutVal=timerOut(1,72);
	movlw	048h
	movwf	(?_timerOut)
	clrf	(?_timerOut+1)
	movlw	(01h)
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	59
	
l6260:	
;rfid125.c: 59: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1261
	goto	u1260
u1261:
	goto	l6266
u1260:
	goto	l6214
	line	61
	
l6266:	
;rfid125.c: 60: }
;rfid125.c: 61: flag_RFID_last = 0;
	clrf	(get_RFID@flag_RFID_last)
	line	62
	
l6268:	
;rfid125.c: 62: i++;
	incf	(get_RFID@i),f
	line	63
;rfid125.c: 63: }
	goto	l6290
	line	66
	
l6270:	
;rfid125.c: 64: else
;rfid125.c: 65: if(0==flag_RFID_last && timeOutVal>72 ||
;rfid125.c: 66: 1==flag_RFID_last && timeOutVal<=72)
	movf	(get_RFID@flag_RFID_last),f
	skipz
	goto	u1271
	goto	u1270
u1271:
	goto	l6274
u1270:
	
l6272:	
	movlw	high(049h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(049h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipnc
	goto	u1281
	goto	u1280
u1281:
	goto	l6278
u1280:
	
l6274:	
	decf	(get_RFID@flag_RFID_last),w
	skipz
	goto	u1291
	goto	u1290
u1291:
	goto	l6290
u1290:
	
l6276:	
	movlw	high(049h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(049h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipnc
	goto	u1301
	goto	u1300
u1301:
	goto	l6290
u1300:
	line	68
	
l6278:	
;rfid125.c: 67: {
;rfid125.c: 68: if(flag_RFID_last)
	movf	(get_RFID@flag_RFID_last),w
	skipz
	goto	u1310
	goto	l2478
u1310:
	line	70
	
l6280:	
;rfid125.c: 69: {
;rfid125.c: 70: timeOutVal=timerOut(0,72);
	movlw	048h
	movwf	(?_timerOut)
	clrf	(?_timerOut+1)
	movlw	(0)
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	71
	
l6282:	
;rfid125.c: 71: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1321
	goto	u1320
u1321:
	goto	l2478
u1320:
	goto	l6214
	line	72
	
l2478:	
	line	73
;rfid125.c: 72: }
;rfid125.c: 73: flag_RFID_last = 1;
	clrf	(get_RFID@flag_RFID_last)
	incf	(get_RFID@flag_RFID_last),f
	line	74
	
l6288:	
;rfid125.c: 74: i++;
	incf	(get_RFID@i),f
	line	76
;rfid125.c: 76: break;
	goto	l6294
	line	48
	
l6290:	
	incf	(get_RFID@ii),f
	
l6292:	
	movlw	(09h)
	subwf	(get_RFID@ii),w
	skipc
	goto	u1331
	goto	u1330
u1331:
	goto	l6240
u1330:
	line	80
	
l6294:	
;rfid125.c: 77: }
;rfid125.c: 79: }
;rfid125.c: 80: if(9==ii)
	movf	(get_RFID@ii),w
	xorlw	09h
	skipz
	goto	u1341
	goto	u1340
u1341:
	goto	l6298
u1340:
	line	82
	
l6296:	
;rfid125.c: 81: {
;rfid125.c: 82: flag_RFID_syn = 1;
	clrf	(get_RFID@flag_RFID_syn)
	incf	(get_RFID@flag_RFID_syn),f
	line	83
;rfid125.c: 83: break;
	goto	l6300
	line	46
	
l6298:	
	movlw	(040h)
	subwf	(get_RFID@i),w
	skipc
	goto	u1351
	goto	u1350
u1351:
	goto	l6234
u1350:
	line	87
	
l6300:	
;rfid125.c: 84: }
;rfid125.c: 85: }
;rfid125.c: 87: if(!flag_RFID_syn)
	movf	(get_RFID@flag_RFID_syn),f
	skipz
	goto	u1361
	goto	u1360
u1361:
	goto	l6306
u1360:
	goto	l6214
	line	91
	
l6306:	
;rfid125.c: 90: }
;rfid125.c: 91: for(ii=0;ii<55;ii++)
	clrf	(get_RFID@ii)
	line	93
	
l6312:	
;rfid125.c: 92: {
;rfid125.c: 93: i = ii/5;
	movlw	(05h)
	movwf	(?___lbdiv)
	movf	(get_RFID@ii),w
	fcall	___lbdiv
	movwf	(get_RFID@i)
	line	94
	
l6314:	
;rfid125.c: 94: timeOutVal=timerOut(flag_RFID_last,150);
	movlw	096h
	movwf	(?_timerOut)
	clrf	(?_timerOut+1)
	movf	(get_RFID@flag_RFID_last),w
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	95
	
l6316:	
;rfid125.c: 95: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1371
	goto	u1370
u1371:
	goto	l6322
u1370:
	goto	l6214
	line	98
	
l6322:	
;rfid125.c: 97: if(0==flag_RFID_last && timeOutVal<=72 ||
;rfid125.c: 98: 1==flag_RFID_last && timeOutVal>72)
	movf	(get_RFID@flag_RFID_last),f
	skipz
	goto	u1381
	goto	u1380
u1381:
	goto	l6326
u1380:
	
l6324:	
	movlw	high(049h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(049h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipc
	goto	u1391
	goto	u1390
u1391:
	goto	l6330
u1390:
	
l6326:	
	decf	(get_RFID@flag_RFID_last),w
	skipz
	goto	u1401
	goto	u1400
u1401:
	goto	l6346
u1400:
	
l6328:	
	movlw	high(049h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(049h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipc
	goto	u1411
	goto	u1410
u1411:
	goto	l6346
u1410:
	line	100
	
l6330:	
;rfid125.c: 99: {
;rfid125.c: 100: if(!flag_RFID_last)
	movf	(get_RFID@flag_RFID_last),f
	skipz
	goto	u1421
	goto	u1420
u1421:
	goto	l6340
u1420:
	line	102
	
l6332:	
;rfid125.c: 101: {
;rfid125.c: 102: timeOutVal=timerOut(1,72);
	movlw	048h
	movwf	(?_timerOut)
	clrf	(?_timerOut+1)
	movlw	(01h)
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	103
	
l6334:	
;rfid125.c: 103: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1431
	goto	u1430
u1431:
	goto	l6340
u1430:
	goto	l6214
	line	105
	
l6340:	
;rfid125.c: 104: }
;rfid125.c: 105: flag_RFID_last = 0;
	clrf	(get_RFID@flag_RFID_last)
	line	106
	
l6342:	
;rfid125.c: 106: RF_serial_55bits[i] <<= 1;
	movf	(get_RFID@i),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrc
	rlf	indf,f
	line	107
	
l6344:	
;rfid125.c: 107: RF_serial_55bits[i] |= 0x01;
	movf	(get_RFID@i),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	bsf	indf+(0/8),(0)&7
	line	108
;rfid125.c: 108: }
	goto	l6366
	line	111
	
l6346:	
;rfid125.c: 109: else
;rfid125.c: 110: if(0==flag_RFID_last && timeOutVal>72 ||
;rfid125.c: 111: 1==flag_RFID_last && timeOutVal<=72)
	movf	(get_RFID@flag_RFID_last),f
	skipz
	goto	u1441
	goto	u1440
u1441:
	goto	l6350
u1440:
	
l6348:	
	movlw	high(049h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(049h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipnc
	goto	u1451
	goto	u1450
u1451:
	goto	l6354
u1450:
	
l6350:	
	decf	(get_RFID@flag_RFID_last),w
	skipz
	goto	u1461
	goto	u1460
u1461:
	goto	l6366
u1460:
	
l6352:	
	movlw	high(049h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(049h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipnc
	goto	u1471
	goto	u1470
u1471:
	goto	l6366
u1470:
	line	113
	
l6354:	
;rfid125.c: 112: {
;rfid125.c: 113: if(flag_RFID_last)
	movf	(get_RFID@flag_RFID_last),w
	skipz
	goto	u1480
	goto	l2499
u1480:
	line	115
	
l6356:	
;rfid125.c: 114: {
;rfid125.c: 115: timeOutVal=timerOut(0,150);
	movlw	096h
	movwf	(?_timerOut)
	clrf	(?_timerOut+1)
	movlw	(0)
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	116
	
l6358:	
;rfid125.c: 116: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1491
	goto	u1490
u1491:
	goto	l2499
u1490:
	goto	l6214
	line	117
	
l2499:	
	line	118
;rfid125.c: 117: }
;rfid125.c: 118: flag_RFID_last = 1;
	clrf	(get_RFID@flag_RFID_last)
	incf	(get_RFID@flag_RFID_last),f
	line	119
	
l6364:	
;rfid125.c: 119: RF_serial_55bits[i] <<= 1;
	movf	(get_RFID@i),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrc
	rlf	indf,f
	line	91
	
l6366:	
	incf	(get_RFID@ii),f
	
l6368:	
	movlw	(037h)
	subwf	(get_RFID@ii),w
	skipc
	goto	u1501
	goto	u1500
u1501:
	goto	l6312
u1500:
	line	122
	
l6370:	
;rfid125.c: 120: }
;rfid125.c: 121: }
;rfid125.c: 122: if(55==ii)
	movf	(get_RFID@ii),w
	xorlw	037h
	skipz
	goto	u1511
	goto	u1510
u1511:
	goto	l6214
u1510:
	line	124
	
l6372:	
;rfid125.c: 123: {
;rfid125.c: 124: even_col = 0;
	clrf	(get_RFID@even_col)
	line	125
;rfid125.c: 125: for(ii=0;ii<10;ii++)
	clrf	(get_RFID@ii)
	line	127
	
l6378:	
;rfid125.c: 126: {
;rfid125.c: 127: even_row = (RF_serial_55bits[ii] & 0x01);
	movf	(get_RFID@ii),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(get_RFID@even_row)
	
l6380:	
	movlw	(01h)
	andwf	(get_RFID@even_row),f
	line	128
	
l6382:	
;rfid125.c: 128: for(j=1;j<5;j++)
	clrf	(get_RFID@j)
	incf	(get_RFID@j),f
	line	130
	
l6388:	
;rfid125.c: 129: {
;rfid125.c: 130: even_row = even_row ^ ((RF_serial_55bits[ii]>>j) & 0x01);
	movf	(get_RFID@ii),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_get_RFID+0)+0
	incf	(get_RFID@j),w
	goto	u1524
u1525:
	clrc
	rrf	(??_get_RFID+0)+0,f
u1524:
	addlw	-1
	skipz
	goto	u1525
	movf	0+(??_get_RFID+0)+0,w
	andlw	01h
	xorwf	(get_RFID@even_row),f
	line	128
	
l6390:	
	incf	(get_RFID@j),f
	
l6392:	
	movlw	(05h)
	subwf	(get_RFID@j),w
	skipc
	goto	u1531
	goto	u1530
u1531:
	goto	l6388
u1530:
	
l2505:	
	line	132
;rfid125.c: 131: }
;rfid125.c: 132: if(even_row & 0x01)
	btfss	(get_RFID@even_row),(0)&7
	goto	u1541
	goto	u1540
u1541:
	goto	l6398
u1540:
	goto	l6214
	line	137
	
l6398:	
;rfid125.c: 135: }
;rfid125.c: 137: RF_serial_55bits[ii] <<= 3;
	movf	(get_RFID@ii),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	rlf	indf,f
	rlf	indf,f
	rlf	indf,w
	andlw	0f8h
	movwf	indf
	line	139
;rfid125.c: 139: i = RF_serial_55bits[ii];
	movf	(get_RFID@ii),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(get_RFID@i)
	line	140
	
l6400:	
;rfid125.c: 140: if( 0==ii%2 )
	btfsc	(get_RFID@ii),(0)&7
	goto	u1551
	goto	u1550
u1551:
	goto	l6404
u1550:
	line	142
	
l6402:	
;rfid125.c: 141: {
;rfid125.c: 142: keyID[ii/2] = (i & 0xF0);
	clrc
	rrf	(get_RFID@ii),w
	addlw	_keyID&0ffh
	movwf	fsr0
	movf	(get_RFID@i),w
	movwf	indf
	clrc
	rrf	(get_RFID@ii),w
	addlw	_keyID&0ffh
	movwf	fsr0
	movlw	(0F0h)
	andwf	indf,f
	line	143
;rfid125.c: 143: }
	goto	l6408
	line	146
	
l6404:	
;rfid125.c: 144: else
;rfid125.c: 145: {
;rfid125.c: 146: i >>=4;
swapf	(get_RFID@i),f
	movlw	15
	andwf	(get_RFID@i),f

	line	147
	
l6406:	
;rfid125.c: 147: keyID[ii/2] |= (i & 0x0F);
	clrc
	rrf	(get_RFID@ii),w
	addlw	_keyID&0ffh
	movwf	fsr0
	movf	(get_RFID@i),w
	andlw	0Fh
	iorwf	indf,f
	line	149
	
l6408:	
;rfid125.c: 148: }
;rfid125.c: 149: even_col ^= RF_serial_55bits[ii];
	movf	(get_RFID@ii),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	movf	indf,w
	xorwf	(get_RFID@even_col),f
	line	125
	
l6410:	
	incf	(get_RFID@ii),f
	
l6412:	
	movlw	(0Ah)
	subwf	(get_RFID@ii),w
	skipc
	goto	u1561
	goto	u1560
u1561:
	goto	l6378
u1560:
	
l2503:	
	line	151
;rfid125.c: 150: }
;rfid125.c: 151: RF_serial_55bits[10] <<= 3;
	rlf	0+(get_RFID@RF_serial_55bits)+0Ah,f
	rlf	0+(get_RFID@RF_serial_55bits)+0Ah,f
	rlf	0+(get_RFID@RF_serial_55bits)+0Ah,w
	andlw	0f8h
	movwf	0+(get_RFID@RF_serial_55bits)+0Ah
	line	152
	
l6414:	
;rfid125.c: 152: keyID[0] =0x00;
	clrf	(_keyID)
	line	153
	
l6416:	
;rfid125.c: 153: if(((RF_serial_55bits[10] & 0xf0)==(even_col & 0xf0)) && (0==(RF_serial_55bits[10]&0x08)))
	movlw	(0F0h)
	andwf	(get_RFID@even_col),w
	movwf	(??_get_RFID+0)+0
	movf	0+(get_RFID@RF_serial_55bits)+0Ah,w
	andlw	0F0h
	xorwf	0+(??_get_RFID+0)+0,w
	skipz
	goto	u1571
	goto	u1570
u1571:
	goto	l6214
u1570:
	
l6418:	
	btfsc	0+(get_RFID@RF_serial_55bits)+0Ah,(3)&7
	goto	u1581
	goto	u1580
u1581:
	goto	l6214
u1580:
	line	156
	
l6420:	
;rfid125.c: 154: {
;rfid125.c: 156: return 1;
	movlw	(01h)
	line	160
	
l2455:	
	return
	opt stack 0
GLOBAL	__end_of_get_RFID
	__end_of_get_RFID:
;; =============== function _get_RFID ends ============

	signat	_get_RFID,89
	global	_eepromWriteByte
psect	text509,local,class=CODE,delta=2
global __ptext509
__ptext509:

;; *************** function _eepromWriteByte *****************
;; Defined at:
;;		line 26 in file "ms82_eeprom.c"
;; Parameters:    Size  Location     Type
;;  EEAddr          1    wreg     unsigned char 
;;  EEData          1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  EEAddr          1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         1       0       0
;;      Temps:          2       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_eepromWriteBlock
;;		_main
;; This function uses a non-reentrant model
;;
psect	text509
	file	"ms82_eeprom.c"
	line	26
	global	__size_of_eepromWriteByte
	__size_of_eepromWriteByte	equ	__end_of_eepromWriteByte-_eepromWriteByte
	
_eepromWriteByte:	
	opt	stack 4
; Regs used in _eepromWriteByte: [wreg]
;eepromWriteByte@EEAddr stored from wreg
	movwf	(eepromWriteByte@EEAddr)
	line	27
	
l6194:	
;ms82_eeprom.c: 27: GIE = 0;
	bcf	(95/8),(95)&7
	line	30
;ms82_eeprom.c: 29: {
;ms82_eeprom.c: 30: while(GIE) asm("clrwdt");
	goto	l1597
	
l1598:	
# 30 "ms82_eeprom.c"
clrwdt ;#
psect	text509
	
l1597:	
	btfsc	(95/8),(95)&7
	goto	u1141
	goto	u1140
u1141:
	goto	l1598
u1140:
	line	31
	
l6196:	
;ms82_eeprom.c: 31: EEADR = EEAddr;
	movf	(eepromWriteByte@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	32
;ms82_eeprom.c: 32: EEDAT = EEData;
	movf	(eepromWriteByte@EEData),w
	movwf	(154)^080h	;volatile
	line	33
	
l6198:	
;ms82_eeprom.c: 33: EEIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(103/8),(103)&7
	line	34
;ms82_eeprom.c: 34: EECON1 = 0x34;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(156)^080h	;volatile
	line	35
	
l6200:	
;ms82_eeprom.c: 35: WR = 1;
	bsf	(1256/8)^080h,(1256)&7
	line	36
;ms82_eeprom.c: 36: while(WR) asm("clrwdt");
	goto	l1600
	
l1601:	
# 36 "ms82_eeprom.c"
clrwdt ;#
psect	text509
	
l1600:	
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1256/8)^080h,(1256)&7
	goto	u1151
	goto	u1150
u1151:
	goto	l1601
u1150:
	line	37
	
l6202:	
;ms82_eeprom.c: 37: _delay((unsigned long)((2)*(8000000/4000.0)));
	opt asmopt_off
movlw	6
movwf	((??_eepromWriteByte+0)+0+1),f
	movlw	48
movwf	((??_eepromWriteByte+0)+0),f
u1937:
	decfsz	((??_eepromWriteByte+0)+0),f
	goto	u1937
	decfsz	((??_eepromWriteByte+0)+0+1),f
	goto	u1937
	clrwdt
opt asmopt_on

	line	39
	
l6204:	
;ms82_eeprom.c: 38: }
;ms82_eeprom.c: 39: GIE = 1;
	bsf	(95/8),(95)&7
	line	40
	
l1603:	
	return
	opt stack 0
GLOBAL	__end_of_eepromWriteByte
	__end_of_eepromWriteByte:
;; =============== function _eepromWriteByte ends ============

	signat	_eepromWriteByte,8312
	global	_eepromReadBlock
psect	text510,local,class=CODE,delta=2
global __ptext510
__ptext510:

;; *************** function _eepromReadBlock *****************
;; Defined at:
;;		line 18 in file "ms82_eeprom.c"
;; Parameters:    Size  Location     Type
;;  addStart        1    wreg     unsigned char 
;;  buff            1    4[COMMON] PTR unsigned char 
;;		 -> buffTag(25), 
;;  len             1    5[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addStart        1    7[COMMON] unsigned char 
;;  i               1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/0
;;		Unchanged: FFEDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         2       0       0
;;      Temps:          1       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_eepromReadByte
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text510
	file	"ms82_eeprom.c"
	line	18
	global	__size_of_eepromReadBlock
	__size_of_eepromReadBlock	equ	__end_of_eepromReadBlock-_eepromReadBlock
	
_eepromReadBlock:	
	opt	stack 5
; Regs used in _eepromReadBlock: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;eepromReadBlock@addStart stored from wreg
	line	20
	movwf	(eepromReadBlock@addStart)
	
l6186:	
;ms82_eeprom.c: 19: unsigned char i;
;ms82_eeprom.c: 20: for(i=0;i<len;i++){
	clrf	(eepromReadBlock@i)
	goto	l6192
	line	21
	
l6188:	
;ms82_eeprom.c: 21: buff[i] = eepromReadByte(addStart+i);
	movf	(eepromReadBlock@i),w
	addwf	(eepromReadBlock@buff),w
	movwf	(??_eepromReadBlock+0)+0
	movf	0+(??_eepromReadBlock+0)+0,w
	movwf	fsr0
	movf	(eepromReadBlock@i),w
	addwf	(eepromReadBlock@addStart),w
	fcall	_eepromReadByte
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	20
	
l6190:	
	incf	(eepromReadBlock@i),f
	
l6192:	
	movf	(eepromReadBlock@len),w
	subwf	(eepromReadBlock@i),w
	skipc
	goto	u1131
	goto	u1130
u1131:
	goto	l6188
u1130:
	line	23
	
l1594:	
	return
	opt stack 0
GLOBAL	__end_of_eepromReadBlock
	__end_of_eepromReadBlock:
;; =============== function _eepromReadBlock ends ============

	signat	_eepromReadBlock,12408
	global	_sys_init
psect	text511,local,class=CODE,delta=2
global __ptext511
__ptext511:

;; *************** function _sys_init *****************
;; Defined at:
;;		line 3 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 20/20
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text511
	file	"sysinit.c"
	line	3
	global	__size_of_sys_init
	__size_of_sys_init	equ	__end_of_sys_init-_sys_init
	
_sys_init:	
	opt	stack 6
; Regs used in _sys_init: [wreg]
	line	21
	
l6182:	
;sysinit.c: 21: OSCCON = 0B01100001;
	movlw	(061h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	22
	
l6184:	
;sysinit.c: 22: _nop();
	nop
	line	28
;sysinit.c: 28: while(HTS==0);
	
l787:	
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1146/8)^080h,(1146)&7
	goto	u1121
	goto	u1120
u1121:
	goto	l787
u1120:
	line	30
	
l790:	
	return
	opt stack 0
GLOBAL	__end_of_sys_init
	__end_of_sys_init:
;; =============== function _sys_init ends ============

	signat	_sys_init,88
	global	___lbdiv
psect	text512,local,class=CODE,delta=2
global __ptext512
__ptext512:

;; *************** function ___lbdiv *****************
;; Defined at:
;;		line 5 in file "D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lbdiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    3[COMMON] unsigned char 
;;  quotient        1    5[COMMON] unsigned char 
;;  counter         1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         3       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_get_RFID
;;		_id_search
;; This function uses a non-reentrant model
;;
psect	text512
	file	"D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lbdiv.c"
	line	5
	global	__size_of___lbdiv
	__size_of___lbdiv	equ	__end_of___lbdiv-___lbdiv
	
___lbdiv:	
	opt	stack 5
; Regs used in ___lbdiv: [wreg+status,2+status,0]
;___lbdiv@dividend stored from wreg
	line	9
	movwf	(___lbdiv@dividend)
	
l6158:	
	clrf	(___lbdiv@quotient)
	line	10
	
l6160:	
	movf	(___lbdiv@divisor),w
	skipz
	goto	u1080
	goto	l6178
u1080:
	line	11
	
l6162:	
	clrf	(___lbdiv@counter)
	incf	(___lbdiv@counter),f
	line	12
	goto	l6166
	
l4900:	
	line	13
	clrc
	rlf	(___lbdiv@divisor),f
	line	14
	
l6164:	
	incf	(___lbdiv@counter),f
	line	12
	
l6166:	
	btfss	(___lbdiv@divisor),(7)&7
	goto	u1091
	goto	u1090
u1091:
	goto	l4900
u1090:
	line	16
	
l4902:	
	line	17
	clrc
	rlf	(___lbdiv@quotient),f
	line	18
	
l6168:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),w
	skipc
	goto	u1101
	goto	u1100
u1101:
	goto	l6174
u1100:
	line	19
	
l6170:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),f
	line	20
	
l6172:	
	bsf	(___lbdiv@quotient)+(0/8),(0)&7
	line	22
	
l6174:	
	clrc
	rrf	(___lbdiv@divisor),f
	line	23
	
l6176:	
	decfsz	(___lbdiv@counter),f
	goto	u1111
	goto	u1110
u1111:
	goto	l4902
u1110:
	line	25
	
l6178:	
	movf	(___lbdiv@quotient),w
	line	26
	
l4905:	
	return
	opt stack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
;; =============== function ___lbdiv ends ============

	signat	___lbdiv,8313
	global	___lwmod
psect	text513,local,class=CODE,delta=2
global __ptext513
__ptext513:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    2[COMMON] unsigned int 
;;  dividend        2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         4       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text513
	file	"D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 6
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l6138:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u1041
	goto	u1040
u1041:
	goto	l6154
u1040:
	line	9
	
l6140:	
	clrf	(___lwmod@counter)
	incf	(___lwmod@counter),f
	line	10
	goto	l6144
	line	11
	
l6142:	
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	line	12
	incf	(___lwmod@counter),f
	line	10
	
l6144:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u1051
	goto	u1050
u1051:
	goto	l6142
u1050:
	line	15
	
l6146:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u1065
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u1065:
	skipc
	goto	u1061
	goto	u1060
u1061:
	goto	l6150
u1060:
	line	16
	
l6148:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	line	17
	
l6150:	
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	line	18
	
l6152:	
	decfsz	(___lwmod@counter),f
	goto	u1071
	goto	u1070
u1071:
	goto	l6146
u1070:
	line	20
	
l6154:	
	movf	(___lwmod@dividend+1),w
	movwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	movwf	(?___lwmod)
	line	21
	
l4895:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___bmul
psect	text514,local,class=CODE,delta=2
global __ptext514
__ptext514:

;; *************** function ___bmul *****************
;; Defined at:
;;		line 3 in file "D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\bmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1    4[COMMON] unsigned char 
;;  product         1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_id_replate
;; This function uses a non-reentrant model
;;
psect	text514
	file	"D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 5
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	movwf	(___bmul@multiplier)
	line	4
	
l6122:	
	clrf	(___bmul@product)
	line	7
	
l6124:	
	btfss	(___bmul@multiplier),(0)&7
	goto	u1021
	goto	u1020
u1021:
	goto	l6128
u1020:
	line	8
	
l6126:	
	movf	(___bmul@multiplicand),w
	addwf	(___bmul@product),f
	line	9
	
l6128:	
	clrc
	rlf	(___bmul@multiplicand),f
	line	10
	
l6130:	
	clrc
	rrf	(___bmul@multiplier),f
	line	11
	
l6132:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u1031
	goto	u1030
u1031:
	goto	l6124
u1030:
	line	12
	
l6134:	
	movf	(___bmul@product),w
	line	13
	
l4869:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_setState
psect	text515,local,class=CODE,delta=2
global __ptext515
__ptext515:

;; *************** function _setState *****************
;; Defined at:
;;		line 148 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;  stt             1    wreg     unsigned char 
;;  _tOut           2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  stt             1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text515
	file	"MAIN.C"
	line	148
	global	__size_of_setState
	__size_of_setState	equ	__end_of_setState-_setState
	
_setState:	
	opt	stack 6
; Regs used in _setState: [wreg+status,2]
;setState@stt stored from wreg
	line	150
	movwf	(setState@stt)
	
l6116:	
;MAIN.C: 150: mtState = stt;
	movf	(setState@stt),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_mtState)
	line	151
	
l6118:	
;MAIN.C: 151: timeTick = 0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	152
	
l6120:	
;MAIN.C: 152: timeOut = _tOut;
	movf	(setState@_tOut+1),w
	movwf	(_timeOut+1)
	movf	(setState@_tOut),w
	movwf	(_timeOut)
	line	153
	
l4133:	
	return
	opt stack 0
GLOBAL	__end_of_setState
	__end_of_setState:
;; =============== function _setState ends ============

	signat	_setState,8312
	global	_SET_EPWM_ON
psect	text516,local,class=CODE,delta=2
global __ptext516
__ptext516:

;; *************** function _SET_EPWM_ON *****************
;; Defined at:
;;		line 11 in file "ms82_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 20/20
;;		On exit  : 20/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text516
	file	"ms82_pwm.c"
	line	11
	global	__size_of_SET_EPWM_ON
	__size_of_SET_EPWM_ON	equ	__end_of_SET_EPWM_ON-_SET_EPWM_ON
	
_SET_EPWM_ON:	
	opt	stack 6
; Regs used in _SET_EPWM_ON: [wreg+status,2]
	line	12
	
l6090:	
;ms82_pwm.c: 12: TRISC |= 0B00100000;
	bsf	(135)^080h+(5/8),(5)&7	;volatile
	line	13
	
l6092:	
;ms82_pwm.c: 13: T2CON0 = 0B00000001;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	14
	
l6094:	
;ms82_pwm.c: 14: T2CON1 = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(158)^080h	;volatile
	line	15
	
l6096:	
;ms82_pwm.c: 15: PR2H = 0;
	clrf	(146)^080h	;volatile
	line	16
;ms82_pwm.c: 16: PR2L = 7;
	movlw	(07h)
	movwf	(145)^080h	;volatile
	line	17
	
l6098:	
;ms82_pwm.c: 17: P1ADTH = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(20)	;volatile
	line	18
	
l6100:	
;ms82_pwm.c: 18: P1ADTL = 4;
	movlw	(04h)
	movwf	(14)	;volatile
	line	20
	
l6102:	
;ms82_pwm.c: 20: P1OE = 0B00000001;
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	21
	
l6104:	
;ms82_pwm.c: 21: P1POL = 0B00000000;
	clrf	(153)^080h	;volatile
	line	22
	
l6106:	
;ms82_pwm.c: 22: P1CON = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(22)	;volatile
	line	24
	
l6108:	
;ms82_pwm.c: 24: TMR2H = 0;
	clrf	(19)	;volatile
	line	25
	
l6110:	
;ms82_pwm.c: 25: TMR2L = 0;
	clrf	(17)	;volatile
	line	26
	
l6112:	
;ms82_pwm.c: 26: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	27
	
l6114:	
;ms82_pwm.c: 27: TMR2ON = 1;
	bsf	(146/8),(146)&7
	line	28
;ms82_pwm.c: 28: while(TMR2IF==0) asm("clrwdt");
	goto	l3294
	
l3295:	
# 28 "ms82_pwm.c"
clrwdt ;#
psect	text516
	
l3294:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u1011
	goto	u1010
u1011:
	goto	l3295
u1010:
	
l3296:	
	line	29
;ms82_pwm.c: 29: TRISC &= 0B11011111;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(135)^080h+(5/8),(5)&7	;volatile
	line	30
	
l3297:	
	return
	opt stack 0
GLOBAL	__end_of_SET_EPWM_ON
	__end_of_SET_EPWM_ON:
;; =============== function _SET_EPWM_ON ends ============

	signat	_SET_EPWM_ON,88
	global	_timerOut
psect	text517,local,class=CODE,delta=2
global __ptext517
__ptext517:

;; *************** function _timerOut *****************
;; Defined at:
;;		line 6 in file "rfid125.c"
;; Parameters:    Size  Location     Type
;;  Logic           1    wreg     unsigned char 
;;  time            2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  Logic           1    4[COMMON] unsigned char 
;;  CurTimer        2    5[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         3       0       0
;;      Temps:          0       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_get_RFID
;; This function uses a non-reentrant model
;;
psect	text517
	file	"rfid125.c"
	line	6
	global	__size_of_timerOut
	__size_of_timerOut	equ	__end_of_timerOut-_timerOut
	
_timerOut:	
	opt	stack 5
; Regs used in _timerOut: [wreg+status,2]
;timerOut@Logic stored from wreg
	line	8
	movwf	(timerOut@Logic)
	
l6066:	
;rfid125.c: 7: unsigned int CurTimer;
;rfid125.c: 8: T0ON = 0;
	bcf	(251/8),(251)&7
	line	9
	
l6068:	
;rfid125.c: 9: TMR0 = 0;
	clrf	(1)	;volatile
	line	10
	
l6070:	
;rfid125.c: 10: T0IF = 0;
	bcf	(90/8),(90)&7
	line	11
	
l6072:	
;rfid125.c: 11: T0ON = 1;
	bsf	(251/8),(251)&7
	line	12
;rfid125.c: 12: while(RA5==Logic){
	goto	l6084
	line	13
	
l6074:	
;rfid125.c: 13: CurTimer= (0 <<8 )| TMR0;
	clrf	(timerOut@CurTimer)
	clrf	(timerOut@CurTimer+1)
	
l6076:	
	movf	(1),w	;volatile
	iorwf	(timerOut@CurTimer),f
	line	14
	
l6078:	
;rfid125.c: 14: if(CurTimer>time)
	movf	(timerOut@CurTimer+1),w
	subwf	(timerOut@time+1),w
	skipz
	goto	u995
	movf	(timerOut@CurTimer),w
	subwf	(timerOut@time),w
u995:
	skipnc
	goto	u991
	goto	u990
u991:
	goto	l6084
u990:
	line	15
	
l6080:	
;rfid125.c: 15: return 0;
	clrf	(?_timerOut)
	clrf	(?_timerOut+1)
	goto	l2449
	line	12
	
l6084:	
	movlw	0
	btfsc	(45/8),(45)&7
	movlw	1
	xorwf	(timerOut@Logic),w
	skipnz
	goto	u1001
	goto	u1000
u1001:
	goto	l6074
u1000:
	line	17
	
l6086:	
;rfid125.c: 16: }
;rfid125.c: 17: return CurTimer;
	movf	(timerOut@CurTimer+1),w
	movwf	(?_timerOut+1)
	movf	(timerOut@CurTimer),w
	movwf	(?_timerOut)
	line	18
	
l2449:	
	return
	opt stack 0
GLOBAL	__end_of_timerOut
	__end_of_timerOut:
;; =============== function _timerOut ends ============

	signat	_timerOut,8314
	global	_comArr
psect	text518,local,class=CODE,delta=2
global __ptext518
__ptext518:

;; *************** function _comArr *****************
;; Defined at:
;;		line 52 in file "ms82_eeprom.c"
;; Parameters:    Size  Location     Type
;;  arr1            1    wreg     PTR unsigned char 
;;		 -> keyID(5), 
;;  arr2            1    2[COMMON] PTR unsigned char 
;;		 -> buffTag(25), 
;;  len1            1    3[COMMON] unsigned char 
;;  len2            1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  arr1            1    8[COMMON] PTR unsigned char 
;;		 -> keyID(5), 
;;  i               1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFEDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         3       0       0
;;      Locals:         2       0       0
;;      Temps:          3       0       0
;;      Totals:         8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_id_search
;; This function uses a non-reentrant model
;;
psect	text518
	file	"ms82_eeprom.c"
	line	52
	global	__size_of_comArr
	__size_of_comArr	equ	__end_of_comArr-_comArr
	
_comArr:	
	opt	stack 5
; Regs used in _comArr: [wreg-fsr0h+status,2+status,0]
;comArr@arr1 stored from wreg
	line	55
	movwf	(comArr@arr1)
	
l6034:	
;ms82_eeprom.c: 53: unsigned char i;
;ms82_eeprom.c: 55: if(len1!=len2)
	movf	(comArr@len1),w
	xorwf	(comArr@len2),w
	skipnz
	goto	u951
	goto	u950
u951:
	goto	l6042
u950:
	line	56
	
l6036:	
;ms82_eeprom.c: 56: return 0;
	movlw	(0)
	goto	l1613
	line	58
	
l6042:	
;ms82_eeprom.c: 57: else{
;ms82_eeprom.c: 58: for(i=0;i<len1;i++){
	clrf	(comArr@i)
	goto	l6052
	line	59
	
l6044:	
;ms82_eeprom.c: 59: if(*(arr1+i) != *(arr2+i)){
	movf	(comArr@i),w
	addwf	(comArr@arr2),w
	movwf	(??_comArr+0)+0
	movf	0+(??_comArr+0)+0,w
	movwf	fsr
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_comArr+1)+0
	movf	(comArr@i),w
	addwf	(comArr@arr1),w
	movwf	(??_comArr+2)+0
	movf	0+(??_comArr+2)+0,w
	movwf	fsr0
	movf	indf,w
	xorwf	(??_comArr+1)+0,w
	skipnz
	goto	u961
	goto	u960
u961:
	goto	l6050
u960:
	goto	l6036
	line	58
	
l6050:	
	incf	(comArr@i),f
	
l6052:	
	movf	(comArr@len1),w
	subwf	(comArr@i),w
	skipc
	goto	u971
	goto	u970
u971:
	goto	l6044
u970:
	line	63
	
l6054:	
;ms82_eeprom.c: 61: }
;ms82_eeprom.c: 62: }
;ms82_eeprom.c: 63: if(i==len1)
	movf	(comArr@i),w
	xorwf	(comArr@len1),w
	skipz
	goto	u981
	goto	u980
u981:
	goto	l6036
u980:
	line	64
	
l6056:	
;ms82_eeprom.c: 64: return 1;
	movlw	(01h)
	line	68
	
l1613:	
	return
	opt stack 0
GLOBAL	__end_of_comArr
	__end_of_comArr:
;; =============== function _comArr ends ============

	signat	_comArr,16505
	global	_eepromReadByte
psect	text519,local,class=CODE,delta=2
global __ptext519
__ptext519:

;; *************** function _eepromReadByte *****************
;; Defined at:
;;		line 7 in file "ms82_eeprom.c"
;; Parameters:    Size  Location     Type
;;  EEAddr          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  EEAddr          1    2[COMMON] unsigned char 
;;  ReEepromData    1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 20/20
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_eepromReadBlock
;;		_main
;; This function uses a non-reentrant model
;;
psect	text519
	file	"ms82_eeprom.c"
	line	7
	global	__size_of_eepromReadByte
	__size_of_eepromReadByte	equ	__end_of_eepromReadByte-_eepromReadByte
	
_eepromReadByte:	
	opt	stack 5
; Regs used in _eepromReadByte: [wreg]
;eepromReadByte@EEAddr stored from wreg
	line	10
	movwf	(eepromReadByte@EEAddr)
	
l6026:	
;ms82_eeprom.c: 8: unsigned char ReEepromData;
;ms82_eeprom.c: 10: EEADR = EEAddr;
	movf	(eepromReadByte@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	11
	
l6028:	
;ms82_eeprom.c: 11: RD = 1;
	bsf	(1248/8)^080h,(1248)&7
	line	12
;ms82_eeprom.c: 12: ReEepromData = EEDAT;
	movf	(154)^080h,w	;volatile
	movwf	(eepromReadByte@ReEepromData)
	line	13
	
l6030:	
;ms82_eeprom.c: 13: RD = 0;
	bcf	(1248/8)^080h,(1248)&7
	line	14
;ms82_eeprom.c: 14: return ReEepromData;
	movf	(eepromReadByte@ReEepromData),w
	line	15
	
l1588:	
	return
	opt stack 0
GLOBAL	__end_of_eepromReadByte
	__end_of_eepromReadByte:
;; =============== function _eepromReadByte ends ============

	signat	_eepromReadByte,4217
	global	_int_init
psect	text520,local,class=CODE,delta=2
global __ptext520
__ptext520:

;; *************** function _int_init *****************
;; Defined at:
;;		line 66 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 20/20
;;		On exit  : 20/20
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text520
	file	"sysinit.c"
	line	66
	global	__size_of_int_init
	__size_of_int_init	equ	__end_of_int_init-_int_init
	
_int_init:	
	opt	stack 6
; Regs used in _int_init: [status,2]
	line	72
	
l6012:	
;sysinit.c: 72: INTCON = 0B00000000;
	clrf	(11)	;volatile
	line	73
;sysinit.c: 73: PIE1 = 0B00000000;
	clrf	(140)^080h	;volatile
	line	74
;sysinit.c: 74: PIR1 = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(12)	;volatile
	line	87
	
l6014:	
;sysinit.c: 87: T0IF = 0;
	bcf	(90/8),(90)&7
	line	88
	
l6016:	
;sysinit.c: 88: T0IE = 0;
	bcf	(93/8),(93)&7
	line	92
	
l6018:	
;sysinit.c: 92: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	93
	
l6020:	
;sysinit.c: 93: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	99
	
l6022:	
;sysinit.c: 99: PEIE = 0;
	bcf	(94/8),(94)&7
	line	101
	
l6024:	
;sysinit.c: 101: GIE = 1;
	bsf	(95/8),(95)&7
	line	102
	
l799:	
	return
	opt stack 0
GLOBAL	__end_of_int_init
	__end_of_int_init:
;; =============== function _int_init ends ============

	signat	_int_init,88
	global	_timer_init
psect	text521,local,class=CODE,delta=2
global __ptext521
__ptext521:

;; *************** function _timer_init *****************
;; Defined at:
;;		line 44 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 20/20
;;		On exit  : 20/20
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text521
	file	"sysinit.c"
	line	44
	global	__size_of_timer_init
	__size_of_timer_init	equ	__end_of_timer_init-_timer_init
	
_timer_init:	
	opt	stack 6
; Regs used in _timer_init: [wreg]
	line	46
	
l6010:	
;sysinit.c: 46: OPTION = 0B00000011;
	movlw	(03h)
	movwf	(129)^080h	;volatile
	line	63
	
l796:	
	return
	opt stack 0
GLOBAL	__end_of_timer_init
	__end_of_timer_init:
;; =============== function _timer_init ends ============

	signat	_timer_init,88
	global	_gpio_init
psect	text522,local,class=CODE,delta=2
global __ptext522
__ptext522:

;; *************** function _gpio_init *****************
;; Defined at:
;;		line 32 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 20/20
;;		On exit  : 20/20
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text522
	file	"sysinit.c"
	line	32
	global	__size_of_gpio_init
	__size_of_gpio_init	equ	__end_of_gpio_init-_gpio_init
	
_gpio_init:	
	opt	stack 6
; Regs used in _gpio_init: [wreg+status,2]
	line	34
	
l6000:	
;sysinit.c: 34: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	35
	
l6002:	
;sysinit.c: 35: TRISA = 0B01110011;
	movlw	(073h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	36
	
l6004:	
;sysinit.c: 36: WPUA = 0B10000000;
	movlw	(080h)
	movwf	(149)^080h	;volatile
	line	37
	
l6006:	
;sysinit.c: 37: PORTC = 0B00000010;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(7)	;volatile
	line	38
	
l6008:	
;sysinit.c: 38: TRISC = 0B11111110;
	movlw	(0FEh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	39
;sysinit.c: 39: WPUC = 0B00000000;
	clrf	(147)^080h	;volatile
	line	41
	
l793:	
	return
	opt stack 0
GLOBAL	__end_of_gpio_init
	__end_of_gpio_init:
;; =============== function _gpio_init ends ============

	signat	_gpio_init,88
	global	_ISR
psect	text523,local,class=CODE,delta=2
global __ptext523
__ptext523:

;; *************** function _ISR *****************
;; Defined at:
;;		line 85 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text523
	file	"MAIN.C"
	line	85
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 3
; Regs used in _ISR: []
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text523
	line	145
	
i1l4130:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text524,local,class=CODE,delta=2
global __ptext524
__ptext524:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
