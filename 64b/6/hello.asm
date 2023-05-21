.LC1:
        .string "%f"
.LC2:
        .string "%lf"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-8], 1
        mov     DWORD PTR [rbp-12], 1
        pxor    xmm0, xmm0
        movsd   QWORD PTR [rbp-32], xmm0
        lea     rax, [rbp-40]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC1
        mov     eax, 0
        call    __isoc99_scanf
        movss   xmm0, DWORD PTR [rbp-40]
        cvtss2sd        xmm0, xmm0
        movsd   QWORD PTR [rbp-24], xmm0
        mov     DWORD PTR [rbp-36], 1
        jmp     .L2
.L5:
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, DWORD PTR [rbp-12]
        movapd  xmm1, xmm0
        mulsd   xmm1, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-8]
        test    rax, rax
        js      .L3
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, rax
        jmp     .L4
.L3:
        mov     rdx, rax
        shr     rdx
        and     eax, 1
        or      rdx, rax
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, rdx
        addsd   xmm0, xmm0
.L4:
        divsd   xmm1, xmm0
        movsd   xmm0, QWORD PTR [rbp-32]
        addsd   xmm0, xmm1
        movsd   QWORD PTR [rbp-32], xmm0
        neg     DWORD PTR [rbp-12]
        mov     eax, DWORD PTR [rbp-36]
        add     eax, eax
        add     eax, 1
        imul    eax, DWORD PTR [rbp-36]
        add     eax, eax
        cdqe
        mov     rdx, QWORD PTR [rbp-8]
        imul    rax, rdx
        mov     QWORD PTR [rbp-8], rax
        movss   xmm1, DWORD PTR [rbp-40]
        movss   xmm0, DWORD PTR [rbp-40]
        mulss   xmm0, xmm1
        cvtss2sd        xmm0, xmm0
        movsd   xmm1, QWORD PTR [rbp-24]
        mulsd   xmm0, xmm1
        movsd   QWORD PTR [rbp-24], xmm0
        add     DWORD PTR [rbp-36], 1
.L2:
        cmp     DWORD PTR [rbp-36], 5
        jle     .L5
        mov     rax, QWORD PTR [rbp-32]
        movq    xmm0, rax
        mov     edi, OFFSET FLAT:.LC2
        mov     eax, 1
        call    printf
        mov     eax, 0
        leave
        ret