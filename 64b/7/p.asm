section .data
    format_float db "%lf"
    format_output db "Result: %lf",0xa,0

    one dq 1.0

section .bss
    x resq 1

section .text
    extern printf, scanf
    global main

    main:

    push rbp
    mov rbp, rsp

    mov rdi, format_float
    mov rax, 1
    call scanf
    movsd [x], xmm0

    movsd xmm0, [x]
    mulsd xmm0, xmm0
    movsd xmm1, [one]
    
    divsd xmm1, xmm0


    mov rdi, format_output
    movsd xmm0, xmm1
    mov rax,1
    call printf

    add rsp, 16
    
    mov rsp, rbp
    mov eax, 60
    xor edi, edi
    syscall

