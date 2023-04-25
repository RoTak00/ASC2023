section .data
msg1 db 'Introdu primul numar',0xa
lenMsg1 equ $ - msg1
msg2 db 'Introdu al doilea numar',0xa
lenMsg2 equ $ - msg2
msg3 db 'Rezultatul inmultirii este '
lenMsg3 equ $ - msg3
msgNonDigit db 'Rezultatul inmultirii nu este o cifra...',0xa
lenMsgNonDigit equ $ - msgNonDigit

newline db ' ',0xa
lenNewline equ $ - newline

section .bss

v1 resb 1
v2 resb 1
res resb 1

section .text
global _start
_start:

; afisez mesajul 1
mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, lenMsg1
int 80h

; citesc cifra v1
mov eax, 3
mov ebx, 2
mov ecx, v1
mov edx, 1
int 80h

; afisez mesajul 2
mov eax, 4
mov ebx, 1
mov ecx, msg2
mov edx, lenMsg2
int 80h

; citesc null (enter sau spatiu)
mov eax, 3
mov ebx, 2
mov ecx, 0
mov edx, 1
int 80h

; citesc cifra v2
mov eax, 3
mov ebx, 2
mov ecx, v2
mov edx, 1
int 80h

; transform v1 to a digit
mov eax, [v1]
sub al, '0'

; transform v2 to a digit from ascii
mov ebx, [v2]
sub bl, '0'

; multiply al with bl, result is in ax
mul bl

; if the result is greater than 10, jump to non-digit
cmp ax, 10
jge resultNonDigit


; transform ax to ascii
add ax, '0'
; move the value to the res variable
mov [res], ax

; afisez mesajul 3
mov eax, 4
mov ebx, 1
mov ecx, msg3
mov edx, lenMsg3
int 80h

; print the result
mov eax, 4
mov ebx, 1
mov ecx, res
mov edx, 1
int 80h

; print a newline
mov eax, 4
mov ebx, 1
mov ecx, newline
mov edx, lenNewline
int 80h

jmp exitProgram

resultNonDigit:

; afisez mesajul de eroare
mov eax, 4
mov ebx, 1
mov ecx, msgNonDigit
mov edx, lenMsgNonDigit
int 80h

exitProgram:

; exit the program safely
mov eax, 1
mov ebx, 0
int 80h