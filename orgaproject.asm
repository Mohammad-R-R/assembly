.model small
printmsg macro msg
push ax
push bx
push cx
push dx
LEA dx,msg
mov ah,09h
int 21h
pop dx
pop cx
pop bx
pop ax
endm
.data
  
msg1 db 0ah,0dh," Enter First NUmber:$"
msg2 db 0ah,0dh," Enter Second NUmber:$"
  
msg3 db 0ah,0dh," GCD is:$"
msg4 db 0ah,0dh," LCM is:$"
msg db 0ah,0dh," $"
num dw 0
cnt dw 0
a dw 0
b dw 0   
gcd dw 0

.code
mov ax,@data
mov ds,ax
mov dx,00
printmsg msg1
call readnum
mov ax,num
mov a,ax
printmsg msg2
call readnum
mov bx,num
mov b,bx
cmp ax,bx
jg x1
  
xchg ax,bx
  
  
x1:xor dx,dx
div bx
cmp dx,00
jz x2
xchg ax,bx
xchg bx,dx
jmp x1

x2:
printmsg msg3
mov num,bx
mov gcd,bx
call printnum
xor dx,dx
mov ax,a
mov cx,b
mul cx
mov gcd,bx
div bx
printmsg msg4
mov num,ax
call printnum


  

ex:
mov ah,4ch
int 21h

readnum proc near
push ax
push bx
push cx                              
push dx
mov num,00
r1:
mov ah,01h
int 21h
cmp al,0dh
je r2
mov cx,ax
and cx,00ffh
sub cx,30h
mov bx,10
mov ax,num
mul bx
add ax,cx
mov num,ax
jmp r1
r2:
pop dx
pop cx
pop bx
pop ax
ret
readnum endp

printnum proc near
push ax
push bx
push cx
push dx
mov ax,num
mov bx,10
p1:
mov dx,00
div bx
push dx
inc cnt
cmp ax,00
jne p1
p2:
cmp cnt,00
je p3
pop dx
add dl,30h
mov ah,02h
int 21h
dec cnt
jmp p2
p3:
pop dx
pop cx
pop bx
pop ax

ret
printnum endp
end