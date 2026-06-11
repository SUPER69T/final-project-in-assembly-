	.text
	.code16
	.file	"entire_project_in-.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	pushl	%ebx
	subl	$148, %esp
	.cfi_offset %ebx, -12
	calll	.L0$pb
.L0$pb:
	popl	%eax
.Ltmp0:
	addl	$_GLOBAL_OFFSET_TABLE_+(.Ltmp0-.L0$pb), %eax
	movl	%eax, -132(%ebp)                # 4-byte Spill
	movl	12(%ebp), %eax
	movl	8(%ebp), %eax
	movl	$0, -8(%ebp)
	movl	$0, -12(%ebp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$1, -12(%ebp)
	je	.LBB0_17
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-132(%ebp), %ebx                # 4-byte Reload
	leal	.L.str@GOTOFF(%ebx), %ecx
	movl	%esp, %eax
	movl	%ecx, (%eax)
	calll	printf@PLT
	movl	-132(%ebp), %ebx                # 4-byte Reload
	leal	.L.str.1@GOTOFF(%ebx), %ecx
	movl	%esp, %eax
	movl	%ecx, (%eax)
	calll	printf@PLT
	movl	-132(%ebp), %ebx                # 4-byte Reload
	movl	%esp, %eax
	leal	-16(%ebp), %ecx
	movl	%ecx, 4(%eax)
	leal	.L.str.2@GOTOFF(%ebx), %ecx
	movl	%ecx, (%eax)
	calll	__isoc99_scanf@PLT
	movl	-16(%ebp), %eax
	movl	%eax, -136(%ebp)                # 4-byte Spill
	subl	$1, %eax
	je	.LBB0_3
	jmp	.LBB0_18
.LBB0_18:                               #   in Loop: Header=BB0_1 Depth=1
	movl	-136(%ebp), %eax                # 4-byte Reload
	subl	$2, %eax
	je	.LBB0_10
	jmp	.LBB0_19
.LBB0_19:                               #   in Loop: Header=BB0_1 Depth=1
	movl	-136(%ebp), %eax                # 4-byte Reload
	subl	$3, %eax
	je	.LBB0_14
	jmp	.LBB0_15
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-132(%ebp), %ebx                # 4-byte Reload
	leal	.L.str.3@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	calll	printf@PLT
	movl	-132(%ebp), %ebx                # 4-byte Reload
	leal	.L.str.2@GOTOFF(%ebx), %ecx
	leal	-20(%ebp), %eax
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	__isoc99_scanf@PLT
	cmpl	$3, -20(%ebp)
	jl	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_1 Depth=1
	movl	$254, %eax
	cmpl	-20(%ebp), %eax
	jge	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-132(%ebp), %ebx                # 4-byte Reload
	leal	.L.str.4@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	calll	printf@PLT
	jmp	.LBB0_1
.LBB0_6:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-132(%ebp), %ebx                # 4-byte Reload
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	calll	Check
	cmpl	$0, %eax
	je	.LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-132(%ebp), %ebx                # 4-byte Reload
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	calll	Print_triangle
	jmp	.LBB0_9
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-132(%ebp), %ebx                # 4-byte Reload
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	calll	Print_square
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_16
.LBB0_10:                               #   in Loop: Header=BB0_1 Depth=1
	movl	-132(%ebp), %ebx                # 4-byte Reload
	leal	.L.str.5@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	calll	printf@PLT
	movl	-132(%ebp), %ebx                # 4-byte Reload
	leal	-121(%ebp), %eax
	leal	.L.str.6@GOTOFF(%ebx), %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	__isoc99_scanf@PLT
	movl	-132(%ebp), %ebx                # 4-byte Reload
	leal	.L.str.7@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	calll	printf@PLT
	movl	-132(%ebp), %ebx                # 4-byte Reload
	leal	.L.str.2@GOTOFF(%ebx), %ecx
	leal	-128(%ebp), %eax
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	__isoc99_scanf@PLT
	cmpl	$1, -128(%ebp)
	jl	.LBB0_12
# %bb.11:                               #   in Loop: Header=BB0_1 Depth=1
	movl	$25, %eax
	cmpl	-128(%ebp), %eax
	jge	.LBB0_13
.LBB0_12:                               #   in Loop: Header=BB0_1 Depth=1
	movl	-132(%ebp), %ebx                # 4-byte Reload
	leal	.L.str.8@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	calll	printf@PLT
	jmp	.LBB0_1
.LBB0_13:                               #   in Loop: Header=BB0_1 Depth=1
	movl	-132(%ebp), %ebx                # 4-byte Reload
	leal	-121(%ebp), %ecx
	movl	-128(%ebp), %eax
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	shifted
	movl	-132(%ebp), %ebx                # 4-byte Reload
	leal	.L.str.9@GOTOFF(%ebx), %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	printf@PLT
	jmp	.LBB0_16
.LBB0_14:                               #   in Loop: Header=BB0_1 Depth=1
	movl	-132(%ebp), %ebx                # 4-byte Reload
	leal	.L.str.10@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	calll	printf@PLT
	movl	$1, -12(%ebp)
	jmp	.LBB0_16
.LBB0_15:                               #   in Loop: Header=BB0_1 Depth=1
	movl	-132(%ebp), %ebx                # 4-byte Reload
	leal	.L.str.11@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	calll	printf@PLT
	jmp	.LBB0_1
.LBB0_16:                               #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_1
.LBB0_17:
	xorl	%eax, %eax
	addl	$148, %esp
	popl	%ebx
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	Check                           # -- Begin function Check
	.p2align	4, 0x90
	.type	Check,@function
Check:                                  # @Check
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	cmpl	$2, 8(%ebp)
	jge	.LBB1_2
# %bb.1:
	movl	$0, -4(%ebp)
	jmp	.LBB1_9
.LBB1_2:
	movl	$2, -8(%ebp)
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
	movl	-8(%ebp), %eax
	imull	-8(%ebp), %eax
	cmpl	8(%ebp), %eax
	jg	.LBB1_8
# %bb.4:                                #   in Loop: Header=BB1_3 Depth=1
	movl	8(%ebp), %eax
	cltd
	idivl	-8(%ebp)
	cmpl	$0, %edx
	jne	.LBB1_6
# %bb.5:
	movl	$0, -4(%ebp)
	jmp	.LBB1_9
.LBB1_6:                                #   in Loop: Header=BB1_3 Depth=1
	jmp	.LBB1_7
.LBB1_7:                                #   in Loop: Header=BB1_3 Depth=1
	movl	-8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -8(%ebp)
	jmp	.LBB1_3
.LBB1_8:
	movl	$1, -4(%ebp)
.LBB1_9:
	movl	-4(%ebp), %eax
	addl	$8, %esp
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Lfunc_end1:
	.size	Check, .Lfunc_end1-Check
	.cfi_endproc
                                        # -- End function
	.globl	Print_triangle                  # -- Begin function Print_triangle
	.p2align	4, 0x90
	.type	Print_triangle,@function
Print_triangle:                         # @Print_triangle
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset %ebx, -12
	calll	.L2$pb
.L2$pb:
	popl	%ebx
.Ltmp1:
	addl	$_GLOBAL_OFFSET_TABLE_+(.Ltmp1-.L2$pb), %ebx
	movl	%ebx, -28(%ebp)                 # 4-byte Spill
	movl	8(%ebp), %eax
	movl	8(%ebp), %eax
	movl	%esp, %ecx
	movl	%ecx, -8(%ebp)
	movl	%eax, %edx
	addl	$15, %edx
	andl	$-16, %edx
	movl	%esp, %ecx
	subl	%edx, %ecx
	movl	%ecx, -24(%ebp)                 # 4-byte Spill
	movl	%ecx, %esp
	movl	%eax, -12(%ebp)
	xorl	%edx, %edx
	subl	$16, %esp
	movl	%ecx, (%esp)
	movl	$0, 4(%esp)
	movl	%eax, 8(%esp)
	calll	memset@PLT
	addl	$16, %esp
	movl	$1, -16(%ebp)
.LBB2_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_3 Depth 2
	movl	-16(%ebp), %eax
	cmpl	8(%ebp), %eax
	jg	.LBB2_8
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	movl	-24(%ebp), %eax                 # 4-byte Reload
	movl	-16(%ebp), %ecx
	movb	$64, (%eax,%ecx)
	movl	$0, -20(%ebp)
.LBB2_3:                                #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-20(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jge	.LBB2_6
# %bb.4:                                #   in Loop: Header=BB2_3 Depth=2
	movl	-28(%ebp), %ebx                 # 4-byte Reload
	subl	$16, %esp
	movl	$64, (%esp)
	calll	putchar@PLT
	addl	$16, %esp
# %bb.5:                                #   in Loop: Header=BB2_3 Depth=2
	movl	-20(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -20(%ebp)
	jmp	.LBB2_3
.LBB2_6:                                #   in Loop: Header=BB2_1 Depth=1
	movl	-28(%ebp), %ebx                 # 4-byte Reload
	subl	$16, %esp
	movl	$10, (%esp)
	calll	putchar@PLT
	addl	$16, %esp
# %bb.7:                                #   in Loop: Header=BB2_1 Depth=1
	movl	-16(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -16(%ebp)
	jmp	.LBB2_1
.LBB2_8:
	movl	-8(%ebp), %eax
	movl	%eax, %esp
	leal	-4(%ebp), %esp
	popl	%ebx
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Lfunc_end2:
	.size	Print_triangle, .Lfunc_end2-Print_triangle
	.cfi_endproc
                                        # -- End function
	.globl	Print_square                    # -- Begin function Print_square
	.p2align	4, 0x90
	.type	Print_square,@function
Print_square:                           # @Print_square
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset %ebx, -12
	calll	.L3$pb
.L3$pb:
	popl	%eax
.Ltmp2:
	addl	$_GLOBAL_OFFSET_TABLE_+(.Ltmp2-.L3$pb), %eax
	movl	%eax, -16(%ebp)                 # 4-byte Spill
	movl	8(%ebp), %eax
	movl	$0, -8(%ebp)
.LBB3_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_3 Depth 2
	movl	-8(%ebp), %eax
	cmpl	8(%ebp), %eax
	jge	.LBB3_8
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	movl	$0, -12(%ebp)
.LBB3_3:                                #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jge	.LBB3_6
# %bb.4:                                #   in Loop: Header=BB3_3 Depth=2
	movl	-16(%ebp), %ebx                 # 4-byte Reload
	movl	$42, (%esp)
	calll	putchar@PLT
# %bb.5:                                #   in Loop: Header=BB3_3 Depth=2
	movl	-12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -12(%ebp)
	jmp	.LBB3_3
.LBB3_6:                                #   in Loop: Header=BB3_1 Depth=1
	movl	-16(%ebp), %ebx                 # 4-byte Reload
	movl	$10, (%esp)
	calll	putchar@PLT
# %bb.7:                                #   in Loop: Header=BB3_1 Depth=1
	movl	-8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -8(%ebp)
	jmp	.LBB3_1
.LBB3_8:
	addl	$20, %esp
	popl	%ebx
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Lfunc_end3:
	.size	Print_square, .Lfunc_end3-Print_square
	.cfi_endproc
                                        # -- End function
	.globl	shifted                         # -- Begin function shifted
	.p2align	4, 0x90
	.type	shifted,@function
shifted:                                # @shifted
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	pushl	%eax
	movl	12(%ebp), %eax
	movl	8(%ebp), %eax
	movl	$0, -4(%ebp)
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	movl	8(%ebp), %eax
	movl	-4(%ebp), %ecx
	cmpb	$0, (%eax,%ecx)
	je	.LBB4_7
# %bb.2:                                #   in Loop: Header=BB4_1 Depth=1
	movl	8(%ebp), %eax
	movl	-4(%ebp), %ecx
	movsbl	(%eax,%ecx), %eax
	cmpl	$65, %eax
	jl	.LBB4_5
# %bb.3:                                #   in Loop: Header=BB4_1 Depth=1
	movl	8(%ebp), %eax
	movl	-4(%ebp), %ecx
	movsbl	(%eax,%ecx), %eax
	cmpl	$90, %eax
	jg	.LBB4_5
# %bb.4:                                #   in Loop: Header=BB4_1 Depth=1
	movl	8(%ebp), %eax
	movl	-4(%ebp), %ecx
	movsbl	(%eax,%ecx), %eax
	subl	$65, %eax
	addl	12(%ebp), %eax
	movl	$26, %ecx
	cltd
	idivl	%ecx
	addl	$65, %edx
                                        # kill: def $dl killed $dl killed $edx
	movl	8(%ebp), %eax
	movl	-4(%ebp), %ecx
	movb	%dl, (%eax,%ecx)
.LBB4_5:                                #   in Loop: Header=BB4_1 Depth=1
	jmp	.LBB4_6
.LBB4_6:                                #   in Loop: Header=BB4_1 Depth=1
	movl	-4(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -4(%ebp)
	jmp	.LBB4_1
.LBB4_7:
	movl	8(%ebp), %eax
	addl	$4, %esp
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Lfunc_end4:
	.size	shifted, .Lfunc_end4-shifted
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Please choose one of the following options: "
	.size	.L.str, 45

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"\n1. Prime number checker\n2. Caesars shift coder\n3. Exit "
	.size	.L.str.1, 57

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"%d"
	.size	.L.str.2, 3

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Please choose a number between 3 and 255: "
	.size	.L.str.3, 43

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"wrong num1..."
	.size	.L.str.4, 14

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"Please enter a word: "
	.size	.L.str.5, 22

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	" %100[^\n]"
	.size	.L.str.6, 10

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"Please enter a number between 1 and 26: "
	.size	.L.str.7, 41

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"wrong num2..."
	.size	.L.str.8, 14

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"%s\n"
	.size	.L.str.9, 4

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"Goodbye!"
	.size	.L.str.10, 9

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"wrong input, enter an integer between 1 and 4."
	.size	.L.str.11, 47

	.ident	"Debian clang version 19.1.7 (3+b1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym printf
	.addrsig_sym __isoc99_scanf
	.addrsig_sym Check
	.addrsig_sym Print_triangle
	.addrsig_sym Print_square
	.addrsig_sym shifted
	.addrsig_sym putchar
