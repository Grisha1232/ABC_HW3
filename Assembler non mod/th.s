	.file	"th.c"
	.text
	.globl	Ber
	.data
	.align 32
	.type	Ber, @object
	.size	Ber, 960
Ber:
	.long	0
	.long	-2147483648
	.long	16383
	.long	0
	.long	0
	.long	-2147483648
	.long	49150
	.long	0
	.long	-1431656448
	.long	-1431655766
	.long	16380
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	-2004318208
	.long	-2004318072
	.long	49146
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	204521472
	.long	-1022611261
	.long	16377
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	-2004318208
	.long	-2004318072
	.long	49146
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1822107648
	.long	-1691956814
	.long	16379
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	-1743159296
	.long	-2120738431
	.long	49149
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1431656448
	.long	-1789569707
	.long	16383
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	-218959872
	.long	-487394574
	.long	49153
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	-1625413632
	.long	-605913992
	.long	16388
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	2134468608
	.long	-2075659370
	.long	49160
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	871442432
	.long	-1048511414
	.long	16395
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	106981376
	.long	-1457905562
	.long	49167
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1431656448
	.long	-1375508139
	.long	16403
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	-1372413952
	.long	-800793720
	.long	49175
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	-1706950656
	.long	-1888643801
	.long	16412
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	-974788608
	.long	-515888355
	.long	49184
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	-363505664
	.long	-938602898
	.long	16421
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	-1912252416
	.long	-947395225
	.long	49194
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	-817063936
	.long	-569287373
	.long	16431
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	485148672
	.long	-1994635782
	.long	49205
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.zero	288
	.globl	sizeBer
	.align 4
	.type	sizeBer, @object
	.size	sizeBer, 4
sizeBer:
	.long	41
	.text
	.globl	fact
	.type	fact, @function
fact:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L2
	fld1
	jmp	.L3
.L2:
	fildq	-8(%rbp)
	fld	%st(0)
	fstpt	-32(%rbp)
	cmpq	$0, -8(%rbp)
	jns	.L5
	fldt	.LC1(%rip)
	faddp	%st, %st(1)
	fstpt	-32(%rbp)
	jmp	.L4
.L5:
	fstp	%st(0)
.L4:
	movq	-8(%rbp), %rax
	subq	$1, %rax
	movq	%rax, %rdi
	call	fact
	fldt	-32(%rbp)
	fmulp	%st, %st(1)
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	fact, .-fact
	.globl	pow2
	.type	pow2, @function
pow2:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	cltq
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	pow2, .-pow2
	.globl	bink
	.type	bink, @function
bink:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fact
	fstpt	-32(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fact
	fstpt	-48(%rbp)
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fact
	fldt	-48(%rbp)
	fmulp	%st, %st(1)
	fldt	-32(%rbp)
	fdivp	%st, %st(1)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	bink, .-bink
	.globl	bernolli
	.type	bernolli, @function
bernolli:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movl	sizeBer(%rip), %eax
	cltq
	cmpq	%rax, -40(%rbp)
	ja	.L11
	movq	-40(%rbp), %rax
	salq	$4, %rax
	movq	%rax, %rdx
	leaq	Ber(%rip), %rax
	fldt	(%rdx,%rax)
	jmp	.L12
.L11:
	movq	-40(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	je	.L13
	movq	-40(%rbp), %rax
	salq	$4, %rax
	movq	%rax, %rdx
	leaq	Ber(%rip), %rax
	fldz
	fstpt	(%rdx,%rax)
	movl	sizeBer(%rip), %eax
	addl	$1, %eax
	movl	%eax, sizeBer(%rip)
	fldz
	jmp	.L12
.L13:
	fldz
	fstpt	-16(%rbp)
	movq	$1, -24(%rbp)
	jmp	.L14
.L15:
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	bink
	fstpt	-64(%rbp)
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	subq	%rdx, %rax
	movq	%rax, %rdi
	call	bernolli
	fldt	-64(%rbp)
	fmulp	%st, %st(1)
	fldt	-16(%rbp)
	faddp	%st, %st(1)
	fstpt	-16(%rbp)
	addq	$1, -24(%rbp)
.L14:
	movq	-24(%rbp), %rax
	cmpq	%rax, -40(%rbp)
	ja	.L15
	movq	-40(%rbp), %rax
	testq	%rax, %rax
	js	.L16
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	jmp	.L17
.L16:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L17:
	movsd	.LC4(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	.LC5(%rip), %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	fldl	-64(%rbp)
	fldt	-16(%rbp)
	fmulp	%st, %st(1)
	movq	-40(%rbp), %rax
	salq	$4, %rax
	movq	%rax, %rdx
	leaq	Ber(%rip), %rax
	fstpt	(%rdx,%rax)
	movl	sizeBer(%rip), %eax
	addl	$1, %eax
	movl	%eax, sizeBer(%rip)
	movq	-40(%rbp), %rax
	salq	$4, %rax
	movq	%rax, %rdx
	leaq	Ber(%rip), %rax
	fldt	(%rdx,%rax)
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	bernolli, .-bernolli
	.globl	ABS
	.type	ABS, @function
ABS:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	fldt	16(%rbp)
	fldz
	fcomip	%st(1), %st
	fstp	%st(0)
	jbe	.L23
	fldt	16(%rbp)
	fchs
	jmp	.L21
.L23:
	fldt	16(%rbp)
.L21:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	ABS, .-ABS
	.globl	th
	.type	th, @function
th:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movsd	%xmm0, -120(%rbp)
	movl	$0, -4(%rbp)
	pxor	%xmm0, %xmm0
	comisd	-120(%rbp), %xmm0
	jbe	.L25
	movl	$1, -4(%rbp)
	fldl	-120(%rbp)
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	call	ABS
	addq	$16, %rsp
	fstpl	-120(%rbp)
.L25:
	movl	$1, -8(%rbp)
	movsd	.LC7(%rip), %xmm0
	movq	-120(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movsd	%xmm0, -144(%rbp)
	fldl	-144(%rbp)
	fstpt	-96(%rbp)
	fldl	-120(%rbp)
	fstpt	-32(%rbp)
	fldt	-32(%rbp)
	fstpt	-48(%rbp)
	movq	$2, -104(%rbp)
	movl	-8(%rbp), %eax
	addl	%eax, %eax
	cltq
	movq	%rax, %rdi
	call	pow2
	movq	%rax, -56(%rbp)
	movl	-8(%rbp), %eax
	addl	%eax, %eax
	cltq
	movq	%rax, %rdi
	call	bernolli
	fstpt	-80(%rbp)
	jmp	.L27
.L35:
	addl	$1, -8(%rbp)
	fldt	-32(%rbp)
	fldt	-96(%rbp)
	fmulp	%st, %st(1)
	fstpt	-32(%rbp)
	movl	-8(%rbp), %eax
	addl	%eax, %eax
	subl	$1, %eax
	imull	-8(%rbp), %eax
	addl	%eax, %eax
	cltq
	movq	%rax, -104(%rbp)
	fildq	-104(%rbp)
	cmpq	$0, -104(%rbp)
	jns	.L28
	fldt	.LC1(%rip)
	faddp	%st, %st(1)
.L28:
	fldt	-32(%rbp)
	fdivp	%st, %st(1)
	fstpt	-32(%rbp)
	movq	-56(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -144(%rbp)
	fildq	-144(%rbp)
	testq	%rax, %rax
	jns	.L29
	fldt	.LC1(%rip)
	faddp	%st, %st(1)
.L29:
	fldt	-32(%rbp)
	fdivp	%st, %st(1)
	fldt	.LC8(%rip)
	fmulp	%st, %st(1)
	fstpt	-32(%rbp)
	salq	$2, -56(%rbp)
	movq	-56(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -144(%rbp)
	fildq	-144(%rbp)
	testq	%rax, %rax
	jns	.L30
	fldt	.LC1(%rip)
	faddp	%st, %st(1)
.L30:
	fldt	-32(%rbp)
	fmulp	%st, %st(1)
	fstpt	-32(%rbp)
	fldt	-32(%rbp)
	fldt	-80(%rbp)
	fdivrp	%st, %st(1)
	fstpt	-32(%rbp)
	movl	-8(%rbp), %eax
	addl	%eax, %eax
	cltq
	movq	%rax, %rdi
	call	bernolli
	fstpt	-80(%rbp)
	fldt	-32(%rbp)
	fldt	-80(%rbp)
	fmulp	%st, %st(1)
	fstpt	-32(%rbp)
	movl	-8(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L31
	pushq	-24(%rbp)
	pushq	-32(%rbp)
	call	ABS
	addq	$16, %rsp
	fchs
	fstpt	-144(%rbp)
	movq	-144(%rbp), %rax
	movl	-136(%rbp), %edx
	movq	%rax, -32(%rbp)
	movl	%edx, -24(%rbp)
	jmp	.L32
.L31:
	pushq	-24(%rbp)
	pushq	-32(%rbp)
	call	ABS
	addq	$16, %rsp
	fstpt	-32(%rbp)
.L32:
	cmpq	$0, -56(%rbp)
	jne	.L33
	fldt	-48(%rbp)
	jmp	.L34
.L33:
	fldt	-48(%rbp)
	fldt	-32(%rbp)
	faddp	%st, %st(1)
	fstpt	-48(%rbp)
.L27:
	pushq	-24(%rbp)
	pushq	-32(%rbp)
	call	ABS
	addq	$16, %rsp
	fldt	.LC9(%rip)
	fxch	%st(1)
	fcomip	%st(1), %st
	fstp	%st(0)
	ja	.L35
	cmpl	$1, -4(%rbp)
	jne	.L36
	fldt	-48(%rbp)
	fchs
	jmp	.L34
.L36:
	fldt	-48(%rbp)
.L34:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	th, .-th
	.section	.rodata
	.align 16
.LC1:
	.long	0
	.long	-2147483648
	.long	16447
	.long	0
	.align 8
.LC4:
	.long	0
	.long	1072693248
	.align 8
.LC5:
	.long	0
	.long	-1074790400
	.align 8
.LC7:
	.long	0
	.long	1073741824
	.align 16
.LC8:
	.long	0
	.long	-2147483648
	.long	16385
	.long	0
	.align 16
.LC9:
	.long	-1924145152
	.long	-2095944041
	.long	16372
	.long	0
	.ident	"GCC: (Debian 11.3.0-5) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
