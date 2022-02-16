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
	sw	$16, -8($29)
	addi	$29, $29, -12
	ori	$3, $0, 40
# was:	ori	_letBind_2_, $0, 40
# 	ori	_size_reg_4_,_letBind_2_,0
	bgez	$3, _safe_lab_5_
# was:	bgez	_size_reg_4_, _safe_lab_5_
	ori	$5, $0, 3
# was:	ori	$5, $0, 3
	la	$6, _Msg_IllegalArraySize_
# was:	la	$6, _Msg_IllegalArraySize_
	j	_RuntimeError_
_safe_lab_5_:
	ori	$2, $28, 0
# was:	ori	_letBind_3_, $28, 0
	sll	$4, $3, 2
# was:	sll	_tmp_11_, _size_reg_4_, 2
	addi	$4, $4, 4
# was:	addi	_tmp_11_, _tmp_11_, 4
	add	$28, $28, $4
# was:	add	$28, $28, _tmp_11_
	sw	$3, 0($2)
# was:	sw	_size_reg_4_, 0(_letBind_3_)
	addi	$6, $2, 4
# was:	addi	_addr_reg_6_, _letBind_3_, 4
	ori	$4, $0, 0
# was:	ori	_i_reg_7_, $0, 0
_loop_beg_8_:
	sub	$5, $4, $3
# was:	sub	_tmp_reg_10_, _i_reg_7_, _size_reg_4_
	bgez	$5, _loop_end_9_
# was:	bgez	_tmp_reg_10_, _loop_end_9_
	sw	$4, 0($6)
# was:	sw	_i_reg_7_, 0(_addr_reg_6_)
	addi	$6, $6, 4
# was:	addi	_addr_reg_6_, _addr_reg_6_, 4
	addi	$4, $4, 1
# was:	addi	_i_reg_7_, _i_reg_7_, 1
	j	_loop_beg_8_
_loop_end_9_:
	ori	$4, $0, 10
# was:	ori	_divide_R_14_, $0, 10
	bne	$4, $0, _safe_lab_15_
# was:	bne	_divide_R_14_, $0, _safe_lab_15_
	ori	$5, $0, 4
# was:	ori	$5, $0, 4
	la	$6, _Msg_DivZero_
# was:	la	$6, _Msg_DivZero_
	j	_RuntimeError_
_safe_lab_15_:
# 	ori	_divide_L_13_,_letBind_2_,0
	div	$4, $3, $4
# was:	div	_letBind_12_, _divide_L_13_, _divide_R_14_
# 	ori	_arr_ind_17_,_letBind_12_,0
	addi	$3, $2, 4
# was:	addi	_arr_reg_18_, _letBind_3_, 4
	lw	$2, 0($2)
# was:	lw	_size_reg_19_, 0(_letBind_3_)
	bgez	$4, _safe_lab_22_
# was:	bgez	_arr_ind_17_, _safe_lab_22_
_error_lab_21_:
	ori	$5, $0, 5
# was:	ori	$5, $0, 5
	la	$6, _Msg_IllegalIndex_
# was:	la	$6, _Msg_IllegalIndex_
	j	_RuntimeError_
_safe_lab_22_:
	sub	$2, $4, $2
# was:	sub	_tmp_reg_20_, _arr_ind_17_, _size_reg_19_
	bgez	$2, _error_lab_21_
# was:	bgez	_tmp_reg_20_, _error_lab_21_
	sll	$4, $4, 2
# was:	sll	_arr_ind_17_, _arr_ind_17_, 2
	add	$3, $3, $4
# was:	add	_arr_reg_18_, _arr_reg_18_, _arr_ind_17_
	lw	$3, 0($3)
# was:	lw	_letBind_16_, 0(_arr_reg_18_)
# 	ori	_times_L_26_,_letBind_16_,0
	ori	$2, $0, 1
# was:	ori	_times_R_27_, $0, 1
	mul	$2, $3, $2
# was:	mul	_plus_L_24_, _times_L_26_, _times_R_27_
	ori	$3, $0, 0
# was:	ori	_plus_R_25_, $0, 0
	add	$16, $2, $3
# was:	add	_tmp_23_, _plus_L_24_, _plus_R_25_
# 	ori	_mainres_1_,_tmp_23_,0
	ori	$2, $16, 0
# was:	ori	$2, _mainres_1_, 0
	jal	putint
# was:	jal	putint, $2
	ori	$2, $16, 0
# was:	ori	$2, _mainres_1_, 0
	addi	$29, $29, 12
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