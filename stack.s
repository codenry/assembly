.data

    HelloWorld:
        .asciz "HelloWorld!\n"


.text

    .global _start
    
    .type PrintFunction, @function

    PrintFunction:

        pushl %ebp #stor the curreent value of EBP on the stack
        movl %esp, %ebp

        #The write function

        movl $4, %eax
        movl $1, %ebx
        movl 8(%ebp), %edx
        movl 12(%ebp), %edx
        int $0x80

        movl %ebp, %esp #Restore the old value of ESP
        popl %ebp #Restore the old value of EBP
        ret #Changge EIP tto start the neext instruction


        _start:

        nop

        #Push the strlen on the stack
        pushl $13

        #push the string poiner on the stack
        pushl $HelloWorld

        #call the functtion

        call PrintFunction 

        #adjus the stack pointer
        addl $8, %esp

        #Exit  Routine
        
        ExitCAll:
            movl $1, %eax
            int $0x80


