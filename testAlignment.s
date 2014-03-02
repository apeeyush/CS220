.data
mystr: .ascii "thi"
mystr2: .asciiz "s is a string."
pow2:	.word 1,2,3,4
	
nl:	 .asciiz "\n"
	
.text
main:
	la $a0, mystr #print address of mystr
        li $v0, 1
        syscall  
        la $a0, nl # newline
        li $v0, 4
        syscall

	la $a0, mystr2 #print address of mystr2
        li $v0, 1
        syscall  
        la $a0, nl # newline
        li $v0, 4
        syscall

        la $a0, mystr #print contents of mystr
        li $v0, 4
        syscall
        la $a0, nl # newline
        li $v0, 4
        syscall

        la $a0, pow2 #print address of pow2
        li $v0, 1
        syscall
        la $a0, nl # newline
        li $v0, 4
        syscall

        li $v0, 10 #exit
        syscall
