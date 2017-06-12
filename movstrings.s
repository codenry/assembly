.data

    HelloWorldString:
        .ascii "Hello World of Assembly"

        H3110:
            .asciz "H3110"

.bss

    .lcomm Destination, 100
    .lcomm DestinationUsingRep, 100
    .lcomm DestinationUsingStore, 100

.text

    .global _start

    _start:
        
        nop
        #1. Simple copying using movsb, movsw, movsl

        movl $HelloWorldString, %esi
        movl $Destination, %edi


        movsb
        movsw
        movsl

        #2. Setting / clearing the DF flag 

        std # set the DF flag
        cld # clear the DF flag

        # 3. Using Rep
        
        movl $HelloWorldString, %esi
        movl $DestinationUsingRep, %edi
        movl $25, %ecx #Set the string length in ECX
        cld # clear the DF

        rep movsb 
        std

        # 4. Loading string from memory into EAX register

        cld
        leal HelloWorldString, %esi 




