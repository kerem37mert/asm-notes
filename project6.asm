.model small
.stack 64
.data
    mesaj1 db "Sayi1 gir: ", 24h  
    mesaj2 db "Sayi2 gir: ", 24h
    mesaj3 db "Carpim   : ", 24h   
   
    satir db 12
    sutun db 12
    
    sayi1 dw 0
    sayi2 dw 0
    carpim dw 0 
    
    char db 0
    
        
.code 
    main proc far 
        mov ax, @data
        mov ds, ax
        
        call imleckon  
        
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
        
        ;;;;;;;;;;;;; SAYI 1 GIRILEN YER ;;;;;;;;;;;;;;;;;;;;
        mov satir, 12
        mov sutun, 25
        call imleckon
        
        ; ilk rakam
        mov ah, 0
        int 16h
        mov dl, al
        mov ah, 02h
        int 21h 
        
        ; rakami 10 ile carp ve ax deki sonucu sayi1 e ata
        and al, 0fh
        mov bl, 10
        mul bl
        mov sayi1, ax  
        
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        
        ; ikinci rakam
        mov ah, 0
        int 16h
        mov dl, al
        mov ah, 02h
        int 21h
        
        ; sayi1 deki degerle birler basamagindeki rakam toplanarak sayi elde ediliyor
        and al, 0fh
        mov ah, 0
        add sayi1, ax
        
          
          
        ;;;;;;;;;;;;; SAYI 2 GIRILEN YER ;;;;;;;;;;;;;;;;;;;;
        mov satir, 13
        mov sutun, 25
        call imleckon
        
        ; ilk rakam
        mov ah, 0
        int 16h
        mov dl, al
        mov ah, 02h
        int 21h 
        
        ; rakami 10 ile carp ve ax deki sonucu sayi1 e ata
        and al, 0fh
        mov bl ,10
        mul bl
        mov sayi2, ax  
        
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        
        ; ikinci rakam
        mov ah, 0
        int 16h
        mov dl, al
        mov ah, 02h
        int 21h
        
        ; sayi2 deki degerle birler basamagindeki rakam toplanarak sayi elde ediliyor
        and al, 0fh
        mov ah, 0
        add sayi2, ax 
        
        
        ; CARPMA ISLEMI
        mov ax, sayi1
        mul sayi2       ; DX:AX SONUC VAR
        
        mov bl, 100
        div bl          ; bolum=al , kalan=ah    
        
        add al, 30h 
        push ax         ; ah'i sakla
        
        mov satir, 14
        mov sutun, 25 
        call imleckon
        
        mov dl, al   ; sonucun ilk rakamimi yaz
        mov ah, 02h
        int 21h  
        
        pop ax
        
        mov al, ah
        mov ah, 0
        
        mov bl, 10
        div bl
        
        push ax        
        mov dl, al   ; sonucun 2. rakamimi yaz  
        add dl, 30h
        mov ah, 02h
        int 21h   
        
        pop ax
        mov dl, ah    ;sonucun 3. rakamimi yaz
        add dl, 30h
        mov ah, 02h
        int 21h    
            
        
        
        int 20h
        
    main endp
    
    imleckon proc near  
        mov ah, 02h
        mov bh, 0
        mov dh, satir
        mov dl, sutun
        
        int 10h
        ret
    imleckon endp 
    
    
    yaz proc near
        mov ah, 09h
        int 21h
        ret
    yaz endp    
end main    