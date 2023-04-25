section .data

newline db ' ',0xa
lenNewline equ $ - newline

digit db 0

section .bss

section .text
global _start
_start:

mov ax, word 1255
mov bl, byte 10

continueLoop:
mov bl, byte 10
div bl
add ah, '0'

push ax

mov [digit], ah

mov eax, 4
mov ebx, 1
mov ecx, digit
mov edx, 1
int 80h

pop ax

movzx ax, al
cmp ax, 0
jne continueLoop



; exit the program safely
mov eax, 1
mov ebx, 0
int 80h