section .text
global _start
_start:

    mov eax, 3
    mov ebx, 0
    mov ecx, x

top:
    add ebx, [ecx]
    inc ecx
    dec eax
    jnz top

done:
    add ebx, '0'
    mov [sum], ebx

display:
    mov edx, 1
    mov ecx, sum
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80

section .data
    x db 2, 4, 3
    sum db 0