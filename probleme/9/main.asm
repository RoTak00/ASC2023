section .data
msg1 db 'Introdu numarul',0xa
lenMsg1 equ $ - msg1

msg2 db 'Numarul este par',0xa
lenMsg2 equ $ - msg2

msg3 db 'Numarul este impar',0xa
lenMsg3 equ $ - msg3

msgErrNoNumber db 'Nu ai introdus un numar',0xa
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
cmp [ecx], byte 0xa
je errNoNumber


findLastDigit:
inc ecx ; mutam pointerul la urm cifra
cmp [ecx], byte 0xa ; verificam daca e newline
jne findLastDigit ; daca nu e newline, comntinuam

dec ecx ; ne intoarcem la ultima cifra
sub [ecx], byte '0'
and [ecx], byte 1 ;comparam cu 1
jz digitEven

digitOdd:
mov eax, 4
mov ebx, 1
mov ecx, msg3
mov edx, lenMsg3
int 80h
jmp exitProgram

digitEven:
mov eax, 4
mov ebx, 1
mov ecx, msg2
mov edx, lenMsg2
int 80h
jmp exitProgram

errNoNumber:
mov eax, 4
mov ebx, 1
mov ecx, msgErrNoNumber
mov edx, lenMsgErrNoNumber
int 80h
jmp exitProgram

exitProgram:

; exit the program safely
mov eax, 1
mov ebx, 0
int 80h