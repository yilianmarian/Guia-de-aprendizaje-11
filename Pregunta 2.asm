
.model small
.stack 100h

.data
num1 dw ?
num2 dw ?
msg1 db 'Ingrese el primer numero: $'
msg2 db 'Ingrese el segundo numero: $'
msg3 db 'El mayor es: $'
newline db 10, 13, '$'

.code
main proc
mov ax, @data
mov ds, ax

lea dx, msg1
mov ah, 9
int 21h

call leer_numero
mov num1, ax

lea dx, msg2
mov ah, 9
int 21h

call leer_numero
mov num2, ax

mov ax, num1
mov bx, num2
cmp ax, bx
jge mayor1
mayor2:
mov ax, num1
jmp mostrar
mayor1:
mov ax, num2
mostrar:
lea dx, msg3
mov ah, 9
int 21h

mov cx, ax
mov ah, 2
mov dl, '0'
div dl
add al, 48
mov dl, al
int 21h

mov dl, newline
mov ah, 2
int 21h

mov ah, 4ch
int 21h
main endp

leer_numero proc
push ax
push bx
push cx
push dx

xor ax, ax
xor bx, bx
xor cx, cx
xor dx, dx

lea dx, newline
mov ah, 9
int 21h

mov ah, 1
int 21h
sub al, 30h
mov bl, al

mov ah, 1
int 21h
sub al, 30h
mov cl, al

mov ah, 1
int 21h
sub al, 30h
mov dl, al

mov ah, 1
int 21h
sub al, 30h
mov ch, al

shl bx, 8
mov bl, cl
shl bx, 8
mov bl, dl
shl bx, 8
mov bl, ch

pop dx
pop cx
pop bx
pop ax
ret
leer_numero endp

end main

