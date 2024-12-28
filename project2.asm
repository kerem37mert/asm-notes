.model small
.stack 64
.data
    mesaj db "kerem$"
    satir db 0
    sutun db 0
.code 
    main proc far
        mov ax, @data
        mov ds, ax
                 
        call ekransil         
        call imleckon
        
        lea si, mesaj
      tekrar:
        mov dx, [si]
        call charyaz
        inc satir
        call imleckon 
        inc si
        cmp [si], "$"
        jne tekrar   
        
        int 20h
    main endp 
    
    
    charyaz proc near  
        mov ah, 02h
        int 21h
        ret
    charyaz endp
                 
                 
    imleckon proc near
        mov ah, 02h
        mov bh, 0
        mov dh, satir
        mov dl, sutun
        int 10h        
        
        ret
    imleckon endp
    
    
    ekransil proc near 
        mov ax, 0600h
        mov bh, 24h
        mov cx, 0000h
        mov dx, 7480h
        int 10h
        
        ret
    ekransil endp    
    
end main           