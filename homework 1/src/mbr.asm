


[BITS 16]

boot: ; This file starts executing here.
main:

    mov ah,0x0e
    mov bx,STRING
    call putStr
    mov dh,50
    call readSector
    jmp 0x7E00
    
STRING:

    db 'if an illegal immigrant was fighting a pedophile, does it mean its alien vs predator?',0
    
putStr:

    mov cl,[bx]
    cmp cl,0
    jne bx_add
    ret
    
bx_add:

    mov al, [bx]
    int 0x10
    add bx,1
    jmp putStr
    
readSector:

    mov bx,0x7E00
    mov ah,0x02
    mov al,50
    mov ch,1
    mov dh,1
    mov cl,2
    int 0x13
    
    ret
     

    hlt


times 510-($-$$) db 0 ; Skip to end of boot sector

db 0x55 ; Magic Numbers
db 0xaa ; To make disk bootable


