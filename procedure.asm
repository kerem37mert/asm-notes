.model small
.stack 64 
.data 
    message  db "Hello World!", 0ah, 0dh, 24h
    message2 db "Hello Assembly!", 0ah, 0dh, 24h
.code 
    main proc far
        mov ax, @data
        mov ds, ax 
        
        call changeColor
        
        lea dx, message
        call write     
        
        lea dx, message2
        call write
        
        int 20h    
    main endp
                                                          
    write proc near   
        mov ah, 09h  
        int 21h
        ret
    write endp
    
    changeColor proc near
        mov ax, 0600h
        mov bh, 2fh
        mov cx, 0000h
        mov dx, 184fh
        int 10h
        ret    
    changeColor endp
end main            