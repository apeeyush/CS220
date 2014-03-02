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
move $t1, $v0
sub $t1, $t1, 1
move $t3, $v0
li $t2, 1

# $t1 : Goes down like -> {n-1,n-2,....,1}
# $t3 : Fixed Number n
# $t2 : Result
totient:
ble $t1, 1, return_totient
move $a0, $t1
move $a1, $t3
jal gcd
move $t6, $v0 #GCD stored in $t6
#move $a0, $t6 #
#li $v0, 1     # Check
#syscall       #
li $t5, 1
div $t5, $t6
mflo $t4
#move $a0, $t4 #
#li $v0, 1     # Check
#syscall       #
add $t2, $t2, $t4
sub $t1, $t1, 1
b totient



# Answr calculated so Printing Output (Stored in $t2)
return_totient:
#First the message
la $a0, result_msg
li $v0, 4
syscall
#Then the value
move $a0, $t2
li $v0, 1
syscall
#Then newline
la $a0, nl_msg
li $v0, 4
syscall
b exit

#It takes two arguments $a0 and $a1 and returns the gcd in $v0
#It also uses temporary vaiable $t0
gcd:
beqz $a0, return_gcd
move $t0, $a0
div $a1, $a0
mfhi $a0
move $a1, $t0
b gcd


return_gcd:
move $v0, $a1
jr $ra

#exit
exit:
li $v0, 10
syscall

.data
query_msg: .asciiz "Input:"
result_msg: .asciiz "Ans = "
nl_msg: .asciiz "\n"