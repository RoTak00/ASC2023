section .data
msg1 db 'Introdu un sir de caractere',0xa
lenMsg1 equ $ - msg1

msg2 db 'Al treilea caracter este',0
lenMsg2 equ $ - msg2


msgErrNoNumber db 'Nu ai introdus nimic',0xa
lenMsgErrNoNumber equ $ - msgErrNoNumber

nl db 0xa

nr times 12 db 0

section .bss


section .text
global _start
_start:

; afisez mesajul 1
mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, lenMsg1
int 80h

; citesc nr
mov eax, 3
mov ebx, 2
mov ecx, nr
mov edx, 12
int 80h


mov ecx, nr ; mutam adresa stringului nr in ecx
inc ecx
inc ecx

mov eax, 4
mov ebx, 1
mov edx, 1
int 80h

mov eax, 4
mov ebx, 1
mov ecx, nl
mov edx, 1
int 80h
jmp exitProgram

exitProgram:

; exit the program safely
mov eax, 1
mov ebx, 0
int 80h