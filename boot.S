/* boot.S - ARM bootloader */
.section .text
.global _start

_start:
    /* Set up stack */
    ldr r0, =_start
    mov sp, r0

    /* Initialize UART */
    ldr r0, =0x101f1000     /* UART0 base address for versatile-pb */
    mov r1, #0x0
    str r1, [r0, #0x30]     /* Disable UART */
    mov r1, #0x70           /* 7-bit word length, no parity, FIFO enabled */
    str r1, [r0, #0x2C]     /* Line Control Register */
    mov r1, #0x1            /* Enable UART */
    str r1, [r0, #0x30]     /* Control Register */

    /* Print message */
    ldr r4, =message        /* Load message address */
print_loop:
    ldrb r1, [r4], #1      /* Load byte and increment address */
    cmp r1, #0             /* Check for null terminator */
    beq halt               /* If null, halt */
    str r1, [r0]          /* Write to UART */
    b print_loop          /* Continue loop */

halt:
    b halt                /* Infinite loop */

.align 4
message:
    .asciz "Hello from ARM Bootloader!\n\r"

/* Ensure proper section alignment */
.align 4
