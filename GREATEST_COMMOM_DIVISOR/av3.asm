# Disciplina: Arquitetura e Organização de Processadores
# Atividade: Avaliação 03 – Programação em Linguagem de Montagem
# Alunos: Gabriel Toscano e Paulo Martino Hermans

.data # segmento de dados
newline: .asciiz "\n"
msg1: .asciiz "ENTRE COM O VALOR X: "
msg2: .asciiz "ENTRE COM O VALOR Y: "
msg3: .asciiz "O MDC dos valores "
msg4: .asciiz " e "
msg5: .asciiz " é "
x: .word 0
y: .word 0
mdc: .word 0

.text # segmento de código
main:
    # entrada do valor de x
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    sw $v0, x
    
    # entrada do valor de y
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    sw $v0, y
    
    # chama a função proc_mdc
    lw $a0, x
    lw $a1, y
    jal proc_mdc
    sw $v0, mdc
    
    # imprime o resultado
    li $v0, 4
    la $a0, msg3
    syscall
    lw $a0, x
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, msg4
    syscall
    lw $a0, y
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, msg5
    syscall
    lw $a0, mdc
    li $v0, 1
    syscall
    
    j exit
    
proc_mdc: # função para calcular MDC
    # armazena o valor de x e y na pilha
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)
    
    # inicializa s0 com x e s1 com y
    move $s0, $a0
    move $s1, $a1

    loop:
        # verifica se x é diferente de y
        bne $s0, $s1, loop_cond
        
        # caso x seja igual a y, retorna x
        move $v0, $s0
        j end_proc_mdc
        
    loop_cond:
        # verifica se x é menor do que y
        blt $s0, $s1, x_lt_y
        
        # caso x seja maior do que y, subtrai y de x
        sub $s0, $s0, $s1
        j loop
        
    x_lt_y:
        # caso x seja menor do que y, subtrai x de y
        sub $s1, $s1, $s0
        j loop
    
    end_proc_mdc:
        # Restaura os registradores
        lw $ra, 0($sp)
        lw $s0, 4($sp)
        lw $s1, 8($sp)
        addi $sp, $sp, 12
        jr $ra

exit:
