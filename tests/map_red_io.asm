	.text	0x00400000
	.globl	main
	la	$28, _heap_
	la	$4, _Maxacha_82_
# was:	la	_Maxacha_82__addr, _Maxacha_82_
	ori	$3, $0, 10
# was:	ori	_Maxacha_82__init, $0, 10
	sw	$3, 0($4)
# was:	sw	_Maxacha_82__init, 0(_Maxacha_82__addr)
	la	$4, _a__str__79_
# was:	la	_a__str__79__addr, _a__str__79_
	ori	$3, $0, 1
# was:	ori	_a__str__79__init, $0, 1
	sw	$3, 0($4)
# was:	sw	_a__str__79__init, 0(_a__str__79__addr)
	la	$4, _Sumaa___74_
# was:	la	_Sumaa___74__addr, _Sumaa___74_
	ori	$3, $0, 5
# was:	ori	_Sumaa___74__init, $0, 5
	sw	$3, 0($4)
# was:	sw	_Sumaa___74__init, 0(_Sumaa___74__addr)
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
# Function read_chr
read_chr:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_i_5_,$2,0
	jal	getchar
# was:	jal	getchar, $2
# 	ori	_read_chrres_6_,$2,0
# 	ori	$2,_read_chrres_6_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
# Function plus
plus:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_x_7_,$2,0
# 	ori	_param_y_8_,$3,0
# 	ori	_plus_L_10_,_param_x_7_,0
# 	ori	_plus_R_11_,_param_y_8_,0
	add	$2, $2, $3
# was:	add	_plusres_9_, _plus_L_10_, _plus_R_11_
# 	ori	$2,_plusres_9_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
# Function max_chr
max_chr:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_a_12_,$2,0
# 	ori	_param_b_13_,$3,0
# 	ori	_lt_L_19_,_param_a_12_,0
# 	ori	_lt_R_20_,_param_b_13_,0
	slt	$4, $2, $3
# was:	slt	_cond_18_, _lt_L_19_, _lt_R_20_
	bne	$4, $0, _then_15_
# was:	bne	_cond_18_, $0, _then_15_
	j	_else_16_
_then_15_:
	ori	$2, $3, 0
# was:	ori	_max_chrres_14_, _param_b_13_, 0
	j	_endif_17_
_else_16_:
# 	ori	_max_chrres_14_,_param_a_12_,0
_endif_17_:
# 	ori	$2,_max_chrres_14_,0
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
# 	ori	_letBind_22_,$2,0
# 	ori	_size_reg_24_,_letBind_22_,0
	bgez	$2, _safe_lab_25_
# was:	bgez	_size_reg_24_, _safe_lab_25_
	ori	$5, $0, 10
# was:	ori	$5, $0, 10
	la	$6, _Msg_IllegalArraySize_
# was:	la	$6, _Msg_IllegalArraySize_
	j	_RuntimeError_
_safe_lab_25_:
	ori	$16, $28, 0
# was:	ori	_letBind_23_, $28, 0
	sll	$3, $2, 2
# was:	sll	_tmp_31_, _size_reg_24_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_31_, _tmp_31_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_31_
	sw	$2, 0($16)
# was:	sw	_size_reg_24_, 0(_letBind_23_)
	addi	$3, $16, 4
# was:	addi	_addr_reg_26_, _letBind_23_, 4
	ori	$4, $0, 0
# was:	ori	_i_reg_27_, $0, 0
_loop_beg_28_:
	sub	$5, $4, $2
# was:	sub	_tmp_reg_30_, _i_reg_27_, _size_reg_24_
	bgez	$5, _loop_end_29_
# was:	bgez	_tmp_reg_30_, _loop_end_29_
	sw	$4, 0($3)
# was:	sw	_i_reg_27_, 0(_addr_reg_26_)
	addi	$3, $3, 4
# was:	addi	_addr_reg_26_, _addr_reg_26_, 4
	addi	$4, $4, 1
# was:	addi	_i_reg_27_, _i_reg_27_, 1
	j	_loop_beg_28_
_loop_end_29_:
# 	ori	_arr_reg_34_,_letBind_23_,0
	lw	$17, 0($16)
# was:	lw	_size_reg_33_, 0(_arr_reg_34_)
	ori	$20, $28, 0
# was:	ori	_letBind_32_, $28, 0
	sll	$2, $17, 2
# was:	sll	_tmp_43_, _size_reg_33_, 2
	addi	$2, $2, 4
# was:	addi	_tmp_43_, _tmp_43_, 4
	add	$28, $28, $2
# was:	add	$28, $28, _tmp_43_
	sw	$17, 0($20)
# was:	sw	_size_reg_33_, 0(_letBind_32_)
	addi	$18, $20, 4
# was:	addi	_addr_reg_37_, _letBind_32_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_38_, $0, 0
	addi	$21, $16, 4
# was:	addi	_elem_reg_35_, _arr_reg_34_, 4
_loop_beg_39_:
	sub	$2, $19, $17
# was:	sub	_tmp_reg_41_, _i_reg_38_, _size_reg_33_
	bgez	$2, _loop_end_40_
# was:	bgez	_tmp_reg_41_, _loop_end_40_
	lw	$2, 0($21)
# was:	lw	_res_reg_36_, 0(_elem_reg_35_)
	addi	$21, $21, 4
# was:	addi	_elem_reg_35_, _elem_reg_35_, 4
# 	ori	$2,_res_reg_36_,0
	jal	plus100
# was:	jal	plus100, $2
# 	ori	_tmp_reg_42_,$2,0
# 	ori	_res_reg_36_,_tmp_reg_42_,0
	sw	$2, 0($18)
# was:	sw	_res_reg_36_, 0(_addr_reg_37_)
	addi	$18, $18, 4
# was:	addi	_addr_reg_37_, _addr_reg_37_, 4
	addi	$19, $19, 1
# was:	addi	_i_reg_38_, _i_reg_38_, 1
	j	_loop_beg_39_
_loop_end_40_:
# 	ori	_arr_reg_45_,_letBind_32_,0
	lw	$18, 0($20)
# was:	lw	_size_reg_46_, 0(_arr_reg_45_)
	ori	$17, $0, 0
# was:	ori	_letBind_44_, $0, 0
	addi	$20, $20, 4
# was:	addi	_arr_reg_45_, _arr_reg_45_, 4
	ori	$19, $0, 0
# was:	ori	_ind_var_47_, $0, 0
_loop_beg_49_:
	sub	$3, $19, $18
# was:	sub	_tmp_reg_48_, _ind_var_47_, _size_reg_46_
	bgez	$3, _loop_end_50_
# was:	bgez	_tmp_reg_48_, _loop_end_50_
	lw	$3, 0($20)
# was:	lw	_tmp_reg_48_, 0(_arr_reg_45_)
	addi	$20, $20, 4
# was:	addi	_arr_reg_45_, _arr_reg_45_, 4
	ori	$2, $17, 0
# was:	ori	$2, _letBind_44_, 0
# 	ori	$3,_tmp_reg_48_,0
	jal	plus
# was:	jal	plus, $2 $3
# 	ori	_tmp_reg_51_,$2,0
	ori	$17, $2, 0
# was:	ori	_letBind_44_, _tmp_reg_51_, 0
	addi	$19, $19, 1
# was:	addi	_ind_var_47_, _ind_var_47_, 1
	j	_loop_beg_49_
_loop_end_50_:
	ori	$2, $16, 0
# was:	ori	_arr_reg_54_, _letBind_23_, 0
	lw	$18, 0($2)
# was:	lw	_size_reg_53_, 0(_arr_reg_54_)
	ori	$16, $28, 0
# was:	ori	_letBind_52_, $28, 0
	addi	$3, $18, 3
# was:	addi	_tmp_63_, _size_reg_53_, 3
	sra	$3, $3, 2
# was:	sra	_tmp_63_, _tmp_63_, 2
	sll	$3, $3, 2
# was:	sll	_tmp_63_, _tmp_63_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_63_, _tmp_63_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_63_
	sw	$18, 0($16)
# was:	sw	_size_reg_53_, 0(_letBind_52_)
	addi	$20, $16, 4
# was:	addi	_addr_reg_57_, _letBind_52_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_58_, $0, 0
	addi	$21, $2, 4
# was:	addi	_elem_reg_55_, _arr_reg_54_, 4
_loop_beg_59_:
	sub	$2, $19, $18
# was:	sub	_tmp_reg_61_, _i_reg_58_, _size_reg_53_
	bgez	$2, _loop_end_60_
# was:	bgez	_tmp_reg_61_, _loop_end_60_
	lw	$2, 0($21)
# was:	lw	_res_reg_56_, 0(_elem_reg_55_)
	addi	$21, $21, 4
# was:	addi	_elem_reg_55_, _elem_reg_55_, 4
# 	ori	$2,_res_reg_56_,0
	jal	read_chr
# was:	jal	read_chr, $2
# 	ori	_tmp_reg_62_,$2,0
# 	ori	_res_reg_56_,_tmp_reg_62_,0
	sb	$2, 0($20)
# was:	sb	_res_reg_56_, 0(_addr_reg_57_)
	addi	$20, $20, 1
# was:	addi	_addr_reg_57_, _addr_reg_57_, 1
	addi	$19, $19, 1
# was:	addi	_i_reg_58_, _i_reg_58_, 1
	j	_loop_beg_59_
_loop_end_60_:
	ori	$20, $16, 0
# was:	ori	_arr_reg_65_, _letBind_52_, 0
	lw	$19, 0($20)
# was:	lw	_size_reg_66_, 0(_arr_reg_65_)
	ori	$18, $0, 97
# was:	ori	_letBind_64_, $0, 97
	addi	$20, $20, 4
# was:	addi	_arr_reg_65_, _arr_reg_65_, 4
	ori	$21, $0, 0
# was:	ori	_ind_var_67_, $0, 0
_loop_beg_69_:
	sub	$3, $21, $19
# was:	sub	_tmp_reg_68_, _ind_var_67_, _size_reg_66_
	bgez	$3, _loop_end_70_
# was:	bgez	_tmp_reg_68_, _loop_end_70_
	lb	$3, 0($20)
# was:	lb	_tmp_reg_68_, 0(_arr_reg_65_)
	addi	$20, $20, 1
# was:	addi	_arr_reg_65_, _arr_reg_65_, 1
	ori	$2, $18, 0
# was:	ori	$2, _letBind_64_, 0
# 	ori	$3,_tmp_reg_68_,0
	jal	max_chr
# was:	jal	max_chr, $2 $3
# 	ori	_tmp_reg_71_,$2,0
	ori	$18, $2, 0
# was:	ori	_letBind_64_, _tmp_reg_71_, 0
	addi	$21, $21, 1
# was:	addi	_ind_var_67_, _ind_var_67_, 1
	j	_loop_beg_69_
_loop_end_70_:
	la	$2, _Sumaa___74_
# was:	la	_tmp_73_, _Sumaa___74_
# _Sumaa___74_: string "Sum: "
# 	ori	_letBind_72_,_tmp_73_,0
# 	ori	$2,_tmp_73_,0
	jal	putstring
# was:	jal	putstring, $2
	ori	$2, $17, 0
# was:	ori	_tmp_76_, _letBind_44_, 0
# 	ori	_letBind_75_,_tmp_76_,0
# 	ori	$2,_letBind_75_,0
	jal	putint
# was:	jal	putint, $2
	la	$2, _a__str__79_
# was:	la	_tmp_78_, _a__str__79_
# _a__str__79_: string "\n"
# 	ori	_letBind_77_,_tmp_78_,0
# 	ori	$2,_tmp_78_,0
	jal	putstring
# was:	jal	putstring, $2
	la	$2, _Maxacha_82_
# was:	la	_tmp_81_, _Maxacha_82_
# _Maxacha_82_: string "Max char: "
# 	ori	_letBind_80_,_tmp_81_,0
# 	ori	$2,_tmp_81_,0
	jal	putstring
# was:	jal	putstring, $2
	ori	$2, $18, 0
# was:	ori	_tmp_84_, _letBind_64_, 0
# 	ori	_letBind_83_,_tmp_84_,0
# 	ori	$2,_letBind_83_,0
	jal	putchar
# was:	jal	putchar, $2
	ori	$2, $16, 0
# was:	ori	_mainres_21_, _letBind_52_, 0
# 	ori	$2,_mainres_21_,0
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
_Maxacha_82_:
	.space	4
	.asciiz	"Max char: "
	.align	2
_a__str__79_:
	.space	4
	.asciiz	"\n"
	.align	2
_Sumaa___74_:
	.space	4
	.asciiz	"Sum: "
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