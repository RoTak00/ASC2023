
section .text
    global _start
_start:
    ; afisam prompt1
    mov eax,4
    mov ebx,1
    mov ecx,prompt1
    mov edx,lenPrompt1

    int 0x80

    ; citim numarul
    mov eax,3
    mov ebx, 2
    mov ecx,num
    mov edx,5

    int 0x80

    ; afisam prompt2
    mov eax,4
    mov ebx,1
    mov ecx,prompt2
    mov edx,lenPrompt2

    int 0x80

    ;afisam numarul

    mov eax,4
    mov ebx,1
    mov ecx,num
    mov edx,5 

    int 0x80

    ;sys exit
    mov eax,1
    mov ebx,0
    mov ecx,0
    mov edx,0
    
    int 0x80

section .data
    prompt1 db 'Introdu un numar!',0xa ; Mesajul de afisat
    lenPrompt1 equ $ - prompt1 ; Lungimea mesajului

    prompt2 db 'Ai introdus numarul:',0xa ; Mesajul de afisat
    lenPrompt2 equ $ - prompt2 ; Lungimea mesajului

section .bss
    num resb 5 ; 5 bytes pentru numar

