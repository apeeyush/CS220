# mccarthy91.asm
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
	#and store in $t0
	move $a0, $v0
#Call the recursive mccarthy91 and copy result from $v0 in $t1
	jal mccarthy91
	move $t1, $v0
#Print the result
done:
	#First the message
	la $a0, result_msg
	li $v0, 4
	syscall
	#Then the value
	move $a0, $t1
	li $v0, 1
	syscall
	#Then newline
	la $a0, nl_msg
	li $v0, 4
	syscall
#exit
	li $v0, 10
	syscall


# Recursive function mccarthy91
# Specifications :
# $a0 : parameter
# $v0 : return value
mccarthy91:
	addi $sp, $sp, -4			#Space for a word
	sw $ra, 0($sp)				#Save $ra for later use
	li $v0, 1
	# If $a0 greater than 100, calculate $a0-10 and return
	li $t9, 100
	bgt $a0, $t9, mccarthy91_decrease
	# Otherwise calculate mccarthy91(n+11)
	addi $a0, $a0, 11
	jal mccarthy91
	#Now mccarthy91(n+11) is in $v0, n+1 is in $a0
	move $a0, $v0
	#Calculate mccarthy91(mccarthy91(n+11))
	jal mccarthy91
mccarthy91_return:
	lw $ra, 0($sp)				#restore $ra
	addi $sp, $sp, 4			#restore $sp
	jr $ra
mccarthy91_decrease:
	addi $v0, $a0, -10
	j mccarthy91_return

.data
query_msg: .asciiz "Input:"
result_msg: .asciiz "Mccarthy91 value is = "
nl_msg: .asciiz "\n"
