.text
main:
	la      $a0, print_msg
	li      $v0, 4
	syscall			                # print the welcome message
	
	# $s0 save the input list HEAD
	jal     list_create
	move    $s0, $v0

main_loop:
	li      $v0, 5
	syscall			                # read number
	move    $s1, $v0
	li      $t0, 1
	blt     $s1, $t0, main_fwd	# if input<1 end input cycle
	move    $a0, $s0	
	move    $a1, $s1
	jal     list_add_end
	j       main_loop

main_fwd:
	move    $a0, $s0
	jal     runlength		        # runlength compression
	move    $a0, $v0	
	jal     list_print		      # print the o/p list
	li      $v0, 10
	syscall			                # end program

.data
print_msg: .asciiz "RUNLENGTH COMPRESSION:\nAfter each number press ENTER. Input ends when a non-positive number is entered.\n"



#**********************************************************************
#
# runlength.asm
#
# Description: This program takes as input the HEAD of a singly-linked
# list of positive integers and returns the runlength compression as
# a linked list (HEAD returned in $v0). This is a non-leaf routine.
# If a empty input list given, the head of the input list returned.
#
# Routine called: list_create, list_add_end
# Stack Sections: Saved registers(5), return address(1)
#
#**********************************************************************

.text
runlength:
  # start of prologue
  addiu $sp, $sp, -24
  sw    $s0, ($sp)
  sw    $s1, 4($sp)
  sw    $s2, 8($sp)
  sw    $s3, 12($sp)
  sw    $s4, 16($sp)
  sw    $ra, 20($sp)
  # end of prologue

# $s0 stores the current node of the input list
# $s1 stores the current number
# $s2 stores its count of the current number
# $s3 stores the HEAD of output list
# $s4 stores the (possibly) new number in the current node

  # initialization
  move  $s0, $a0			# initialize the current node to HEAD
  li    $s1, -1       # initialize the first no. to -1
  li    $s2, 0
  jal   list_create
  move  $s3, $v0

runlength_loop:
  lw    $s4, ($s0)
  li    $t1, -1
  beq   $s4, $t1, runlength_end   # return, if the end of the
                                  # input list is reached
  beq   $s4, $s1 runlength_increment	# if the same no.
                                      # increment count
  # If a new number is encountered,
  # add current no. and its count to the output list
  beq   $s1, $t1, runlength_fwd   # Initiallly, $s1=-1,
                                  # which MUST NOT be added, hence skip
  move  $a0, $s3
  move  $a1, $s2
  jal   list_add_end              # add the conut of the number to o/p list
  move  $a0, $s3
  move  $a1, $s1
  jal   list_add_end              # next add the number to o/p list

runlength_fwd:
  move  $s1, $s4                  # save the new number in $s1
  li    $s2, 1                    # reset the new counter to 1
  lw    $s0, 4($s0)               # goto the next node in i/p list
  j     runlength_loop            # loop

runlength_increment:
  addi  $s2, $s2, 1               # increment count (NOTE: CHECK OVERFLOW ISSUES)
  lw    $s0, 4($s0)               # point to next node
  j     runlength_loop            # loop

runlength_end:
  #save the most current number
  li    $t1, -1
  beq   $s1, $t1, runlength_epi   # if the list is empty, just return the i/p
  move  $a0, $s3                  # else add the last node
  move  $a1, $s2
  jal   list_add_end              # add the count of the last node to o/p list
  move  $a0, $s3
  move  $a1, $s1
  jal   list_add_end              # add the last node to o/p list

runlength_epi:
  move  $v0, $s3
  # start of epilogue
  lw    $s0, ($sp)
  lw    $s1, 4($sp)
  lw    $s2, 8($sp)
  lw    $s3, 12($sp)
  lw    $s4, 16($sp)
  lw    $ra, 20($sp)
  addiu $sp, $sp, 24		          # pop stack frame
  jr    $ra
  # end of epilogue

#**********************************************************************
#	End of runlength.asm
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
