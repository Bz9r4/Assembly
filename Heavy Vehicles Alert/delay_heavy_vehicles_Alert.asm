;---------------
; Assembly Code
;---------------
#define __SFR_OFFSET 0x00
#include "avr/io.h"
;------------------------
.global start
.global led
;------------------------
start:
    SBI   DDRB, 5             ;set PB5 (D13) as i/o
    SBI   DDRB, 4             ;set PB5 (D12) as i/o
    RET                       ;return to setup() function
;---------------------------------------------------------------------------
led:
    CPI   R24, 0x00           ;value in R24 passed by caller compared with 0
    BREQ  ledOFF              ;jump (branch) if equal to subroutine ledOFF
    SBI   PORTB, 5            ;set D19 to high
    CBI   PORTB, 4            ;set D19 to low
    RCALL delay_sec
    RET                       ;return to loop() function
;---------------------------------------------------------------------------
ledOFF:
    CBI   PORTB, 5            ;set D13 to low
    SBI   PORTB, 4            ;set D12 to high
    RCALL delay_sec
    RET                       ;return to loop() function
;---------------------------------------------------------------------------
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
