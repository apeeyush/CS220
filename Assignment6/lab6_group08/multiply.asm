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
			jal     list_add_end
			j       main_loop_a
	# Now Create second list and save list head in $s2
		main_fwd_a:	
			jal     list_create
		move    $s2, $v0

		main_loop:
			li      $v0, 5
			syscall			                    # read number
			move    $s1, $v0
			li      $t0, 0
			blt     $s1, $t0, main_fwd	#if input< 0 end input cycle
			li      $t0, 9		
			bgt     $s1, $t0, main_fwd	#if input > 9 end input cycle
			move    $a0, $s2	
			move    $a1, $s1
			jal     list_add_end
			j       main_loop	

		main_fwd:
		# Print lists to ensure that input is entered correctly
		# and then reverse lists before multiplication
			move    $a0, $s0
			jal     list_print		          	# print a
			move    $a0, $s0
			jal     list_reverse
			move    $s0, $v0		            # reverse a
			
			move    $a0, $s2
			jal     list_print			        # print b
			move    $a0, $s2
			jal     list_reverse
			move    $s2, $v0		            # reverse b
	
			move    $a0, $s0
			move    $a1, $s2
			jal     multiply		            # multiply
			move    $a0, $v0	
			jal     list_reverse  	         	# reverse o/p
			move    $a0, $v0
			jal     list_print              	# print the o/p list
			li      $v0, 10
			syscall			                    # end program


# multiply
#
# Description: This routine takes two singly-linked lists of 
# non-negative integers as input (HEADS in $a0 and $a1) and returns the
# multiplication of them in the form of another list (HEAD in $v0).
# In case any of its arguments is an empty list, the output is the HEAD
# of the empty input list (If both inputs are empty, the output is $a0)
# This is a leaf-type routine as it calls other routines.
# Let the number in the list pointed by $a0 be a and that by $a1 be b.
# NOTE: The i/p lists must have numbers such that the LSB occurs first
# and MSB occurs last. The o/p list is formatted in the same way.
#
# Routines called: list_create, list_add_end, list_search
# Stack Frame Sections: saved registers(8), return address(1)

.text
multiply:
	# start of prologue
	addiu $sp, $sp, -36
	sw    $s0, ($sp)
	sw    $s1, 4($sp)
	sw    $s2, 8($sp)
	sw    $ra, 32($sp)	
	# end of prologue

# $s0 stores the HEAD of a (multiplicand)
# $s1 stores the HEAD of b (multiplier)
# $s2 stores the HEAD of output
# $s3 stores the current node in multiplier (b)
# $s4 stores the count
# $s5 save the node address $s4 in o/p list incase $s4.next is a NULL node
# $s6 is the current running node in of multiplicand(a) in the subloop
# $s7 is the current running node in of the o/p list in the subloop

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
	# create the output list
		jal   list_create		          			# create the output list
		move  $s2, $v0		            			# save the o/p HEAD in $s2
		move  $s3, $s1		            			# current node in multiplier
                                # initialized to HEAD of b
	li    $s4, 0                  # current node in o/p initialized to its HEAD

# Creating the O/P List (Raw)
multiply_loop:
	lw    $t1, ($s3)
	li    $t2, -1
	beq   $t1, $t2, multiply_fwd	# proceed as creation stage is complete

	li    $t0, 0
	move  $s7, $s2
multiply_loop_init:
	bge   $t0, $s4, multiply_loop_escape
	addi  $t0, $t0, 1		
	lw    $s7, 4($s7)
	j     multiply_loop_init

multiply_loop_escape:	
	move  $s6, $s0			
			# initialize current running node in the subloop
	

multiply_subloop:
	lw    $t1, ($s6)
	li    $t2, -1
	beq   $t1, $t2, multiply_subloop_break	  # if last a is reached, break subloop

	li    $t2, -1
	lw    $t1, ($s7)			        # load no. stored in $s4
	beq   $t1, $t2, multiply_subloop_addnode	# if($s4.num == -1) save $s4 in $s5

	# if s7.num != -1
	lw    $t0, ($s3)
	lw    $t1, ($s6)
	mult  $t0, $t1
	mflo  $t0		                  # multiply digits $s6.num * $s3.num , store in $t0

	lw    $t1, ($s7)		          # load the current number in o/p node

	#(* NOTE: ADD CHECK FOR OVERFLOW *)	
	add   $t0, $t0, $t1		        # add the nos. 

	sw    $t0, ($s7)			        # update the o/p node
	lw    $s7, 4($s7)			        # increment $s7
	lw    $s6, 4($s6)			        # increment $s6

	#(* REMARK: $s5, the backup prev. register is not used *)
	j     multiply_subloop 

multiply_subloop_addnode:
  # if s7.num == -1
	# prev. of $s4 i.e. the last non-NULL node is stored in $s5
	lw    $t0, ($s3)
	lw    $t1, ($s6)
	mult  $t0, $t1		            # multiply $s6.num * $s3.num
	mflo  $t0		                  # $t0 stores the result
                                # (hi = 0 since we multiplying digits)

	move  $a0, $s2
	move  $a1, $t0		            # need to add a node with val $t0

	jal   list_add_end
	
	# the new $s7 is the last node
	move  $a0, $s2
	li    $a1, -1
	jal   list_search
	
	move  $s7, $v0		            # the last node is the new $s7
	lw    $s6, 4($s6)		          # increment $s6
	

 	j     multiply_subloop
	
multiply_subloop_break:
  # break the subloop
	lw    $s3, 4($s3)
	addi  $s4, $s4, 1		          # CHECK OVERFLOW ISSUES
	j     multiply_loop		        # loop the main loop

# REFINING THE O/P LIST (i.e. all the elements of it are digits
# $t0 contains the current node in the o/p
# $t1 is the carry

multiply_fwd:
	move  $t0, $s2

multiply_refine:
	lw    $t2, ($t0)
	li    $t4, -1
	beq   $t2, $t4, multiply_end 	# end if the refinement is completed

	li    $t3, 10
	div   $t2, $t3	              # $t2/10
	mfhi  $t3	                    # move remainder
	sw    $t3, ($t0)	            # store in current node
	
	li    $t3, -1
	lw    $t6, 4($t0)	            # load the address of next node
	lw    $t2, ($t6)	            # load the next number
	beq   $t2, $t3, multiply_refine_addnode	  # add a node if this dosent work	
	#else

	mflo  $t3	                    # move quotient
	add   $t3, $t3, $t2	          # (* CHECK OVERFLOW ISSUES *)

	sw    $t3, ($t6)	            # update the next node

	lw    $t0, 4($t0)	            # increment $t0
	j     multiply_refine

multiply_refine_addnode:
	mflo  $a1	
	move  $a0, $s2
	jal   list_add_end            # append the quotient to the list
	move  $a0, $s2
	li    $a1, -1
	jal   list_search
	move  $t0, $v0	              # the last node the next $t0
	j     multiply_refine
	
multiply_end:
	move  $v0, $s2
	# start of epilogue
	lw    $s0, ($sp)
	lw    $s1, 4($sp)
	lw    $s2, 8($sp)
	lw    $ra, 32($sp)
	addiu $sp, $sp, 36
	jr    $ra
	# end of epilogue

#**********************************************************************
#	End of multiply.asm
#**********************************************************************



#****************************************************************************************************
#
# This is a collection of preliminary operations on singly-linked lists containing positive integers.
# These routines were written in MIPS32 assembly language.
# NULL is defined as the node that contains the number -1.
# If the register $t0 points to a node in the list, then ($t0) is the number(>= -1) stored in the node,
# and 4($tp) is the location where the address of the next node is stored.	   
#
# 1. list_create.asm
#	Creates a NULL initialized list and returns its HEAD.	
# 2. list_add_beg.asm
#	Adds a node to the beginning of the list containing the number in the argument ($a1) 
#	and returns the new HEAD.
# 3. list_add_end.asm
#	Adds a node at the end of the list containing the number in $a1. No return	
# 4. list_delete.asm
#	Deletes the node pointed to by the register $a1, and returns the new HEAD.
# 5. list_search.asm
#	Searches the list for a node containing the number in $a1. If found, the index of the
#	first encounter while travelling from the HEAD is returned. If not found, then the address
#	of the TAIL (a NULL node) is returned in $v0. 
#	NOTE: When searching for '-1' (i.e. the TAIl node), it returns the address of TAIL correctly.	
# 6. list_print.asm
#	Print the contents of a list in  a line.
# 7. list_reverse.asm
#	Reverses a given list.
#
#----------------------------------------------------------------------
# List function: 	list_create
# Arguments: 		NONE
# Return:		Returns the address of a -1 initialized list
#			in register $v0.
# Rountine called:	NONE
# Routine type:		leaf
# Stack Frame Sections:	NONE 
#----------------------------------------------------------------------		


.text
list_create:
	li $a0, 8		#Need 8 bytes assigned, first for number
				#second byte for the pointer to next node.
	li $v0, 9
	syscall			#call sbrk, HEAD in $v0
	li $t1, -1
	sw $t1, ($v0)		#store -1 in the 'int' section (empty list)
	jr $ra
			
#----------------------------------------------------------------------
# List function: 	list_add_beg	
# Arguments: 		HEAD ($a0), number($a1)
# Return:		HEAD ($v0)	
# Rountine called:	list_create	
# Routine type:		leaf	
# Stack Frame Sections:	saved register(2), return address(1) 
#----------------------------------------------------------------------		

.text
list_add_beg:
	#start of prologue
	addiu $sp, $sp, -12
	sw $s0, ($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	#end of prologue

	move $s0, $a0
	move $s1, $a1	
	jal list_create		#create an -1 node
	move $t0, $v0
	sw $s1, ($t0)		#initialize it to the number
	sw $s0, 4($t0)		#make the prev HEAD next to this node
	move $v0, $t0	

	#start of epilogue
	lw $s0, ($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	addiu $sp, $sp, 12
	jr $ra
	#end of epilogue

#----------------------------------------------------------------------
# List function: 	list_add_end	
# Arguments: 		HEAD ($a0), number($a1)
# Return:		NONE	
# Rountine called:	list_search, list_create	
# Routine type:		non-leaf	
# Stack Frame Sections:	saved register(1), return address(1) 
#----------------------------------------------------------------------		

.text
list_add_end:
	#start of prologue
	addiu $sp, $sp, -8
	sw $s0, ($sp)
	sw $ra, 4($sp)
	#end of prologue

	move $s0, $a1		#save $a1 in $s0
	li $a1, -1
	jal list_search
	move $t0, $v0		#save the index of last node in $t0
	sw $s0, ($t0)		#store the current number in last node
	jal list_create
	sw $v0, 4($t0)		#point to the last node which is empty		

	#start of epilogue
	lw $s0, ($sp)
	lw $ra, 4($sp)
	addiu $sp, $sp, 8
	jr $ra
	#end of epilogue

#----------------------------------------------------------------------
# List function: 	list_delete	
# Arguments: 		HEAD($a0),index($a1)
# Return:		HEAD($v0)
# Rountine called:	NONE
# Routine type:		leaf
# Stack Frame Sections:	NONE 
#----------------------------------------------------------------------		

.text
list_delete:
	li $t0, -1
	lw $t1, ($a1)
	beq $t0, $t1, list_delete_none #if  NUll is $a1, dont do anything

	beq $a0, $a1, list_delete_head	#the head is to be deleted
	move $t0, $a0			#initialize $t0 to HEAD
	
#$t0 is the current index, $t2 is the previous index in this loop
list_delete_loop:
	beq $t0, $a1, list_delete_fwd
	move $t2, $t0
	lw $t0, 4($t0)		#goto the next node
	j list_delete_loop

list_delete_fwd:
	# $t2 now stores the index prev to $a1 if it is not HEAD
	lw $t0, 4($a1)		#store the next index of the to-be-deleted in $t0
	sw $t0, 4($t2)		#link the next of $a1 to the prev.
	j list_delete_none

list_delete_head:
	#Hence, the node to be deleted is the HEAD
	lw $v0, 4($a0)
	jr $ra			#return the next index as HEAD 

list_delete_none:
	move $v0, $a0		#return the HEAD as usual
	jr $ra			#return

#----------------------------------------------------------------------
# List function: 	list_search	
# Arguments: 		HEAD($a0), number to be searched($a1)
# Return:		index($v0) if the positive number was found
#			$v0 is the tail address if not-found
# Rountine called:	NONE
# Routine type:		leaf
# Stack Frame Sections:	NONE 
#----------------------------------------------------------------------		

.text
list_search:
	lw $t1, ($a0)		#whats in HEAD to $t1
	move $t0, $a0
	beq $t1, $a1, list_search_end	#when found end

	move $t0, $a0		#initialize current index to HEAD	
list_search_loop:
	lw $t1, ($t0)		#store the no. in current node in $t1
	li $t2, -1		
	beq $t1, $a1, list_search_end		#return if found
	beq $t1, $t2, list_search_end		#not found, return the address of tail 
	lw $t0 , 4($t0)				#if not load the next index
	j list_search_loop

list_search_end:
	move $v0, $t0 
	jr $ra


#----------------------------------------------------------------------
# List function: 	list_print	
# Arguments: 		HEAD($a0) of list to be printed	
# Return:		NONE	
# Rountine called:	NONE
# Routine type:		leaf
# Stack Frame Sections:	NONE 
#----------------------------------------------------------------------		

.text
list_print:
	move $t0, $a0		#save the HEAD in $t0
	la $a0, print_newline
	li $v0, 4
	syscall			#print a newline
	# print the output list	
	#$t0 points at the current o/p node, initialized at HEAD

list_print_loop:
	li $t1, -1
	lw $t2, ($t0)
	beq $t1, $t2, list_print_end	#if end of o/p list reached, end
	move $a0, $t2
	li $v0, 1		
	syscall			#print output number
	la $a0, print_space	
	li $v0, 4
	syscall			#print space
	lw $t0, 4($t0)
	j list_print_loop	#print loop	

list_print_end:
	la $a0, print_newline
	li $v0, 4
	syscall			#print newline
	jr $ra

.data
print_newline: .asciiz "\n"
print_space: .asciiz " "

	
#----------------------------------------------------------------------
# List function: 	list_reverse	
# Arguments: 		HEAD ($a0)	
# Return:		HEAD of reversed list ($v0)
# Rountine called:	list_search
# Routine type:		non-leaf
# Stack Frame Sections:	Saved registers(3), return address(1) 
#----------------------------------------------------------------------		

.text
list_reverse:
	#start of prologue
	addiu $sp, $sp, -16
	sw $s0, ($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $ra, 12($sp)
	#end of prologue
	
# $s0 stores the HEAD of i/p list
# $s1 stores the HEAD of the o/p list
# $s2 points to the LAST node (NULl node) in the i/p list

	move $s0, $a0		#save the HEAd of i/p
		
	move $s1, $s0
	li $t0, -1
	lw $t1, ($s0)		#check if i/p is empty
	beq $t0, $t1, list_reverse_epi	#return i/p if its is empty	

	move $a0, $s0
	li $a1, -1
	jal list_search
	move $s2, $v0		#save the addr of LAST node

	# in the beginning od each iteration, every node- 
	# before $t0 (including $t0) in i/p is reversed.
	# $t0 contains the current node in i/p list
	# $t2 contains the $t0.next
	
	
	move $t0, $s0		#initialized to HEAD
	lw $t2, 4($s0)		#initialize the next pointer to HEAD.next
	sw $s2, 4($s0)		#link the input's HEAD to the last (NULL) node 
list_reverse_loop:
	beq $t2, $s2, list_reverse_end	#go to end sequence if next node is last
	lw $t1, 4($t2)		#save the next node of $t2 in $t1
	sw $t0, 4($t2)		#set the next node of the $t0.next to $t0
	move $t0, $t2		#increment the node $t0
	move $t2, $t1		#increment the node of $t2
	j list_reverse_loop

list_reverse_end:		#sequence when the job is completed
	move $s1, $t0		#HEAD of the o/p is the second-last node in list
list_reverse_epi:
	move $v0, $s1
	#start of epilogue
	lw $s0, ($sp)	
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $ra, 12($sp)
	addiu $sp, $sp, 16
	jr $ra
	#end of epilogue


#*********************** End of List functions ************************************



.data
info_msg: .asciiz "This assembly program multiplies two numbers \nThe input format is as specified in the question\n"
nl_msg: .asciiz "\n"
space_msg: .asciiz " "