.model small
.stack 64
.data
    sayi1 dd 0123bc62h
    sayi2 dd 0012553ah
    sonuc dd 0
.code 
    main proc far  
        mov al, @data
        mov ds, ax     
        
        lea si, sayi1
        lea di, sayi2
        lea bx, sonuc
        
        clc ; eldeyi sifirla
        mov cx, 4
      tekrar:
        mov al, [si]
        adc al, [di]
        mov [bx], al
        
        inc si
        ;inc si
        inc di
        ;inc di
        inc bx
        ;inc bx
        
        loop tekrar  
        
        int 20h
    main endp
end main    