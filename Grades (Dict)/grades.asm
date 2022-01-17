.data 
enter: 	.asciiz "Enter the subject name (. to exit): "
DSA: 	.asciiz "DSA: Your Marks is 73 and Your Grade is B+\n"
COAL: 	.asciiz "COAL: Your Marks is 90 and Your Grade is A\n"
DLD: 	.asciiz "DLD: Your Marks is 69 and Your Grade is B\n"
DB: 	.asciiz "DB: Your Marks is 81 and Your Grade is A-\n"
ISL2: 	.asciiz "ISL2: Your Marks is 80 and Your Grade is A-\n"
ISL: 	.asciiz "ISL: Your Marks is 75 and Your Grade is B+\n"
ITC: 	.asciiz "ITC: Your Marks is 55 and Your Grade is C\n"
CS: 	.asciiz "CS: Your Marks is 29 and Your Grade is F\n"
TW: 	.asciiz "TW: Your Marks is 43 and Your Grade is D\n"
PS: 	.asciiz "PS: Your Marks is 76 and Your Grade is B+\n"
SANDS: 	.asciiz "SANDS: Your Marks is 67 and Your Grade is B-\n"
E1: 	.asciiz "E1: Your Marks is 71 and Your Grade is B+\n"
CA: 	.asciiz "CA: Your Marks is 57 and Your Grade is C\n"
OOP: 	.asciiz "OOP: Your Marks is 82 and Your Grade is A-\n"
Stop: 	.asciiz ":"
dot: 	.asciiz "."
NotMatched: .asciiz "Your Entry didn't match any suject. Try another\n"
str: 	.space 10

.text
main:
	li $v0, 4
	la $a0, enter
	syscall
	
	li $v0, 8
	la $a0, str
	li $a1, 10
	syscall
	
	move $t0, $a0
	move   $t5, $t0
	
    	# should we stop?
    	la      $a0,dot                     # get address of dot string
    	lb      $a0,($a0)                   # get the dot value
    	lb      $t1,($t0)                   # get first char of user string
    	beq     $t1,$a0,exit                # equal? yes, exit program


    	la $t3, Stop
    	lb $t3, ($t3)
 	
 	la $t1, DLD
 	la $t2, DLD
 	
 	jal cmploop
 	
 	la $t1, DSA
 	la $t2, DSA
 	
 	jal cmploop
 	
 	la $t1, COAL
 	la $t2, COAL
 	
 	jal cmploop
 	
 	la $t1, DB
 	la $t2, DB
 	
 	jal cmploop
 	
 	la $t1, ISL2
 	la $t2, ISL2
 	
 	jal cmploop
 	
 	la $t1, ISL
 	la $t2, ISL
 	
 	jal cmploop
 	
 	la $t1, ITC
 	la $t2, ITC
 	
 	jal cmploop
 	
 	la $t1, CS
 	la $t2, CS
 	
 	jal cmploop
 	
 	la $t1, TW
 	la $t2, TW
 	
 	jal cmploop
 	
 	la $t1, PS
 	la $t2, PS
 	
 	jal cmploop
 	
 	la $t1, SANDS
 	la $t2, SANDS
 	
 	jal cmploop
 	
 	la $t1, E1
 	la $t2, E1
 	
 	jal cmploop
 	
 	la $t1, CA
 	la $t2, CA
 	
 	jal cmploop
 	
 	la $t1, OOP
 	la $t2, OOP
 	
 	jal cmploop
 	
 	j notMatched
    
# string compare loop (just like strcmp)
cmploop:
    lb      $t6,($t5)                   # get next char from input
    lb      $t7,($t1)                   # get next char from Strings up
    beq     $t7,$t3,cmpeq               # at End Of String? yes, fly (strings equal)
    bne     $t6,$t7,jump     	          # are they different? if yes, jump back


    addi    $t5,$t5,1                   # point to next char
    addi    $t1,$t1,1                   # point to next char
    j       cmploop
    
jump:
	move 	     $t5, $t0
	jr $ra
cmpeq:
	li $v0, 4
	move $a0, $t2
	syscall
	
	j main
	
notMatched:
	li $v0, 4
	la $a0, NotMatched
	syscall
	j main
	
# exit program
exit:
    li      $v0,10
    syscall
