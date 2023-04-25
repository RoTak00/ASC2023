section .data
a db 8
b db 3
c db 6

msg1 db "Numarul cel mai mic este ",0
len1 equ $ - msg1

msg2 db "Numarul cel mai mare este ",0
len2 equ $ - msg2

nl db 0xa

section .bss

min resb 1
max resb 1

section .text
global _start
_start:
    ; determinam minimul in eax
    movzx eax, byte [a]
    movzx ebx, byte [b]
    movzx ecx, byte [c]

    compareBmin:
    cmp eax, ebx
    jl compareCmin
    mov eax, ebx

    compareCmin:
    cmp eax, ecx
    jl doneCompareMin
    mov eax, ecx

    doneCompareMin:
    add eax, '0'
    mov [min], eax

    ; determinam maximul in eax
    movzx eax, byte [a]
    movzx ebx, byte [b]
    movzx ecx, byte [c]

    compareBmax:
    cmp eax, ebx
    jg compareCmax
    mov eax, ebx

    compareCmax:
    cmp eax, ecx
    jg doneCompareMax
    mov eax, ecx

    doneCompareMax:
    add eax, '0'
    mov [max], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len1
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, min
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
    mov ecx, max
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
    