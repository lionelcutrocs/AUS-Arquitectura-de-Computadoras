.macro done
li $v0,10
syscall
.end_macro	

#.include "macro.h"

.data

num1:	.word 2
num2:	.word 5

.text

main:
	lw $a0, num1
	lw $a1, num2
	jal suma
	
	done
	
suma:
	add $v0, $a0, $a1
	jr $ra
	
	


	
	
	
	