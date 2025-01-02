.model small
.stack 64
.data
    sayi1 dd 0123bc62h
    sayi2 dd 0012553ah
    sonuc dd 0
.code 
    main proc far  
        mov ax, @data
        mov ds, ax     
        
        lea si, sayi1
        lea di, sayi2
        lea bx, sonuc
        
        clc ; eldeyi sifirla
        mov cx, 2
      tekrar:
        mov ax, [si]
        adc ax, [di]
        mov [bx], ax
        
        inc si
        inc si
        inc di
        inc di
        inc bx
        inc bx
        
        loop tekrar  
        
        int 20h
    main endp
end main    