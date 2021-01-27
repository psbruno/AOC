.data 
	msgInput: .asciiz "Entre com a frase "
	bn: .asciiz "\n"
	msg2: .asciiz "Numero total de caracteres: "
	msg3: .asciiz "Numero total de palavras: "
	Frase: .space 100
.text 

						
									
.main:			
	#impressao da msg para usuario
	li $v0, 4
	la $a0, msgInput
	syscall
	
	#leitura da frase
	li $v0, 8 # 8 == Ler String ou char
	la $a0, Frase
	la $a1, 100
	syscall
	
	jal NChars
	jal NWords
	
	
	#encerra o programa
	li $v0, 10
	syscall
	
#------------------Funcoes:	

#--------------------------------primeira funcao - contador de caracteres


NChars:
	addi $t1,$t1,0
	la $t0, Frase		# recupera Frase da memoria para o registrador t0	
loop1:
	lb $a0, 0($t0)  	#seta o iésimo caracter da string (i em termos do reg t0)
	beqz $a0, exit 		#confere se tem mais letras
#	li $v0, 11		#print de auxilio
#	syscall
	
	addi $t0,$t0,1		#skipa i
	addi $t1,$t1,1		#contador++
	j loop1			
	
	exit:
	
	sub $t1,$t1,1  		# o loop estava iterando uma vez a mais, entao ajustamos o registrador que é o nosso contador
	
	li $v0, 4		#imprimir mensagem de output1 
	la $a0, msg2
	syscall
			
	addi $v0, $0, 1		# imprimir numero de caracteres
	add $a0, $0, $t1
	syscall	
	
	li $v0, 4		#imprimir quebra de linha
	la $a0, bn
	syscall
	
	jr $ra
	
	
#--------------------------------segunda funcao - contador de palavras

NWords:
	addi $t1,$t1,0
	la $t0, Frase		# recupera Frase da memoria para o registrador t0
	addi $t1,$0,1		#contador = 0
	addi $t2,$0,' '		#seta t2 como espaco tabela ascii
	addi $t3, $0, 'A' 	#seta t3 como o primeiro caracter válido da tabela ascii, A
	addi $t5, $0, 0		#t5 = 0, contador de palavras inválidas
	addi $t6,$0, 48		#t5= o equivalente a ponto na tabela ascii
loop2:
	lb $a0, 0($t0)  	#seta o iésimo caracter da string (i em funcao do reg t0)
	beq $a0,$t2, espaco 	#confere se o caracter atual é um espaco


	
	
	
	beqz $a0, exit2 	#confere se tem mais letras
	
	slt  $t4, $a0, $t3	# if $a0<65, t4=1 else t4=0
	beq $t4, $0, StringIOK
	
	slt $t4, $a0,$t6		# if $a0<44, t4=1 else t4=0
	bne $t4, $0, StringIOK
	
		
	while_stringI_diff_Espaco:	
		lb $a0, 0($t0)  	#seta o iésimo caracter da string (i em funcao do reg t0)
		addi $t0,$t0,1		#skipa i
		beqz $a0, exit2 	#confere se tem mais letras
		#addi $v0, $0, 1	
		#syscall
		bne $a0,$t2,while_stringI_diff_Espaco
	
	addi $t0,$t0,1		#skipa i
	beqz $a0, exit2 	#confere se tem mais letras

	j loop2
	
	
	
	StringIOK:
	addi $t0,$t0,1		#skipa i
	j loop2			
	
	espaco:
	addi $t1,$t1,1		#contador++
	beqz $a0, exit2 	#confere se tem mais letras
	addi $t0,$t0,1		#skip i
	j loop2
	
	
	exit2:
	
#	sub $t1,$t1,1  		# o loop estava iterando uma vez a mais, entao ajustamos o registrador que é o nosso contador
	
	li $v0, 4		#imprimir mensagem de output2
	la $a0, msg3
	syscall
		
	addi $v0, $0, 1		# imprimir numero de palavras
	add $a0, $0, $t1
	syscall	
	
	li $v0, 4		#imprimir quebra de linha
	la $a0, bn
	syscall
	jr $ra
