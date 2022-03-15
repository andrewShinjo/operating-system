[bits 16]

; Switch to protected mode

switch_to_pm:
    
    cli                     ; Turn off interrupts
    lgdt [gdt_descriptor]   ; Load global descriptor table, which defines the protected mode segments

    mov eax, cr0            ; To make the switch to protected mode,
    or eax, 0x1             ; set the first bit of CR0, 
    mov cr0, eax            ; a control register

    jmp CODE_SEG:init_pm    ; Make a far jump (to a new segment) to our 32-bit code.
                            ; Forces the CPU to flush its cache of pre-fetched and
                            ; real-mode decoded instructions, which can cause problems.

[bits 32]

; Initialize registers and stack once in protected mode

init_pm:
    
    mov ax, DATA_SEG        ; Now, in protected mode, the old segments are meaningless
    mov ds, ax              ; Point the segment registers to the data selectors
    mov ss, ax              ; defined in the global descriptor table
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000
    mov esp, ebp

    call begin_pm

