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
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #1
	mov	r2, #16
	mov	ip, #140
	mov	r0, #120
	ldr	r3, .L3
	stmib	r3, {r0, r1}
	str	ip, [r3]
	str	r1, [r3, #20]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	bx	lr
.L4:
	.align	2
.L3:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	ldr	r0, .L11
	mov	r2, #40
	str	lr, [sp, #-4]!
	mov	ip, #20
	str	r1, [r0]
	mov	r0, #16
	ldr	r3, .L11+4
	ldr	lr, .L11+8
	str	r2, [r3]
.L6:
	mov	r3, lr
	mov	r2, #32
.L7:
	str	r2, [r3, #4]
	add	r2, r2, #40
	cmp	r2, #232
	str	ip, [r3]
	str	r1, [r3, #8]
	str	r0, [r3, #12]
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	add	r3, r3, #24
	bne	.L7
	add	ip, ip, #18
	cmp	ip, #92
	add	lr, lr, #120
	bne	.L6
	ldr	lr, [sp], #4
	bx	lr
.L12:
	.align	2
.L11:
	.word	direction
	.word	shootSpeed
	.word	enemies
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #83886080
	mov	r0, #3
	ldr	r3, .L19
	ldr	r1, .L19+4
	ldr	r4, .L19+8
	mov	lr, pc
	bx	r4
	mov	r1, #1
	mov	r2, #16
	mov	ip, #140
	mov	r0, #120
	ldr	r3, .L19+12
	stmib	r3, {r0, r1}
	str	ip, [r3]
	str	r1, [r3, #20]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	bl	initEnemies
	mov	r1, #0
	mov	r2, #2
	mvn	ip, #4
	ldr	r3, .L19+16
	add	r0, r3, #192
.L14:
	str	r1, [r3]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	strb	ip, [r3, #28]
	str	r1, [r3, #20]
	stmib	r3, {r1, r2}
	add	r3, r3, #32
	cmp	r3, r0
	bne	.L14
	mov	r2, #34
	mov	r0, #120
	mov	r6, #2
	mov	r1, #10
	mov	r5, #20
	mvn	r4, #1
	mov	lr, #1
	mov	ip, #4
	ldr	r3, .L19+20
.L15:
	str	r2, [r3, #8]
	add	r2, r2, #50
	cmp	r2, #234
	str	r0, [r3]
	str	r0, [r3, #4]
	str	r6, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r5, [r3, #24]
	strb	r4, [r3, #36]
	str	lr, [r3, #28]
	str	ip, [r3, #32]
	add	r3, r3, #40
	bne	.L15
	mov	r2, #0
	mvn	lr, #32768
	mov	ip, #22
	mov	r0, #512
	ldr	r3, .L19+24
	ldr	r1, .L19+28
	strh	lr, [r3, #246]	@ movhi
	strh	r2, [r3, #244]	@ movhi
	strh	r2, [r3, #254]	@ movhi
	strh	ip, [r3, #248]	@ movhi
	strh	r0, [r3, #250]	@ movhi
	strh	r1, [r3, #252]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	67109120
	.word	backgroundPal
	.word	DMANow
	.word	player
	.word	shots
	.word	blockades
	.word	83886336
	.word	15855
	.size	initGame, .-initGame
	.align	2
	.global	initShots
	.syntax unified
	.arm
	.fpu softvfp
	.type	initShots, %function
initShots:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	mov	r2, #2
	mvn	ip, #4
	ldr	r3, .L25
	add	r0, r3, #192
.L22:
	str	r1, [r3]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	strb	ip, [r3, #28]
	str	r1, [r3, #20]
	stmib	r3, {r1, r2}
	add	r3, r3, #32
	cmp	r3, r0
	bne	.L22
	bx	lr
.L26:
	.align	2
.L25:
	.word	shots
	.size	initShots, .-initShots
	.align	2
	.global	initBlockades
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBlockades, %function
initBlockades:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #34
	mov	r0, #120
	mov	r6, #2
	mov	r1, #10
	mov	r5, #20
	mvn	r4, #1
	mov	lr, #1
	mov	ip, #4
	ldr	r3, .L31
.L28:
	str	r2, [r3, #8]
	add	r2, r2, #50
	cmp	r2, #234
	str	r0, [r3]
	str	r0, [r3, #4]
	str	r6, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r5, [r3, #24]
	strb	r4, [r3, #36]
	str	lr, [r3, #28]
	str	ip, [r3, #32]
	add	r3, r3, #40
	bne	.L28
	pop	{r4, r5, r6, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	blockades
	.size	initBlockades, .-initBlockades
	.align	2
	.global	shootShot
	.syntax unified
	.arm
	.fpu softvfp
	.type	shootShot, %function
shootShot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, lr}
	ldr	lr, .L40
.L36:
	ldr	ip, [lr, r3, lsl #5]
	cmp	ip, #0
	lsl	ip, r3, #5
	beq	.L39
	add	r3, r3, #1
	cmp	r3, #6
	bne	.L36
	pop	{r4, lr}
	bx	lr
.L39:
	mov	r4, #1
	ldr	lr, .L40+4
	add	r1, r1, #8
	add	ip, lr, ip
	str	r2, [lr, r3, lsl #5]
	str	r4, [ip, #20]
	str	r1, [ip, #4]
	str	r0, [ip, #24]
	pop	{r4, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	shots+20
	.word	shots
	.size	shootShot, .-shootShot
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L58
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L43
	ldr	r2, .L58+4
	ldr	r3, [r2, #4]
	cmp	r3, #1
	ldrgt	r1, [r2, #8]
	subgt	r3, r3, r1
	strgt	r3, [r2, #4]
.L43:
	ldr	r3, .L58
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L44
	ldr	r3, .L58+4
	ldr	r2, [r3, #16]
	ldr	r1, [r3, #4]
	rsb	r2, r2, #241
	cmp	r1, r2
	ldrlt	r2, [r3, #8]
	addlt	r1, r2, r1
	strlt	r1, [r3, #4]
.L44:
	ldr	r3, .L58+8
	ldrh	r3, [r3]
	tst	r3, #1
	bxeq	lr
	ldr	r3, .L58+12
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bxne	lr
	ldr	r0, .L58+16
.L47:
	ldr	r2, [r0, r3, lsl #5]
	cmp	r2, #0
	lsl	r1, r3, #5
	beq	.L57
	add	r3, r3, #1
	cmp	r3, #6
	bne	.L47
	bx	lr
.L57:
	push	{r4, lr}
	mov	r4, #1
	ldr	lr, .L58+4
	ldr	ip, .L58+20
	ldr	r0, [lr, #4]
	ldr	lr, [lr]
	add	r1, ip, r1
	add	r0, r0, #8
	str	lr, [ip, r3, lsl #5]
	str	r4, [r1, #20]
	str	r0, [r1, #4]
	str	r2, [r1, #24]
	pop	{r4, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	shots+20
	.word	shots
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	moveDownRow
	.syntax unified
	.arm
	.fpu softvfp
	.type	moveDownRow, %function
moveDownRow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L70
	push	{r4, lr}
	sub	lr, ip, #8
	add	r4, ip, #480
.L61:
	mov	r3, ip
	mov	r1, #0
.L62:
	ldr	r2, [r3, #-8]
	ldr	r0, [r3]
	add	r1, r1, #1
	add	r2, r2, r0
	cmp	r1, #5
	str	r2, [r3, #-8]
	add	r3, r3, #24
	bne	.L62
	add	ip, ip, #120
	cmp	ip, r4
	bne	.L61
	ldr	r3, .L70+4
	ldr	ip, [r3]
	add	r4, lr, #480
.L63:
	mov	r3, lr
	mov	r1, #0
.L64:
	ldmib	r3, {r0, r2}
	mla	r2, ip, r2, r0
	add	r1, r1, #1
	cmp	r1, #5
	str	r2, [r3, #4]
	add	r3, r3, #24
	bne	.L64
	add	lr, lr, #120
	cmp	lr, r4
	bne	.L63
	pop	{r4, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	enemies+8
	.word	direction
	.size	moveDownRow, .-moveDownRow
	.global	__aeabi_idivmod
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L120
	ldr	r4, .L120+4
	ldr	r8, .L120+8
	ldr	r9, .L120+12
.L73:
	mov	r1, #0
	ldr	r3, .L120+16
	mov	r6, r1
	ldr	r5, [r3]
	mov	r2, r1
	mov	r3, r4
	ldr	r10, [r7]
	ldr	ip, [r8, #20]
	ldr	lr, [r9]
.L85:
	ldr	r0, [r3, #20]
	cmp	r0, #0
	add	r2, r2, #1
	beq	.L74
	cmp	r5, #12
	moveq	r0, #2
	ldr	fp, [r3]
	streq	r0, [r3, #8]
	ldr	r0, [r3, #4]
	moveq	r6, #1
	moveq	r10, #10
	cmp	fp, #111
	movge	r1, #1
	movge	ip, #0
	cmp	r0, #0
	ble	.L117
	ldr	fp, [r3, #16]
	add	fp, r0, fp
	cmp	fp, #238
	bgt	.L117
	ldr	fp, [r3, #8]
	mla	r0, fp, lr, r0
	str	r0, [r3, #4]
.L74:
	cmp	r2, #4
	add	r3, r3, #120
	bne	.L85
	cmp	r6, #0
	strne	r10, [r7]
	cmp	r1, #0
	strne	ip, [r8, #20]
.L84:
	ldr	r3, .L120+20
	add	r4, r4, #24
	cmp	r4, r3
	bne	.L73
	ldr	r4, .L120+24
	ldr	r3, .L120+28
	ldr	r0, [r4]
	mov	lr, pc
	bx	r3
	ldr	r3, .L120+32
	mov	lr, pc
	bx	r3
	mov	r2, r0
	ldr	r1, [r7]
	ldr	r0, [r4]
	ldr	r3, .L120+36
	mov	r4, r2
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	bne	.L72
	mov	lr, #3
	ldr	r0, .L120+40
	smull	r3, r0, r4, r0
	asr	ip, r4, #31
	rsb	r2, ip, r0, asr #1
	add	r0, r2, r2, lsl #2
	sub	r2, r4, r0
	ldr	r0, .L120+4
	add	r3, r2, r2, lsl #1
	add	r3, r0, r3, lsl lr
	lsl	ip, r2, #1
.L92:
	ldr	r0, [r3, #380]
	cmp	r0, #0
	bne	.L118
	sub	lr, lr, #1
	cmn	lr, #1
	sub	r3, r3, #120
	bne	.L92
.L72:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L117:
	cmp	r6, #0
	strne	r10, [r7]
	rsb	lr, lr, #0
	cmp	r1, #0
	strne	ip, [r8, #20]
	str	lr, [r9]
	bl	moveDownRow
	b	.L84
.L118:
	ldr	r4, .L120+44
.L91:
	ldr	r3, [r4, r1, lsl #5]
	cmp	r3, #0
	lsl	r0, r1, #5
	beq	.L119
	add	r1, r1, #1
	cmp	r1, #6
	bne	.L91
	b	.L72
.L119:
	mov	r4, #1
	rsb	r3, lr, lr, lsl #4
	add	r2, ip, r2
	lsl	r3, r3, #3
	ldr	ip, .L120+4
	add	r3, r3, r2, lsl #3
	add	r2, ip, r3
	ldr	r2, [r2, #4]
	ldr	r3, [ip, r3]
	ldr	ip, .L120+48
	add	r2, r2, #8
	add	r0, ip, r0
	add	r3, r3, #10
	str	r2, [r0, #4]
	str	r3, [ip, r1, lsl #5]
	str	r4, [r0, #20]
	str	r4, [r0, #24]
	b	.L72
.L121:
	.align	2
.L120:
	.word	shootSpeed
	.word	enemies
	.word	player
	.word	direction
	.word	score
	.word	enemies+120
	.word	shootTimer
	.word	srand
	.word	rand
	.word	__aeabi_idivmod
	.word	1717986919
	.word	shots+20
	.word	shots
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	updateShots
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateShots, %function
updateShots:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #0
	ldr	r5, .L176
	ldr	r7, .L176+4
	ldr	r10, .L176+8
	sub	sp, sp, #20
.L136:
	ldr	r3, [r5]
	sub	r2, r3, #18
	cmp	r2, #142
	strhi	r9, [r5, #20]
	bhi	.L124
	ldr	r2, [r5, #24]
	cmp	r2, #1
	ldr	r2, [r5, #8]
	beq	.L175
	ldr	r8, .L176+12
	sub	r3, r3, r2
	str	r3, [r5]
	add	fp, r8, #480
.L131:
	mov	r4, r8
	mov	r6, #0
.L133:
	add	r0, r5, #12
	ldm	r0, {r0, r1}
	ldr	r2, [r5, #4]
	str	r3, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp]
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #16]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	add	r6, r6, #1
	beq	.L132
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L132
	ldr	r3, [r5, #20]
	cmp	r3, #0
	ldrne	r3, [r10]
	addne	r3, r3, #1
	strne	r9, [r4, #20]
	strne	r9, [r5, #20]
	strne	r3, [r10]
.L132:
	cmp	r6, #5
	ldr	r3, [r5]
	add	r4, r4, #24
	bne	.L133
	add	r8, r8, #120
	cmp	r8, fp
	bne	.L131
	ldr	r4, .L176+16
	add	r6, r4, #160
.L134:
	add	r0, r5, #12
	ldm	r0, {r0, r1}
	ldr	r2, [r5, #4]
	str	r3, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #24]
	ldr	r1, [r4]
	ldr	r0, [r4, #8]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L135
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L135
	ldr	r3, [r5, #20]
	cmp	r3, #0
	strne	r9, [r5, #20]
.L135:
	add	r4, r4, #40
	cmp	r4, r6
	beq	.L124
	ldr	r3, [r5]
	b	.L134
.L128:
	ldr	r4, .L176+20
	add	r0, r4, #12
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r5, #16]
	ldr	r3, [r5, #12]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L124
	ldr	r3, [r5, #20]
	cmp	r3, #0
	strne	r9, [r5, #20]
	strne	r9, [r4, #20]
.L124:
	ldr	r3, .L176+24
	add	r5, r5, #32
	cmp	r5, r3
	bne	.L136
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L175:
	ldr	r4, .L176+16
	add	r3, r3, r2
	str	r3, [r5]
	add	r6, r4, #160
.L129:
	add	r0, r5, #12
	ldm	r0, {r0, r1}
	ldr	r2, [r5, #4]
	str	r3, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #24]
	ldr	r1, [r4]
	ldr	r0, [r4, #8]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L126
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L126
	ldr	r3, [r5, #20]
	cmp	r3, #0
	beq	.L126
	ldr	r3, [r4, #32]
	cmp	r3, #0
	sub	r3, r3, #1
	str	r9, [r5, #20]
	strgt	r3, [r4, #32]
	strle	r9, [r4, #32]
.L126:
	add	r4, r4, #40
	cmp	r4, r6
	beq	.L128
	ldr	r3, [r5]
	b	.L129
.L177:
	.align	2
.L176:
	.word	shots
	.word	collision
	.word	score
	.word	enemies
	.word	blockades
	.word	player
	.word	shots+192
	.size	updateShots, .-updateShots
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_d2iz
	.align	2
	.global	updateBlockades
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBlockades, %function
updateBlockades:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mvn	fp, #5
	mov	r10, #0
	ldr	r4, .L194
	ldr	r8, .L194+4
	ldr	r7, .L194+8
	ldr	r6, .L194+12
	add	r5, r4, #160
.L183:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L179
	ldr	r3, [r4, #32]
	cmp	r3, #3
	bgt	.L179
	beq	.L190
	cmp	r3, #2
	beq	.L191
	cmp	r3, #1
	strbne	fp, [r4, #36]
	strne	r10, [r4, #28]
	beq	.L192
.L179:
	add	r4, r4, #40
	cmp	r4, r5
	bne	.L183
.L193:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L191:
	ldr	r9, [r4, #20]
	mov	r0, r9
	mov	lr, pc
	bx	r8
	mov	r2, #0
	ldr	r3, .L194+16
.L189:
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	ldr	r3, [r4, #4]
	sub	r9, r9, r0
	add	r9, r3, r9
	str	r0, [r4, #16]
	str	r9, [r4]
	add	r4, r4, #40
	cmp	r4, r5
	bne	.L183
	b	.L193
.L190:
	ldr	r9, [r4, #20]
	mov	r0, r9
	mov	lr, pc
	bx	r8
	mov	r2, #0
	ldr	r3, .L194+20
	b	.L189
.L192:
	ldr	r9, [r4, #20]
	mov	r0, r9
	mov	lr, pc
	bx	r8
	mov	r2, #0
	ldr	r3, .L194+24
	b	.L189
.L195:
	.align	2
.L194:
	.word	blockades
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_d2iz
	.word	1071644672
	.word	1072168960
	.word	1070596096
	.size	updateBlockades, .-updateBlockades
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	bl	updateEnemies
	bl	updateShots
	bl	updateBlockades
	ldr	r2, .L198
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L199:
	.align	2
.L198:
	.word	shootTimer
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L202
	ldr	ip, .L202+4
	sub	sp, sp, #8
	ldr	r3, [r0, #12]
	ldr	r2, [r0, #16]
	ldr	r1, [r0]
	ldr	r4, .L202+8
	ldr	r0, [r0, #4]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L203:
	.align	2
.L202:
	.word	player
	.word	playerBitmap
	.word	drawImage4
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r6, .L215
	ldr	r8, .L215+4
	ldr	r7, .L215+8
	sub	sp, sp, #12
	add	r9, r6, #480
.L205:
	mov	r4, r6
	mov	r5, #0
.L207:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	add	r5, r5, #1
	bne	.L214
.L206:
	cmp	r5, #5
	add	r4, r4, #24
	bne	.L207
	add	r6, r6, #120
	cmp	r6, r9
	bne	.L205
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L214:
	str	r8, [sp]
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #16]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	b	.L206
.L216:
	.align	2
.L215:
	.word	enemies
	.word	enemyBitmap
	.word	drawImage4
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	drawShots
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawShots, %function
drawShots:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L226
	ldr	r6, .L226+4
	sub	sp, sp, #8
	add	r5, r4, #192
	b	.L219
.L218:
	add	r4, r4, #32
	cmp	r4, r5
	beq	.L225
.L219:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L218
	ldrb	r2, [r4, #28]	@ zero_extendqisi2
	ldr	r3, [r4, #12]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	str	r2, [sp]
	add	r4, r4, #32
	ldr	r2, [r4, #-16]
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L219
.L225:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L227:
	.align	2
.L226:
	.word	shots
	.word	drawRect4
	.size	drawShots, .-drawShots
	.align	2
	.global	drawBlockades
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBlockades, %function
drawBlockades:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L237
	ldr	r6, .L237+4
	sub	sp, sp, #8
	add	r5, r4, #160
.L230:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L236
.L229:
	add	r4, r4, #40
	cmp	r4, r5
	bne	.L230
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L236:
	ldrb	r2, [r4, #36]	@ zero_extendqisi2
	ldr	r3, [r4, #16]
	str	r2, [sp]
	ldr	r1, [r4]
	ldr	r2, [r4, #24]
	ldr	r0, [r4, #8]
	mov	lr, pc
	bx	r6
	b	.L229
.L238:
	.align	2
.L237:
	.word	blockades
	.word	drawRect4
	.size	drawBlockades, .-drawBlockades
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L241
	ldr	r3, .L241+4
	mov	lr, pc
	bx	r3
	bl	drawPlayer
	bl	drawEnemies
	bl	drawShots
	pop	{r4, lr}
	b	drawBlockades
.L242:
	.align	2
.L241:
	.word	backgroundBitmap
	.word	drawFullscreenImage4
	.size	drawGame, .-drawGame
	.comm	shootSpeed,4,4
	.comm	shootTimer,4,4
	.comm	direction,4,4
	.comm	score,4,4
	.comm	blockades,160,4
	.comm	shots,192,4
	.comm	enemies,480,4
	.comm	player,24,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
