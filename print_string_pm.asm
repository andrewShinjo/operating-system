; print_string_pm.asm
; Prints a string in 32-bit protected mode.

[bits 32]

; Define some constants

VIDEO_MEMORY   equ 0xb8000
WHITE_ON_BLACK equ 0x0f

; Prints a null-terminated string at EDX

print_string_pm:

    pusha
    mov edx, VIDEO_MEMORY   ; EDX = start of VIDEO_MEMORY

print_string_pm_loop:

    mov al, [ebx]               ; al = *EBX
    mov ah, WHITE_ON_BLACK      ; ah = attributes of char at al

    cmp al, 0
    je print_string_pm_done

    mov [edx], ax

    add ebx, 1                  ; Increment EBX to the next char in the string
    add edx, 2                  ; Move to the next character cell in video memory

    jmp print_string_pm_loop    ; Loop around to print the next character

print_string_pm_done:

    popa
    ret
