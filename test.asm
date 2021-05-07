DATA SEGMENT
     ARRAY DB 1,1,1,1,3
     AVG DB ?
     MSG DB "AVERAGE = $"
ENDS

CODE SEGMENT 
    ASSUME DS:DATA CS:CODE
START:
      MOV AX,DATA
      MOV DS,AX

      LEA SI,ARRAY 
      LEA DX,MSG
      MOV AH,9
      INT 21H

      MOV AX,00
      MOV BL,5

      MOV CX,5 
      LOOP1:
           ADD AL,ARRAY[SI]
           INC SI
      LOOP LOOP1

      DIV BL

      ADD AL,30H

      MOV DL,AL
      MOV AH,2
      INT 21H

      MOV AH,4CH
      INT 21H     
ENDS
END START