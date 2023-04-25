section .data
msg1 db 'Introdu numarul',0xa
lenMsg1 equ $ - msg1
msg2 db 'Numarul se afla in multime!',0xa
lenMsg2 equ $ - msg2
msg3 db 'Numarul nu se afla in multime!',0xa
lenMsg3 equ $ - msg3

section .bss

nr resb 1


section .text
global _start
_start:

; afisez mesajul 1
mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, lenMsg1
int 80h

; citesc cifra nr
mov eax, 3
mov ebx, 2
mov ecx, nr
mov edx, 1
int 80h

; transform nr to a digit
mov eax, [nr]
sub eax, '0'

cmp eax, 1
je inSet

cmp eax, 4
je inSet

cmp eax, 6
je inSet

cmp eax, 7
je inSet

; afisez mesajul 2
mov eax, 4
mov ebx, 1
mov ecx, msg3
mov edx, lenMsg3
int 80h

jmp exitProgram

inSet:
; afisez mesajul 3
mov eax, 4
mov ebx, 1
mov ecx, msg2
mov edx, lenMsg2
int 80h

jmp exitProgram

exitProgram:

; exit the program safely
mov eax, 1
mov ebx, 0
int 80h