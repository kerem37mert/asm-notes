.model small
.stack 64
.data

.code
    main proc far 
        ; rotate right
        mov al, 13      ; binary -> 00001101 ; hex -> 0DH  
        ror al, 1       ; binary -> 10000110 ; hex -> 86H
        
        ; rotate left
        mov al, 11      ; binary -> 00001011 ; hex -> 0BH
        rol al, 2       ; binary -> 00101100 ; hex -> 2CH
        
        int 20h   
    main endp
end main    