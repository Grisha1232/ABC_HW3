	.file	"th.c"
	.intel_syntax noprefix
# GNU C17 (Debian 11.3.0-5) version 11.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions
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
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 32	#,
	mov	QWORD PTR -8[rbp], rdi	# n, n
# ./th.c:13:     if (n == 0) return 1;
	cmp	QWORD PTR -8[rbp], 0	# n,
	jne	.L2	#,
# ./th.c:13:     if (n == 0) return 1;
	fld1	
	jmp	.L3	#
.L2:
# ./th.c:14:     return n * fact(n - 1);
	fild	QWORD PTR -8[rbp]	# n
	fld	st(0)	#
	fstp	TBYTE PTR -32[rbp]	# %sfp
	cmp	QWORD PTR -8[rbp], 0	# n,
	jns	.L5	#,
	fld	TBYTE PTR .LC1[rip]	#
	faddp	st(1), st	#,
	fstp	TBYTE PTR -32[rbp]	# %sfp
	jmp	.L4	#
.L5:
	fstp	st(0)		#
.L4:
# ./th.c:14:     return n * fact(n - 1);
	mov	rax, QWORD PTR -8[rbp]	# tmp88, n
	sub	rax, 1	# _2,
	mov	rdi, rax	#, _2
	call	fact	#
# ./th.c:14:     return n * fact(n - 1);
	fld	TBYTE PTR -32[rbp]	# %sfp
	fmulp	st(1), st	#,
.L3:
# ./th.c:15: }
	leave	
	ret	
	.size	fact, .-fact
	.globl	pow2
	.type	pow2, @function
pow2:
	push	rbp	#
	mov	rbp, rsp	#,
	mov	QWORD PTR -8[rbp], rdi	# n, n
# ./th.c:18:     return 1 << n;
	mov	rax, QWORD PTR -8[rbp]	# tmp86, n
	mov	edx, 1	# tmp87,
	mov	ecx, eax	# tmp91, _1
	sal	edx, cl	# tmp87, tmp91
	mov	eax, edx	# _2, tmp87
	cdqe
# ./th.c:19: }
	pop	rbp	#
	ret	
	.size	pow2, .-pow2
	.globl	bink
	.type	bink, @function
bink:
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 48	#,
	mov	QWORD PTR -8[rbp], rdi	# n, n
	mov	QWORD PTR -16[rbp], rsi	# k, k
# ./th.c:22:     return 1.0 * fact(n) / (fact(k) * fact(n - k));
	mov	rax, QWORD PTR -8[rbp]	# tmp89, n
	mov	rdi, rax	#, tmp89
	call	fact	#
	fstp	TBYTE PTR -32[rbp]	# %sfp
# ./th.c:22:     return 1.0 * fact(n) / (fact(k) * fact(n - k));
	mov	rax, QWORD PTR -16[rbp]	# tmp90, k
	mov	rdi, rax	#, tmp90
	call	fact	#
	fstp	TBYTE PTR -48[rbp]	# %sfp
# ./th.c:22:     return 1.0 * fact(n) / (fact(k) * fact(n - k));
	mov	rax, QWORD PTR -8[rbp]	# tmp91, n
	sub	rax, QWORD PTR -16[rbp]	# _3, k
	mov	rdi, rax	#, _3
	call	fact	#
# ./th.c:22:     return 1.0 * fact(n) / (fact(k) * fact(n - k));
	fld	TBYTE PTR -48[rbp]	# %sfp
	fmulp	st(1), st	#,
# ./th.c:22:     return 1.0 * fact(n) / (fact(k) * fact(n - k));
	fld	TBYTE PTR -32[rbp]	# %sfp
	fdivrp	st(1), st	#,
# ./th.c:23: }
	leave	
	ret	
	.size	bink, .-bink
	.globl	bernolli
	.type	bernolli, @function
bernolli:
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 64	#,
	mov	QWORD PTR -40[rbp], rdi	# n, n
# ./th.c:26:     if (n <= sizeBer) return Ber[n];
	mov	eax, DWORD PTR sizeBer[rip]	# sizeBer.0_1, sizeBer
	cdqe
# ./th.c:26:     if (n <= sizeBer) return Ber[n];
	cmp	QWORD PTR -40[rbp], rax	# n, _2
	ja	.L11	#,
# ./th.c:26:     if (n <= sizeBer) return Ber[n];
	mov	rax, QWORD PTR -40[rbp]	# tmp105, n
	sal	rax, 4	# tmp105,
	mov	rdx, rax	# tmp106, tmp105
	lea	rax, Ber[rip]	# tmp107,
	fld	TBYTE PTR [rdx+rax]	# Ber[n_27(D)]
	jmp	.L12	#
.L11:
# ./th.c:27:     if (n % 2 == 1) {
	mov	rax, QWORD PTR -40[rbp]	# tmp108, n
	and	eax, 1	# _3,
# ./th.c:27:     if (n % 2 == 1) {
	test	rax, rax	# _3
	je	.L13	#,
# ./th.c:28:         Ber[n] = 0;
	mov	rax, QWORD PTR -40[rbp]	# tmp109, n
	sal	rax, 4	# tmp109,
	mov	rdx, rax	# tmp110, tmp109
	lea	rax, Ber[rip]	# tmp111,
	fldz	
	fstp	TBYTE PTR [rdx+rax]	# Ber[n_27(D)]
# ./th.c:29:         sizeBer++;
	mov	eax, DWORD PTR sizeBer[rip]	# sizeBer.1_4, sizeBer
	add	eax, 1	# _5,
	mov	DWORD PTR sizeBer[rip], eax	# sizeBer, _5
# ./th.c:30:         return 0;
	fldz	
	jmp	.L12	#
.L13:
# ./th.c:32:     long double s = 0;
	fldz	
	fstp	TBYTE PTR -16[rbp]	# s
# ./th.c:33:     for (long k = 1; k < n; k++) {
	mov	QWORD PTR -24[rbp], 1	# k,
# ./th.c:33:     for (long k = 1; k < n; k++) {
	jmp	.L14	#
.L15:
# ./th.c:34:         s += bink(n + 1, k + 1) * bernolli(n - k);
	mov	rax, QWORD PTR -24[rbp]	# tmp114, k
	add	rax, 1	# _6,
# ./th.c:34:         s += bink(n + 1, k + 1) * bernolli(n - k);
	mov	rdx, rax	# _7, _6
	mov	rax, QWORD PTR -40[rbp]	# tmp115, n
	add	rax, 1	# _8,
	mov	rsi, rdx	#, _7
	mov	rdi, rax	#, _8
	call	bink	#
	fstp	TBYTE PTR -64[rbp]	# %sfp
# ./th.c:34:         s += bink(n + 1, k + 1) * bernolli(n - k);
	mov	rdx, QWORD PTR -24[rbp]	# k.2_10, k
	mov	rax, QWORD PTR -40[rbp]	# tmp116, n
	sub	rax, rdx	# _11, k.2_10
	mov	rdi, rax	#, _11
	call	bernolli	#
# ./th.c:34:         s += bink(n + 1, k + 1) * bernolli(n - k);
	fld	TBYTE PTR -64[rbp]	# %sfp
	fmulp	st(1), st	#,
# ./th.c:34:         s += bink(n + 1, k + 1) * bernolli(n - k);
	fld	TBYTE PTR -16[rbp]	# s
	faddp	st(1), st	#,
	fstp	TBYTE PTR -16[rbp]	# s
# ./th.c:33:     for (long k = 1; k < n; k++) {
	add	QWORD PTR -24[rbp], 1	# k,
.L14:
# ./th.c:33:     for (long k = 1; k < n; k++) {
	mov	rax, QWORD PTR -24[rbp]	# k.3_13, k
	cmp	QWORD PTR -40[rbp], rax	# n, k.3_13
	ja	.L15	#,
# ./th.c:36:     Ber[n] = (-1. / (n + 1.)) * s;
	mov	rax, QWORD PTR -40[rbp]	# tmp119, n
	test	rax, rax	# tmp119
	js	.L16	#,
	pxor	xmm0, xmm0	# _14
	cvtsi2sd	xmm0, rax	# _14, tmp119
	jmp	.L17	#
.L16:
	mov	rdx, rax	# tmp121, tmp119
	shr	rdx	# tmp121
	and	eax, 1	# tmp122,
	or	rdx, rax	# tmp121, tmp122
	pxor	xmm0, xmm0	# tmp120
	cvtsi2sd	xmm0, rdx	# tmp120, tmp121
	addsd	xmm0, xmm0	# _14, tmp120
.L17:
	movsd	xmm1, QWORD PTR .LC4[rip]	# tmp123,
	addsd	xmm1, xmm0	# _15, _14
# ./th.c:36:     Ber[n] = (-1. / (n + 1.)) * s;
	movsd	xmm0, QWORD PTR .LC5[rip]	# tmp124,
	divsd	xmm0, xmm1	# tmp124, _15
	movsd	QWORD PTR -64[rbp], xmm0	# %sfp, tmp124
	fld	QWORD PTR -64[rbp]	# %sfp
# ./th.c:36:     Ber[n] = (-1. / (n + 1.)) * s;
	fld	TBYTE PTR -16[rbp]	# s
	fmulp	st(1), st	#,
# ./th.c:36:     Ber[n] = (-1. / (n + 1.)) * s;
	mov	rax, QWORD PTR -40[rbp]	# tmp126, n
	sal	rax, 4	# tmp126,
	mov	rdx, rax	# tmp127, tmp126
	lea	rax, Ber[rip]	# tmp128,
	fstp	TBYTE PTR [rdx+rax]	# Ber[n_27(D)]
# ./th.c:37:     sizeBer++;
	mov	eax, DWORD PTR sizeBer[rip]	# sizeBer.4_19, sizeBer
	add	eax, 1	# _20,
	mov	DWORD PTR sizeBer[rip], eax	# sizeBer, _20
# ./th.c:38:     return Ber[n];
	mov	rax, QWORD PTR -40[rbp]	# tmp129, n
	sal	rax, 4	# tmp129,
	mov	rdx, rax	# tmp130, tmp129
	lea	rax, Ber[rip]	# tmp131,
	fld	TBYTE PTR [rdx+rax]	# Ber[n_27(D)]
.L12:
# ./th.c:39: }
	leave	
	ret	
	.size	bernolli, .-bernolli
	.globl	ABS
	.type	ABS, @function
ABS:
	push	rbp	#
	mov	rbp, rsp	#,
# ./th.c:42:     if (x < 0) return x * -1;
	fld	TBYTE PTR 16[rbp]	# x
	fldz	
	fcomip	st, st(1)	#,
	fstp	st(0)		#
	jbe	.L23	#,
# ./th.c:42:     if (x < 0) return x * -1;
	fld	TBYTE PTR 16[rbp]	# x
	fchs	
	jmp	.L21	#
.L23:
# ./th.c:43:     return x;
	fld	TBYTE PTR 16[rbp]	# x
.L21:
# ./th.c:44: }
	pop	rbp	#
	ret	
	.size	ABS, .-ABS
	.globl	th
	.type	th, @function
th:
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 144	#,
	movsd	QWORD PTR -120[rbp], xmm0	# x, x
# ./th.c:47:     int flagLessZero = 0;
	mov	DWORD PTR -4[rbp], 0	# flagLessZero,
# ./th.c:48:     if (x < 0) {
	pxor	xmm0, xmm0	# tmp107
	comisd	xmm0, QWORD PTR -120[rbp]	# tmp107, x
	jbe	.L25	#,
# ./th.c:49:         flagLessZero = 1;
	mov	DWORD PTR -4[rbp], 1	# flagLessZero,
# ./th.c:50:         x = ABS(x);
	fld	QWORD PTR -120[rbp]	# x
	lea	rsp, -16[rsp]	#,
	fstp	TBYTE PTR [rsp]	#
	call	ABS	#
	add	rsp, 16	#,
# ./th.c:50:         x = ABS(x);
	fstp	QWORD PTR -120[rbp]	# x
.L25:
# ./th.c:52:     int countMemb = 1;
	mov	DWORD PTR -8[rbp], 1	# countMemb,
# ./th.c:53:     long double powX2 = pow(x, 2);
	movsd	xmm0, QWORD PTR .LC7[rip]	# tmp108,
	mov	rax, QWORD PTR -120[rbp]	# tmp109, x
	movapd	xmm1, xmm0	#, tmp108
	movq	xmm0, rax	#, tmp109
	call	pow@PLT	#
# ./th.c:53:     long double powX2 = pow(x, 2);
	movsd	QWORD PTR -144[rbp], xmm0	# %sfp, _3
	fld	QWORD PTR -144[rbp]	# %sfp
	fstp	TBYTE PTR -96[rbp]	# powX2
# ./th.c:54:     long double curr = x;
	fld	QWORD PTR -120[rbp]	# x
	fstp	TBYTE PTR -32[rbp]	# curr
# ./th.c:55:     long double result = curr;
	fld	TBYTE PTR -32[rbp]	# curr
	fstp	TBYTE PTR -48[rbp]	# result
# ./th.c:56:     unsigned long long int del = 2;
	mov	QWORD PTR -104[rbp], 2	# del,
# ./th.c:57:     unsigned long long int p2 = pow2(2 * countMemb);
	mov	eax, DWORD PTR -8[rbp]	# tmp111, countMemb
	add	eax, eax	# _4
# ./th.c:57:     unsigned long long int p2 = pow2(2 * countMemb);
	cdqe
	mov	rdi, rax	#, _5
	call	pow2	#
	mov	QWORD PTR -56[rbp], rax	# p2, tmp112
# ./th.c:58:     long double ber = bernolli(2 * countMemb);
	mov	eax, DWORD PTR -8[rbp]	# tmp113, countMemb
	add	eax, eax	# _6
# ./th.c:58:     long double ber = bernolli(2 * countMemb);
	cdqe
	mov	rdi, rax	#, _7
	call	bernolli	#
	fstp	TBYTE PTR -80[rbp]	# ber
# ./th.c:59:     while (ABS(curr) > 0.0005) {
	jmp	.L27	#
.L35:
# ./th.c:60:         countMemb++;
	add	DWORD PTR -8[rbp], 1	# countMemb,
# ./th.c:62:         curr *= powX2;
	fld	TBYTE PTR -32[rbp]	# curr
	fld	TBYTE PTR -96[rbp]	# powX2
	fmulp	st(1), st	#,
	fstp	TBYTE PTR -32[rbp]	# curr
# ./th.c:63:         del = (2 * countMemb) * (2 * countMemb - 1);
	mov	eax, DWORD PTR -8[rbp]	# tmp118, countMemb
	add	eax, eax	# _8
# ./th.c:63:         del = (2 * countMemb) * (2 * countMemb - 1);
	sub	eax, 1	# _9,
# ./th.c:63:         del = (2 * countMemb) * (2 * countMemb - 1);
	imul	eax, DWORD PTR -8[rbp]	# _10, countMemb
	add	eax, eax	# _11
# ./th.c:63:         del = (2 * countMemb) * (2 * countMemb - 1);
	cdqe
	mov	QWORD PTR -104[rbp], rax	# del, tmp119
# ./th.c:64:         curr = curr / del;
	fild	QWORD PTR -104[rbp]	# del
	cmp	QWORD PTR -104[rbp], 0	# del,
	jns	.L28	#,
	fld	TBYTE PTR .LC1[rip]	#
	faddp	st(1), st	#,
.L28:
# ./th.c:64:         curr = curr / del;
	fld	TBYTE PTR -32[rbp]	# curr
	fdivrp	st(1), st	#,
	fstp	TBYTE PTR -32[rbp]	# curr
# ./th.c:66:         curr = (curr / (p2 - 1)) * 4;
	mov	rax, QWORD PTR -56[rbp]	# tmp123, p2
	sub	rax, 1	# _13,
# ./th.c:66:         curr = (curr / (p2 - 1)) * 4;
	mov	QWORD PTR -144[rbp], rax	# %sfp, _13
	fild	QWORD PTR -144[rbp]	# %sfp
	test	rax, rax	# _13
	jns	.L29	#,
	fld	TBYTE PTR .LC1[rip]	#
	faddp	st(1), st	#,
.L29:
	fld	TBYTE PTR -32[rbp]	# curr
	fdivrp	st(1), st	#,
# ./th.c:66:         curr = (curr / (p2 - 1)) * 4;
	fld	TBYTE PTR .LC8[rip]	#
	fmulp	st(1), st	#,
	fstp	TBYTE PTR -32[rbp]	# curr
# ./th.c:67:         p2 *= 4;
	sal	QWORD PTR -56[rbp], 2	# p2,
# ./th.c:68:         curr = curr * (p2 - 1);
	mov	rax, QWORD PTR -56[rbp]	# tmp128, p2
	sub	rax, 1	# _16,
# ./th.c:68:         curr = curr * (p2 - 1);
	mov	QWORD PTR -144[rbp], rax	# %sfp, _16
	fild	QWORD PTR -144[rbp]	# %sfp
	test	rax, rax	# _16
	jns	.L30	#,
	fld	TBYTE PTR .LC1[rip]	#
	faddp	st(1), st	#,
.L30:
# ./th.c:68:         curr = curr * (p2 - 1);
	fld	TBYTE PTR -32[rbp]	# curr
	fmulp	st(1), st	#,
	fstp	TBYTE PTR -32[rbp]	# curr
# ./th.c:71:         curr = curr / ber;
	fld	TBYTE PTR -32[rbp]	# curr
	fld	TBYTE PTR -80[rbp]	# ber
	fdivp	st(1), st	#,
	fstp	TBYTE PTR -32[rbp]	# curr
# ./th.c:72:         ber = bernolli(2 * countMemb);
	mov	eax, DWORD PTR -8[rbp]	# tmp135, countMemb
	add	eax, eax	# _18
# ./th.c:72:         ber = bernolli(2 * countMemb);
	cdqe
	mov	rdi, rax	#, _19
	call	bernolli	#
	fstp	TBYTE PTR -80[rbp]	# ber
# ./th.c:73:         curr = curr * ber;
	fld	TBYTE PTR -32[rbp]	# curr
	fld	TBYTE PTR -80[rbp]	# ber
	fmulp	st(1), st	#,
	fstp	TBYTE PTR -32[rbp]	# curr
# ./th.c:75:         if (countMemb % 2 == 0) {
	mov	eax, DWORD PTR -8[rbp]	# countMemb.5_20, countMemb
	and	eax, 1	# _21,
# ./th.c:75:         if (countMemb % 2 == 0) {
	test	eax, eax	# _21
	jne	.L31	#,
# ./th.c:76:             curr = ABS(curr) * -1;
	push	QWORD PTR -24[rbp]	# curr
	push	QWORD PTR -32[rbp]	# curr
	call	ABS	#
	add	rsp, 16	#,
# ./th.c:76:             curr = ABS(curr) * -1;
	fchs	
	fstp	TBYTE PTR -144[rbp]	# %sfp
	mov	rax, QWORD PTR -144[rbp]	#, %sfp
	mov	edx, DWORD PTR -136[rbp]	#, %sfp
	mov	QWORD PTR -32[rbp], rax	# curr,
	mov	DWORD PTR -24[rbp], edx	# curr,
	jmp	.L32	#
.L31:
# ./th.c:78:             curr = ABS(curr);
	push	QWORD PTR -24[rbp]	# curr
	push	QWORD PTR -32[rbp]	# curr
	call	ABS	#
	add	rsp, 16	#,
	fstp	TBYTE PTR -32[rbp]	# curr
.L32:
# ./th.c:80:         if (p2 == 0) {
	cmp	QWORD PTR -56[rbp], 0	# p2,
	jne	.L33	#,
# ./th.c:81:             return result;
	fld	TBYTE PTR -48[rbp]	# result
	jmp	.L34	#
.L33:
# ./th.c:84:         result += curr;
	fld	TBYTE PTR -48[rbp]	# result
	fld	TBYTE PTR -32[rbp]	# curr
	faddp	st(1), st	#,
	fstp	TBYTE PTR -48[rbp]	# result
.L27:
# ./th.c:59:     while (ABS(curr) > 0.0005) {
	push	QWORD PTR -24[rbp]	# curr
	push	QWORD PTR -32[rbp]	# curr
	call	ABS	#
	add	rsp, 16	#,
# ./th.c:59:     while (ABS(curr) > 0.0005) {
	fld	TBYTE PTR .LC9[rip]	#
	fxch	st(1)		#
	fcomip	st, st(1)	#,
	fstp	st(0)		#
	ja	.L35	#,
# ./th.c:86:     if (flagLessZero == 1) {
	cmp	DWORD PTR -4[rbp], 1	# flagLessZero,
	jne	.L36	#,
# ./th.c:87:         return -result;
	fld	TBYTE PTR -48[rbp]	# result
	fchs	
	jmp	.L34	#
.L36:
# ./th.c:89:     return result;
	fld	TBYTE PTR -48[rbp]	# result
.L34:
# ./th.c:90: }
	leave	
	ret	
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
