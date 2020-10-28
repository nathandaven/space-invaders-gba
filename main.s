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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L4
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L4+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	titlePal
	.word	DMANow
	.word	titleBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	mov	r2, #0
	ldr	r0, .L7
	ldr	r3, .L7+4
	strh	r0, [r1]	@ movhi
	ldr	r1, .L7+8
	ldrh	r0, [r3, #48]
	ldr	r3, .L7+12
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	1044
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L16
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L9
	ldr	r3, .L16+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L15
.L9:
	pop	{r4, lr}
	bx	lr
.L15:
	mov	r1, #1
	ldr	r2, .L16+12
	ldr	r3, .L16+16
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L19
	str	r2, [r3]
	bx	lr
.L20:
	.align	2
.L19:
	.word	state
	.size	goToGame, .-goToGame
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"PAUSED\000"
	.text
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #251
	ldr	r3, .L23
	mov	lr, pc
	bx	r3
	ldr	r4, .L23+4
	ldr	r2, .L23+8
	mov	r1, #75
	mov	r0, #105
	mov	r3, #250
	mov	lr, pc
	bx	r4
	ldr	r3, .L23+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+16
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L23+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L24:
	.align	2
.L23:
	.word	fillScreen4
	.word	drawString4
	.word	.LC0
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L35
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L35+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L26
	ldr	r2, .L35+8
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L26
	mov	r2, #1
	ldr	r3, .L35+12
	str	r2, [r3]
.L25:
	pop	{r4, lr}
	bx	lr
.L26:
	tst	r3, #4
	beq	.L25
	ldr	r3, .L35+8
	ldrh	r3, [r3]
	ands	r3, r3, #4
	bne	.L25
	ldr	r2, .L35+16
	pop	{r4, lr}
	str	r3, [r2]
	b	goToStart
.L36:
	.align	2
.L35:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.word	score
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"YOU WIN!\000"
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #253
	ldr	r3, .L39
	mov	lr, pc
	bx	r3
	ldr	r4, .L39+4
	ldr	r2, .L39+8
	mov	r1, #80
	mov	r0, #96
	mov	r3, #251
	mov	lr, pc
	bx	r4
	ldr	r3, .L39+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+16
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L39+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L40:
	.align	2
.L39:
	.word	fillScreen4
	.word	drawString4
	.word	.LC1
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L48
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L41
	ldr	r3, .L48+8
	ldrh	r3, [r3]
	ands	r3, r3, #8
	beq	.L47
.L41:
	pop	{r4, lr}
	bx	lr
.L47:
	ldr	r2, .L48+12
	pop	{r4, lr}
	str	r3, [r2]
	b	goToStart
.L49:
	.align	2
.L48:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	score
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"YOU LOSE!\000"
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #252
	ldr	r3, .L52
	mov	lr, pc
	bx	r3
	ldr	r4, .L52+4
	ldr	r2, .L52+8
	mov	r1, #80
	mov	r0, #96
	mov	r3, #251
	mov	lr, pc
	bx	r4
	ldr	r3, .L52+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+16
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L52+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L53:
	.align	2
.L52:
	.word	fillScreen4
	.word	drawString4
	.word	.LC2
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"Score: %d\000"
	.text
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L65
	ldr	r4, .L65+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+8
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	add	r2, r2, r2, lsl #2
	ldr	r1, .L65+12
	ldr	r3, .L65+16
	lsl	r2, r2, #1
	ldr	r0, .L65+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L65+24
	mov	r1, #4
	mov	r0, #15
	ldr	r2, .L65+20
	mov	r3, #251
	mov	lr, pc
	bx	r5
	ldr	r3, .L65+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L55
	ldr	r3, .L65+40
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L62
.L55:
	ldr	r3, .L65+44
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L63
	ldr	r3, [r4]
	cmp	r3, #20
	beq	.L64
.L54:
	pop	{r4, r5, r6, lr}
	bx	lr
.L63:
	bl	goToLose
	ldr	r3, [r4]
	cmp	r3, #20
	bne	.L54
.L64:
	pop	{r4, r5, r6, lr}
	b	goToWin
.L62:
	bl	goToPause
	b	.L55
.L66:
	.align	2
.L65:
	.word	updateGame
	.word	score
	.word	drawGame
	.word	.LC3
	.word	sprintf
	.word	scoreText
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	player
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L78
	push	{r4, r7, fp, lr}
	strh	r1, [r3]	@ movhi
	ldr	r4, .L78+4
	ldr	fp, .L78+8
	ldrh	r1, [r4, #48]
	ldr	r5, .L78+12
	ldr	r3, .L78+16
	strh	r1, [fp]	@ movhi
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L78+20
	ldr	r10, .L78+24
	ldr	r9, .L78+28
	ldr	r8, .L78+32
	ldr	r7, .L78+36
.L68:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L69:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L69
.L71:
	.word	.L74
	.word	.L73
	.word	.L72
	.word	.L70
	.word	.L70
.L70:
	mov	lr, pc
	bx	r7
	b	.L68
.L72:
	mov	lr, pc
	bx	r8
	b	.L68
.L73:
	mov	lr, pc
	bx	r9
	b	.L68
.L74:
	mov	lr, pc
	bx	r10
	b	.L68
.L79:
	.align	2
.L78:
	.word	1044
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	goToStart
	.word	state
	.word	start
	.word	game
	.word	pause
	.word	win
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	scoreText,41,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
