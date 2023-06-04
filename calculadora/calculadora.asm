section .data
    num1 db 10     ; primeiro número
    num2 db 5      ; segundo número

section .text
    global _start

_start:
    ; Adição
    mov al, [num1]
    add al, [num2]
    ; Agora, o resultado está em AL

    ; Subtração
    mov bl, [num1]
    sub bl, [num2]
    ; Agora, o resultado está em BL

    ; Multiplicação
    mov cl, [num1]
    imul cl, byte [num2]
    ; Agora, o resultado está em CL

    ; Divisão
    mov dl, [num1]
    xor ah, ah
    div byte [num2]
    ; Agora, o quociente está em AL e o resto está em AH

    ; Terminar o programa
    mov eax, 1      ; código de saída 1
    int 0x80        ; chamar a interrupção do sistema operacional para sair
