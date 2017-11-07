.set MAGIC, 0x1badb002
.set FLAGS, (1<<0 | 1<<1)
.set CHECKSUM, -(MAGIC + FLAGS)


.section .multiboot
	.long MAGIC
	.long FLAGS
	.long CHECKSUM


.section .text
.extern airosMain
.global loader

loader:
	mov $airos_stack, %esp
	push %eax
	push %ebx
	call airosMain


_stop:
	cli
	hlt
	jmp _stop



.section .bss
.space 2*1024*1024;
airos_stack:

