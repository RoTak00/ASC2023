section .data

    rNum1 db "Introdu a",0xa,0
    rNum2 db "Introdu b",0xa,0

    suma db "suma = %ld",0xa,0
    scan db "%ld"

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

    mov rdi, rNum1
    mov rax, 0
    call printf

    mov rdi, scan
    mov rsi, a
    mov rax, 0
    call scanf

    mov rdi, rNum2
    mov rax, 0
    call printf

    mov rdi, scan
    mov rsi, b
    mov rax, 0
    call scanf

    mov rcx, [a]
    add rcx, [b]

    mov rdx, 0
    mov rax, rcx
    mov rcx, dword 2

    div rcx

    mov rcx, rax

    mov rdi, suma
    mov rsi, rcx
    mov rax, 0
    call printf

    ExitProgram:

    mov rsp, rbp
    pop rbp
    mov rax, 60
    mov rdi, 0
    syscall



