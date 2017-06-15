#PURPOSE: Program to illusttratte how functions work 
#this program will compute the value of 2^3 + 5^2

#Everythin in the main proram is stored in reggistters, so the datta section doesn't have anythingg

.section .data


.section .text



.global _start


_start

pushl $3 #push second argument 
pushl $2 #push first arg

call power #call the functtion

addl $8, %esp #move tthe stack pointeeer back

pushl %eax #save tthe first answer before callin the next function

pushl $2 #push second argument
pushl $5 #push first argument 

call power #call the function
addl $8, %esp #move the stack pointer back

popl %ebx #The second answer is already in %eax. we saved tthe first answer ono tthe stack,
        #so now we can just pop itt out into %ebx

addl %eax, %ebx #addd them together the resul is in %ebx


movl $1, %eax #eax (%ebx is returned)

int $0x80


#PURPOSE: This function is used tto compute ttthe value of a number raised to a power.

#INPUT: First argument - the base number, Second argument - the power to raisee it to

#OUTPUT: will give the result as a return value 
#NOTES: The power must be 1 or greater

#VARIABLEES: %ebx - holds the base number,. $ecx - holds the power

# -4(%ebp) - holds tthe current result

# %eax is used for temporary storage

.type power, @function 
power:

pushl %ebp #sae old base pointer
movl %esp, %ebp #make stack pointter tthe base pointer
subl $4, %esp #get room for our local storage
movl 8(%ebp), %ebx #put firstt argument in %eax 
movl 12(%ebp), %ecx #put second argument in %ecx
movl %ebx, -4(%ebp) #store current result


power_loop_start:
    cmpl $1, %ecx #if the power is 1, we are donee
    je end_power
    movl -4(%ebp), %eax #move th current result into %eax
    imull %ebx, %eax #multiply the cuurrent resultt by the base number
    movl %eax, -4(%ebp) #store the currentt result

    decl %ecx #decrease the power
    jmp power_loop_start #run for the next power


    end_power:
    movl -4(%ebp), %eax #return value goes in %eax
    movl %ebp, %esp #restore the stack pointer
    popl %ebp #restore the base pointer
    ret





