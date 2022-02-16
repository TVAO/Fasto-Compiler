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
# Function f
f:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_a_1_,$2,0
# 	ori	_param_b_2_,$3,0
# 	ori	_param_c_3_,$4,0
# 	ori	_param_d_4_,$5,0
	ori	$6, $0, 1000
# was:	ori	_times_L_12_, $0, 1000
# 	ori	_times_R_13_,_param_a_1_,0
	mul	$2, $6, $2
# was:	mul	_plus_L_10_, _times_L_12_, _times_R_13_
	ori	$6, $0, 100
# was:	ori	_times_L_14_, $0, 100
# 	ori	_times_R_15_,_param_b_2_,0
	mul	$3, $6, $3
# was:	mul	_plus_R_11_, _times_L_14_, _times_R_15_
	add	$2, $2, $3
# was:	add	_plus_L_8_, _plus_L_10_, _plus_R_11_
	ori	$3, $0, 10
# was:	ori	_times_L_16_, $0, 10
# 	ori	_times_R_17_,_param_c_3_,0
	mul	$3, $3, $4
# was:	mul	_plus_R_9_, _times_L_16_, _times_R_17_
	add	$2, $2, $3
# was:	add	_plus_L_6_, _plus_L_8_, _plus_R_9_
# 	ori	_plus_R_7_,_param_d_4_,0
	add	$2, $2, $5
# was:	add	_fres_5_, _plus_L_6_, _plus_R_7_
# 	ori	$2,_fres_5_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
# Function zero
zero:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_b_18_,$2,0
# 	ori	_cond_23_,_param_b_18_,0
	bne	$2, $0, _then_20_
# was:	bne	_cond_23_, $0, _then_20_
	j	_else_21_
_then_20_:
	ori	$2, $0, 0
# was:	ori	_zerores_19_, $0, 0
	j	_endif_22_
_else_21_:
# 	ori	_arg_24_,_param_b_18_,0
# 	ori	$2,_arg_24_,0
	jal	zero
# was:	jal	zero, $2
# 	ori	_zerores_19_,$2,0
_endif_22_:
# 	ori	$2,_zerores_19_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
# Function test
test:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_z_25_,$2,0
	ori	$3, $0, 1
# was:	ori	_plus_L_28_, $0, 1
# 	ori	_plus_R_29_,_param_z_25_,0
	add	$3, $3, $2
# was:	add	_letBind_27_, _plus_L_28_, _plus_R_29_
	ori	$4, $0, 2
# was:	ori	_plus_L_31_, $0, 2
# 	ori	_plus_R_32_,_param_z_25_,0
	add	$5, $4, $2
# was:	add	_letBind_30_, _plus_L_31_, _plus_R_32_
	ori	$4, $0, 3
# was:	ori	_plus_L_34_, $0, 3
# 	ori	_plus_R_35_,_param_z_25_,0
	add	$4, $4, $2
# was:	add	_letBind_33_, _plus_L_34_, _plus_R_35_
	ori	$6, $0, 4
# was:	ori	_plus_L_37_, $0, 4
# 	ori	_plus_R_38_,_param_z_25_,0
	add	$2, $6, $2
# was:	add	_letBind_36_, _plus_L_37_, _plus_R_38_
# 	ori	_arg_39_,_letBind_36_,0
# 	ori	_arg_40_,_letBind_27_,0
# 	ori	_arg_41_,_letBind_33_,0
# 	ori	_arg_42_,_letBind_30_,0
# 	ori	$2,_arg_39_,0
# 	ori	$3,_arg_40_,0
# 	ori	$4,_arg_41_,0
# 	ori	$5,_arg_42_,0
	jal	f
# was:	jal	f, $2 $3 $4 $5
# 	ori	_testres_26_,$2,0
# 	ori	$2,_testres_26_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
# Function main
main:
	sw	$31, -4($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -16
	ori	$2, $0, 0
# was:	ori	_arg_46_, $0, 0
# 	ori	$2,_arg_46_,0
	jal	test
# was:	jal	test, $2
# 	ori	_tmp_45_,$2,0
	ori	$17, $2, 0
# was:	ori	_letBind_44_, _tmp_45_, 0
	ori	$2, $17, 0
# was:	ori	$2, _letBind_44_, 0
	jal	putint
# was:	jal	putint, $2
	ori	$2, $0, 1
# was:	ori	_arg_50_, $0, 1
# 	ori	$2,_arg_50_,0
	jal	zero
# was:	jal	zero, $2
# 	ori	_arg_49_,$2,0
# 	ori	$2,_arg_49_,0
	jal	test
# was:	jal	test, $2
# 	ori	_tmp_48_,$2,0
	ori	$16, $2, 0
# was:	ori	_letBind_47_, _tmp_48_, 0
	ori	$2, $16, 0
# was:	ori	$2, _letBind_47_, 0
	jal	putint
# was:	jal	putint, $2
	ori	$2, $0, 10000
# was:	ori	_times_L_53_, $0, 10000
# 	ori	_times_R_54_,_letBind_44_,0
	mul	$2, $2, $17
# was:	mul	_plus_L_51_, _times_L_53_, _times_R_54_
# 	ori	_plus_R_52_,_letBind_47_,0
	add	$2, $2, $16
# was:	add	_mainres_43_, _plus_L_51_, _plus_R_52_
# 	ori	$2,_mainres_43_,0
	addi	$29, $29, 16
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