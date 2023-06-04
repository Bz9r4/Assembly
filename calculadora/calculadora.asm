section .data
    num1 db 10     ; primeiro n�mero
    num2 db 5      ; segundo n�mero

section .text
    global _start

_start:
    ; Adi��o
    mov al, [num1]
    add al, [num2]
    ; Agora, o resultado est� em AL

    ; Subtra��o
    mov bl, [num1]
    sub bl, [num2]
    ; Agora, o resultado est� em BL

    ; Multiplica��o
    mov cl, [num1]
    imul cl, byte [num2]
    ; Agora, o resultado est� em CL

    ; Divis�o
    mov dl, [num1]
    xor ah, ah
    div byte [num2]
    ; Agora, o quociente est� em AL e o resto est� em AH

    ; Terminar o programa
    mov eax, 1      ; c�digo de sa�da 1
    int 0x80        ; chamar a interrup��o do sistema operacional para sair
