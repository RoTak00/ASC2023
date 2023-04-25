section .data
msg1 db 'Introdu numarul',0xa
lenMsg1 equ $ - msg1

msg2 db 'Numarul este palindrom',0xa
lenMsg2 equ $ - msg2

msg3 db 'Numarul nu este palindrom',0xa
lenMsg3 equ $ - msg3

msgErrNoNumber db 'Nu ai introdus un numar',0xa
lenMsgErrNoNumber equ $ - msgErrNoNumber

nl db 0xa ; newline

nr times 12 db 0 ; variabila in care vom stoca numarul citit

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
mov ebx, nr ; si in ebx

; daca primul caracter e new line, nu a fost introdus un numar
cmp [ecx], byte 0xa
je errNoNumber

findLastDigit:
inc ecx ; mutam pointerul la urmatoarea cifra (caracter)
cmp [ecx], byte 0xa ; verificam daca e newline
jne findLastDigit ; daca nu e newline, continuam

dec ecx ; ne intoarcem la ultima cifra

; acum in ebx e adresa primei cifre, in ecx adresa ultimei
; daca in ebx avem -, mutam ebx la prima cifra
cmp [ebx], byte '-'
jne startLoop
inc ebx

startLoop:
jmp midLoop
checkPalindrome: ; folosim metoda two pointers
inc ebx
dec ecx
cmp ebx, ecx ; comparam cele doua caractere
jge outCheckPalindrome ; daca primul pointer a ajuns dupa al doilea, iesim din loop. avem un palindrom
midLoop:
mov eax, [ebx]
mov edx, [ecx]
cmp dl, al ; daca cele doua cifre nu sunt egale, nu e palindrom
jne notPalindrome
jmp checkPalindrome ; altfel, continuam
outCheckPalindrome:

Palindrome:
mov eax, 4
mov ebx, 1
mov ecx, msg2
mov edx, lenMsg2
int 80h
jmp exitProgram

notPalindrome:
mov eax, 4
mov ebx, 1
mov ecx, msg3
mov edx, lenMsg3
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