.data

    HelloWorrld:
        .asciz "Hello Worrld!\n"

    ZeroFlagSet:
        .asciz "Zero Flag Set!"

    ZeroFlagNotSet:
        .asciz "Zero Flag Not Set!"


.text

    .global _start

    _start:

    nop

    movl $10, %eax
    jz FlagSetPrint


    FlagNotSetPrint:
        movl $4, %eax
        movl $1, %ebx
        leal ZeroFlagNotSet, %ecx
        movl $19, %edx
        int $0x80
        jmp ExitCall

    ExitCall:
        movl $1, %eax
        movl $0, %ebx
            int $0x80

    PrintHelloWorld:
        movl $10, %ecx
        PrintTenTimes:
            pushl %ecx
            movl $4, %eax
            movl $1, %ebx
            leal HelloWorrld, %ecx
            movl $4, %edx
            int $0x80
            popl %ecx
        loop PrintTenTimes
        jmp ExitCall


