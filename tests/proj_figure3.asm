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
# Function plus100
plus100:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_x_1_,$2,0
# 	ori	_plus_L_3_,_param_x_1_,0
	ori	$3, $0, 100
# was:	ori	_plus_R_4_, $0, 100
	add	$2, $2, $3
# was:	add	_plus100res_2_, _plus_L_3_, _plus_R_4_
# 	ori	$2,_plus100res_2_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
# Function plus
plus:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_x_5_,$2,0
# 	ori	_param_y_6_,$3,0
# 	ori	_plus_L_8_,_param_x_5_,0
# 	ori	_plus_R_9_,_param_y_6_,0
	add	$2, $2, $3
# was:	add	_plusres_7_, _plus_L_8_, _plus_R_9_
# 	ori	$2,_plusres_7_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
# Function main
main:
	sw	$31, -4($29)
	sw	$21, -28($29)
	sw	$20, -24($29)
	sw	$19, -20($29)
	sw	$18, -16($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -32
	jal	getint
# was:	jal	getint, $2
# 	ori	_letBind_11_,$2,0
# 	ori	_size_reg_13_,_letBind_11_,0
	bgez	$2, _safe_lab_14_
# was:	bgez	_size_reg_13_, _safe_lab_14_
	ori	$5, $0, 6
# was:	ori	$5, $0, 6
	la	$6, _Msg_IllegalArraySize_
# was:	la	$6, _Msg_IllegalArraySize_
	j	_RuntimeError_
_safe_lab_14_:
	ori	$20, $28, 0
# was:	ori	_letBind_12_, $28, 0
	sll	$3, $2, 2
# was:	sll	_tmp_20_, _size_reg_13_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_20_, _tmp_20_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_20_
	sw	$2, 0($20)
# was:	sw	_size_reg_13_, 0(_letBind_12_)
	addi	$5, $20, 4
# was:	addi	_addr_reg_15_, _letBind_12_, 4
	ori	$3, $0, 0
# was:	ori	_i_reg_16_, $0, 0
_loop_beg_17_:
	sub	$4, $3, $2
# was:	sub	_tmp_reg_19_, _i_reg_16_, _size_reg_13_
	bgez	$4, _loop_end_18_
# was:	bgez	_tmp_reg_19_, _loop_end_18_
	sw	$3, 0($5)
# was:	sw	_i_reg_16_, 0(_addr_reg_15_)
	addi	$5, $5, 4
# was:	addi	_addr_reg_15_, _addr_reg_15_, 4
	addi	$3, $3, 1
# was:	addi	_i_reg_16_, _i_reg_16_, 1
	j	_loop_beg_17_
_loop_end_18_:
# 	ori	_arr_reg_23_,_letBind_12_,0
	lw	$17, 0($20)
# was:	lw	_size_reg_22_, 0(_arr_reg_23_)
	ori	$16, $28, 0
# was:	ori	_letBind_21_, $28, 0
	sll	$2, $17, 2
# was:	sll	_tmp_32_, _size_reg_22_, 2
	addi	$2, $2, 4
# was:	addi	_tmp_32_, _tmp_32_, 4
	add	$28, $28, $2
# was:	add	$28, $28, _tmp_32_
	sw	$17, 0($16)
# was:	sw	_size_reg_22_, 0(_letBind_21_)
	addi	$19, $16, 4
# was:	addi	_addr_reg_26_, _letBind_21_, 4
	ori	$18, $0, 0
# was:	ori	_i_reg_27_, $0, 0
	addi	$21, $20, 4
# was:	addi	_elem_reg_24_, _arr_reg_23_, 4
_loop_beg_28_:
	sub	$2, $18, $17
# was:	sub	_tmp_reg_30_, _i_reg_27_, _size_reg_22_
	bgez	$2, _loop_end_29_
# was:	bgez	_tmp_reg_30_, _loop_end_29_
	lw	$2, 0($21)
# was:	lw	_res_reg_25_, 0(_elem_reg_24_)
	addi	$21, $21, 4
# was:	addi	_elem_reg_24_, _elem_reg_24_, 4
# 	ori	$2,_res_reg_25_,0
	jal	plus100
# was:	jal	plus100, $2
# 	ori	_tmp_reg_31_,$2,0
# 	ori	_res_reg_25_,_tmp_reg_31_,0
	sw	$2, 0($19)
# was:	sw	_res_reg_25_, 0(_addr_reg_26_)
	addi	$19, $19, 4
# was:	addi	_addr_reg_26_, _addr_reg_26_, 4
	addi	$18, $18, 1
# was:	addi	_i_reg_27_, _i_reg_27_, 1
	j	_loop_beg_28_
_loop_end_29_:
# 	ori	_arr_reg_34_,_letBind_12_,0
	lw	$17, 0($20)
# was:	lw	_size_reg_35_, 0(_arr_reg_34_)
	ori	$2, $0, 0
# was:	ori	_letBind_33_, $0, 0
	addi	$20, $20, 4
# was:	addi	_arr_reg_34_, _arr_reg_34_, 4
	ori	$18, $0, 0
# was:	ori	_ind_var_36_, $0, 0
_loop_beg_38_:
	sub	$3, $18, $17
# was:	sub	_tmp_reg_37_, _ind_var_36_, _size_reg_35_
	bgez	$3, _loop_end_39_
# was:	bgez	_tmp_reg_37_, _loop_end_39_
	lw	$3, 0($20)
# was:	lw	_tmp_reg_37_, 0(_arr_reg_34_)
	addi	$20, $20, 4
# was:	addi	_arr_reg_34_, _arr_reg_34_, 4
# 	ori	$2,_letBind_33_,0
# 	ori	$3,_tmp_reg_37_,0
	jal	plus
# was:	jal	plus, $2 $3
# 	ori	_tmp_reg_40_,$2,0
# 	ori	_letBind_33_,_tmp_reg_40_,0
	addi	$18, $18, 1
# was:	addi	_ind_var_36_, _ind_var_36_, 1
	j	_loop_beg_38_
_loop_end_39_:
	ori	$2, $16, 0
# was:	ori	_arr_reg_43_, _letBind_21_, 0
	lw	$16, 0($2)
# was:	lw	_size_reg_42_, 0(_arr_reg_43_)
	ori	$17, $28, 0
# was:	ori	_letBind_41_, $28, 0
	addi	$3, $16, 3
# was:	addi	_tmp_52_, _size_reg_42_, 3
	sra	$3, $3, 2
# was:	sra	_tmp_52_, _tmp_52_, 2
	sll	$3, $3, 2
# was:	sll	_tmp_52_, _tmp_52_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_52_, _tmp_52_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_52_
	sw	$16, 0($17)
# was:	sw	_size_reg_42_, 0(_letBind_41_)
	addi	$18, $17, 4
# was:	addi	_addr_reg_46_, _letBind_41_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_47_, $0, 0
	addi	$20, $2, 4
# was:	addi	_elem_reg_44_, _arr_reg_43_, 4
_loop_beg_48_:
	sub	$2, $19, $16
# was:	sub	_tmp_reg_50_, _i_reg_47_, _size_reg_42_
	bgez	$2, _loop_end_49_
# was:	bgez	_tmp_reg_50_, _loop_end_49_
	lw	$2, 0($20)
# was:	lw	_res_reg_45_, 0(_elem_reg_44_)
	addi	$20, $20, 4
# was:	addi	_elem_reg_44_, _elem_reg_44_, 4
# 	ori	$2,_res_reg_45_,0
	jal	chr
# was:	jal	chr, $2
# 	ori	_tmp_reg_51_,$2,0
# 	ori	_res_reg_45_,_tmp_reg_51_,0
	sb	$2, 0($18)
# was:	sb	_res_reg_45_, 0(_addr_reg_46_)
	addi	$18, $18, 1
# was:	addi	_addr_reg_46_, _addr_reg_46_, 1
	addi	$19, $19, 1
# was:	addi	_i_reg_47_, _i_reg_47_, 1
	j	_loop_beg_48_
_loop_end_49_:
	ori	$2, $0, 1
# was:	ori	_arr_ind_56_, $0, 1
	addi	$3, $17, 4
# was:	addi	_arr_reg_57_, _letBind_41_, 4
	lw	$4, 0($17)
# was:	lw	_size_reg_58_, 0(_letBind_41_)
	bgez	$2, _safe_lab_61_
# was:	bgez	_arr_ind_56_, _safe_lab_61_
_error_lab_60_:
	ori	$5, $0, 10
# was:	ori	$5, $0, 10
	la	$6, _Msg_IllegalIndex_
# was:	la	$6, _Msg_IllegalIndex_
	j	_RuntimeError_
_safe_lab_61_:
	sub	$4, $2, $4
# was:	sub	_tmp_reg_59_, _arr_ind_56_, _size_reg_58_
	bgez	$4, _error_lab_60_
# was:	bgez	_tmp_reg_59_, _error_lab_60_
	add	$3, $3, $2
# was:	add	_arr_reg_57_, _arr_reg_57_, _arr_ind_56_
	lb	$2, 0($3)
# was:	lb	_arg_55_, 0(_arr_reg_57_)
# 	ori	$2,_arg_55_,0
	jal	ord
# was:	jal	ord, $2
# 	ori	_tmp_54_,$2,0
# 	ori	_letBind_53_,_tmp_54_,0
# 	ori	$2,_letBind_53_,0
	jal	putint
# was:	jal	putint, $2
	ori	$2, $17, 0
# was:	ori	_tmp_62_, _letBind_41_, 0
	ori	$16, $2, 0
# was:	ori	_mainres_10_, _tmp_62_, 0
# 	ori	$2,_tmp_62_,0
	jal	putstring
# was:	jal	putstring, $2
	ori	$2, $16, 0
# was:	ori	$2, _mainres_10_, 0
	addi	$29, $29, 32
	lw	$21, -28($29)
	lw	$20, -24($29)
	lw	$19, -20($29)
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