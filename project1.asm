;
;
;

.model small
.stack 64
.data
    mesaj1       db "bir cumle giriniz       :", 24h 
    mesaj2       db "Aranan karakteri griniz :", 24h
    mesaj3       db "Aranan karakter sayisi  :", 24h 
    satir        db 12
    sutun        db 12
    girilenCumle db "                                " 
    girilenChar  db 0 
    chrSay       db 0
    
.code
    main proc far
        mov ax, @data
        mov ds, ax 
        
        call ekrsil   
         
        mov satir, 12
        mov sutun, 12
        call imlecKon
        lea dx, mesaj1
        call yaz
        
        mov satir, 13
        mov sutun, 12
        call imlecKon
        lea dx, mesaj2
        call yaz
                                        
        mov satir, 14
        mov sutun, 12
        call imlecKon
        lea dx, mesaj3
        call yaz     
        ;---------------------------- 
        call klavyeGir    ; klavyeden cumle gir
        ;----------------------------
        mov satir, 13
        mov sutun, 40
        call imlecKon     ; klavyeden tusa bas
        
        mov ah, 0
        int 16h
                
        mov girilenChar, al   ; sakla     
        mov ah, 02h           ; ekrana yaz
        mov dl, al
        int 21h     
        
        ; bu girilen karakteri arayip kac tane oldugunu bul   
        lea si, girilenCumle  
        mov al, girilenChar 
     say: 
        cmp [si], "$" 
        je son 
        cmp [si], al
        jne sonraki
        inc chrSay        
     sonraki:   
        inc si
        loop say   
     son:
        mov satir, 14
        mov sutun, 40
        call imlecKon
                 
        add chrSay, 30h
        mov dl, chrSay
        mov ah, 02h   
        int 21h
                  
        int 20h
    main endp  
                
                
    yaz proc near
        mov ah, 09h 
        int 21h
        ret
    yaz endp 
    
    
    klavyeGir proc near         
        mov satir, 12
        mov sutun, 38
        call imlecKon
        
        lea si, girilenCumle
        
      tekrar:  
        mov ah, 0
        int 16h    
        
        mov ah, 02h  ; girilen karakteri goster 
        mov dl, al     
        int 21h
        
        
        mov [si], al
        inc si         
        cmp al, 13
        jne tekrar  
        mov [si-1], "$"    
        
        mov satir, 20
        mov sutun, 40
        call imlecKon
        lea dx, girilenCumle
        call yaz 
                  
        ret
    klavyeGir endp    
    
    
    ekrsil proc near
        mov ax, 0600h
        mov bh, 0f4h
        mov cx, 0000h
        mov dx, 184fh
        int 10h 
        ret 
    ekrsil endp 
    
                    
    imleckon proc near  
        mov ah, 02h
        mov bh, 0
        mov dh, satir
        mov dl, sutun
        int 10h
        ret
    imlecKon endp                    
                    
    
end main    