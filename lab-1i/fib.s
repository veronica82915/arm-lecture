	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}

	mov.w r2, #0
	mov r3, r0
	mov.w r4, #-1
	mov.w r5, #1

loop:
	add r2, r4, r5
	mov r4, r5
	mov r5, r2
	sub r3, r3, #1
	cmp r3, #0
	bge loop

	mov r0, r5	

	@ R4 = R0 - 0 (update flags)
	@ if(R0 <= 0) goto .L3 (which returns 0)

	@ Compare R4 wtih 1
	@ If R4 == 1 goto .L4 (which returns 1)

	@ R0 = R4 - 1
	@ Recursive call to fibonacci with R4 - 1 as parameter

	@ R5 = R0
	@ R0 = R4 - 2
	@ Recursive call to fibonacci with R4 - 2 as parameter

	@ R0 = R5 + R0 (update flags)

	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
