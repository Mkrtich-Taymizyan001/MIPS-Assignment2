#
# Program: Pythagorean Theorem Validator
# Input:  three unsigned 8-bit integers: a, b, c
# Process: 
#   - evaluate:  X = a^2 + b^2 
#   - evaluate:  Y = c^2
#   - compare X & Y
# Output a string: 
#   - "True!" , when X == Y
#   - "False!", when X != Y
	
	.data
a:  .byte 3
b:  .byte 4
c:  .byte 5
X:  .byte
Y:  .byte

T:  .asciiz  "True!\n"
F:  .asciiz  "False!\n"


	.text

main:	nop
        # s0 = a
        # s1 = b
        # s2 = c
        # t2 = a*a + b*b
        # t3 = c*c

	# read three integers
	#lbu $s0, a      # s0 = a
	li $v0, 5
	syscall # read int
	move $s0, $v0
	
	
	
        lbu $s1, b      # s1 = b
	lbu $s2, c     # s2 = c
	

	# eval X
	mult $s0, $s0     # a * a
	mflo $t0

	mult $s1, $s1     # b * b
	mflo $t1

	add $t2, $t0, $t1

	# eval Y
	mult $s2, $s2     # c * c
	mflo $t3
	
	

	# compare
	beq $t2, $t3, label_true 
        b label_false
        
label_true: nop        # success
        li $v0, 4
        la $a0, T
        syscall        # print_string
        j label_end
           
label_false: nop       # false
        li $v0, 4
        la $a0, F
        syscall        # print_string
        j label_end
        
label_end: nop        # exit 
        li $v0, 10  
        syscall
        



