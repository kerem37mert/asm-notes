.model small
.stack 64
.data
    myName db "kerem mert$"
    newLine db 0ah, 24h
.code
    main proc far
        mov ax, @data
        mov ds, ax 
        
        call changeColor  
        
        mov cx, 10
        lea si, myName
    tekrar:    
        mov dl, [si]
        call writeChar
        inc si
        lea dx, newLine
        call write
        loop tekrar
        
        int 20h    
    main endp
    
    writeChar proc near
        mov ah, 02h
        int 21h
        ret
    writeChar endp
    
    write proc near
        mov ah, 09h
        int 21h
        ret    
    write endp
    
    changeColor proc near
        mov ax, 0600h
        mov bh, 24h
        mov cx, 0000h
        mov dx, 184fh
        int 10h
        ret
    changeColor endp    
end main      