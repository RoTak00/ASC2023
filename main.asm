
section .text
    global _start
_start:
    
    mov eax, 56h
    and eax,1
    jz even

    odd:
    mov eax,4
    mov ebx,1
    mov ecx,msgOdd
    mov edx,lenMsgOdd
    int 80h

    jmp exit

    even:
    mov eax,4
    mov ebx,1
    mov ecx,msgEven
    mov edx,lenMsgEven
    int 80h

    exit:
    mov eax,1
    mov ebx,0
    int 80h

section .data
msgEven dw 'The number is even',0xa
lenMsgEven equ $ - msgEven
msgOdd dw 'The number is odd',0xa
lenMsgOdd equ $ - msgOdd 
