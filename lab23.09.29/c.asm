section .data
v dw 126, 14, 1322, 235, 7, 4, 8, 10, 12, 9
par db 0
imp db 0

msg1 db "Numarul de elemente pare este ",0
len1 equ $ - msg1

msg2 db "Numarul de elemente impare este ",0
len2 equ $ - msg2

nl db 0xa

section .bss



section .text
global _start
_start:
    mov eax, v ; adresa vectorului
    mov ebx, 10
    mov ecx, 0
    mov edx, 0
    
    top:
    and [eax], byte 1
    jz nrPar

    nrImp:
    inc byte [imp]

    jmp middle
    
    nrPar:
    inc byte [par]

    middle:

    inc eax
    dec ebx
    jnz top

    add [par], byte '0'
    add [imp], byte '0'
    
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len1
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, par
    mov edx, 1
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, nl
    mov edx, 1
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, imp
    mov edx, 1
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, nl
    mov edx, 1
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h
    