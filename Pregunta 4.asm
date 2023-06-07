.model small
.stack 100h

.data
num db ?
fact dw 1

.code
main proc
mov ax, @data
mov ds, ax

mov ah, 01h 
int 21h 
sub al, 30h 
mov bl, al 

mov cx, 1 
loop1:
cmp cx, bl 
jg done 
mov ax, cx 
mul fact
mov fact, ax
inc cx 
jmp loop1 

done:
mov ah, 09h 
mov dx, offset mensaje
int 21h

mov ax, fact 
call imprimir_ax

mov ah, 4ch 
int 21h

imprimir_ax proc
push bx 
push cx 
push dx 

mov cx, 4 
mov bx, 10 
mov dx, 0 
loop2:
xor dx, dx 
div bx 
add dl, 30h 
push dx 
dec cx 
cmp ax, 0 
jne loop2 

imprimir:
pop dx 
mov ah, 02h 
int 21h
loop imprimir 

pop dx 
pop cx 
pop bx 
ret 

mensaje db 'El factorial es: $'

end main

