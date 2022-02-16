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
# Function read_char
read_char:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_i_1_,$2,0
	jal	getchar
# was:	jal	getchar, $2
# 	ori	_read_charres_2_,$2,0
# 	ori	$2,_read_charres_2_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
# Function read_string
read_string:
	sw	$31, -4($29)
	sw	$20, -24($29)
	sw	$19, -20($29)
	sw	$18, -16($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -28
# 	ori	_param_n_3_,$2,0
	ori	$3, $2, 0
# was:	ori	_size_reg_9_, _param_n_3_, 0
	bgez	$3, _safe_lab_10_
# was:	bgez	_size_reg_9_, _safe_lab_10_
	ori	$5, $0, 3
# was:	ori	$5, $0, 3
	la	$6, _Msg_IllegalArraySize_
# was:	la	$6, _Msg_IllegalArraySize_
	j	_RuntimeError_
_safe_lab_10_:
	ori	$2, $28, 0
# was:	ori	_arr_reg_6_, $28, 0
	sll	$4, $3, 2
# was:	sll	_tmp_16_, _size_reg_9_, 2
	addi	$4, $4, 4
# was:	addi	_tmp_16_, _tmp_16_, 4
	add	$28, $28, $4
# was:	add	$28, $28, _tmp_16_
	sw	$3, 0($2)
# was:	sw	_size_reg_9_, 0(_arr_reg_6_)
	addi	$6, $2, 4
# was:	addi	_addr_reg_11_, _arr_reg_6_, 4
	ori	$5, $0, 0
# was:	ori	_i_reg_12_, $0, 0
_loop_beg_13_:
	sub	$4, $5, $3
# was:	sub	_tmp_reg_15_, _i_reg_12_, _size_reg_9_
	bgez	$4, _loop_end_14_
# was:	bgez	_tmp_reg_15_, _loop_end_14_
	sw	$5, 0($6)
# was:	sw	_i_reg_12_, 0(_addr_reg_11_)
	addi	$6, $6, 4
# was:	addi	_addr_reg_11_, _addr_reg_11_, 4
	addi	$5, $5, 1
# was:	addi	_i_reg_12_, _i_reg_12_, 1
	j	_loop_beg_13_
_loop_end_14_:
	lw	$16, 0($2)
# was:	lw	_size_reg_5_, 0(_arr_reg_6_)
	ori	$17, $28, 0
# was:	ori	_read_stringres_4_, $28, 0
	addi	$3, $16, 3
# was:	addi	_tmp_23_, _size_reg_5_, 3
	sra	$3, $3, 2
# was:	sra	_tmp_23_, _tmp_23_, 2
	sll	$3, $3, 2
# was:	sll	_tmp_23_, _tmp_23_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_23_, _tmp_23_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_23_
	sw	$16, 0($17)
# was:	sw	_size_reg_5_, 0(_read_stringres_4_)
	addi	$18, $17, 4
# was:	addi	_addr_reg_17_, _read_stringres_4_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_18_, $0, 0
	addi	$20, $2, 4
# was:	addi	_elem_reg_7_, _arr_reg_6_, 4
_loop_beg_19_:
	sub	$2, $19, $16
# was:	sub	_tmp_reg_21_, _i_reg_18_, _size_reg_5_
	bgez	$2, _loop_end_20_
# was:	bgez	_tmp_reg_21_, _loop_end_20_
	lw	$2, 0($20)
# was:	lw	_res_reg_8_, 0(_elem_reg_7_)
	addi	$20, $20, 4
# was:	addi	_elem_reg_7_, _elem_reg_7_, 4
# 	ori	$2,_res_reg_8_,0
	jal	read_char
# was:	jal	read_char, $2
# 	ori	_tmp_reg_22_,$2,0
# 	ori	_res_reg_8_,_tmp_reg_22_,0
	sb	$2, 0($18)
# was:	sb	_res_reg_8_, 0(_addr_reg_17_)
	addi	$18, $18, 1
# was:	addi	_addr_reg_17_, _addr_reg_17_, 1
	addi	$19, $19, 1
# was:	addi	_i_reg_18_, _i_reg_18_, 1
	j	_loop_beg_19_
_loop_end_20_:
	ori	$2, $17, 0
# was:	ori	$2, _read_stringres_4_, 0
	addi	$29, $29, 28
	lw	$20, -24($29)
	lw	$19, -20($29)
	lw	$18, -16($29)
	lw	$17, -12($29)
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
# Function add_one
add_one:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_x_24_,$2,0
# 	ori	_plus_L_26_,_param_x_24_,0
	ori	$3, $0, 1
# was:	ori	_plus_R_27_, $0, 1
	add	$2, $2, $3
# was:	add	_add_oneres_25_, _plus_L_26_, _plus_R_27_
# 	ori	$2,_add_oneres_25_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
# Function main
main:
	sw	$31, -4($29)
	sw	$20, -24($29)
	sw	$19, -20($29)
	sw	$18, -16($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -28
	jal	getint
# was:	jal	getint, $2
# 	ori	_letBind_29_,$2,0
# 	ori	_arg_31_,_letBind_29_,0
# 	ori	$2,_arg_31_,0
	jal	read_string
# was:	jal	read_string, $2
# 	ori	_letBind_30_,$2,0
# 	ori	_arr_reg_42_,_letBind_30_,0
	lw	$18, 0($2)
# was:	lw	_size_reg_41_, 0(_arr_reg_42_)
	ori	$20, $28, 0
# was:	ori	_arr_reg_38_, $28, 0
	sll	$3, $18, 2
# was:	sll	_tmp_51_, _size_reg_41_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_51_, _tmp_51_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_51_
	sw	$18, 0($20)
# was:	sw	_size_reg_41_, 0(_arr_reg_38_)
	addi	$17, $20, 4
# was:	addi	_addr_reg_45_, _arr_reg_38_, 4
	ori	$16, $0, 0
# was:	ori	_i_reg_46_, $0, 0
	addi	$19, $2, 4
# was:	addi	_elem_reg_43_, _arr_reg_42_, 4
_loop_beg_47_:
	sub	$2, $16, $18
# was:	sub	_tmp_reg_49_, _i_reg_46_, _size_reg_41_
	bgez	$2, _loop_end_48_
# was:	bgez	_tmp_reg_49_, _loop_end_48_
	lb	$2, 0($19)
# was:	lb	_res_reg_44_, 0(_elem_reg_43_)
	addi	$19, $19, 1
# was:	addi	_elem_reg_43_, _elem_reg_43_, 1
# 	ori	$2,_res_reg_44_,0
	jal	ord
# was:	jal	ord, $2
# 	ori	_tmp_reg_50_,$2,0
# 	ori	_res_reg_44_,_tmp_reg_50_,0
	sw	$2, 0($17)
# was:	sw	_res_reg_44_, 0(_addr_reg_45_)
	addi	$17, $17, 4
# was:	addi	_addr_reg_45_, _addr_reg_45_, 4
	addi	$16, $16, 1
# was:	addi	_i_reg_46_, _i_reg_46_, 1
	j	_loop_beg_47_
_loop_end_48_:
	lw	$19, 0($20)
# was:	lw	_size_reg_37_, 0(_arr_reg_38_)
	ori	$16, $28, 0
# was:	ori	_arr_reg_34_, $28, 0
	sll	$2, $19, 2
# was:	sll	_tmp_58_, _size_reg_37_, 2
	addi	$2, $2, 4
# was:	addi	_tmp_58_, _tmp_58_, 4
	add	$28, $28, $2
# was:	add	$28, $28, _tmp_58_
	sw	$19, 0($16)
# was:	sw	_size_reg_37_, 0(_arr_reg_34_)
	addi	$18, $16, 4
# was:	addi	_addr_reg_52_, _arr_reg_34_, 4
	ori	$17, $0, 0
# was:	ori	_i_reg_53_, $0, 0
	addi	$20, $20, 4
# was:	addi	_elem_reg_39_, _arr_reg_38_, 4
_loop_beg_54_:
	sub	$2, $17, $19
# was:	sub	_tmp_reg_56_, _i_reg_53_, _size_reg_37_
	bgez	$2, _loop_end_55_
# was:	bgez	_tmp_reg_56_, _loop_end_55_
	lw	$2, 0($20)
# was:	lw	_res_reg_40_, 0(_elem_reg_39_)
	addi	$20, $20, 4
# was:	addi	_elem_reg_39_, _elem_reg_39_, 4
# 	ori	$2,_res_reg_40_,0
	jal	add_one
# was:	jal	add_one, $2
# 	ori	_tmp_reg_57_,$2,0
# 	ori	_res_reg_40_,_tmp_reg_57_,0
	sw	$2, 0($18)
# was:	sw	_res_reg_40_, 0(_addr_reg_52_)
	addi	$18, $18, 4
# was:	addi	_addr_reg_52_, _addr_reg_52_, 4
	addi	$17, $17, 1
# was:	addi	_i_reg_53_, _i_reg_53_, 1
	j	_loop_beg_54_
_loop_end_55_:
	lw	$18, 0($16)
# was:	lw	_size_reg_33_, 0(_arr_reg_34_)
	ori	$17, $28, 0
# was:	ori	_letBind_32_, $28, 0
	addi	$2, $18, 3
# was:	addi	_tmp_65_, _size_reg_33_, 3
	sra	$2, $2, 2
# was:	sra	_tmp_65_, _tmp_65_, 2
	sll	$2, $2, 2
# was:	sll	_tmp_65_, _tmp_65_, 2
	addi	$2, $2, 4
# was:	addi	_tmp_65_, _tmp_65_, 4
	add	$28, $28, $2
# was:	add	$28, $28, _tmp_65_
	sw	$18, 0($17)
# was:	sw	_size_reg_33_, 0(_letBind_32_)
	addi	$19, $17, 4
# was:	addi	_addr_reg_59_, _letBind_32_, 4
	ori	$20, $0, 0
# was:	ori	_i_reg_60_, $0, 0
	addi	$16, $16, 4
# was:	addi	_elem_reg_35_, _arr_reg_34_, 4
_loop_beg_61_:
	sub	$2, $20, $18
# was:	sub	_tmp_reg_63_, _i_reg_60_, _size_reg_33_
	bgez	$2, _loop_end_62_
# was:	bgez	_tmp_reg_63_, _loop_end_62_
	lw	$2, 0($16)
# was:	lw	_res_reg_36_, 0(_elem_reg_35_)
	addi	$16, $16, 4
# was:	addi	_elem_reg_35_, _elem_reg_35_, 4
# 	ori	$2,_res_reg_36_,0
	jal	chr
# was:	jal	chr, $2
# 	ori	_tmp_reg_64_,$2,0
# 	ori	_res_reg_36_,_tmp_reg_64_,0
	sb	$2, 0($19)
# was:	sb	_res_reg_36_, 0(_addr_reg_59_)
	addi	$19, $19, 1
# was:	addi	_addr_reg_59_, _addr_reg_59_, 1
	addi	$20, $20, 1
# was:	addi	_i_reg_60_, _i_reg_60_, 1
	j	_loop_beg_61_
_loop_end_62_:
	ori	$2, $17, 0
# was:	ori	_tmp_66_, _letBind_32_, 0
	ori	$16, $2, 0
# was:	ori	_mainres_28_, _tmp_66_, 0
# 	ori	$2,_tmp_66_,0
	jal	putstring
# was:	jal	putstring, $2
	ori	$2, $16, 0
# was:	ori	$2, _mainres_28_, 0
	addi	$29, $29, 28
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