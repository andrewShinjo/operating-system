; read_disk.asm
read_disk:
    ; Inputs:
    ; al = number of sectors to read
    ; ch = cylinder number (starts from 0)
    ; cl = sector number (starts from 1)
    ; dh = head number (starts from 0)
    ; dl = drive number
    ; es:bx = where we want to place the output
    ; Output:
    ; es:bx = data read from disk
    mov ah, 0x02
    int 0x13

    ; if error happens during disk read
    ; carry flag = 1, and disk_error called
    jc disk_error

    ret

disk_error:
    mov bx, DISK_ERROR_MESSAGE
    call print_string
    jmp $

DISK_ERROR_MESSAGE: db "Error reading disk.", 0


; Information about using disk:
; Each sector has 512 bytes
; dl stores the disk number of the disk that booted
