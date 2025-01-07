.model small
.stack 64
.data
    text1 db "kerem", 24h
    text2 db "kerem", 24h
    msg1 db "esit", 24h
    msg2 db "esit degil", 24h   
    satir db 0
    sutun db 0
.code 
    main proc far 
        mov ax, @data
        mov ds, ax
        mov es, ax 
        
        lea dx, text1
        call yaz
        
        inc satir
        call imleckon
       
        lea dx, text2
        call yaz
        
        inc satir    
        inc satir
        call imleckon
        
        lea si, text1
        lea di, text2  
        
        
        cld 
        mov cx, 5
        repe cmpsb
        jne esitdegil
        lea dx, msg1
        call yaz 
        jmp son
        
      esitdegil:
        lea dx, msg2
        call yaz
           
        
      son:
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