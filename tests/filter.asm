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
# Function isMul16
isMul16:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_a_17_,$2,0
	ori	$3, $0, 16
# was:	ori	_divide_R_24_, $0, 16
	bne	$3, $0, _safe_lab_25_
# was:	bne	_divide_R_24_, $0, _safe_lab_25_
	ori	$5, $0, 6
# was:	ori	$5, $0, 6
	la	$6, _Msg_DivZero_
# was:	la	$6, _Msg_DivZero_
	j	_RuntimeError_
_safe_lab_25_:
# 	ori	_divide_L_23_,_param_a_17_,0
	div	$4, $2, $3
# was:	div	_times_L_21_, _divide_L_23_, _divide_R_24_
	ori	$3, $0, 16
# was:	ori	_times_R_22_, $0, 16
	mul	$3, $4, $3
# was:	mul	_eq_L_19_, _times_L_21_, _times_R_22_
# 	ori	_eq_R_20_,_param_a_17_,0
	ori	$4, $0, 0
# was:	ori	_isMul16res_18_, $0, 0
	bne	$3, $2, _false_26_
# was:	bne	_eq_L_19_, _eq_R_20_, _false_26_
	ori	$4, $0, 1
# was:	ori	_isMul16res_18_, $0, 1
_false_26_:
	ori	$2, $4, 0
# was:	ori	$2, _isMul16res_18_, 0
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
# 	ori	_letBind_28_,$2,0
# 	ori	_size_reg_41_,_letBind_28_,0
	bgez	$2, _safe_lab_42_
# was:	bgez	_size_reg_41_, _safe_lab_42_
	ori	$5, $0, 10
# was:	ori	$5, $0, 10
	la	$6, _Msg_IllegalArraySize_
# was:	la	$6, _Msg_IllegalArraySize_
	j	_RuntimeError_
_safe_lab_42_:
	ori	$7, $28, 0
# was:	ori	_arr_reg_31_, $28, 0
	sll	$3, $2, 2
# was:	sll	_tmp_48_, _size_reg_41_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_48_, _tmp_48_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_48_
	sw	$2, 0($7)
# was:	sw	_size_reg_41_, 0(_arr_reg_31_)
	addi	$5, $7, 4
# was:	addi	_addr_reg_43_, _arr_reg_31_, 4
	ori	$3, $0, 0
# was:	ori	_i_reg_44_, $0, 0
_loop_beg_45_:
	sub	$4, $3, $2
# was:	sub	_tmp_reg_47_, _i_reg_44_, _size_reg_41_
	bgez	$4, _loop_end_46_
# was:	bgez	_tmp_reg_47_, _loop_end_46_
	sw	$3, 0($5)
# was:	sw	_i_reg_44_, 0(_addr_reg_43_)
	addi	$5, $5, 4
# was:	addi	_addr_reg_43_, _addr_reg_43_, 4
	addi	$3, $3, 1
# was:	addi	_i_reg_44_, _i_reg_44_, 1
	j	_loop_beg_45_
_loop_end_46_:
	lw	$3, 0($7)
# was:	lw	_size_reg_30_, 0(_arr_reg_31_)
	ori	$2, $28, 0
# was:	ori	_letBind_29_, $28, 0
	sll	$4, $3, 2
# was:	sll	_tmp_58_, _size_reg_30_, 2
	addi	$4, $4, 4
# was:	addi	_tmp_58_, _tmp_58_, 4
	add	$28, $28, $4
# was:	add	$28, $28, _tmp_58_
	sw	$3, 0($2)
# was:	sw	_size_reg_30_, 0(_letBind_29_)
	addi	$4, $2, 4
# was:	addi	_addr_reg_34_, _letBind_29_, 4
	ori	$6, $0, 0
# was:	ori	_i_reg_35_, $0, 0
	ori	$5, $0, 0
# was:	ori	_j_reg_36_, $0, 0
	addi	$7, $7, 4
# was:	addi	_elem_reg_32_, _arr_reg_31_, 4
_loop_beg_37_:
	sub	$8, $6, $3
# was:	sub	_tmp_reg_39_, _i_reg_35_, _size_reg_30_
	bgez	$8, _loop_end_38_
# was:	bgez	_tmp_reg_39_, _loop_end_38_
	lw	$8, 0($7)
# was:	lw	_res_reg_33_, 0(_elem_reg_32_)
# 	ori	_eq_L_50_,_res_reg_33_,0
	ori	$9, $0, 2
# was:	ori	_divide_R_55_, $0, 2
	bne	$9, $0, _safe_lab_56_
# was:	bne	_divide_R_55_, $0, _safe_lab_56_
	ori	$5, $0, 10
# was:	ori	$5, $0, 10
	la	$6, _Msg_DivZero_
# was:	la	$6, _Msg_DivZero_
	j	_RuntimeError_
_safe_lab_56_:
	ori	$10, $8, 0
# was:	ori	_divide_L_54_, _res_reg_33_, 0
	div	$10, $10, $9
# was:	div	_times_L_52_, _divide_L_54_, _divide_R_55_
	ori	$9, $0, 2
# was:	ori	_times_R_53_, $0, 2
	mul	$10, $10, $9
# was:	mul	_eq_R_51_, _times_L_52_, _times_R_53_
	ori	$9, $0, 0
# was:	ori	_fun_arg_res_49_, $0, 0
	bne	$8, $10, _false_57_
# was:	bne	_eq_L_50_, _eq_R_51_, _false_57_
	ori	$9, $0, 1
# was:	ori	_fun_arg_res_49_, $0, 1
_false_57_:
	ori	$8, $9, 0
# was:	ori	_res_reg_33_, _fun_arg_res_49_, 0
	beq	$8, $0, _false_label_40_
# was:	beq	_res_reg_33_, $0, _false_label_40_
	lw	$8, 0($7)
# was:	lw	_res_reg_33_, 0(_elem_reg_32_)
	sw	$8, 0($4)
# was:	sw	_res_reg_33_, 0(_addr_reg_34_)
	addi	$4, $4, 4
# was:	addi	_addr_reg_34_, _addr_reg_34_, 4
	addi	$5, $5, 1
# was:	addi	_j_reg_36_, _j_reg_36_, 1
_false_label_40_:
	addi	$7, $7, 4
# was:	addi	_elem_reg_32_, _elem_reg_32_, 4
	addi	$6, $6, 1
# was:	addi	_i_reg_35_, _i_reg_35_, 1
	j	_loop_beg_37_
_loop_end_38_:
	sw	$5, 0($2)
# was:	sw	_j_reg_36_, 0(_letBind_29_)
	ori	$6, $2, 0
# was:	ori	_arr_reg_61_, _letBind_29_, 0
	lw	$3, 0($6)
# was:	lw	_size_reg_60_, 0(_arr_reg_61_)
	ori	$2, $28, 0
# was:	ori	_letBind_59_, $28, 0
	sll	$4, $3, 2
# was:	sll	_tmp_72_, _size_reg_60_, 2
	addi	$4, $4, 4
# was:	addi	_tmp_72_, _tmp_72_, 4
	add	$28, $28, $4
# was:	add	$28, $28, _tmp_72_
	sw	$3, 0($2)
# was:	sw	_size_reg_60_, 0(_letBind_59_)
	addi	$5, $2, 4
# was:	addi	_addr_reg_64_, _letBind_59_, 4
	ori	$4, $0, 0
# was:	ori	_i_reg_65_, $0, 0
	addi	$6, $6, 4
# was:	addi	_elem_reg_62_, _arr_reg_61_, 4
_loop_beg_66_:
	sub	$7, $4, $3
# was:	sub	_tmp_reg_68_, _i_reg_65_, _size_reg_60_
	bgez	$7, _loop_end_67_
# was:	bgez	_tmp_reg_68_, _loop_end_67_
	lw	$7, 0($6)
# was:	lw	_res_reg_63_, 0(_elem_reg_62_)
	addi	$6, $6, 4
# was:	addi	_elem_reg_62_, _elem_reg_62_, 4
# 	ori	_times_L_70_,_res_reg_63_,0
	ori	$8, $7, 0
# was:	ori	_times_R_71_, _res_reg_63_, 0
	mul	$7, $7, $8
# was:	mul	_fun_arg_res_69_, _times_L_70_, _times_R_71_
# 	ori	_res_reg_63_,_fun_arg_res_69_,0
	sw	$7, 0($5)
# was:	sw	_res_reg_63_, 0(_addr_reg_64_)
	addi	$5, $5, 4
# was:	addi	_addr_reg_64_, _addr_reg_64_, 4
	addi	$4, $4, 1
# was:	addi	_i_reg_65_, _i_reg_65_, 1
	j	_loop_beg_66_
_loop_end_67_:
# 	ori	_arr_reg_75_,_letBind_59_,0
	lw	$16, 0($2)
# was:	lw	_size_reg_74_, 0(_arr_reg_75_)
	ori	$17, $28, 0
# was:	ori	_letBind_73_, $28, 0
	sll	$3, $16, 2
# was:	sll	_tmp_86_, _size_reg_74_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_86_, _tmp_86_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_86_
	sw	$16, 0($17)
# was:	sw	_size_reg_74_, 0(_letBind_73_)
	addi	$19, $17, 4
# was:	addi	_addr_reg_78_, _letBind_73_, 4
	ori	$18, $0, 0
# was:	ori	_i_reg_79_, $0, 0
	ori	$20, $0, 0
# was:	ori	_j_reg_80_, $0, 0
	addi	$21, $2, 4
# was:	addi	_elem_reg_76_, _arr_reg_75_, 4
_loop_beg_81_:
	sub	$2, $18, $16
# was:	sub	_tmp_reg_83_, _i_reg_79_, _size_reg_74_
	bgez	$2, _loop_end_82_
# was:	bgez	_tmp_reg_83_, _loop_end_82_
	lw	$2, 0($21)
# was:	lw	_res_reg_77_, 0(_elem_reg_76_)
# 	ori	$2,_res_reg_77_,0
	jal	isMul16
# was:	jal	isMul16, $2
# 	ori	_tmp_reg_85_,$2,0
# 	ori	_res_reg_77_,_tmp_reg_85_,0
	beq	$2, $0, _false_label_84_
# was:	beq	_res_reg_77_, $0, _false_label_84_
	lw	$2, 0($21)
# was:	lw	_res_reg_77_, 0(_elem_reg_76_)
	sw	$2, 0($19)
# was:	sw	_res_reg_77_, 0(_addr_reg_78_)
	addi	$19, $19, 4
# was:	addi	_addr_reg_78_, _addr_reg_78_, 4
	addi	$20, $20, 1
# was:	addi	_j_reg_80_, _j_reg_80_, 1
_false_label_84_:
	addi	$21, $21, 4
# was:	addi	_elem_reg_76_, _elem_reg_76_, 4
	addi	$18, $18, 1
# was:	addi	_i_reg_79_, _i_reg_79_, 1
	j	_loop_beg_81_
_loop_end_82_:
	sw	$20, 0($17)
# was:	sw	_j_reg_80_, 0(_letBind_73_)
	ori	$2, $17, 0
# was:	ori	_arg_87_, _letBind_73_, 0
# 	ori	$2,_arg_87_,0
	jal	write_int_arr
# was:	jal	write_int_arr, $2
# 	ori	_mainres_27_,$2,0
# 	ori	$2,_mainres_27_,0
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