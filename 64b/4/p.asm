section .data

    pNum1 db "%f",0xa,0
    num1 dq 3.14

section .bss
    a resq 1
    b resq 1

section .text
    extern printf
    extern scanf

    global main
main:
    push rbp
    mov rbp, rsp

    mov rdi, pNum1
    mov rsi, num1
    mov rax, 0
    call printf



    ExitProgram:

    mov rsp, rbp
    pop rbp
    mov rax, 60
    mov rdi, 0
    syscall



