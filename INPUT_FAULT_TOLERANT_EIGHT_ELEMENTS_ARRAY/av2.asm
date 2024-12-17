# Disciplina: Arquitetura e Organização de Processadores
# Atividade: Avaliação 02 – Programação em Linguagem de Montagem
# Alunos: Gabriel Toscano e Paulo Martino Hermans

.data # segmento de dados
newline: .asciiz "\n"
Msg1:    .asciiz "\n\n LEITURA DOS ELEMENTOS DO VETOR: "
Msg21:   .asciiz "\n\n ENTRE COM A["
Msg22:   .asciiz "]: "
Msg3:    .asciiz "\n\n DIGITE O INDICE A SER IMPRESSO (8 para finalizar): "
Msg41:   .asciiz "\n\n A["
Msg42:   .asciiz "] = "
Msg5:    .asciiz "ENTRE COM O TAMANHO DO VETOR (MAX: 8): "
Msg6:    .asciiz "VALOR INVALIDO, ESCOLHA DE 2 ATÉ 8: "
buffer:  .asciiz ""
Array_A: .word 0, 0, 0, 0, 0, 0, 0, 0 # criação do vetor

.text    # segmento de código
main:
	li $s3, 0    # $s3 inicia o contador em 0.
	la $s4, Array_A    # $s4 contem o endereço base de A[].
	li $v0, 4
	la $a0, Msg5
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	ble $s0, 1, loopTamanho
	bgt $s0, 8, loopTamanho
	j loopLeitura

loopLeitura:
	beq $s3, $s0, loopSaida
	sll $t1, $s3, 2    # desloca os bits duas casas a esquerda
	add $t1, $t1, $s4    # $t1 = end.base + 4.i(deslocamento) = end. de A[i]
	la $a0, Msg21
	li $v0, 4
	syscall
	move $a0, $s3
	li $v0, 1
	syscall
	la $a0, Msg22
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	sw $v0, 0($t1)    # A[i] = $v0
	addi $s3, $s3, 1    # i = i + 1
	j loopLeitura
	
loopTamanho:
	li $v0, 4
	la $a0, Msg6
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	ble $s0, 1, loopTamanho    # garante que o tamanho seja maior ou igual ao minimo
	bgt $s0, 8, loopTamanho    # garante que o tamanho seja menor ou igual ao maximo
	j loopLeitura
	
loopSaida:
	li $v0, 4
	la $a0, Msg3
	syscall
	li $v0, 5
	syscall
	move $s3, $v0
	bge $s3, $s0, Exit  # fecha o programa caso o indice seja maior que o numero definido
	blt $s3, 0, Exit    # fecha o programa caso o indice seja menor que o minimo 
	sll $t1, $s3, 2    # desloca os bits duas casas a esquerda
	add $t1, $t1, $s4    # $t1 = end.base + 4.i(deslocamento) = end. de A[i]
	la $a0, Msg41
	li $v0, 4
	syscall
	move $a0, $s3
	li $v0, 1
	syscall
	la $a0, Msg42
	li $v0, 4
	syscall
	lw $a0, 0($t1)
	li $v0, 1
	syscall
	addi $s3, $s3, 1 # i = i + 1
	j loopSaida
	
Exit:
