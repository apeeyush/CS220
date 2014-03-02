# totient.asm
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
# Call totient function and store result in $t9
	move $a1, $v0
	move $a0, $v0
	sub $a0, $a0, 1
	jal totient
	move $t9, $v0
# Print the answer
	#First the message
	la $a0, result_msg
	li $v0, 4
	syscall
	#Then the value
	move $a0, $t9
	li $v0, 1
	syscall
	#Then newline
	la $a0, nl_msg
	li $v0, 4
	syscall
#exit
	li $v0, 10
	syscall

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
query_msg: .asciiz "Input : "
result_msg: .asciiz "Totient is = "
nl_msg: .asciiz "\n"