; kucuk harfleri buyuk harfe donustur

.model small
.stack 64
.data 
    mesaj db "kerem$" 
    satir db 10
    sutun db 20
.code 
    main proc far      
        mov ax, @data
        mov ds, ax  
         
        call imleckon   
        
        lea dx, mesaj
        call yaz  
        
        inc satir
        call imleckon
     
        lea si, mesaj  
      tekrar:
        mov dl, [si] 
        sub dl, 32
        
        call charyaz
        inc si
        cmp [si], "$"
        jne tekrar
        
        
        
        int 20h
    main endp    
                
                
    yaz proc near    
        mov ah, 09h
        int 21h
        
        ret
    yaz endp
    
    
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
    
end main    