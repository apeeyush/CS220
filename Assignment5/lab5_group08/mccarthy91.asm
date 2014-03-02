# mccarthy91.asm
.text
.globl main
main:

# Read the number
# First the query
la $a0, query_msg
li $v0, 4
syscall

# Now read the input
li $v0, 5
syscall

#exit
li $v0, 10
syscall

.data
query_msg: .asciiz "Input:"
result_msg: .asciiz "Ans = "
nl_msg: .asciiz "\n"