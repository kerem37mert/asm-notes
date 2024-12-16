.model small
.stack 64
.data
    yazi db "Hello World!", 0dh, 0ah, 24h
.code 
    main proc far
        mov ax, @data
        mov ds, ax  
        
        mov cx, 1      
        
      tekrar:               
        mov ah, 09h            
        lea dx, yazi
        int 21h
        loop tekrar
                          
        int 20h
    main endp
end main    