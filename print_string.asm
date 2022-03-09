; Prints a string.
; Input: bx = memory address of string to print
; Output: String gets printed
print_string:
    pusha               ; push registers to the stack
    mov ah, 0x0e        ; ah = 0x0e
    mov al, [bx]        ; al = *bx
    cmp al, 0           ; if al == 0, end()
    je end              
    int 0x10            ; ah=0x0e & int=0x10 => print char in al to screen
                        ; then move the cursor forward
    inc bx              ; bx = bx + 1
    jmp print_string    ; print_string()

end:
    popa                ; pop register values from stack back to registers
    ret                 ; return



