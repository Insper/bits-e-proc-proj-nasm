; add32

; zera ram 8 (carry in do MSB)
leaw $8, %A
movw $0, (%A)

; verificar se vai acontecer estouro
leaw $1, %A
movw (%A), %D
leaw $3, %A
andw (%A), %D, %D
leaw $32768, %A
andw %A, %D, %D
leaw $NOTOVER, %A
je
nop

; carry in MSB = 1
leaw $8, %A
movw $1, (%A)

NOTOVER:

; somar T_low + W_low
leaw $1, %A
movw (%A), %D
leaw $3, %A
addw (%A), %D, %D
leaw $5, %A
movw %D, (%A)

; somar T_high + W_high + carry
leaw $0, %A
movw (%A), %D
leaw $2, %A
addw (%A), %D, %D
leaw $8, %A
addw (%A), %D, %D
leaw $4, %A
movw %D, (%A)
