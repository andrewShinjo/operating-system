; boot.bin

[org 0x7c00]

mov ah, 0x0e
mov dx, 0x1fb6

call print_hex

jmp $

%include "print_string.asm"
%include "print_hex.asm"

times 510-($-$$) db 0
dw 0xaa55
