	.text
	.file	"./tests/compiled/test-array_scope.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp2:
	.cfi_def_cfa_offset 32
.Ltmp3:
	.cfi_offset %rbx, -32
.Ltmp4:
	.cfi_offset %r14, -24
.Ltmp5:
	.cfi_offset %r15, -16
	movl	$48, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	$__unnamed_1, (%rbx)
	movq	$__unnamed_1, 8(%rbx)
	movq	$__unnamed_1, 16(%rbx)
	movq	$__unnamed_1, 24(%rbx)
	movq	$__unnamed_1, 32(%rbx)
	movq	$__unnamed_1, 40(%rbx)
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
	movq	%rax, %r15
	movl	$6, (%r15)
	movq	%rbx, 8(%r15)
	movl	$24, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	$__unnamed_2, (%rbx)
	movq	$__unnamed_2, 8(%rbx)
	movq	$__unnamed_2, 16(%rbx)
	movl	$16, %edi
	callq	malloc
	movl	$3, (%rax)
	movq	%rbx, 8(%rax)
	movq	8(%r15), %rcx
	movabsq	$12884901890, %rdx      # imm = 0x300000002
	movq	%rdx, (%rcx)
	movabsq	$21474836484, %rdx      # imm = 0x500000004
	movq	%rdx, 8(%rcx)
	movl	$6, 16(%rcx)
	movq	8(%r14), %rcx
	movq	$.Ltmp, (%rcx)
	movq	$.Ltmp.2, 8(%rcx)
	movq	$.Ltmp.3, 16(%rcx)
	movq	$.Ltmp.4, 24(%rcx)
	movq	8(%rax), %rax
	movq	$.Ltmp.5, (%rax)
	movq	$.Ltmp.6, 8(%rax)
	movq	$.Ltmp.7, 16(%rax)
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	__unnamed_1,@object     # @0
	.bss
	.globl	__unnamed_1
__unnamed_1:
	.zero	1
	.size	__unnamed_1, 1

	.type	.Lfmt,@object           # @fmt
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfmt:
	.asciz	"%d"
	.size	.Lfmt, 3

	.type	.Lfmt.1,@object         # @fmt.1
.Lfmt.1:
	.asciz	"%s\n"
	.size	.Lfmt.1, 4

	.type	__unnamed_2,@object     # @1
	.bss
	.globl	__unnamed_2
__unnamed_2:
	.zero	1
	.size	__unnamed_2, 1

	.type	.Ltmp,@object           # @tmp
	.section	.rodata.str1.1,"aMS",@progbits,1
.Ltmp:
	.asciz	"you"
	.size	.Ltmp, 4

	.type	.Ltmp.2,@object         # @tmp.2
.Ltmp.2:
	.asciz	"are"
	.size	.Ltmp.2, 4

	.type	.Ltmp.3,@object         # @tmp.3
.Ltmp.3:
	.asciz	"an"
	.size	.Ltmp.3, 3

	.type	.Ltmp.4,@object         # @tmp.4
.Ltmp.4:
	.asciz	"array"
	.size	.Ltmp.4, 6

	.type	.Ltmp.5,@object         # @tmp.5
.Ltmp.5:
	.asciz	"some"
	.size	.Ltmp.5, 5

	.type	.Ltmp.6,@object         # @tmp.6
.Ltmp.6:
	.asciz	"strings"
	.size	.Ltmp.6, 8

	.type	.Ltmp.7,@object         # @tmp.7
.Ltmp.7:
	.asciz	"here"
	.size	.Ltmp.7, 5


	.section	".note.GNU-stack","",@progbits
