; boot.asm
; A boot sector that enters 32-bit protected mode.

[org 0x7c00]

mov bp, 0x9000              ; Sets the stack, bp = 0x9000
mov sp, bp                  ; sp = bp

mov bx, MESSAGE_REAL_MODE   ; bx = MESSAGE_REAL_MODE
; call print_string

call switch_to_pm

jmp $

%include "print_string.asm"
%include "gdt.asm"
%include "print_string_pm.asm"
%include "switch_to_pm.asm"

[bits 32]

; The start of 32-bit protected mode

begin_pm:
    
    mov ebx, MESSAGE_PROTECTED_MODE     ; ebx = MESSAGE_PROTECTED_MODE
    call print_string_pm

    jmp $

; Variables

MESSAGE_REAL_MODE      db "Started in 16-bit real mode", 0
MESSAGE_PROTECTED_MODE db "Successfully reached 32-bit protected mode", 0

; Boot sector padding

times 510-($-$$) db 0
dw 0xaa55
