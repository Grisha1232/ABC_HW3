	.intel_syntax noprefix
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
	push	rbp				
	mov	rbp, rsp			
	sub	rsp, 32	
	mov	QWORD PTR -8[rbp], rdi		# n
						# if (n == 0) return 1
	cmp	QWORD PTR -8[rbp], 0		# n
	jne	.L2	
						
	fld1	
	jmp	.L3	
.L2:
						# return n * fact(n - 1)
	fild	QWORD PTR -8[rbp]		# n
	fld	st(0)				
	fstp	TBYTE PTR -32[rbp]		
	cmp	QWORD PTR -8[rbp], 0		# n
	jns	.L5				
	fld	TBYTE PTR .LC1[rip]		
	faddp	st(1), st			
	fstp	TBYTE PTR -32[rbp]		
	jmp	.L4				
.L5:
	fstp	st(0)		
.L4:

	mov	rax, QWORD PTR -8[rbp]		# n
	sub	rax, 1				
	mov	rdi, rax			
	call	fact				
						
	fld	TBYTE PTR -32[rbp]		
	fmulp	st(1), st			
.L3:
						
	leave	
	ret	
	.size	fact, .-fact
	.globl	pow2
	.type	pow2, @function
pow2:
	push	rbp				
	mov	rbp, rsp			
	mov	QWORD PTR -8[rbp], rdi		# n
						
	mov	rax, QWORD PTR -8[rbp]		
	mov	edx, 1				
	mov	ecx, eax			
	sal	edx, cl				
	mov	eax, edx			
	cdqe
						
	pop	rbp				
	ret	
	.size	pow2, .-pow2
	.globl	bink
	.type	bink, @function
bink:
	push	rbp				
	mov	rbp, rsp			
	sub	rsp, 48				
	mov	QWORD PTR -8[rbp], rdi		# n
	mov	QWORD PTR -16[rbp], rsi		# k
						# 1.0 * fact(n) / (fact(k) * fact(n - k));
	mov	rdi, QWORD PTR -8[rbp]		# n
	call	fact				
	fstp	TBYTE PTR -32[rbp]		
						
	mov	rdi, QWORD PTR -16[rbp]		# k
	call	fact				
	fstp	TBYTE PTR -48[rbp]		
						
	mov	rax, QWORD PTR -8[rbp]		# n
	sub	rax, QWORD PTR -16[rbp]		# k
	mov	rdi, rax			
	call	fact				
						
	fld	TBYTE PTR -48[rbp]		
	fmulp	st(1), st			
						# return 1.0 * fact(n) / (fact(k) * fact(n - k));
	fld	TBYTE PTR -32[rbp]		
	fdivrp	st(1), st			
						
	leave	
	ret	
	.size	bink, .-bink
	.globl	bernolli
	.type	bernolli, @function
bernolli:
	push	rbp				
	mov	rbp, rsp			
	sub	rsp, 64				
	mov	QWORD PTR -40[rbp], rdi		# n
						
	mov	eax, DWORD PTR sizeBer[rip]	# sizeBer
	cdqe
						# if (n <= sizeBer) return Ber[n];
	cmp	QWORD PTR -40[rbp], rax		
	ja	.L11				
						
	mov	rax, QWORD PTR -40[rbp]		# n
	sal	rax, 4				
	mov	rdx, rax			
	lea	rax, Ber[rip]			
	fld	TBYTE PTR [rdx+rax]		# Ber[n]
	jmp	.L12				
.L11:
						# if (n % 2 == 1)
	mov	rax, QWORD PTR -40[rbp]		# n
	and	eax, 1				
						
	test	rax, rax			
	je	.L13				
						# Ber[n] = 0;
	mov	rax, QWORD PTR -40[rbp]		# n
	sal	rax, 4				
	mov	rdx, rax			
	lea	rax, Ber[rip]			
	fldz	
	fstp	TBYTE PTR [rdx+rax]		# Ber[n]
						# sizeBer++;
	mov	eax, DWORD PTR sizeBer[rip]	# sizeBer
	add	eax, 1				#
	mov	DWORD PTR sizeBer[rip], eax	#
	
						# return 0;
	fldz	
	jmp	.L12				#
.L13:
						# long double s = 0;
	fldz	
	fstp	TBYTE PTR -16[rbp]		# s
						# for (long k = 1; k < n; k++) 
	mov	QWORD PTR -24[rbp], 1		# int k = 1
						
	jmp	.L14				#
.L15:
						# bink(n + 1, k + 1) * bernolli(n - k);
	mov	rax, QWORD PTR -24[rbp]		# k
	add	rax, 1				
						
	mov	rdx, rax			
	mov	rax, QWORD PTR -40[rbp]		
	add	rax, 1				
	mov	rsi, rdx			
	mov	rdi, rax			
	call	bink				
	fstp	TBYTE PTR -64[rbp]		
						
	mov	rdx, QWORD PTR -24[rbp]		# k
	mov	rax, QWORD PTR -40[rbp]		# n
	sub	rax, rdx			# n - k
	mov	rdi, rax			
	call	bernolli			
						
	fld	TBYTE PTR -64[rbp]		
	fmulp	st(1), st			
						
	fld	TBYTE PTR -16[rbp]		# s
	faddp	st(1), st			
	fstp	TBYTE PTR -16[rbp]		# s
						
	add	QWORD PTR -24[rbp], 1		# k++
.L14:
						
	mov	rax, QWORD PTR -24[rbp]		# 
	cmp	QWORD PTR -40[rbp], rax		# k < n
	ja	.L15				
						# (-1. / (n + 1.)) * s;
	mov	rax, QWORD PTR -40[rbp]		# n
	test	rax, rax			
	js	.L16				
	pxor	xmm0, xmm0			
	cvtsi2sd	xmm0, rax		
	jmp	.L17				
.L16:
	mov	rdx, rax			
	shr	rdx				
	and	eax, 1				
	or	rdx, rax			
	pxor	xmm0, xmm0			
	cvtsi2sd	xmm0, rdx		
	addsd	xmm0, xmm0			
.L17:
	movsd	xmm1, QWORD PTR .LC4[rip]	
	addsd	xmm1, xmm0			
						
	movsd	xmm0, QWORD PTR .LC5[rip]	
	divsd	xmm0, xmm1			
	movsd	QWORD PTR -64[rbp], xmm0	
	fld	QWORD PTR -64[rbp]		
						
	fld	TBYTE PTR -16[rbp]		# s
	fmulp	st(1), st			
						# Ber[n] = (-1. / (n + 1.)) * s;
	mov	rax, QWORD PTR -40[rbp]		# n
	sal	rax, 4				# 
	mov	rdx, rax			# 
	lea	rax, Ber[rip]			# 
	fstp	TBYTE PTR [rdx+rax]		# Ber[n]
						# sizeBer++;
	mov	eax, DWORD PTR sizeBer[rip]	# 
	add	eax, 1				# 
	mov	DWORD PTR sizeBer[rip], eax	# 
	
						# return Ber[n];
	mov	rax, QWORD PTR -40[rbp]		# n
	sal	rax, 4				# 
	mov	rdx, rax			# 
	lea	rax, Ber[rip]			# 
	fld	TBYTE PTR [rdx+rax]		# Ber[n]
.L12:
						
	leave	
	ret	
	.size	bernolli, .-bernolli
	.globl	ABS
	.type	ABS, @function
ABS:
	push	rbp				
	mov	rbp, rsp			
						# if (x < 0) return x * -1
	fld	TBYTE PTR 16[rbp]		# x
	fldz	
	fcomip	st, st(1)			#
	fstp	st(0)				#
	jbe	.L23				#
						# 
	fld	TBYTE PTR 16[rbp]		# x
	fchs	
	jmp	.L21				#
.L23:
						# return x;
	fld	TBYTE PTR 16[rbp]		# x
.L21:
						
	pop	rbp				
	ret	
	.size	ABS, .-ABS
	.globl	th
	.type	th, @function
th:
	push	rbp				
	mov	rbp, rsp			
	sub	rsp, 144			
	movsd	QWORD PTR -120[rbp], xmm0	# double x
						
	mov	DWORD PTR -4[rbp], 0		# int flagLessZero = 0
						# if (x < 0) 
	pxor	xmm0, xmm0			
	comisd	xmm0, QWORD PTR -120[rbp]	# x
	jbe	.L25				
						# flagLessZero = 1;
	mov	DWORD PTR -4[rbp], 1		# 
	
						# x = ABS(x);
	fld	QWORD PTR -120[rbp]		# x
	lea	rsp, -16[rsp]			#
	fstp	TBYTE PTR [rsp]			#
	call	ABS				#
	add	rsp, 16				#
						# 
	fstp	QWORD PTR -120[rbp]		# x = ABS(x);
.L25:
						# int countMemb = 1;
	mov	DWORD PTR -8[rbp], 1		# 
	
						# long double powX2 = pow(x, 2);
	movsd	xmm0, QWORD PTR .LC7[rip]	# 
	movapd	xmm1, xmm0			#
	movq	xmm0, QWORD PTR -120[rbp]	# transfer x to func pow
	call	pow@PLT				
						
	movsd	QWORD PTR -144[rbp], xmm0	
	fld	QWORD PTR -144[rbp]		
	fstp	TBYTE PTR -96[rbp]		# long double powX2
						
	fld	QWORD PTR -120[rbp]		# x
	fstp	TBYTE PTR -32[rbp]		# long double curr
	
						
	fld	TBYTE PTR -32[rbp]		# curr
	fstp	TBYTE PTR -48[rbp]		# long double result
	
						# unsigned long long int del = 2;
	mov	QWORD PTR -104[rbp], 2		# del
	
						
	mov	eax, DWORD PTR -8[rbp]		# countMemb
	add	eax, eax			
						
	cdqe
	mov	rdi, rax			
	call	pow2				
	mov	QWORD PTR -56[rbp], rax		# unsigned long long int p2
						
	mov	eax, DWORD PTR -8[rbp]		# countMemb
	add	eax, eax			
						
	cdqe
	mov	rdi, rax			
	call	bernolli			
	fstp	TBYTE PTR -80[rbp]		# long double ber
						# while (ABS(curr) > 0.0005) 
	jmp	.L27				
.L35:
						
	add	DWORD PTR -8[rbp], 1		# countMemb++
						# curr *= powX2;
	fld	TBYTE PTR -32[rbp]		# curr
	fld	TBYTE PTR -96[rbp]		# powX2
	fmulp	st(1), st			
	fstp	TBYTE PTR -32[rbp]		# curr
						#
	mov	eax, DWORD PTR -8[rbp]		# countMemb
	add	eax, eax			# 
						# 
	sub	eax, 1				# 
						# 
	imul	eax, DWORD PTR -8[rbp]		# countMemb
	add	eax, eax			# 
						# 
	cdqe
	mov	QWORD PTR -104[rbp], rax	# del = (2 * countMemb) * (2 * countMemb - 1);
						# curr = curr / del;
	fild	QWORD PTR -104[rbp]		# del
	cmp	QWORD PTR -104[rbp], 0		# del
	jns	.L28				
	fld	TBYTE PTR .LC1[rip]		
	faddp	st(1), st			
.L28:
						
	fld	TBYTE PTR -32[rbp]		# curr
	fdivrp	st(1), st			
	fstp	TBYTE PTR -32[rbp]		# curr
						# curr = (curr / (p2 - 1)) * 4;
	mov	rax, QWORD PTR -56[rbp]		# p2
	sub	rax, 1				# 
						
	mov	QWORD PTR -144[rbp], rax	#
	fild	QWORD PTR -144[rbp]		# 
	test	rax, rax			# 
	jns	.L29				#
	fld	TBYTE PTR .LC1[rip]		#
	faddp	st(1), st			#
.L29:
	fld	TBYTE PTR -32[rbp]		# curr
	fdivrp	st(1), st			#
						# 
	fld	TBYTE PTR .LC8[rip]		#
	fmulp	st(1), st			#
	fstp	TBYTE PTR -32[rbp]		# curr
	
						# p2 *= 4;
	sal	QWORD PTR -56[rbp], 2		# p2
	
						# curr = curr * (p2 - 1);
	mov	rax, QWORD PTR -56[rbp]		# p2
	sub	rax, 1				# 
						# 
	mov	QWORD PTR -144[rbp], rax	# 
	fild	QWORD PTR -144[rbp]		# 
	test	rax, rax			# 
	jns	.L30				#
	fld	TBYTE PTR .LC1[rip]		#
	faddp	st(1), st			#
.L30:
						# curr = curr * (p2 - 1);
	fld	TBYTE PTR -32[rbp]		# curr
	fmulp	st(1), st			#
	fstp	TBYTE PTR -32[rbp]		# curr
	
						# curr = curr / ber;
	fld	TBYTE PTR -32[rbp]		# curr
	fld	TBYTE PTR -80[rbp]		# ber
	fdivp	st(1), st			#
	fstp	TBYTE PTR -32[rbp]		# curr
						# ber = bernolli(2 * countMemb);
	mov	eax, DWORD PTR -8[rbp]		# countMemb
	add	eax, eax			# 
						# ber = bernolli(2 * countMemb);
	cdqe
	mov	rdi, rax			#,
	call	bernolli			#
	fstp	TBYTE PTR -80[rbp]		# ber
	
						# curr = curr * ber;
	fld	TBYTE PTR -32[rbp]		# curr
	fld	TBYTE PTR -80[rbp]		# ber
	fmulp	st(1), st			#
	fstp	TBYTE PTR -32[rbp]		# curr
	
						# if (countMemb % 2 == 0) 
	mov	eax, DWORD PTR -8[rbp]		# countMemb
	and	eax, 1				# 
						# 
	test	eax, eax			#
	jne	.L31				#
						# curr = ABS(curr) * -1;
	push	QWORD PTR -24[rbp]		# curr
	push	QWORD PTR -32[rbp]		# curr
	call	ABS				#
	add	rsp, 16				#
						# 
						
	fchs	
	fstp	TBYTE PTR -144[rbp]		# 
	mov	rax, QWORD PTR -144[rbp]	#
	mov	edx, DWORD PTR -136[rbp]	#
	mov	QWORD PTR -32[rbp], rax		# curr
	mov	DWORD PTR -24[rbp], edx		# curr
	jmp	.L32				#
.L31:
						# curr = ABS(curr);
	push	QWORD PTR -24[rbp]		# curr
	push	QWORD PTR -32[rbp]		# curr
	call	ABS				#
	add	rsp, 16				#
	fstp	TBYTE PTR -32[rbp]		# curr
.L32:
						# if (p2 == 0) 
	cmp	QWORD PTR -56[rbp], 0		# p2
	jne	.L33				#
						# return result
	fld	TBYTE PTR -48[rbp]		# result
	jmp	.L34				#
.L33:
						# result += curr;
	fld	TBYTE PTR -48[rbp]		# result
	fld	TBYTE PTR -32[rbp]		# curr
	faddp	st(1), st			#
	fstp	TBYTE PTR -48[rbp]		# result
.L27:
						# 
	push	QWORD PTR -24[rbp]		# curr
	push	QWORD PTR -32[rbp]		# curr
	call	ABS				#
	add	rsp, 16				#
						# 
	fld	TBYTE PTR .LC9[rip]		#
	fxch	st(1)				#
	fcomip	st, st(1)			#
	fstp	st(0)				#
	ja	.L35				#
	
						# if (flagLessZero == 1) 
	cmp	DWORD PTR -4[rbp], 1		# flagLessZero
	jne	.L36				#
						# return -result;
	fld	TBYTE PTR -48[rbp]		# result
	fchs	
	jmp	.L34				
.L36:
						# return result;
	fld	TBYTE PTR -48[rbp]		# result
.L34:
						
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
