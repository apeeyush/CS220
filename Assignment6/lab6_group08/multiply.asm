# multiply.asm

.text
.globl main
main:

# Print the info message
	la $a0, info_msg
	li $v0, 4
	syscall

	# We will store the two large numbers in two singly linked lists

	# Create First List and save list head in $s0. 
		jal     list_create
		move    $s0, $v0
	# Also add the input given by the user to the list.
		main_loop_a:
			li      $v0, 5
			syscall			                    # read number
			move    $s1, $v0
			li      $t0, 0
			blt     $s1, $t0, main_fwd_a	  # if input< 0 end input cycle
			li      $t0, 9
			bgt     $s1, $t0, main_fwd_a	  # if input > 9 end input cycle
			move    $a0, $s0
			move    $a1, $s1
			jal     list_add
			j       main_loop_a
	# Now Create second list and save list head in $s2
		main_fwd_a:	
			jal     list_create
		move    $s2, $v0

		main_loop_b:
			li      $v0, 5
			syscall			                    # read number
			move    $s1, $v0
			li      $t0, 0
			blt     $s1, $t0, main_fwd	#if input< 0 end input cycle
			li      $t0, 9		
			bgt     $s1, $t0, main_fwd	#if input > 9 end input cycle
			move    $a0, $s2	
			move    $a1, $s1
			jal     list_add
			j       main_loop_b

		main_fwd:
		# Print lists to ensure that input is entered correctly
		# and then reverse lists before multiplication
		# Printing list a and then reversing it
			# Print list a
				# First the message
					la $a0, print_a
					li $v0, 4
					syscall
				# Then the value
					move    $a0, $s0
					jal     list_print
			# Reverse the list
				move    $a0, $s0
				jal     list_reverse
			move    $s0, $v0		            # reverse a
		# Printing list b and then reversing it
			# Print list b
				# First the message
					la $a0, print_b
					li $v0, 4
					syscall
				# Then the value
					move    $a0, $s2
					jal     list_print
			# Reverse the list
				move    $a0, $s2
				jal     list_reverse
				move    $s2, $v0		            # reverse b
		# Multiplication Step
			move    $a0, $s0
			move    $a1, $s2
			jal     multiply		            # multiply
			move    $a0, $v0	
			jal     list_reverse  	         	# reverse output list
		# Print the result
			move    $a0, $v0
			jal     list_print              	# print the output list
		# Exit
			li      $v0, 10
			syscall			                    # end program


# multiply
# It takes two singly-linked lists as input and returns multiplication as linked list.
# $a0 = HEAD of list a
# $a1 = Head of list b
# The input lists must have numbers such that the LSB occurs first and MSB occurs last. 
# The output list is formatted in the same way.
# Routines called: list_create, list_add_end, list_search

.text
multiply:
# Save the values in $s0, $s1, $s2 and $ra as they will get modified during the run of multiplication.
	addiu $sp, $sp, -16
	sw    $s0, ($sp)
	sw    $s1, 4($sp)
	sw    $s2, 8($sp)
	sw    $ra, 12($sp)

# $s0 stores the HEAD of list a
# $s1 stores the HEAD of list b
# $s2 stores the HEAD of output
# $s3 stores the current node in b
# $s4 stores the count
# $s5 save the node address $s4 in output list incase $s4.next is a NULL node
# $s6 is the current running node in of multiplicand(a) in the subloop
# $s7 is the current running node in of the output list in the subloop

	move  $s0, $a0		# save HEAD of a
	move  $s1, $a1		# save HEAD of b

	# check if input list a is empty
		move  $s2, $a0		
		li    $t0, -1
		lw    $t1, ($s2)							# load the first digit in a
		beq   $t0, $t1, multiply_end				# if a empty, return HEAD of a
	# check if input list b is empty
		move  $s2, $a1
		lw    $t1, ($s2)
		beq   $t0, $t1, multiply_end				# if b empty, then return HEAD of b 
	# create the output list and store output head in $s2
		jal   list_create
		move  $s2, $v0
	# Initializations
		move  $s3, $s1		            			# current node in multiplier
		li    $s4, 0                  				# initialize count to 0

# Creating the output list
multiply_loop:
	lw    $t1, ($s3)
	li    $t2, -1
	beq   $t1, $t2, multiply_format_start			# proceed as creation stage is complete

	li    $t0, 0
	move  $s7, $s2									# initialize current running node to HEAD of output

multiply_loop_init:
	bge   $t0, $s4, multiply_loop_escape
	addi  $t0, $t0, 1		
	lw    $s7, 4($s7)
	j     multiply_loop_init

multiply_loop_escape:	
	move  $s6, $s0									# initialize current running node in the subloop
	

multiply_subloop:
	lw    $t1, ($s6)
	li    $t2, -1
	beq   $t1, $t2, multiply_subloop_break	  		# if last a is reached, break subloop

	li    $t2, -1
	lw    $t1, ($s7)			        			# load no. stored in $s4
	beq   $t1, $t2, multiply_subloop_addnode		# if($s4.num == -1) save $s4 in $s5

	lw    $t0, ($s3)				  				# Value of current node in list b
	lw    $t1, ($s6)								# Value of current node in list a
	mult  $t0, $t1
	mflo  $t0		                  				# multiply digits and store in $t0

	lw    $t1, ($s7)								# load the current number in output node
	add   $t0, $t0, $t1						        # add the numbers

	sw    $t0, ($s7)
	lw    $s7, 4($s7)						        # increment current output node
	lw    $s6, 4($s6)			        			# increment current node in a

	j     multiply_subloop 

	multiply_subloop_addnode:
		# prev. of $s4 i.e. the last non-NULL node is stored in $s5
		lw    $t0, ($s3)
		lw    $t1, ($s6)
		mult  $t0, $t1									# multiply $s6.num * $s3.num
		mflo  $t0										# $t0 stores the result

		# need to add a node with val $t0
		move  $a0, $s2
		move  $a1, $t0
		jal   list_add

		# the new $s7 is the last node
		move  $a0, $s2
		li    $a1, -1
		jal   list_search

		move  $s7, $v0									# the last node is the new $s7
		lw    $s6, 4($s6)		          				# increment current node in a

 		j     multiply_subloop

multiply_subloop_break:
	lw    $s3, 4($s3)								# Increment current node in b
	addi  $s4, $s4, 1								# Increment the count by 1
	j     multiply_loop


# Multiplication has been done. Now we need to shift carry values to next nodes in linked list
# multiply_format will format the answer linked list in correct format
# $t0 contains the current node
# $t1 contains the carry

multiply_format_start:
	move  $t0, $s2

multiply_format:
	lw    $t2, ($t0)

 	# end if the format is completed	
	li    $t4, -1
	beq   $t2, $t4, multiply_end

	li    $t3, 10
	div   $t2, $t3	          	    # $t2/10
	mfhi  $t3	                    # move remainder to $t3
	sw    $t3, ($t0)	            # store the remainder in current node

	li    $t3, -1
	lw    $t6, 4($t0)	            # load the address of next node
	lw    $t2, ($t6)	            # load the next number
	beq   $t2, $t3, multiply_format_addnode	  # add a node if this dosent work

	mflo  $t3	                    # move quotient in $t3
	add   $t3, $t3, $t2
	sw    $t3, ($t6)	            # update the next node

	lw    $t0, 4($t0)	            # increment $t0
	j     multiply_format

multiply_format_addnode:
	mflo  $a1	
	move  $a0, $s2
	jal   list_add
	move  $a0, $s2           		# append the quotient to the list
	li    $a1, -1
	jal   list_search
	move  $t0, $v0					# the last node the next $t0
	j     multiply_format

# Restore old values as multiplication has finished and return output head in $v0
multiply_end:
	move  $v0, $s2
	lw    $s0, ($sp)
	lw    $s1, 4($sp)
	lw    $s2, 8($sp)
	lw    $ra, 12($sp)
	addiu $sp, $sp, 16
	jr    $ra

	

#list_reverse function that takes the Head in $a0 and returns the Head of the reversed list in $v0
# Rountine called:	list_search

.text
list_reverse:
	
	addiu $sp, $sp, -16
	sw $s0, ($sp)	#store the Head of the input list
	sw $s1, 4($sp)	#store the Head of the list to be returned
	sw $s2, 8($sp)	#store the last NIL node of the list
	sw $ra, 12($sp)
	move $s0, $a0	#store the Head of the list 
		
	move $s1, $s0
	li $t0, -1
	lw $t1, ($s0)	#if the list is empty
	beq $t0, $t1, list_reverse_empty	#return if list if empty	

	move $a0, $s0
	li $a1, -1
	jal list_search
	move $s2, $v0		#save the address of the last node

#Loop Invariant for the following iterations: In the beginning, $t0 and all nodes before it are reversed
#$t0 contains the current node in the given list, while $t2 contains the next node	
	
	move $t0, $s0		#initialize to Head
	lw $t2, 4($s0)		#initializ the next pointer to Head.next
	sw $s2, 4($s0)		#link the Head of the original list to the last(NIL) node 

list_reverse_loop:
	beq $t2, $s2, list_reverse_end	#go if the next node is last
	lw $t1, 4($t2)		#store the next node of $t2 in $t1
	sw $t0, 4($t2)		#set the next node of $t0.next to $t0
	move $t0, $t2		#increment $t0 node
	move $t2, $t1		#increment $t2 node
	j list_reverse_loop

list_reverse_end:		
	move $s1, $t0		#Head of the reversed list is the penultimate node in list

list_reverse_empty:
	move $v0, $s1
	lw $s0, ($sp)	
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $ra, 12($sp)
	add $sp, $sp, 16
	jr $ra

#We have developed the necessary helper functions to create a modular design. They are given henceforth.

#list_create function that returns address of an unitialized list set to -1 in register $v0
.text
list_create:
	li $v0, 9			#allocate memory
	li $a0, 8			#of size 8 bytes
	syscall				#call sbrk, Head stored in $v0
	li $t1, -1
	sw $t1, ($v0)		#store -1 in the 'int' section
	jr $ra				
	
#list_add function that takes head and the number in $a0 and $a1 and appends the number at the last position
.text
list_add:
	addi $sp,$sp,-8
	sw $s0,($sp)
	sw $ra,4($sp)

	move $s0, $a1		#store $a1 in $s0
	li $a1, -1
	jal list_search
	move $t0, $v0		#store the index of last node in $t0
	sw $s0, ($t0)		#store the number currently read in the last node
	jal list_create
	sw $v0, 4($t0)		#point to the last node(empty)

	lw $s0, ($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra
	
		
#list_search function to take list and number to be searched, and return the position at which the number is found
.text
list_search:
	lw $t1, ($a0)		#stores Head in $t1
	move $t0, $a0
	beq $t1, $a1, list_search_end	#when they are equal, number has been found, go to the end
	move $t0, $a0		#initialize $t0 to Head	

list_search_loop:
	lw $t1, ($t0)						#store the number in the current node in $t1
	li $t2, -1		
	beq $t1, $a1, list_search_end		#if found, go to end
	beq $t1, $t2, list_search_end		#if not found, the address of the last element(tail) is returned 
	lw $t0 , 4($t0)						#if not found, load next number in $t0
	j list_search_loop

list_search_end:
	move $v0, $t0 
	jr $ra


#list_print function that gives the head of the list in $a0
.text
list_print:
	move $t0, $a0		#store the Head in $t0
	la $a0, print_newline
	li $v0, 4
	syscall				#print a newline

list_print_loop:
	li $t1, -1
	lw $t2, ($t0)
	beq $t1, $t2, list_print_end	#if the list ends
	move $a0, $t2
	li $v0, 1		
	syscall			#print output number
	la $a0, space	
	li $v0, 4
	syscall			#give whitespace
	lw $t0, 4($t0)
	j list_print_loop		

list_print_end:
	la $a0, print_newline
	li $v0, 4
	syscall			#print newline
	jr $ra			#return control back



.data
info_msg: .asciiz "This assembly program multiplies two numbers \nThe input format is as specified in the question\n"
print_newline: .asciiz "\n"
space: .asciiz " "
print_a: .asciiz "List a is : "
print_b: .asciiz "List b is : "
ans_msg: .asciiz "The answer is : "