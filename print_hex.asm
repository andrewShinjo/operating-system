; Print a hexadecimal to the screen.
; Input: dx = hexadecimal value to print in the format 0x????
; Output: Prints the hexadecimal value
print_hex:
    pusha                   

    mov bx, dx                  
    shr bx, 12                  
    mov bx, [ bx + HEX_TABLE ]  
    mov [ HEX_OUT + 2 ], bl

    mov bx, dx
    shr bx, 8
    and bx, 0x000f
    mov bx, [ bx + HEX_TABLE ]
    mov [ HEX_OUT + 3 ], bl

    mov bx, dx
    shr bx, 4
    and bx, 0x000f
    mov bx, [ bx + HEX_TABLE ]
    mov [ HEX_OUT + 4 ], bl

    mov bx, dx
    and bx, 0x000f
    mov bx, [ bx + HEX_TABLE ]
    mov [ HEX_OUT + 5 ], bl

    mov bx, HEX_OUT

    call print_string
    
    popa
    ret

HEX_OUT: db '0x0000', 0
HEX_TABLE: db '0123456789abcdef'

