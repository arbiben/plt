	.text
	.file	"./tests/compiled/test-pass_intarray.ll"
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
	subq	$24, %rsp
.Ltmp2:
	.cfi_def_cfa_offset 48
.Ltmp3:
	.cfi_offset %rbx, -24
.Ltmp4:
	.cfi_offset %r14, -16
	movl	$24, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	$0, (%rbx)
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r14
	movl	$6, (%r14)
	movq	%rbx, 8(%r14)
	movl	$24, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	$0, (%rbx)
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	movl	$16, %edi
	callq	malloc
	movl	$6, (%rax)
	movq	%rbx, 8(%rax)
	movl	(%rax), %eax
	movq	%rbx, 16(%rsp)
	movl	%eax, 8(%rsp)
	movq	8(%r14), %rax
	movabsq	$8589934593, %rcx       # imm = 0x200000001
	movq	%rcx, (%rax)
	movabsq	$17179869187, %rcx      # imm = 0x400000003
	movq	%rcx, 8(%rax)
	movabsq	$25769803781, %rcx      # imm = 0x600000005
	movq	%rcx, 16(%rax)
	movq	8(%r14), %rsi
	movl	(%r14), %edi
	callq	addOne
	movq	8(%r14), %rax
	movl	(%rax), %esi
	movl	$.Lfmt, %edi
	xorl	%eax, %eax
	callq	printf
	movq	16(%rsp), %rax
	movabsq	$12884901890, %rcx      # imm = 0x300000002
	movq	%rcx, (%rax)
	movabsq	$21474836484, %rcx      # imm = 0x500000004
	movq	%rcx, 8(%rax)
	movabsq	$30064771078, %rcx      # imm = 0x700000006
	movq	%rcx, 16(%rax)
	movq	16(%rsp), %rsi
	movl	8(%rsp), %edi
	callq	addOne
	movl	$.Lfmt.1, %edi
	movl	$.Ltmp, %esi
	xorl	%eax, %eax
	callq	printf
	movq	16(%rsp), %rax
	movl	(%rax), %esi
	movl	$.Lfmt, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.globl	addOne
	.align	16, 0x90
	.type	addOne,@function
addOne:                                 # @addOne
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rsi, -8(%rsp)
	movl	%edi, -16(%rsp)
	movq	-8(%rsp), %rax
	incl	(%rax)
	movl	-16(%rsp), %eax
	movq	-8(%rsp), %rdx
	retq
.Lfunc_end1:
	.size	addOne, .Lfunc_end1-addOne
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

	.type	.Ltmp,@object           # @tmp
.Ltmp:
	.asciz	"should be 3"
	.size	.Ltmp, 12

	.type	.Lfmt.2,@object         # @fmt.2
.Lfmt.2:
	.asciz	"%d"
	.size	.Lfmt.2, 3

	.type	.Lfmt.3,@object         # @fmt.3
.Lfmt.3:
	.asciz	"%s\n"
	.size	.Lfmt.3, 4


	.section	".note.GNU-stack","",@progbits
