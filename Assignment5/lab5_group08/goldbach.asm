# goldbach.asm
.text
.globl main
main:

# Read the number
	# First the query message
	la $a0, query_msg
	li $v0, 4
	syscall
	# Now read the input
	li $v0, 5
	syscall
# If Read Number is Odd, Print -1
	li $s6, 2
	div $v0, $s6
	mfhi $t1
	bnez $t1, print_minus_one
# If Read Number is 2, Print -1
	beq $v0, $s6, print_minus_one
# Otherwise Call goldbach which will calculate the prime numbers
	move $t8, $v0
	move $t7, $v0
	sub $t7, $t7, 1
	jal goldbach
	move $t9, $v1
#Once Goldbach returns, print the answer
	#First the message
	la $a0, result_msg
	li $v0, 4
	syscall
	#Then the values
	move $a0, $t9
	li $v0, 1
	syscall
	#A Space
	la $a0, space_msg
	li $v0, 4
	syscall
	#Then the values
	sub $t9, $t8, $t9
	move $a0, $t9
	li $v0, 1
	syscall
	#Then newline
	la $a0, nl_msg
	li $v0, 4
	syscall
#Exit once values are printed
exit:
	li $v0, 10
	syscall

print_minus_one:
	#First the message
	la $a0, result_msg
	li $v0, 4
	syscall
	#Then the values
	li $a0, -1
	li $v0, 1
	syscall
	#A Space
	la $a0, space_msg
	li $v0, 4
	syscall
	li $a0, -1
	li $v0, 1
	syscall
	#Then newline
	la $a0, nl_msg
	li $v0, 4
	syscall
	#Exit
	b exit

# Returns one of the prime number(p) for n (Such that n-p is also prime)
# Function Specifications :
# $t7 : Goes down like -> {n-1,n-2,....,1}
# $t8 : Fixed Number n
# $v1 : Result (Initialised to 1)
goldbach:
	addi $sp, $sp, -4				#Space for a word
	sw $ra, 0($sp)					#Save $ra for later use
goldbach_loop:
	# Checking if p is prime by calculating it's totient value and storing it in $s0
	move $a0, $t7
	move $a1, $t7
	sub $a0, $a0, 1
	move $s3, $a0
	jal totient
	move $s0, $v0
	# Checking if n-p is prime by calculating it's totient value and storing it in $s2
	sub $s1, $t8, $t7
	move $a0, $s1
	move $a1, $s1
	sub $a0, $a0, 1
	move $s4, $a0
	jal totient
	move $s2, $v0
	# Storing p in $v1(Output)
	move $v1, $t7
	# Reducing p by 1 to carry on the loop
	sub $t7, $t7, 1
	# If p or n-p is not prime, we continue in the loop
	bne $s0, $s3, goldbach_loop
	bne $s2, $s4, goldbach_loop
	#Otherwise we end the loop and return
	b return_goldbach
# Answr calculated so Returning
return_goldbach:
	lw $ra, 0($sp)					#Restore $ra
	addi $sp, $sp, 4				#Restore $sp
	jr $ra


# Returns the totient
# Specifications :
# $a0 : Goes down like -> {n-1,n-2,....,1}
# $a1 : Fixed Number n
# $v0 : Result (Initialised to 1)
totient:
	addi $sp, $sp, -4				#Space for a word
	sw $ra, 0($sp)					#Save $ra for later use
	li $v0, 1 						#Initializing result by 1
totient_loop:
	# If a0 <= 1, Return the totient
	ble $a0, 1, return_totient
	# Calculating the GCD
	move $t1, $a0
	move $t2, $a1
	jal gcd
	move $t6, $t3 					#GCD stored in $t6
	# Incrementing $v0 by 1 if GCD is 1. For this calculate 1/GCD and add the quotient to $v0 (Will be 1 only when GCD=1)
	li $t5, 1
	div $t5, $t6
	mflo $t4
	add $v0, $v0, $t4
	# Decrement $a0 to coinue the loop
	sub $a0, $a0, 1
	b totient_loop
# Answr calculated so Returning
return_totient:
	lw $ra, 0($sp)					#Restore $ra
	addi $sp, $sp, 4				#Restore $sp
	jr $ra

#It takes two arguments $t1 and $t2 (such that $t1<$t2) and returns the gcd in $t3
#It also uses temporary vaiable $t0
gcd:
	# If $t1=0, return the value of $t2
	beqz $t1, return_gcd
	move $t0, $t1					#Storing value of $t1 temporarily
	div $t2, $t1
	mfhi $t1						#$t1 = $t2%$t1
	move $t2, $t0					#$t2 = $t0
	b gcd
return_gcd:
	move $t3, $t2					#Output has to be returned in $t3
	jr $ra

.data
query_msg: .asciiz "Input for Goldbach : "
result_msg: .asciiz "Ans = "
nl_msg: .asciiz "\n"
space_msg: .asciiz " "