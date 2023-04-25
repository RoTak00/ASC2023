section .data

x dd 199933

msg1 db "Numarul este prim ",0xa,0
len1 equ $ - msg1

msg2 db "Numarul nu este prim ",0xa,0
len2 equ $ - msg2

nl db 0xa

section .bss

section .text

global _start
_start:
    
    mov ebx, 1 ; divizor

    top:
    inc ebx
    cmp ebx, [x]
    jge prime

    mov eax, [x]
    cdq
    
    idiv ebx

    cmp edx, dword 0
    je notPrime
    jmp top

    prime:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len1
    int 80h

    jmp exit

    notPrime:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 80h

    exit: 
    mov eax, 1
    mov ebx, 0
    int 80h
    