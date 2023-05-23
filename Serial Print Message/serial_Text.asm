;------------------------
; Assembly Code
;------------------------
#define __SFR_OFFSET 0x00
#include "avr/io.h"
;------------------------
.global init_serial
.global print_msg
;------------------------
init_serial:
    CLR   R24
    STS   UCSR0A, R24               ;clear UCSR0A register
    STS   UBRR0H, R24               ;clear UBRR0H register
    LDI   R24, 103                  ;& store in UBRR0L 103 value
    STS   UBRR0L, R24               ;to set baud rate 9600
    LDI   R24, 1<<RXEN0 | 1<<TXEN0  ;enable RXB & TXB
    STS   UCSR0B, R24
    LDI   R24, 1<<UCSZ00 | 1<<UCSZ01;asynch, no parity, 1 stop, 8 bits
    STS   UCSR0C, R24
    RET
;-------------------------------------------------------------------------
print_msg:
    LDI   R30, lo8(message)
    LDI   R31, hi8(message)         ;Z points to string message
agn:LPM   R18, Z+                   ;load char of string onto R18
    CPI   R18, 0                    ;check if R18=0 (end of string)
    BREQ  ext                       ;if yes, exit
    ;--------------------------------------------------------------------
l1: LDS   R17, UCSR0A
    SBRS  R17, UDRE0                ;test data buffer if data can be sent
    RJMP  l1
    STS   UDR0, R18                 ;send char in R18 to serial monitor
    ;--------------------------------------------------------------------
    RJMP  agn                       ;loop back & get next character
    ;--------------------------------------------------------------------
ext:RCALL delay_sec
    RET
;------------------------------------------------------------------------
message:
    .ascii "Programming Serial Interface!" ;even number of characters!!!
    .byte 10,13,0   ;newline character, enter and null character
;------------------------------------------------------------------------
delay_sec:                          ;3s delay
    LDI   R20, 255
l4: LDI   R21, 255
l5: LDI   R22, 255
l6: DEC   R22
    BRNE  l6
    DEC   R21
    BRNE  l5
    DEC   R20
    BRNE  l4
    RET
