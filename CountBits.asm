.data
msg0: .asciiz "Enter an integer: "
msg1: .asciiz "Number of 1's: "

.text	# Text is where all instructions are

li $v0, 4
la $a0, msg0 # Print msg0
syscall

li $v0, 5
syscall		# Read int
move $t0, $v0

li $s0, 0	# Set $s0 = 0

loop:
div $t1, $t0, 2	# int / 2
mfhi $t1	# load remainder
beqz $t1, B1	# if remainder = 0, go to B1
add $s0, $s0, 1 # if not $s0 ++

B1:
srl $t0, $t0, 1 # shift number to right side (aka reduce by 4)
bgtz $t0, loop  # repeat steps until int = 0

li $v0, 4	
la $a0, msg1	# print msg1
syscall

li $v0, 1
move $a0, $s0	# print result
syscall 

li $v0, 10	# exit
syscall 
