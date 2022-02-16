	.text	0x00400000
	.globl	main
	la	$28, _heap_
	la	$4, _a__str__8_
# was:	la	_a__str__8__addr, _a__str__8_
	ori	$3, $0, 1
# was:	ori	_a__str__8__init, $0, 1
	sw	$3, 0($4)
# was:	sw	_a__str__8__init, 0(_a__str__8__addr)
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
# Function write_nl
write_nl:
	sw	$31, -4($29)
	sw	$16, -8($29)
	addi	$29, $29, -12
# 	ori	_param_b_1_,$2,0
	ori	$16, $2, 0
# was:	ori	_tmp_4_, _param_b_1_, 0
# 	ori	_letBind_3_,_tmp_4_,0
	la	$2, _true
# was:	la	$2, _true
	bne	$16, $0, _wBoolF_5_
# was:	bne	_letBind_3_, $0, _wBoolF_5_
	la	$2, _false
# was:	la	$2, _false
_wBoolF_5_:
	jal	putstring
# was:	jal	putstring, $2
	la	$2, _a__str__8_
# was:	la	_tmp_7_, _a__str__8_
# _a__str__8_: string "\n"
# 	ori	_letBind_6_,_tmp_7_,0
# 	ori	$2,_tmp_7_,0
	jal	putstring
# was:	jal	putstring, $2
	ori	$2, $16, 0
# was:	ori	_write_nlres_2_, _letBind_3_, 0
# 	ori	$2,_write_nlres_2_,0
	addi	$29, $29, 12
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
# Function main
main:
	sw	$31, -4($29)
	sw	$18, -16($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -20
	ori	$3, $0, 2
# was:	ori	_divide_R_15_, $0, 2
	bne	$3, $0, _safe_lab_16_
# was:	bne	_divide_R_15_, $0, _safe_lab_16_
	ori	$5, $0, 7
# was:	ori	$5, $0, 7
	la	$6, _Msg_DivZero_
# was:	la	$6, _Msg_DivZero_
	j	_RuntimeError_
_safe_lab_16_:
	ori	$2, $0, 3
# was:	ori	_divide_L_14_, $0, 3
	div	$2, $2, $3
# was:	div	_eq_L_12_, _divide_L_14_, _divide_R_15_
	ori	$4, $0, 1
# was:	ori	_eq_R_13_, $0, 1
	ori	$3, $0, 0
# was:	ori	_arg_11_, $0, 0
	bne	$2, $4, _false_17_
# was:	bne	_eq_L_12_, _eq_R_13_, _false_17_
	ori	$3, $0, 1
# was:	ori	_arg_11_, $0, 1
_false_17_:
	ori	$2, $3, 0
# was:	ori	$2, _arg_11_, 0
	jal	write_nl
# was:	jal	write_nl, $2
	ori	$18, $2, 0
# was:	ori	_letBind_10_, $2, 0
	ori	$3, $0, 2
# was:	ori	_divide_R_23_, $0, 2
	bne	$3, $0, _safe_lab_24_
# was:	bne	_divide_R_23_, $0, _safe_lab_24_
	ori	$5, $0, 8
# was:	ori	$5, $0, 8
	la	$6, _Msg_DivZero_
# was:	la	$6, _Msg_DivZero_
	j	_RuntimeError_
_safe_lab_24_:
	ori	$2, $0, 3
# was:	ori	_divide_L_22_, $0, 3
	sub	$2, $0, $2
# was:	sub	_divide_L_22_, $0, _divide_L_22_
	div	$2, $2, $3
# was:	div	_eq_L_20_, _divide_L_22_, _divide_R_23_
	ori	$4, $0, 2
# was:	ori	_eq_R_21_, $0, 2
	sub	$4, $0, $4
# was:	sub	_eq_R_21_, $0, _eq_R_21_
	ori	$3, $0, 0
# was:	ori	_arg_19_, $0, 0
	bne	$2, $4, _false_25_
# was:	bne	_eq_L_20_, _eq_R_21_, _false_25_
	ori	$3, $0, 1
# was:	ori	_arg_19_, $0, 1
_false_25_:
	ori	$2, $3, 0
# was:	ori	$2, _arg_19_, 0
	jal	write_nl
# was:	jal	write_nl, $2
	ori	$16, $2, 0
# was:	ori	_letBind_18_, $2, 0
	ori	$3, $0, 2
# was:	ori	_divide_R_31_, $0, 2
	sub	$3, $0, $3
# was:	sub	_divide_R_31_, $0, _divide_R_31_
	bne	$3, $0, _safe_lab_32_
# was:	bne	_divide_R_31_, $0, _safe_lab_32_
	ori	$5, $0, 9
# was:	ori	$5, $0, 9
	la	$6, _Msg_DivZero_
# was:	la	$6, _Msg_DivZero_
	j	_RuntimeError_
_safe_lab_32_:
	ori	$2, $0, 3
# was:	ori	_divide_L_30_, $0, 3
	div	$2, $2, $3
# was:	div	_eq_L_28_, _divide_L_30_, _divide_R_31_
	ori	$4, $0, 2
# was:	ori	_eq_R_29_, $0, 2
	sub	$4, $0, $4
# was:	sub	_eq_R_29_, $0, _eq_R_29_
	ori	$3, $0, 0
# was:	ori	_arg_27_, $0, 0
	bne	$2, $4, _false_33_
# was:	bne	_eq_L_28_, _eq_R_29_, _false_33_
	ori	$3, $0, 1
# was:	ori	_arg_27_, $0, 1
_false_33_:
	ori	$2, $3, 0
# was:	ori	$2, _arg_27_, 0
	jal	write_nl
# was:	jal	write_nl, $2
	ori	$17, $2, 0
# was:	ori	_letBind_26_, $2, 0
	ori	$3, $0, 2
# was:	ori	_divide_R_39_, $0, 2
	sub	$3, $0, $3
# was:	sub	_divide_R_39_, $0, _divide_R_39_
	bne	$3, $0, _safe_lab_40_
# was:	bne	_divide_R_39_, $0, _safe_lab_40_
	ori	$5, $0, 10
# was:	ori	$5, $0, 10
	la	$6, _Msg_DivZero_
# was:	la	$6, _Msg_DivZero_
	j	_RuntimeError_
_safe_lab_40_:
	ori	$2, $0, 3
# was:	ori	_divide_L_38_, $0, 3
	sub	$2, $0, $2
# was:	sub	_divide_L_38_, $0, _divide_L_38_
	div	$2, $2, $3
# was:	div	_eq_L_36_, _divide_L_38_, _divide_R_39_
	ori	$4, $0, 1
# was:	ori	_eq_R_37_, $0, 1
	ori	$3, $0, 0
# was:	ori	_arg_35_, $0, 0
	bne	$2, $4, _false_41_
# was:	bne	_eq_L_36_, _eq_R_37_, _false_41_
	ori	$3, $0, 1
# was:	ori	_arg_35_, $0, 1
_false_41_:
	ori	$2, $3, 0
# was:	ori	$2, _arg_35_, 0
	jal	write_nl
# was:	jal	write_nl, $2
# 	ori	_letBind_34_,$2,0
# 	ori	_and_L_47_,_letBind_10_,0
	ori	$3, $0, 0
# was:	ori	_and_L_45_, $0, 0
	beq	$18, $0, _falseLabel_49_
# was:	beq	_and_L_47_, $0, _falseLabel_49_
# 	ori	_and_R_48_,_letBind_18_,0
	and	$3, $18, $16
# was:	and	_and_L_45_, _and_L_47_, _and_R_48_
_falseLabel_49_:
	ori	$4, $0, 0
# was:	ori	_and_L_43_, $0, 0
	beq	$3, $0, _falseLabel_50_
# was:	beq	_and_L_45_, $0, _falseLabel_50_
# 	ori	_and_R_46_,_letBind_26_,0
	and	$4, $3, $17
# was:	and	_and_L_43_, _and_L_45_, _and_R_46_
_falseLabel_50_:
	ori	$3, $0, 0
# was:	ori	_arg_42_, $0, 0
	beq	$4, $0, _falseLabel_51_
# was:	beq	_and_L_43_, $0, _falseLabel_51_
# 	ori	_and_R_44_,_letBind_34_,0
	and	$3, $4, $2
# was:	and	_arg_42_, _and_L_43_, _and_R_44_
_falseLabel_51_:
	ori	$2, $3, 0
# was:	ori	$2, _arg_42_, 0
	jal	write_nl
# was:	jal	write_nl, $2
# 	ori	_mainres_9_,$2,0
# 	ori	$2,_mainres_9_,0
	addi	$29, $29, 20
	lw	$18, -16($29)
	lw	$17, -12($29)
	lw	$16, -8($29)
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
_a__str__8_:
	.space	4
	.asciiz	"\n"
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