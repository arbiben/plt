	.text
	.file	"./tests/compiled/test-access_struct.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp0:
	.cfi_def_cfa_offset 32
	movb	$0, 12(%rsp)
	movb	$1, %al
	testb	%al, %al
	je	.LBB0_2
# BB#1:                                 # %then
	movl	$.Lfmt, %edi
	movl	$1, %esi
	xorl	%eax, %eax
	callq	printf
.LBB0_2:                                # %merge
	xorl	%eax, %eax
	addq	$24, %rsp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	.Lfmt,@object           # @fmt
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfmt:
	.asciz	"%d"
	.size	.Lfmt, 3

	.type	.Lfmt.1,@object         # @fmt.1
.Lfmt.1:
	.asciz	"%s\n"
	.size	.Lfmt.1, 4


	.section	".note.GNU-stack","",@progbits
