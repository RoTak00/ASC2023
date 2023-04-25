section .text
global _start
_start:

mov ecx, '4'
sub ecx, '0'

mov edx, '5'
sub edx, '0'

call sum

mov [res], eax
mov ecx, msg
mov edx, len
mov ebx, 1
mov eax, 4

int 0x80

mov ecx, res
mov edx, 1
mov ebx, 1
mov eax, 4

int 0x80

mov eax, 1
mov ebx, 0

int 0x80

sum:

add eax, ecx
add eax, edx
add eax, '0'
ret

section .data
msg db "Suma cifrelor este: ",0xa,0
len equ $ - msg
segment .bss
res resb 1