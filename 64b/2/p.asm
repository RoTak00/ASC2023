section .data
    number1 dq 41
    number2 dq 41

    fmt1 db "Number1 >= Number2",0xa,0
    ;lenFmt1 equ $ - fmt1 

    fmt2 db "Number1 < Number2",0xa,0
    ;lenFmt2 equ $ - fmt2 

section .bss

section .text
    extern printf
    global main
main:
    push rbp
    mov rbp, rsp

    mov rax, [number1]
    mov rbx, [number2]

    cmp rax, rbx

    jge GreaterOrEqual
    
    LessOrEqual:

    mov rdi, fmt2
    mov rax, 0
    call printf

    jmp ExitProgram

    GreaterOrEqual:

    mov rdi, fmt1
    mov rax, 0
    call printf
    
    jmp ExitProgram

    ExitProgram:

    mov rsp, rbp
    pop rbp
    mov rax, 60
    mov rdi, 0
    syscall



