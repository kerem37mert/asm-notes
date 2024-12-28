.model small
.stack 64
.data                                
    mesaj        db "isminizi giriniz $"   
    girilenmesaj db "                 $"
    satir db 0
    sutun db 0 
.code
    main proc far
        
        mov ax, @data
        mov ds, ax
           
    
        lea dx, mesaj
        call yaz 
        
        mov satir, 1
        mov sutun, 0
        call imleckon  
        
        lea si, girilenmesaj
      tekrar:          
        call klavyegir
        
   
        mov [si], al
        inc si
        cmp al, 13
        jne tekrar
        mov [si], "$"
        
        mov satir, 5
        mov sutun, 0
        call imleckon
        
       
        lea dx, girilenmesaj  
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
    
    
    klavyegir proc near 
        mov ah, 0
        int 16h    
        
        mov ah, 02h  ; girilen karakteri goster 
        mov dl, al     
        int 21h 
        ret
    klavyegir endp    
end main    