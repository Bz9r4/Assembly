;---------------
; Assembly Code
;---------------
#define __SFR_OFFSET 0x00
#include "avr/io.h"
;------------------------
.global start
.global ledvermelho
.global ledamarelo
.global ledverde
;------------------------
start:
    SBI   DDRB, 5             ;set PB5 (D13) as i/o
    SBI   DDRB, 4             ;set PB5 (D12) as i/o
    SBI   DDRB, 3             ;set PB5 (D11) as i/o
    RET                       ;return to setup() function
;---------------------------------------------------------------------------
ledvermelho:
    SBI   PORTB, 5            ;set D13 to high
    CBI   PORTB, 4            ;set D12 to low
    CBI   PORTB, 3            ;set D11 to low
    RET                       ;return to loop() function
;---------------------------------------------------------------------------
ledamarelo:
    CBI   PORTB, 5            ;set D13 to low
    SBI   PORTB, 4            ;set D12 to high
    CBI   PORTB, 3            ;set D11 to low
    RET                       ;return to loop() function
;---------------------------------------------------------------------------
ledverde:
    CBI   PORTB, 5             ;set D13 to low
    CBI   PORTB, 4             ;set D12 to low
    SBI   PORTB, 3             ;set D11 to high
    RET                       ;return to setup() function
