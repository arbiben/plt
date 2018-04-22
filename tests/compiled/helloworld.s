	.text
	.file	"./tests/compiled/helloworld.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp0:
	.cfi_def_cfa_offset 32
	movl	$1, 12(%rsp)
	movq	$.Ltmp, 16(%rsp)
	movl	$1, x(%rip)
	movl	$5, (%rsp)
	movl	$5, x(%rip)
	cmpl	$5, (%rsp)
	jne	.LBB0_2
# BB#1:                                 # %then
	movl	$.Lfmt.1, %edi
	movl	$.Ltmp.2, %esi
	xorl	%eax, %eax
	callq	printf
.LBB0_2:                                # %merge
	xorl	%eax, %eax
	addq	$24, %rsp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	x,@object               # @x
	.bss
	.globl	x
	.align	4
x:
	.long	0                       # 0x0
	.size	x, 4

	.type	.Lfmt,@object           # @fmt
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfmt:
	.asciz	"%d"
	.size	.Lfmt, 3

	.type	.Lfmt.1,@object         # @fmt.1
.Lfmt.1:
	.asciz	"%s\n"
	.size	.Lfmt.1, 4

	.type	.Ltmp,@object           # @tmp
.Ltmp:
	.asciz	"world"
	.size	.Ltmp, 6

	.type	.Ltmp.2,@object         # @tmp.2
.Ltmp.2:
	.asciz	"hello world"
	.size	.Ltmp.2, 12


	.section	".note.GNU-stack","",@progbits
