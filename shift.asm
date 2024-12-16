.model small
.stack 64
.data

.code
    main proc far
        ;shift right
        mov ax, 10      ; binary -> 00001010  ; hex -> 0AH
        shr ax, 2       ; binary -> 00000010  ; hex -> 02H
        
        ;shift left
        mov ax, 15      ; binary -> 00001111  ; hex -> 0FH
        shl ax, 3       ; binary -> 01111000  ; hex -> 78H  
        
        int 20h    
    main endp
end main    