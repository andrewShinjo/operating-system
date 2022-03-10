; boot.asm
[org 0x7c00]

mov al, 1
mov ch, 0
mov cl, 2
mov dh, 0
mov bx, 0
mov es, bx
mov bx, 0x7e00
call read_disk
call print_string

jmp $

%include "print_string.asm"
%include "print_hex.asm"
%include "read_disk.asm"

BOOT_DRIVE: db 0

times 510-($-$$) db 0
dw 0xaa55

times 10 db 'A'
times 1 db 0
