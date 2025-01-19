.model small
.stack 64
.data
    mesaj db "kEreM", 24h
.code
    main proc far  
        mov ax, @data
        mov ds, ax
        
        lea si, mesaj
      tekrar:
        mov al, [si]
        cmp al, "$"
        je son  
        cmp al, 61h
        jnb arttir
        add al, 20h
        mov [si], al
                        

      arttir:
        inc si
        jmp tekrar
        
      son:  
      
       lea dx, mesaj
        mov ah, 09h
        int 21h
        int 20h
    main endp
end main    