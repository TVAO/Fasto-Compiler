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
# Function write_1darr
write_1darr:
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
# was:	ori	_write_1darrres_5_, $28, 0
	sll	$3, $16, 2
# was:	sll	_tmp_16_, _size_reg_6_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_16_, _tmp_16_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_16_
	sw	$16, 0($17)
# was:	sw	_size_reg_6_, 0(_write_1darrres_5_)
	addi	$18, $17, 4
# was:	addi	_addr_reg_10_, _write_1darrres_5_, 4
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
# was:	ori	$2, _write_1darrres_5_, 0
	addi	$29, $29, 28
	lw	$20, -24($29)
	lw	$19, -20($29)
	lw	$18, -16($29)
	lw	$17, -12($29)
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
# Function write_2darr
write_2darr:
	sw	$31, -4($29)
	sw	$20, -24($29)
	sw	$19, -20($29)
	sw	$18, -16($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -28
# 	ori	_param_x_17_,$2,0
# 	ori	_arr_reg_20_,_param_x_17_,0
	lw	$16, 0($2)
# was:	lw	_size_reg_19_, 0(_arr_reg_20_)
	ori	$17, $28, 0
# was:	ori	_write_2darrres_18_, $28, 0
	sll	$3, $16, 2
# was:	sll	_tmp_29_, _size_reg_19_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_29_, _tmp_29_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_29_
	sw	$16, 0($17)
# was:	sw	_size_reg_19_, 0(_write_2darrres_18_)
	addi	$18, $17, 4
# was:	addi	_addr_reg_23_, _write_2darrres_18_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_24_, $0, 0
	addi	$20, $2, 4
# was:	addi	_elem_reg_21_, _arr_reg_20_, 4
_loop_beg_25_:
	sub	$2, $19, $16
# was:	sub	_tmp_reg_27_, _i_reg_24_, _size_reg_19_
	bgez	$2, _loop_end_26_
# was:	bgez	_tmp_reg_27_, _loop_end_26_
	lw	$2, 0($20)
# was:	lw	_res_reg_22_, 0(_elem_reg_21_)
	addi	$20, $20, 4
# was:	addi	_elem_reg_21_, _elem_reg_21_, 4
# 	ori	$2,_res_reg_22_,0
	jal	write_1darr
# was:	jal	write_1darr, $2
# 	ori	_tmp_reg_28_,$2,0
# 	ori	_res_reg_22_,_tmp_reg_28_,0
	sw	$2, 0($18)
# was:	sw	_res_reg_22_, 0(_addr_reg_23_)
	addi	$18, $18, 4
# was:	addi	_addr_reg_23_, _addr_reg_23_, 4
	addi	$19, $19, 1
# was:	addi	_i_reg_24_, _i_reg_24_, 1
	j	_loop_beg_25_
_loop_end_26_:
	ori	$2, $17, 0
# was:	ori	$2, _write_2darrres_18_, 0
	addi	$29, $29, 28
	lw	$20, -24($29)
	lw	$19, -20($29)
	lw	$18, -16($29)
	lw	$17, -12($29)
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
# Function even
even:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_a_30_,$2,0
	ori	$3, $0, 2
# was:	ori	_divide_R_37_, $0, 2
	bne	$3, $0, _safe_lab_38_
# was:	bne	_divide_R_37_, $0, _safe_lab_38_
	ori	$5, $0, 6
# was:	ori	$5, $0, 6
	la	$6, _Msg_DivZero_
# was:	la	$6, _Msg_DivZero_
	j	_RuntimeError_
_safe_lab_38_:
# 	ori	_divide_L_36_,_param_a_30_,0
	div	$4, $2, $3
# was:	div	_times_L_34_, _divide_L_36_, _divide_R_37_
	ori	$3, $0, 2
# was:	ori	_times_R_35_, $0, 2
	mul	$3, $4, $3
# was:	mul	_eq_L_32_, _times_L_34_, _times_R_35_
# 	ori	_eq_R_33_,_param_a_30_,0
	ori	$4, $0, 0
# was:	ori	_evenres_31_, $0, 0
	bne	$3, $2, _false_39_
# was:	bne	_eq_L_32_, _eq_R_33_, _false_39_
	ori	$4, $0, 1
# was:	ori	_evenres_31_, $0, 1
_false_39_:
	ori	$2, $4, 0
# was:	ori	$2, _evenres_31_, 0
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
# 	ori	_letBind_41_,$2,0
	ori	$3, $2, 0
# was:	ori	_size_reg_47_, _letBind_41_, 0
	bgez	$3, _safe_lab_48_
# was:	bgez	_size_reg_47_, _safe_lab_48_
	ori	$5, $0, 11
# was:	ori	$5, $0, 11
	la	$6, _Msg_IllegalArraySize_
# was:	la	$6, _Msg_IllegalArraySize_
	j	_RuntimeError_
_safe_lab_48_:
	ori	$2, $28, 0
# was:	ori	_arr_reg_44_, $28, 0
	sll	$4, $3, 2
# was:	sll	_tmp_54_, _size_reg_47_, 2
	addi	$4, $4, 4
# was:	addi	_tmp_54_, _tmp_54_, 4
	add	$28, $28, $4
# was:	add	$28, $28, _tmp_54_
	sw	$3, 0($2)
# was:	sw	_size_reg_47_, 0(_arr_reg_44_)
	addi	$5, $2, 4
# was:	addi	_addr_reg_49_, _arr_reg_44_, 4
	ori	$6, $0, 0
# was:	ori	_i_reg_50_, $0, 0
_loop_beg_51_:
	sub	$4, $6, $3
# was:	sub	_tmp_reg_53_, _i_reg_50_, _size_reg_47_
	bgez	$4, _loop_end_52_
# was:	bgez	_tmp_reg_53_, _loop_end_52_
	sw	$6, 0($5)
# was:	sw	_i_reg_50_, 0(_addr_reg_49_)
	addi	$5, $5, 4
# was:	addi	_addr_reg_49_, _addr_reg_49_, 4
	addi	$6, $6, 1
# was:	addi	_i_reg_50_, _i_reg_50_, 1
	j	_loop_beg_51_
_loop_end_52_:
	lw	$4, 0($2)
# was:	lw	_size_reg_43_, 0(_arr_reg_44_)
	ori	$3, $28, 0
# was:	ori	_letBind_42_, $28, 0
	sll	$5, $4, 2
# was:	sll	_tmp_71_, _size_reg_43_, 2
	addi	$5, $5, 4
# was:	addi	_tmp_71_, _tmp_71_, 4
	add	$28, $28, $5
# was:	add	$28, $28, _tmp_71_
	sw	$4, 0($3)
# was:	sw	_size_reg_43_, 0(_letBind_42_)
	addi	$5, $3, 4
# was:	addi	_addr_reg_55_, _letBind_42_, 4
	ori	$6, $0, 0
# was:	ori	_i_reg_56_, $0, 0
	addi	$7, $2, 4
# was:	addi	_elem_reg_45_, _arr_reg_44_, 4
_loop_beg_57_:
	sub	$2, $6, $4
# was:	sub	_tmp_reg_59_, _i_reg_56_, _size_reg_43_
	bgez	$2, _loop_end_58_
# was:	bgez	_tmp_reg_59_, _loop_end_58_
	lw	$2, 0($7)
# was:	lw	_res_reg_46_, 0(_elem_reg_45_)
	addi	$7, $7, 4
# was:	addi	_elem_reg_45_, _elem_reg_45_, 4
# 	ori	_plus_L_62_,_res_reg_46_,0
	ori	$8, $0, 2
# was:	ori	_plus_R_63_, $0, 2
	add	$2, $2, $8
# was:	add	_size_reg_61_, _plus_L_62_, _plus_R_63_
	bgez	$2, _safe_lab_64_
# was:	bgez	_size_reg_61_, _safe_lab_64_
	ori	$5, $0, 10
# was:	ori	$5, $0, 10
	la	$6, _Msg_IllegalArraySize_
# was:	la	$6, _Msg_IllegalArraySize_
	j	_RuntimeError_
_safe_lab_64_:
	ori	$8, $28, 0
# was:	ori	_fun_arg_res_60_, $28, 0
	sll	$9, $2, 2
# was:	sll	_tmp_70_, _size_reg_61_, 2
	addi	$9, $9, 4
# was:	addi	_tmp_70_, _tmp_70_, 4
	add	$28, $28, $9
# was:	add	$28, $28, _tmp_70_
	sw	$2, 0($8)
# was:	sw	_size_reg_61_, 0(_fun_arg_res_60_)
	addi	$11, $8, 4
# was:	addi	_addr_reg_65_, _fun_arg_res_60_, 4
	ori	$10, $0, 0
# was:	ori	_i_reg_66_, $0, 0
_loop_beg_67_:
	sub	$9, $10, $2
# was:	sub	_tmp_reg_69_, _i_reg_66_, _size_reg_61_
	bgez	$9, _loop_end_68_
# was:	bgez	_tmp_reg_69_, _loop_end_68_
	sw	$10, 0($11)
# was:	sw	_i_reg_66_, 0(_addr_reg_65_)
	addi	$11, $11, 4
# was:	addi	_addr_reg_65_, _addr_reg_65_, 4
	addi	$10, $10, 1
# was:	addi	_i_reg_66_, _i_reg_66_, 1
	j	_loop_beg_67_
_loop_end_68_:
	ori	$2, $8, 0
# was:	ori	_res_reg_46_, _fun_arg_res_60_, 0
	sw	$2, 0($5)
# was:	sw	_res_reg_46_, 0(_addr_reg_55_)
	addi	$5, $5, 4
# was:	addi	_addr_reg_55_, _addr_reg_55_, 4
	addi	$6, $6, 1
# was:	addi	_i_reg_56_, _i_reg_56_, 1
	j	_loop_beg_57_
_loop_end_58_:
# 	ori	_arr_reg_74_,_letBind_42_,0
	lw	$17, 0($3)
# was:	lw	_size_reg_73_, 0(_arr_reg_74_)
	ori	$16, $28, 0
# was:	ori	_letBind_72_, $28, 0
	sll	$2, $17, 2
# was:	sll	_tmp_96_, _size_reg_73_, 2
	addi	$2, $2, 4
# was:	addi	_tmp_96_, _tmp_96_, 4
	add	$28, $28, $2
# was:	add	$28, $28, _tmp_96_
	sw	$17, 0($16)
# was:	sw	_size_reg_73_, 0(_letBind_72_)
	addi	$19, $16, 4
# was:	addi	_addr_reg_77_, _letBind_72_, 4
	ori	$18, $0, 0
# was:	ori	_i_reg_78_, $0, 0
	ori	$20, $0, 0
# was:	ori	_j_reg_79_, $0, 0
	addi	$21, $3, 4
# was:	addi	_elem_reg_75_, _arr_reg_74_, 4
_loop_beg_80_:
	sub	$2, $18, $17
# was:	sub	_tmp_reg_82_, _i_reg_78_, _size_reg_73_
	bgez	$2, _loop_end_81_
# was:	bgez	_tmp_reg_82_, _loop_end_81_
	lw	$2, 0($21)
# was:	lw	_res_reg_76_, 0(_elem_reg_75_)
# 	ori	_arr_reg_86_,_res_reg_76_,0
	lw	$3, 0($2)
# was:	lw	_size_reg_87_, 0(_arr_reg_86_)
	ori	$6, $0, 0
# was:	ori	_letBind_85_, $0, 0
	addi	$2, $2, 4
# was:	addi	_arr_reg_86_, _arr_reg_86_, 4
	ori	$4, $0, 0
# was:	ori	_ind_var_88_, $0, 0
_loop_beg_90_:
	sub	$5, $4, $3
# was:	sub	_tmp_reg_89_, _ind_var_88_, _size_reg_87_
	bgez	$5, _loop_end_91_
# was:	bgez	_tmp_reg_89_, _loop_end_91_
	lw	$5, 0($2)
# was:	lw	_tmp_reg_89_, 0(_arr_reg_86_)
	addi	$2, $2, 4
# was:	addi	_arr_reg_86_, _arr_reg_86_, 4
# 	ori	_plus_L_93_,_letBind_85_,0
# 	ori	_plus_R_94_,_tmp_reg_89_,0
	add	$6, $6, $5
# was:	add	_fun_arg_res_92_, _plus_L_93_, _plus_R_94_
# 	ori	_letBind_85_,_fun_arg_res_92_,0
	addi	$4, $4, 1
# was:	addi	_ind_var_88_, _ind_var_88_, 1
	j	_loop_beg_90_
_loop_end_91_:
	ori	$2, $6, 0
# was:	ori	_arg_95_, _letBind_85_, 0
# 	ori	$2,_arg_95_,0
	jal	even
# was:	jal	even, $2
# 	ori	_fun_arg_res_84_,$2,0
# 	ori	_res_reg_76_,_fun_arg_res_84_,0
	beq	$2, $0, _false_label_83_
# was:	beq	_res_reg_76_, $0, _false_label_83_
	lw	$2, 0($21)
# was:	lw	_res_reg_76_, 0(_elem_reg_75_)
	sw	$2, 0($19)
# was:	sw	_res_reg_76_, 0(_addr_reg_77_)
	addi	$19, $19, 4
# was:	addi	_addr_reg_77_, _addr_reg_77_, 4
	addi	$20, $20, 1
# was:	addi	_j_reg_79_, _j_reg_79_, 1
_false_label_83_:
	addi	$21, $21, 4
# was:	addi	_elem_reg_75_, _elem_reg_75_, 4
	addi	$18, $18, 1
# was:	addi	_i_reg_78_, _i_reg_78_, 1
	j	_loop_beg_80_
_loop_end_81_:
	sw	$20, 0($16)
# was:	sw	_j_reg_79_, 0(_letBind_72_)
	ori	$2, $16, 0
# was:	ori	_arg_97_, _letBind_72_, 0
# 	ori	$2,_arg_97_,0
	jal	write_2darr
# was:	jal	write_2darr, $2
# 	ori	_mainres_40_,$2,0
# 	ori	$2,_mainres_40_,0
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