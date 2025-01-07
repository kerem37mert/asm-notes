.model small 
.stack 64
.data
    message1 db "java$"
    message2 db "    $"   
    
    satir db 0
    sutun db 0
.code
    main proc far
        mov ax, @data
        mov ds, ax 
        mov es, ax
        
        lea dx, message1
        call yaz
        
        lea si, message1
        lea di, message2
        
        cld
        mov cx, 4
        rep movsb 
        
        mov satir, 5
        call imleckon
        
        lea dx, message2
        call yaz
        
        
        int 20h
    main endp
    
    yaz proc near
        mov ah, 09h
        int 21h
        ret
    yaz endp 
    
    imleckon proc near 
        mov ah, 02h
        mov bh, 0
        mov dh, satir
        mov dl, sutun
        
        int 10h
        ret
    imleckon endp    
end main    