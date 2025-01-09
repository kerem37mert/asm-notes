.model small 
.stack 64
.data
    mesaj1 db "Sayi1 giriniz: ", 24h
    mesaj2 db "Sayi2 giriniz: ", 24h
    mesaj3 db "Sonuc:       : ", 24h
    
    sayi1 dw 0
    sayi2 dw 0
    sonuc dw 0    
    
    satir db 0
    sutun db 0
    
.code
    main proc near
        mov ax, @data
        mov ds, ax

        ; sayi 1 gir
        mov dx, offset mesaj1   ; esdegeri = lea dx, mesaj1
        call yaz 
        
        
          
        ; sayi 2 gir
        inc satir
        call imleckon
        mov dx, offset mesaj2 
        call yaz 
        
        
        dec satir
        mov sutun, 25
        call imleckon
        
        ; 1.rakam
        mov ah, 0
        int 16h
        mov dl, al
        mov ah, 02h
        int 21h
        
        and al, 0fh
        mov bl, 10
        mul bl
        mov sayi1, ax   
        
        ; 2.rakam   
        mov ah, 0h
        int 16h
        mov dl, al
        mov ah, 02h
        int 21h
        
        and al, 0fh
        mov ah, 0
        add sayi1, ax
        
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
        
        inc satir 
        mov sutun, 25
        call imleckon      
        
        ; 1.rakam
        mov ah, 0
        int 16h
        mov dl, al
        mov ah, 02h
        int 21h
        
        and al, 0fh
        mov bl, 10
        mul bl
        mov sayi2, ax   
        
        ; 2.rakam   
        mov ah, 0h
        int 16h
        mov dl, al
        mov ah, 02h
        int 21h
        
        and al, 0fh
        mov ah, 0
        add sayi2, ax
        
        mov ax, sayi1
        mul sayi2
        mov sonuc, ax
                  
        
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