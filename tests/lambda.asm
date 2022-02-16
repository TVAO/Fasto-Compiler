	.text	0x00400000
	.globl	main
	la	$28, _heap_
	la	$4, _a__str__45_
# was:	la	_a__str__45__addr, _a__str__45_
	ori	$3, $0, 1
# was:	ori	_a__str__45__init, $0, 1
	sw	$3, 0($4)
# was:	sw	_a__str__45__init, 0(_a__str__45__addr)
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
# Function write_int
write_int:
	sw	$31, -4($29)
	sw	$16, -8($29)
	addi	$29, $29, -12
# 	ori	_param_x_1_,$2,0
	ori	$16, $2, 0
# was:	ori	_tmp_3_, _param_x_1_, 0
# 	ori	_write_intres_2_,_tmp_3_,0
	ori	$2, $16, 0
# was:	ori	$2, _write_intres_2_, 0
	jal	putint
# was:	jal	putint, $2
	ori	$2, $16, 0
# was:	ori	$2, _write_intres_2_, 0
	addi	$29, $29, 12
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
# Function write_int_arr
write_int_arr:
	sw	$31, -4($29)
	sw	$20, -24($29)
	sw	$19, -20($29)
	sw	$18, -16($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -28
# 	ori	_param_x_4_,$2,0
# 	ori	_arr_reg_7_,_param_x_4_,0
	lw	$16, 0($2)
# was:	lw	_size_reg_6_, 0(_arr_reg_7_)
	ori	$17, $28, 0
# was:	ori	_write_int_arrres_5_, $28, 0
	sll	$3, $16, 2
# was:	sll	_tmp_16_, _size_reg_6_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_16_, _tmp_16_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_16_
	sw	$16, 0($17)
# was:	sw	_size_reg_6_, 0(_write_int_arrres_5_)
	addi	$18, $17, 4
# was:	addi	_addr_reg_10_, _write_int_arrres_5_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_11_, $0, 0
	addi	$20, $2, 4
# was:	addi	_elem_reg_8_, _arr_reg_7_, 4
_loop_beg_12_:
	sub	$2, $19, $16
# was:	sub	_tmp_reg_14_, _i_reg_11_, _size_reg_6_
	bgez	$2, _loop_end_13_
# was:	bgez	_tmp_reg_14_, _loop_end_13_
	lw	$2, 0($20)
# was:	lw	_res_reg_9_, 0(_elem_reg_8_)
	addi	$20, $20, 4
# was:	addi	_elem_reg_8_, _elem_reg_8_, 4
# 	ori	$2,_res_reg_9_,0
	jal	write_int
# was:	jal	write_int, $2
# 	ori	_tmp_reg_15_,$2,0
# 	ori	_res_reg_9_,_tmp_reg_15_,0
	sw	$2, 0($18)
# was:	sw	_res_reg_9_, 0(_addr_reg_10_)
	addi	$18, $18, 4
# was:	addi	_addr_reg_10_, _addr_reg_10_, 4
	addi	$19, $19, 1
# was:	addi	_i_reg_11_, _i_reg_11_, 1
	j	_loop_beg_12_
_loop_end_13_:
	ori	$2, $17, 0
# was:	ori	$2, _write_int_arrres_5_, 0
	addi	$29, $29, 28
	lw	$20, -24($29)
	lw	$19, -20($29)
	lw	$18, -16($29)
	lw	$17, -12($29)
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
# Function main
main:
	sw	$31, -4($29)
	sw	$16, -8($29)
	addi	$29, $29, -12
	jal	getint
# was:	jal	getint, $2
# 	ori	_letBind_18_,$2,0
	ori	$5, $2, 0
# was:	ori	_size_reg_20_, _letBind_18_, 0
	bgez	$5, _safe_lab_21_
# was:	bgez	_size_reg_20_, _safe_lab_21_
	ori	$5, $0, 7
# was:	ori	$5, $0, 7
	la	$6, _Msg_IllegalArraySize_
# was:	la	$6, _Msg_IllegalArraySize_
	j	_RuntimeError_
_safe_lab_21_:
	ori	$6, $28, 0
# was:	ori	_letBind_19_, $28, 0
	sll	$2, $5, 2
# was:	sll	_tmp_27_, _size_reg_20_, 2
	addi	$2, $2, 4
# was:	addi	_tmp_27_, _tmp_27_, 4
	add	$28, $28, $2
# was:	add	$28, $28, _tmp_27_
	sw	$5, 0($6)
# was:	sw	_size_reg_20_, 0(_letBind_19_)
	addi	$2, $6, 4
# was:	addi	_addr_reg_22_, _letBind_19_, 4
	ori	$4, $0, 0
# was:	ori	_i_reg_23_, $0, 0
_loop_beg_24_:
	sub	$3, $4, $5
# was:	sub	_tmp_reg_26_, _i_reg_23_, _size_reg_20_
	bgez	$3, _loop_end_25_
# was:	bgez	_tmp_reg_26_, _loop_end_25_
	sw	$4, 0($2)
# was:	sw	_i_reg_23_, 0(_addr_reg_22_)
	addi	$2, $2, 4
# was:	addi	_addr_reg_22_, _addr_reg_22_, 4
	addi	$4, $4, 1
# was:	addi	_i_reg_23_, _i_reg_23_, 1
	j	_loop_beg_24_
_loop_end_25_:
# 	ori	_arr_reg_31_,_letBind_19_,0
	lw	$2, 0($6)
# was:	lw	_size_reg_30_, 0(_arr_reg_31_)
	ori	$3, $28, 0
# was:	ori	_arg_29_, $28, 0
	sll	$4, $2, 2
# was:	sll	_tmp_42_, _size_reg_30_, 2
	addi	$4, $4, 4
# was:	addi	_tmp_42_, _tmp_42_, 4
	add	$28, $28, $4
# was:	add	$28, $28, _tmp_42_
	sw	$2, 0($3)
# was:	sw	_size_reg_30_, 0(_arg_29_)
	addi	$4, $3, 4
# was:	addi	_addr_reg_34_, _arg_29_, 4
	ori	$5, $0, 0
# was:	ori	_i_reg_35_, $0, 0
	addi	$6, $6, 4
# was:	addi	_elem_reg_32_, _arr_reg_31_, 4
_loop_beg_36_:
	sub	$7, $5, $2
# was:	sub	_tmp_reg_38_, _i_reg_35_, _size_reg_30_
	bgez	$7, _loop_end_37_
# was:	bgez	_tmp_reg_38_, _loop_end_37_
	lw	$7, 0($6)
# was:	lw	_res_reg_33_, 0(_elem_reg_32_)
	addi	$6, $6, 4
# was:	addi	_elem_reg_32_, _elem_reg_32_, 4
# 	ori	_plus_L_40_,_res_reg_33_,0
	ori	$8, $0, 2
# was:	ori	_plus_R_41_, $0, 2
	add	$7, $7, $8
# was:	add	_fun_arg_res_39_, _plus_L_40_, _plus_R_41_
# 	ori	_res_reg_33_,_fun_arg_res_39_,0
	sw	$7, 0($4)
# was:	sw	_res_reg_33_, 0(_addr_reg_34_)
	addi	$4, $4, 4
# was:	addi	_addr_reg_34_, _addr_reg_34_, 4
	addi	$5, $5, 1
# was:	addi	_i_reg_35_, _i_reg_35_, 1
	j	_loop_beg_36_
_loop_end_37_:
	ori	$2, $3, 0
# was:	ori	$2, _arg_29_, 0
	jal	write_int_arr
# was:	jal	write_int_arr, $2
	ori	$16, $2, 0
# was:	ori	_letBind_28_, $2, 0
	la	$2, _a__str__45_
# was:	la	_tmp_44_, _a__str__45_
# _a__str__45_: string "\n"
# 	ori	_letBind_43_,_tmp_44_,0
# 	ori	$2,_tmp_44_,0
	jal	putstring
# was:	jal	putstring, $2
# 	ori	_arr_reg_47_,_letBind_28_,0
	lw	$2, 0($16)
# was:	lw	_size_reg_48_, 0(_arr_reg_47_)
	ori	$4, $0, 0
# was:	ori	_arg_46_, $0, 0
	addi	$16, $16, 4
# was:	addi	_arr_reg_47_, _arr_reg_47_, 4
	ori	$3, $0, 0
# was:	ori	_ind_var_49_, $0, 0
_loop_beg_51_:
	sub	$5, $3, $2
# was:	sub	_tmp_reg_50_, _ind_var_49_, _size_reg_48_
	bgez	$5, _loop_end_52_
# was:	bgez	_tmp_reg_50_, _loop_end_52_
	lw	$5, 0($16)
# was:	lw	_tmp_reg_50_, 0(_arr_reg_47_)
	addi	$16, $16, 4
# was:	addi	_arr_reg_47_, _arr_reg_47_, 4
# 	ori	_plus_L_54_,_arg_46_,0
# 	ori	_plus_R_55_,_tmp_reg_50_,0
	add	$4, $4, $5
# was:	add	_fun_arg_res_53_, _plus_L_54_, _plus_R_55_
# 	ori	_arg_46_,_fun_arg_res_53_,0
	addi	$3, $3, 1
# was:	addi	_ind_var_49_, _ind_var_49_, 1
	j	_loop_beg_51_
_loop_end_52_:
	ori	$2, $4, 0
# was:	ori	$2, _arg_46_, 0
	jal	write_int
# was:	jal	write_int, $2
# 	ori	_mainres_17_,$2,0
# 	ori	$2,_mainres_17_,0
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
_a__str__45_:
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