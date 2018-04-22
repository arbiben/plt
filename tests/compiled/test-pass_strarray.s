	.text
	.file	"./tests/compiled/test-pass_strarray.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp2:
	.cfi_def_cfa_offset 32
.Ltmp3:
	.cfi_offset %rbx, -24
.Ltmp4:
	.cfi_offset %r14, -16
	movl	$16, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	$__unnamed_1, (%rbx)
	movq	$__unnamed_1, 8(%rbx)
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r14
	movl	$2, (%r14)
	movq	%rbx, 8(%r14)
	movq	$.Ltmp, (%rbx)
	movq	$.Ltmp.2, 8(%rbx)
	movq	8(%r14), %rsi
	movl	(%r14), %edi
	callq	changeString
	movq	8(%r14), %rax
	movq	(%rax), %rsi
	movl	$.Lfmt.1, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.globl	changeString
	.align	16, 0x90
	.type	changeString,@function
changeString:                           # @changeString
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rsi, -8(%rsp)
	movl	%edi, -16(%rsp)
	movq	-8(%rsp), %rax
	movq	$.Ltmp.5, (%rax)
	movl	-16(%rsp), %eax
	movq	-8(%rsp), %rdx
	retq
.Lfunc_end1:
	.size	changeString, .Lfunc_end1-changeString
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

	.type	__unnamed_1,@object     # @0
	.bss
	.globl	__unnamed_1
__unnamed_1:
	.zero	1
	.size	__unnamed_1, 1

	.type	.Ltmp,@object           # @tmp
	.section	.rodata.str1.1,"aMS",@progbits,1
.Ltmp:
	.asciz	"hi"
	.size	.Ltmp, 3

	.type	.Ltmp.2,@object         # @tmp.2
.Ltmp.2:
	.asciz	"bye"
	.size	.Ltmp.2, 4

	.type	.Lfmt.3,@object         # @fmt.3
.Lfmt.3:
	.asciz	"%d"
	.size	.Lfmt.3, 3

	.type	.Lfmt.4,@object         # @fmt.4
.Lfmt.4:
	.asciz	"%s\n"
	.size	.Lfmt.4, 4

	.type	.Ltmp.5,@object         # @tmp.5
.Ltmp.5:
	.asciz	"new string"
	.size	.Ltmp.5, 11


	.section	".note.GNU-stack","",@progbits
