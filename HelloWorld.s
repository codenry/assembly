#my first assembly program

.data

HelloWorldString:
    .ascii "Hellow World\n"

.text

.global _start

_start:

    #Load all the arguments for write ()

    movl $4, %eax
    movl $1, %ebx
    movl $HelloWorldString, %ecx
    movl $12, %edx

    int $0x80

    #Need to exit the program
    movl $1, %eax
    movl $0, %ebx
    int $0x80
