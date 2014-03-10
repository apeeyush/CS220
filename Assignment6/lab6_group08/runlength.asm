#runlength.asm file for run-length encoding
.text
.globl main
main:

la $a0, intro_msg
li $v0, 4
syscall				#print the introduction

la $a0, input_msg
li $v0, 4
syscall				#print the input rules

jal     list_create	#list_create returns with the address of the Head stored in $v0
move    $s0, $v0

input_loop:
	li      $v0, 5
	syscall			                #read number
	li      $t0, 1
	move    $s1, $v0
	blt     $s1, $t0, end_loop		#End input loop if number<1 , even though we expect the end of the list to be denoted by 0
	move    $a0, $s0	
	move    $a1, $s1
	jal     list_add				#jal with address of head in $a0 and the new number entered in $a1
	j       input_loop				#jump back to the beginning of the loop

end_loop:
	move    $a0, $s0
	jal     runlength		        #runlength encoding
	move    $a0, $v0	
	jal     list_print				#print the list
	li      $v0, 10
	syscall							#end the program

.data

intro_msg: .asciiz "This program take integers separated by a newline character as input\n"
input_msg: .asciiz "Start the Input (0 and two consecutive newlines denote the end of input)\n"
print_newline: .asciiz "\n"
space: .asciiz " "

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
	add $sp,$sp,-8
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
	add $sp, $sp, 8
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

#runlength.asm THe Head is passed as argument is $a0, and the runlength encoding is returned
#(the Head of the linked list is returned in $v0).
#For empty lists, the head is returned
#Functions called: list_create, list_add

.text
runlength:
  #store values
  add $sp, $sp, -24
  sw    $s0, ($sp)	#stores the current element of the list
  sw    $s1, 4($sp)	#stores the current number
  sw    $s2, 8($sp)	#stores the current number's count
  sw    $s3, 12($sp)#stores the new number read
  sw    $s4, 16($sp)#stores the Head of output list
  sw    $ra, 20($sp)

  # initialization
  move  $s0, $a0	#initialise the current element to Head
  li    $s1, -1     #initialise the first number to -1
  li    $s2, 0		#initially the count of the current number would be 0
  jal   list_create
  move  $s4, $v0

runlength_loop:
  lw    $s3, ($s0)
  li    $t1, -1
  beq   $s3, $t1, runlength_end   # if the end is reached then return
  beq   $s3, $s1 runlength_increment	# Increment if same number
  # If new number, add current number and its count to the output list
  beq   $s1, $t1, runlength_fwd   # Initially, $s1=-1,which should not be considered, so skip ahead
  
  move  $a0, $s4
  move  $a1, $s2
  jal   list_add              # add the count of the number tolist
  move  $a0, $s4
  move  $a1, $s1
  jal   list_add              # next add the number to  list

runlength_fwd:
  move  $s1, $s3				# save the new number in $s1
  li    $s2, 1					# reset the new counter to 1
  lw    $s0, 4($s0)				# goto the next node in i/p list
  j     runlength_loop			# loop

runlength_increment:
  addi  $s2, $s2, 1				# increment count
  lw    $s0, 4($s0)				# point to next node
  j     runlength_loop			# loop

runlength_end:
  #save the current number
  li    $t1, -1
  beq   $s1, $t1, runlength_end2	# if the list is empty
  move  $a0, $s4					# else add the last node
  move  $a1, $s2
  jal   list_add              		# add the count of the last node to list
  move  $a0, $s4
  move  $a1, $s1
  jal   list_add					#append the last node to list

runlength_end2:
  move  $v0, $s4
  #restore values
  lw    $s0, ($sp)
  lw    $s1, 4($sp)
  lw    $s2, 8($sp)
  lw    $s3, 12($sp)
  lw    $s4, 16($sp)
  lw    $ra, 20($sp)
  add $sp, $sp, 24		          #pop stack frame
  jr $ra
