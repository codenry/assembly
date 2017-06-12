#Demo program to show how to use datatypes and movx instructions

.data

    HelloWorld:
        .ascii "HelloWorld!"

    ByteLocation:
        .byte 10

    Int32:
        .int 2

    Int16:
        .short 3

    Float:
        .float 10.23

    IntegerArray:
        .int 10,20,30,40,50

.bss
    .comm LargeBuffer, 10000

.text

    .global _start

    _start:

        nop
    #1.mov immediate value into register

    movl $10, %eax
    
    #2.mov immediate value into memory location

    movw $50, Int16

    #3.Mov data from memory to register
    
    movl %eax, %ebx

    #4.Mov data from register to memory 
    movl Int32, %eax

    #5.mov data from memory to register 

    movb $3, %al
    movb %al, ByteLocation 

    #6. Mov data into indexed memory Location
    #Location is decided by BaseAddress(Offset, Index, DataSize)
    #Offset and Index must be register, DataSize can be a numerical value

    movl $0, %ecx
    movl $2, %edi
    movl $22, IntegerArray(%ecx, %edi, 4)





