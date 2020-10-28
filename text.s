	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"text.c"
	.text
	.align	2
	.global	drawChar3
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar3, %function
drawChar3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, r1
	mov	fp, r3
	mov	r6, #0
	ldr	r9, .L13
	sub	sp, sp, #12
	add	r2, r2, r2, lsl #1
	str	r0, [sp, #4]
	ldr	r8, .L13+4
	add	r9, r9, r2, lsl #4
.L2:
	mov	r4, #6
	ldr	r3, [sp, #4]
	add	r5, r9, r6
	add	r7, r3, r4
	b	.L4
.L3:
	subs	r4, r4, #1
	beq	.L12
.L4:
	ldrb	ip, [r5], #1	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L3
	sub	r0, r7, r4
	mov	r2, fp
	mov	r1, r10
	mov	lr, pc
	bx	r8
	subs	r4, r4, #1
	bne	.L4
.L12:
	add	r6, r6, #6
	cmp	r6, #48
	add	r10, r10, #1
	bne	.L2
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	fontdata_6x8
	.word	setPixel3
	.size	drawChar3, .-drawChar3
	.align	2
	.global	drawChar4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar4, %function
drawChar4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, r1
	mov	fp, r3
	mov	r6, #0
	ldr	r9, .L26
	sub	sp, sp, #12
	add	r2, r2, r2, lsl #1
	str	r0, [sp, #4]
	ldr	r8, .L26+4
	add	r9, r9, r2, lsl #4
.L16:
	mov	r4, #6
	ldr	r3, [sp, #4]
	add	r5, r9, r6
	add	r7, r3, r4
	b	.L18
.L17:
	subs	r4, r4, #1
	beq	.L25
.L18:
	ldrb	ip, [r5], #1	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L17
	sub	r0, r7, r4
	mov	r2, fp
	mov	r1, r10
	mov	lr, pc
	bx	r8
	subs	r4, r4, #1
	bne	.L18
.L25:
	add	r6, r6, #6
	cmp	r6, #48
	add	r10, r10, #1
	bne	.L16
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	fontdata_6x8
	.word	setPixel4
	.size	drawChar4, .-drawChar4
	.align	2
	.global	drawString3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString3, %function
drawString3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L28
	mov	r4, r0
	mov	r7, r1
	mov	r6, r3
.L30:
	mov	r0, r4
	mov	r3, r6
	mov	r1, r7
	bl	drawChar3
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L30
.L28:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
	.size	drawString3, .-drawString3
	.align	2
	.global	drawString4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString4, %function
drawString4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L36
	mov	r4, r0
	mov	r7, r1
	mov	r6, r3
.L38:
	mov	r0, r4
	mov	r3, r6
	mov	r1, r7
	bl	drawChar4
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L38
.L36:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
	.size	drawString4, .-drawString4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
