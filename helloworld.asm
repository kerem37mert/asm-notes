.model small
.stack 64
.data
    yazi db "Hello World!", 0dh, 0ah, 24h
.code 
    main proc far
        mov ax, @data
        mov ds, ax

                    
        mov ah, 09h            
        lea dx, yazi
        int 21h    
        
    main endp
end main    