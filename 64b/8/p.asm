section .data
    format_float db "%lf"
    format_output db "Result: %lf",0xa,0

    C1 dq 945.0
    C2 dq -189.0
    C3 dq 21.0
    C4 dq 2.0

    NEG_1 dq -1.0


section .bss
    
    numerator resq 1
    numitor resq 1
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

    ; calculam numaratorul in xmm0
    movsd xmm0, [x]

    ; x^2
    movsd xmm1, [x]
    mulsd xmm0, xmm1
    
    ; 2 * x^2
    movsd xmm1, [C4]
    mulsd xmm0, xmm1

    ; 21 + 2 * x ^ 2
    movsd xmm1, [C3]
    addsd xmm0, xmm1

    ; x * (21 + 2 * x ^ 2)
    movsd xmm1, [x]
    mulsd xmm0, xmm1

    ; x ^ 2 * (21 + 2 * x ^ 2)
    movsd xmm1, [x]
    mulsd xmm0, xmm1

    ; - x ^ 2 * (21 + 2 * x ^ 2)
    movsd xmm1, [NEG_1]
    mulsd xmm0, xmm1

    ; -189 - x ^ 2 * (21 + 2 * x ^ 2)
    movsd xmm1, [C2]
    addsd xmm0, xmm1

    ; x * ( -189 - x ^ 2 * (21 + 2 * x ^ 2))
    movsd xmm1, [x]
    mulsd xmm0, xmm1

    ; x ^ 2 * ( -189 - x ^ 2 * (21 + 2 * x ^ 2))
    movsd xmm1, [x]
    mulsd xmm0, xmm1

    ; 945 + x ^ 2 * ( -189 - x ^ 2 * (21 + 2 * x ^ 2))
    movsd xmm1, [C1]
    addsd xmm0, xmm1

    movsd [numerator], xmm0

    movsd xmm0, [x]
    ; 945 * x
    movsd xmm1, [C1]
    mulsd xmm0, xmm1

    movsd [numitor], xmm0

    ; calculez fractia
    movsd xmm0, [numerator]
    movsd xmm1, [numitor]

    divsd xmm0, xmm1

    mov rdi, format_output
    mov rax,1
    call printf

    add rsp, 16
    
    mov rsp, rbp
    mov eax, 60
    xor edi, edi
    syscall

