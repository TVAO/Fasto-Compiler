	.text	0x00400000
	.globl	main
	la	$28, _heap_
	la	$4, _true
# was:	la	_true_addr, _true
	ori	$3, $0, 4
# was:	ori	_true_init, $0, 4
	sw	$3, 0($4)
# was:	sw	_true_init, 0(_true_addr)
	la	$3, _false
# was:	la	_false_addr, _false
	ori	$4, $0, 5
# was:	ori	_false_init, $0, 5
	sw	$4, 0($3)
# was:	sw	_false_init, 0(_false_addr)
	jal	main
_stop_:
	ori	$2, $0, 10
	syscall
# Function main
main:
	sw	$31, -4($29)
	addi	$29, $29, -8
	ori	$3, $0, 1
# was:	ori	_letBind_2_, $0, 1
	ori	$2, $0, 1
# was:	ori	_letBind_3_, $0, 1
# 	ori	_eq_L_13_,_letBind_2_,0
# 	ori	_eq_R_14_,_letBind_3_,0
	ori	$4, $0, 0
# was:	ori	_op_L_8_, $0, 0
	bne	$3, $2, _false_15_
# was:	bne	_eq_L_13_, _eq_R_14_, _false_15_
	ori	$4, $0, 1
# was:	ori	_op_L_8_, $0, 1
_false_15_:
	j	_begin_11_
_skip_10_:
	ori	$4, $0, 1
# was:	ori	_eq_L_6_, $0, 1
	j	_exit_12_
_begin_11_:
	bne	$4, $0, _skip_10_
# was:	bne	_op_L_8_, $0, _skip_10_
	ori	$5, $3, 0
# was:	ori	_and_L_16_, _letBind_2_, 0
	xori	$5, $5, 1
# was:	xori	_and_L_16_, _and_L_16_, 1
	ori	$6, $0, 0
# was:	ori	_op_R_9_, $0, 0
	beq	$5, $0, _falseLabel_22_
# was:	beq	_and_L_16_, $0, _falseLabel_22_
# 	ori	_eq_L_18_,_letBind_3_,0
	ori	$6, $0, 1
# was:	ori	_eq_R_19_, $0, 1
	ori	$7, $0, 0
# was:	ori	_and_R_17_, $0, 0
	bne	$2, $6, _false_20_
# was:	bne	_eq_L_18_, _eq_R_19_, _false_20_
	ori	$7, $0, 1
# was:	ori	_and_R_17_, $0, 1
_false_20_:
	and	$6, $5, $7
# was:	and	_op_R_9_, _and_L_16_, _and_R_17_
_falseLabel_22_:
	or	$4, $4, $6
# was:	or	_eq_L_6_, _op_L_8_, _op_R_9_
_exit_12_:
# 	ori	_eq_L_28_,_letBind_2_,0
# 	ori	_eq_R_29_,_letBind_3_,0
	ori	$5, $0, 0
# was:	ori	_op_L_23_, $0, 0
	bne	$3, $2, _false_30_
# was:	bne	_eq_L_28_, _eq_R_29_, _false_30_
	ori	$5, $0, 1
# was:	ori	_op_L_23_, $0, 1
_false_30_:
	j	_begin_26_
_skip_25_:
	ori	$3, $0, 1
# was:	ori	_eq_R_7_, $0, 1
	j	_exit_27_
_begin_26_:
	bne	$5, $0, _skip_25_
# was:	bne	_op_L_23_, $0, _skip_25_
# 	ori	_and_L_31_,_letBind_2_,0
	xori	$3, $3, 1
# was:	xori	_and_L_31_, _and_L_31_, 1
	ori	$6, $0, 0
# was:	ori	_op_R_24_, $0, 0
	beq	$3, $0, _falseLabel_37_
# was:	beq	_and_L_31_, $0, _falseLabel_37_
	ori	$7, $2, 0
# was:	ori	_eq_L_33_, _letBind_3_, 0
	ori	$2, $0, 1
# was:	ori	_eq_R_34_, $0, 1
	ori	$6, $0, 0
# was:	ori	_and_R_32_, $0, 0
	bne	$7, $2, _false_35_
# was:	bne	_eq_L_33_, _eq_R_34_, _false_35_
	ori	$6, $0, 1
# was:	ori	_and_R_32_, $0, 1
_false_35_:
	and	$6, $3, $6
# was:	and	_op_R_24_, _and_L_31_, _and_R_32_
_falseLabel_37_:
	or	$3, $5, $6
# was:	or	_eq_R_7_, _op_L_23_, _op_R_24_
_exit_27_:
	ori	$2, $0, 0
# was:	ori	_tmp_5_, $0, 0
	bne	$4, $3, _false_38_
# was:	bne	_eq_L_6_, _eq_R_7_, _false_38_
	ori	$2, $0, 1
# was:	ori	_tmp_5_, $0, 1
_false_38_:
	ori	$3, $2, 0
# was:	ori	_letBind_4_, _tmp_5_, 0
	la	$2, _true
# was:	la	$2, _true
	bne	$3, $0, _wBoolF_39_
# was:	bne	_letBind_4_, $0, _wBoolF_39_
	la	$2, _false
# was:	la	$2, _false
_wBoolF_39_:
	jal	putstring
# was:	jal	putstring, $2
	ori	$2, $0, 1
# was:	ori	_mainres_1_, $0, 1
# 	ori	$2,_mainres_1_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
ord:
	jr	$31
chr:
	andi	$2, $2, 255
	jr	$31
putint:
	addi	$29, $29, -8
	sw	$2, 0($29)
	sw	$4, 4($29)
	ori	$4, $2, 0
	ori	$2, $0, 1
	syscall
	ori	$2, $0, 4
	la	$4, _space_
	syscall
	lw	$2, 0($29)
	lw	$4, 4($29)
	addi	$29, $29, 8
	jr	$31
getint:
	ori	$2, $0, 5
	syscall
	jr	$31
putchar:
	addi	$29, $29, -8
	sw	$2, 0($29)
	sw	$4, 4($29)
	ori	$4, $2, 0
	ori	$2, $0, 11
	syscall
	ori	$2, $0, 4
	la	$4, _space_
	syscall
	lw	$2, 0($29)
	lw	$4, 4($29)
	addi	$29, $29, 8
	jr	$31
getchar:
	addi	$29, $29, -8
	sw	$4, 0($29)
	sw	$5, 4($29)
	ori	$2, $0, 12
	syscall
	ori	$5, $2, 0
	ori	$2, $0, 4
	la	$4, _cr_
	syscall
	ori	$2, $5, 0
	lw	$4, 0($29)
	lw	$5, 4($29)
	addi	$29, $29, 8
	jr	$31
putstring:
	addi	$29, $29, -16
	sw	$2, 0($29)
	sw	$4, 4($29)
	sw	$5, 8($29)
	sw	$6, 12($29)
	lw	$4, 0($2)
	addi	$5, $2, 4
	add	$6, $5, $4
	ori	$2, $0, 11
putstring_begin:
	sub	$4, $5, $6
	bgez	$4, putstring_done
	lb	$4, 0($5)
	syscall
	addi	$5, $5, 1
	j	putstring_begin
putstring_done:
	lw	$2, 0($29)
	lw	$4, 4($29)
	lw	$5, 8($29)
	lw	$6, 12($29)
	addi	$29, $29, 16
	jr	$31
_RuntimeError_:
	la	$4, _ErrMsg_
	ori	$2, $0, 4
	syscall
	ori	$4, $5, 0
	ori	$2, $0, 1
	syscall
	la	$4, _colon_space_
	ori	$2, $0, 4
	syscall
	ori	$4, $6, 0
	ori	$2, $0, 4
	syscall
	la	$4, _cr_
	ori	$2, $0, 4
	syscall
	j	_stop_
	.data	
# Fixed strings for I/O
_ErrMsg_:
	.asciiz	"Runtime error at line "
_colon_space_:
	.asciiz	": "
_cr_:
	.asciiz	"\n"
_space_:
	.asciiz	" "
# Message strings for specific errors
_Msg_IllegalArraySize_:
	.asciiz	"negative array size"
_Msg_IllegalIndex_:
	.asciiz	"array index out of bounds"
_Msg_DivZero_:
	.asciiz	"division by zero"
# String Literals
	.align	2
_true:
	.space	4
	.asciiz	"true"
	.align	2
_false:
	.space	4
	.asciiz	"false"
	.align	2
_heap_:
	.space	100000