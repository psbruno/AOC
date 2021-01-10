.data
	msg1: .asciiz "Insira as horas (inteiro entre 0 e 23) "  
	msg2: .asciiz "Insira os minutos (inteiro entre 0 e 60) "  
	msg3: .asciiz "Insira os segundos (inteiro entre 0 e 60) "  
	msg4: .asciiz "Horário Digitado: "  
	msg5: .asciiz ":"

.text 
#-------------------- Horas 
	NotLessH:
	addi $v0,$0, 4 		#imprimir string do input 1
	la $a0, msg1
	syscall
	
	li $v0, 5		#input 1
	syscall
	
	add $t5,$0,$v0		#t0 = 0+ v0 (input)
	addi $t1, $0,23	
	addi $t2, $0, 0
				
	slt $t3,$v0,$t1 	# $t0 = 1 se  $v0 (input) > $t1 (setado como 23)
	slt $t4,$t2,$v0		# $t3 = 1 se $t2 (0) > $v0 (input)

	beq $t3,$zero,NotLessH 	# vá para NotLess, se $t0 == 0 
	beq $t4,$zero,NotLessH 	# vá para NotLess, se $t3 == 0 
	
	

	
#-----------------------Minutos
	NotLessM:
	addi $v0,$0, 4 		#imprimir string do input 2
	la $a0, msg2
	syscall
	
	li $v0, 5		#input 2
	syscall
	
	add $t6,$0,$v0		#t6 = 0+ v0 (input)
	addi $t1, $0,60		#setando o valor máximo para minutos
	addi $t2, $0, 0		#setando o valor mínimo para minutos
				
	slt $t3,$v0,$t1 	# $t0 = 1 se  $v0 (input) > $t1 (setado como 60)
	slt $t4,$t2,$v0		# $t3 = 1 se $t2 (0) > $v0 (input)

	beq $t3,$zero,NotLessM 	# vá para NotLessM, se $t3 == 0, resultado do primeiro slt
	beq $t4,$zero,NotLessM 	# vá para NotLessM, se $t4 == 0, resultado do segundo slt
	
	
#---------------------Segundos
	NotLessS:
	addi $v0,$0, 4 		#imprimir string do input 3
	la $a0, msg3
	syscall
	
	li $v0, 5		#input 3
	syscall
	
	add $t7,$0,$v0		#t7 = 0+ v0, criando cópia do input 
	addi $t1, $0,60		#setando o valor máximo para segundos
				
	slt $t3,$v0,$t1 	# $t0 = 1 se  $v0 (input) > $t1 (setado como 60)
	slt $t4,$0,$v0		# $t3 = 1 se $t2 (0) > $v0 (input)

	beq $t3,$zero,NotLessS 	# vá para NotLessS, se $t3 == 0, resultado do primeiro slt
	beq $t4,$zero,NotLessS 	# vá para NotLessS, se $t4 == 0, resultado do segundo slt
	
	
	
	
#------------------output
	addi $v0,$0, 4 		#imprimir string do resultado
	la $a0, msg4
	syscall
	
	addi $v0, $0, 1		# imprimir horas
	add $a0, $0, $t5
	syscall	
	
	addi $v0,$0, 4 		#imprimir separador
	la $a0, msg5
	syscall
	
	addi $v0, $0, 1		# imprimir minutos 
	add $a0, $0, $t6
	syscall		
	
	addi $v0,$0, 4 		#imprimir string do resultado
	la $a0, msg5
	syscall	
		
	addi $v0, $0, 1		# imprimir segundos 
	add $a0, $0, $t7
	syscall	
	
	
	
	