# Disciplina: Arquitetura e Organização de Processadores 
# Atividade: Avaliação 01 – Programação em Linguagem de Montagem 
# Exercício 02
# Alunos: Gabriel Toscano e Paulo Martino Hermans

.data
espaco: .asciiz " "

.text
main:
    li $t0, 0           # inicializa o contador com 0
    li $t1, 10          # valor em que deve parar
    
loop:
    li $v0, 1           # chamada para imprimir int
    move $a0, $t0       # move o valor do contador para o registrador $a0
    syscall  		# chama o sistema para imprimir o valor do contador
    la $a0, espaco
    li $v0, 4	
    syscall	
    addi $t0, $t0, 1    # incrementa o contador em 1
    bne $t0, $t1, loop  # se o contador for diferente de 10 volta para o loop
