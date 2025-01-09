; string komutlarini kullanmadan

.model small
.stack 64
.data
    mesaj1 db "String gir       : ", 24h
    mesaj2 db "Bir karakter gir : ", 24h
    mesaj3 db "Karakter sayisi  : ", 24h 
    
    str    db "                   ", 24h
    char   db 0
    charsay db 0  
    
    satir db 0
    sutun db 0
    
.code 
    main proc far     
        mov ax, @data
        mov ds, ax
        
        lea dx, mesaj1
        call yaz
        
        inc satir
        call imleckon
        lea dx, mesaj2
        call yaz
        
        inc satir
        call imleckon
        lea dx, mesaj3 
        call yaz   
        
        ; string gir 
        dec satir
        dec satir
        mov sutun, 20
        call imleckon
        
        lea si, str
      tekrar:
        mov ah, 0
        int 16h
        mov dl, al
        mov ah, 02h
        int 21h
        mov [si], al
        inc si
        cmp al, 13
        jne tekrar 
        
        mov [si], 24h
        
        
        ; karakter gir
        inc satir
        mov sutun, 20
        call imleckon
        
        mov ah, 0
        int 16h 
        mov char, al
        mov dl, al
        mov ah, 02h
        int 21h
        
        ; karakter sayisi bulma
        lea si, [str]
      tekrar2:
        cmp [si], 24h
        je son
        cmp [si], al
        jne sonraki   
        inc charsay
        
      sonraki:
        inc si
        jmp tekrar2 
        
            
      son:
      
        inc satir
        mov sutun, 20 
        call imleckon
        add charsay, 30h
      
        mov dl, charsay
        mov ah, 02h
        int 21h  
        
        int 20h
    main endp   
    
    yaz proc near:
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