section .data
    x dd 1.2   ; Input value of x for which sin(x) will be approximated

    print_string db "%0.2f",0xa
    buffer db 16

section .text
    extern printf
    extern scanf

    global main
main:
    ; Your code goes here

    ; Compute the Taylor expansion of sin(x) up to the 4th term
    fld dword [x]         ; Load x onto the FPU stack

    fmul dword [x]        ; Multiply x by x (x^2)
    fdiv dword [factorial2]  ; Divide by 2! (2)
    fsubrp st1, st0       ; Subtract (x^2 / 2!) from x

    fmul dword [x]        ; Multiply x by x^2 (x^3)
    fdiv dword [factorial3]  ; Divide by 3! (6)
    faddp st1, st0        ; Add (x^3 / 3!) to the result

    fmul dword [x]        ; Multiply x by x^3 (x^4)
    fdiv dword [factorial4]  ; Divide by 4! (24)
    fsubrp st1, st0       ; Subtract (x^4 / 4!) from the result

    ; Result is now in st0

    ; Rest of your code goes here


    sub esp, dword 8              ; Allocate space on the stack for the floating-point number
    fstp qword [esp]        ; Store the value in st0 onto the stack

    push buffer             ; Push the buffer address onto the stack
    push dword print_string      ; Push the format string address onto the stack
    call printf             ; Call the C library printf function to print the number

    add esp, 12 
    ; Exit the program
    mov eax, 60
    xor edi, edi
    syscall

section .data
    factorial2 dd 2.0    ; Constant value of 2!
    factorial3 dd 6.0    ; Constant value of 3!
    factorial4 dd 24.0   ; Constant value of 4!