	.text
	.file	"./tests/compiled/test-if.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %merge
	pushq	%rax
.Ltmp0:
	.cfi_def_cfa_offset 16
	movl	$.Lfmt, %edi
	movl	$1, %esi
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	popq	%rcx
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
