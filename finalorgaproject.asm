.model small

.data
  
message1 db 0ah,0dh," enter 1st #:$"
message2 db 0ah,0dh," enter 2nd #:$"
  
message3 db 0ah,0dh," GCD :$"
message4 db 0ah,0dh," LCM :$"
message5 db 0ah,0dh," the fraction is:$"
message6 db         " /$"   
message7 db 0ah,0dh," invalid number$"
message8 db 0ah,0dh," give fraction example $"
message9 db          " / $"
message10 db         " + $"
message11 db         " / $"  

message12 db 0ah,0dh," GCD2 :$" 
message13 db 0ah,0dh," LCM2 :$"
message14 db 0ah,0dh," the result :$"
 
limit dw 0

value dw 0
count dw 0

x dw 0
y dw 0   
gcd dw 0
value2 dw 0

a dw 0
b dw 0
c dw 0
d dw 0
e dw 0
f dw 0 

gcd2 dw 0

.code
mov ax,@data
mov ds,ax
mov dx,00 



push dx
LEA dx,message1
mov ah,09h
int 21h
pop dx
   
                             
push dx


mov value,00
mov bx,0
mov dx,0

   
MOV AH,01H
INT 21H
SUB AL,30H
MOV BH,AL
MOV AL,100
MUL BH
MOV AH,00
ADD value,AX

MOV AH,01H
INT 21H
SUB AL,30H
MOV BH,AL
MOV AL,10
MUL BH
MOV AH,00
ADD value,AX

MOV AH,01H
INT 21H
SUB AL,30H
MOV BL,AL
MOV BH,00
ADD value,BX

pop dx
pop cx
pop bx
pop ax
                      

mov ax,value
mov x,ax
push ax
push bx
push cx
push dx


 



LEA dx,message2
mov ah,09h
int 21h
pop dx
pop cx
pop bx
pop ax 

push ax
push bx
push cx                              
push dx

mov value,00
mov bx,0
mov dx,0
   
MOV AH,01H
INT 21H
SUB AL,30H
MOV BH,AL
MOV AL,100
MUL BH
MOV AH,00
ADD value,AX

MOV AH,01H
INT 21H
SUB AL,30H
MOV BH,AL
MOV AL,10
MUL BH
MOV AH,00
ADD value,AX

MOV AH,01H
INT 21H
SUB AL,30H
MOV BL,AL
MOV BH,00
ADD value,BX
pop dx
pop cx
pop bx
pop ax

mov bx,value
mov y,bx
cmp ax,bx
jg label1
 
 
 
  
xchg ax,bx
           

  
label1:xor dx,dx
div bx
cmp dx,00
jz label2
xchg ax,bx
xchg bx,dx
jmp label1

label2:
push ax

push dx
LEA dx,message3
mov ah,09h
int 21h
pop dx
pop ax
mov value,bx
mov gcd,bx
push ax
push bx
push cx
push dx
mov ax,value
mov bx,10
process1:
mov dx,00
div bx
push dx
inc count
cmp ax,00
jne process1
process2:
cmp count,00
je process3
pop dx
add dl,30h
mov ah,02h
int 21h
dec count
jmp process2
process3:
pop dx
pop cx
pop bx
pop ax
xor dx,dx
mov ax,x
mov cx,y
mul cx
mov gcd,bx
div bx
push ax
;-----------------------------LCM-------------------
push dx
LEA dx,message4
mov ah,09h
int 21h
pop dx
pop ax
mov value,ax
push ax
push bx
push cx
push dx
mov ax,value
mov bx,10
process4:
mov dx,00
div bx
push dx
inc count
cmp ax,00
jne process4
process5:
cmp count,00
je process9
pop dx
add dl,30h
mov ah,02h
int 21h
dec count
jmp process5
; ---------------------------- Fraction x
 process9:

LEA dx,message5
mov ah,09h
int 21h
pop dx
pop ax

push ax
push bx
push cx
push dx
mov ax,x
mov bx,gcd 
div bx
 call portm
 pro: 
 push ax
push bx
push cx
push dx
LEA dx,message6
mov ah,09h
int 21h
pop dx
pop cx
pop bx
pop ax 
mov ax,y
mov bx,gcd 
div bx
  call portm2
mov ax,x
mov bx,y
div y


mov ax ,00
mov bx,00
mov dx,00
mov cx,00   
pros:      
 ;--------------------------------fraction things      
 push dx
LEA dx,message8
mov ah,09h
int 21h
pop dx                             
push dx

;---------------------------num1
mov value2,00
mov bx,0
mov dx,0

   
MOV AH,01H
INT 21H
SUB AL,30H
MOV BH,AL
MOV AL,100
MUL BH
MOV AH,00
ADD value2,AX

MOV AH,01H
INT 21H
SUB AL,30H
MOV BH,AL
MOV AL,10
MUL BH
MOV AH,00
ADD value2,AX

MOV AH,01H
INT 21H
SUB AL,30H
MOV BL,AL
MOV BH,00
ADD value2,BX

pop dx
pop cx
pop bx
pop ax
                      

mov ax,value2
mov a,ax
push ax
push bx
push cx
push dx     
      
push dx
LEA dx,message9
mov ah,09h
int 21h
pop dx                             
push d

mov value2,00
mov bx,0
mov dx,0

;---------------------------- num2   
MOV AH,01H
INT 21H
SUB AL,30H
MOV BH,AL
MOV AL,100
MUL BH
MOV AH,00
ADD value2,AX

MOV AH,01H
INT 21H
SUB AL,30H
MOV BH,AL
MOV AL,10
MUL BH
MOV AH,00
ADD value2,AX

MOV AH,01H
INT 21H
SUB AL,30H
MOV BL,AL
MOV BH,00
ADD value2,BX

pop dx
pop cx
pop bx
pop ax
                      

mov ax,value2
mov b,ax
push ax
push bx
push cx
push dx      
 
 
 push dx
LEA dx,message10
mov ah,09h
int 21h
pop dx                             
push dx

;______________________________________num3
MOV AH,01H
INT 21H
SUB AL,30H
MOV BH,AL
MOV AL,100
MUL BH
MOV AH,00
ADD value2,AX

MOV AH,01H
INT 21H
SUB AL,30H
MOV BH,AL
MOV AL,10
MUL BH
MOV AH,00
ADD value2,AX

MOV AH,01H
INT 21H
SUB AL,30H
MOV BL,AL
MOV BH,00
ADD value2,BX

pop dx
pop cx
pop bx
pop ax
                      

mov ax,value2
mov c,ax
push ax
push bx
push cx
push dx    


;_-----------------------

 push dx
LEA dx,message11
mov ah,09h
int 21h
pop dx                             
push dx 
;---------------------------------num4
 MOV AH,01H
INT 21H
SUB AL,30H
MOV BH,AL
MOV AL,100
MUL BH
MOV AH,00
ADD value2,AX

MOV AH,01H
INT 21H
SUB AL,30H
MOV BH,AL
MOV AL,10
MUL BH
MOV AH,00
ADD value2,AX

MOV AH,01H
INT 21H
SUB AL,30H
MOV BL,AL
MOV BH,00
ADD value2,BX

pop dx
pop cx
pop bx
pop ax
                      

mov ax,value2
mov d,ax
push ax
push bx
push cx
push dx 
mov bx,value2
mov d,bx
cmp ax,bx
jg label11
;-------------------------------------------------gcd2

label11:xor dx,dx
div bx
cmp dx,00
jz label12
xchg ax,bx
xchg bx,dx
jmp label11

label12:
push ax

push dx
LEA dx,message12
mov ah,09h
int 21h
pop dx
pop ax
mov value2,bx
mov gcd2,bx
push ax
push bx
push cx
push dx
mov ax,value2
mov bx,10
core1:
mov dx,00
div bx
push dx
inc count
cmp ax,00
jne core1
core2:
cmp count,00
je core3
pop dx
add dl,30h
mov ah,02h
int 21h
dec count
jmp core2
core3:
pop dx
pop cx
pop bx
pop ax
xor dx,dx
mov ax,b
mov cx,d
mul cx
mov gcd2,bx
div bx
push ax



;-------------------------------------------------lcm2
push dx
LEA dx,message13
mov ah,09h
int 21h
pop dx
pop ax
mov value2,ax
push ax
push bx
push cx
push dx
mov ax,value2
mov bx,10  

process14:
mov dx,00
div bx
push dx
inc count
cmp ax,00
jne process14 

process15:
cmp count,00
je process19
pop dx
add dl,30h
mov ah,02h
int 21h
dec count
jmp process15

process19:
pop dx
pop cx
pop bx
pop ax
;___________________________mul Numerators and denominators with lcm2
 mov ax,a
 mul dx  
 
  mov ax,b
 mul dx   
 
  mov ax,c 
 mul dx 
 
  mov ax,d
 mul dx
 ;--------------------------------------- add Numerators 
 
 mov ax,c
 mov dx ,b
   add ax,dx
   
LEA dx,message14
mov ah,09h
int 21h
pop dx
pop ax

push ax
push bx
push cx
push dx
mov ax,b
mov bx,d 
add bx,ax
 call portm
 promax: 
 push ax
push bx
push cx
push dx
LEA dx,message6
mov ah,09h
int 21h
pop dx
pop cx
pop bx
pop ax 
mov ax,y

  call portm2
mov ax,a
mov bx,b
add ax,bx


mov ax ,00
mov bx,00
mov dx,00
mov cx,00   

are3:
pop dx
pop cx
pop bx
pop ax

 .exit
 
portm proc 
     process7:
mov dx,00
div bx
push dx
inc count
cmp ax,00
jne process7
process8:
cmp count,00
je process6
pop dx
pop ax
add dl,30h
mov ah,02h
int 21h
dec count
jmp process8  

   



process6:
pop dx
pop cx
pop bx
pop ax   
   jmp pro
 
portm2 proc 
     process13:
mov dx,00
div bx
push dx
inc count
cmp ax,00
jne process13
process10:
cmp count,00
je process11
pop dx
pop ax
add dl,30h
mov ah,02h
int 21h
dec count
jmp process10  

   



process11:
pop dx
pop cx
pop bx
pop ax

 jmp pros


end