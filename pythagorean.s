# Program: Pythagorean Theorem Validator
# General Process: 
#   - evaluate:  X = a^2 + b^2 
#   - evaluate:  Y = c^2
#   - compare X & Y
#   - based upon the  
#
# This program has 5 distinct versions, defined by their git hub tags
#
#  tag == is_right:  
#    Input:  three unsigned 8-bit integers: a, b, c
#    Outputs: "True!" or "False!" based upon the value of X == Y
#  tag == angle_type
#    Input:  three unsigned 8-bit integers: a, b, c
#    Outputs: "Acute!", "Right!", or "Obtuse!"
#  tag == approximated_hypotenuse
#    Input:  two unsigned 8-bit integers: a, b
#    Outputs: "Nearest right-triangle is where the hypotenuse is: ", d
#  tag == computed_hypotenuse
#    Input:  two unsigned 8-bit integers: a, b
#    Outputs: "The computed value of c is: " c
#  tag == series
#    Inputs: reads a serics of a, b, and for each pair generates an output
#    Outputs: "a ^2 + b ^2 \~= c^2" 

		 .include "include/syscall_macros.s"
		 .include "include/isqrt.s"

		.data
	            .globl main
	             
hypotenuse_string: .asciiz "The computed value of c is: "
first_string: .asciiz " ^2 +  "
second_string: .asciiz "^2 \~= "
third_string: .asciiz "^2"
            
		.text

		# define any macros here
		# E.g., here is the definition of the "inc" macro
		# Usage:  inc($t0)
		.macro inc(%reg)
			addi %reg, %reg, 1		# increment the value of in register "%reg"
		.end_macro
			



	  # insert your starter code here
	 
	  main:  nop
      
loop_top: nop
       # Handle the inputs, etc
       # ....
       read_int($t0) # reads a 

	read_int($t1) #reads b
	move $s3, $t0 #move a to a0
	move $s4, $t1 #move b to a1
	move $a0, $t0 #move a to a0
	move $a1, $t1 #move b to a1
	beqz $a0, loop_end
	beqz $a1, loop_end
       
	
        jal hypotenuse	
        
          hypotenuse_block:	nop 
          move $s2, $v0
	print_int($s3)
	print_string(first_string)
	print_int($s4)
	print_string(second_string)
	print_int($s2) # prints c
	print_string(third_string)
       
       b  loop_top
 loop_end:  

	    
  nop  


if_done:  nop

	halt()



	  
hypotenuse:  nop
	# assume a is in $a0 and b is in $a1
	nop  # compute a^2
        mult $a0, $a0
        mflo $a0
        
        nop  # compute b^2
        mult $a1, $a1
        mflo $a1
 	
 	move $s1, $ra
 
	addu $a0, $a0, $a1 # calc X = a^2 + b^2
	
	jal isqrt
	move $ra, $s1
	jr $ra

