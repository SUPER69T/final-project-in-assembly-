; Leon Subbotsky - 323862524, Bar Cohen - 324268309.
data segment
        ; ORG 100H ;for what we need this?####################3
        start_loop_msg db 'Please choose one of the following options: ', 13, 10, '1. Prime number checker', 13, 10, '2. . Caesars shift coder', 13, 10, '3. Exit', 13, 10, '$'
        wrong_start_msg db 13, 10, 'Invalid input...', 13, 10, '$'

        proc_1_msg db 13, 10, 'Enter a positive integer number N (255>N>2):', 13, 10, '$'
        proc_2_msg db 13, 10, 'Enter one decimal digit (between 2 to 9):', 13, 10, '$'

        Number dw ? ; To save the number we converted from HEX to BASE 10
        wrong_input1_msg db 13, 10, 'The number has to be greater than 2 and smaller than 255...', 13, 10, '$'
        caeser_shift_msg db 13, 10, 'Type a string (only small characters in English):', 13, 10, '$'
        caeser_offset_msg db 13, 10, ' Enter one decimal digit (between 2 to 9):', 13, 10, '$'


        String1 db 101, ?, 101 dup('$') ; Buffer for 100 chars + Carriage Return, initialized to DOS's - '$' delimiter.


        ; Number of type word, and using the pointer: [Number]
        result1 db 'prime', 13, 10, '$'
        result2 db 'not prime', 13, 10, '$'
        result db 13, 10, 'Your result is: $'

        shift_offset db 0 ; to save the offset for the caeser shift

data ends

code segment
        assume cs:code,ds:data
main: 
        ; Initialize Segment
        mov ax, seg data
        mov ds, ax

        ; taking and checking the start input in a loop:
        start_input_evaluation:

                ; Printing start_loop_msg:
                mov dx, offset start_loop_msg   ; 1. Point DX to the memory address of the message
                mov ah,9
                int 21H


                mov ah,01H                       ; 2. Tell DOS we want to use the "Print String" function
                int 21h                         ; 3. Trigger the DOS interrupt to execute that function



                ; call Ascii2DecInput             ; taking input.
                
                ; cmp ax, '1'                       ; relooping if ax < 1
                ; jb failed_start_eval

                ; cmp ax, '3'                       ; relooping if ax < N
                ; ja failed_start_eval




                cmp ax,'1'
                je input1evaluation

                cmp ax,'2'
                  je input2evaluation

                cmp ax,'3'
                  je quit_program

                jmp failed_start_eval



                ; taking and checking 'Number' in a loop:
                input1evaluation:

                        ; Printing message1:
                        mov dx, offset  proc_1_msg  ; 1. Point DX to the memory address of the message
                        mov ah, 9                       ; 2. Tell DOS we want to use the "Print String" function
                        int 21h                         ; 3. Trigger the DOS interrupt to execute that function

                        call Ascii2DecInput             ; taking input.
                        mov [Number], AX                ; Save the number we got from the proc Ascli2DecInput so AX will be free.
                        cmp ax, 3                       ; relooping if N < 3
                        jb failed_eval1

                        cmp ax, 254                     ; relooping if 254 < N
                        ja failed_eval1
                        jmp valid
                        


                        failed_eval1:
                        mov dx, offset wrong_input1_msg   
                        mov ah, 9                       
                        int 21h
                        jmp input1evaluation
        
                        ; push ax
                        valid:                             ; Pushing the first Ascii2DecInput's output (AX) to the stack
                        call check_for_prime
                        cmp al,1
                        je Triangle

                        Square:
                        call Print_Square
                        jmp start_input_evaluation

                        Triangle: 
                                call Print_Triangle
                                jmp start_input_evaluation


                input2evaluation:
                        mov dx , offset caeser_shift_msg ;print message to ask for string input
                        mov ah, 9
                        int 21h
                        
                        mov di,offset String1 ;pointer for the string input, we will save the string in String1
                read_string:
                        mov ah, 01h
                        int 21h
                        cmp al,'.' ;the request is to finish the input with '.'.
                        je end_read_string ; if its '.' we finish to read

                        mov [di],al ; save the char we got in the string buffer
                        inc di ; move the pointer to the next char in the string buffer
                        jmp read_string ; if its not '.' we keep reading chars and saving them in the string buffer

                end_read_string:
                       mov byte ptr [di], '$' ; End the string with a '$' for DOS printing
                       mov dx, offset caeser_offset_msg ;print message to ask for offset input
                       mov ah, 9
                       int 21h

                       mov ah, 01h ; read the offset input
                       int 21h
                       sub al, 30h ; convert from ASCII to number
                       mov [shift_offset], al ; save the offset for the caeser shift in shift_offset
                       ; Now we have the string in String1 and the offset in shift_offset, we can perform the Caesar shift:
                
                       call Caesar_shift ; perform the Caesar shift, the result will be saved in String2
                       mov dx, offset String2 ; print the shifted string
                       mov ah, 9
                       int 21h

                       jmp start_input_evaluation 


                quit_program:
                        mov ah,4cH  
                        int 21H
               





        failed_start_eval:
                mov dx, offset wrong_start_msg   
                mov ah, 9                       
                int 21h
                jmp start_input_evaluation

        ; Exit to DOS
        mov ah, 4c00h                
        int 21h     


        check_for_prime PROC 
               mov cx, [Number]
               SHR cx, 1 ; we only need to check for divisors up to N/2, so we divide cx by 2.
        
               start_loop:
                cmp cx,1
                jbe prime 
                
                mov ax, [Number]
                mov dx,0 ;dx will hold the reminder
                div cx

                cmp dx,0
                jbe not_prime
                
                loop start_loop
                prime:
                     mov dx,offset result1
                     mov ah,9
                     int 21h
                     mov al,1   
                     ret   
                not_prime:
                     mov dx,offset result2
                     mov ah,9
                     int 21h   
                     mov al,0
                     ret  
        check_for_prime ENDP


        ; printing a right-angled Isosceles triangle (of length-N):
        Print_Triangle PROC
                ; ---example---:
                ;            outter: cx = 5
                ;@           outter: cx = 5, inner: cx = 1
                ;@@          outter: cx = 4, inner: cx = 2
                ;@@@         outter: cx = 3, inner: cx = 3
                ;@@@@        outter: cx = 2, inner: cx = 4
                ;@@@@@       outter: cx = 1, inner: cx = 5
                ; outter: cx = 0
                
                XOR cx, cx                                      ; initiating the iterator to 1 (runs from 1 to Number).
                
                print_line:
                        push cx
                        ; ---printing a word of size CX (0 < CX <= Number)---:
                        inner_loop:
                                MOV AH, 02h       
                                MOV DL, '@'       
                                INT 21h 

                                ; inner loop's condition:
                                cmp cx, 0                               ; breaking when CX=0
                                jne inner_loop
                        ; -----
                        pop cx

                        ; ---printing a newline---:
                        MOV AH, 02h       
                        MOV DL, 0Dh       ; 0Dh=CR (carriage return)
                        INT 21h           

                        MOV AH, 02h       
                        MOV DL, 0Ah       ; 0Ah=LF (line feed)
                        INT 21h          
                        ; -----
                
                ; outter loop's condition:
                condition: 
                        inc cx                                  ; CX+=1
                        cmp cx, [Number]                                       
                        jne print_line                          ; Continue looping if cx!=triangle_string_buffer, otherwise return.
                
                end_loop:
                        ret
                
        Print_Triangle ENDP


        ; print a square (of length-N):  
        Print_Square PROC
                mov di, [Number]                                ; DI acts as our outter-loop's iterator =>
                ; this avoids excessive use of push/pop operations on the CX register. 

                print_line:
                        ; checking for end of outter-loop:
                        cmp di, 0               
                        je end_loop                             ; Exit the loop if DI == 0.

                        ; ---printing a word of size CX (CX = Number)---:
                        mov ah, 40h                             
                        mov bx, 1      
                        mov cx, [Number]                        ; cx = Number.                                              
                        mov dx, offset square_string_buffer   
                        int 21h 
                        ; -----

                        ; ---printing a newline---:
                        mov ah, 40h                             
                        mov bx, 1                               
                        mov cx, 2                               
                        mov dx, offset newline                  
                        int 21h
                        ; -----

                        dec di                                            
                        jmp print_line                          
                
                end_loop:
                        ret

        Print_Square ENDP

        Caesar_shift PROC
                

                mov si, offset String1 ; SI points to the current char in String1
                mov di, offset String2 ; DI points to the current char in String2

                shift_loop:
                        mov al, [si] ; Get the current char from String1
                        cmp al, '$'  ; Check if it's the end of the string
                        je end_shift_loop ; If it is, we are done

                        ; Check if the character is a lowercase letter (between 'a' and 'z')
                        cmp al, 'a'
                        jb store_char ; If it's less than 'a', we won't shift it, just store it as is
                        cmp al, 'z'
                        ja store_char ; If it's greater than 'z', we won't shift it, just store it as is

                        add al, [shift_offset] ; Shift the character by the offset
                        cmp al, 'z'
                        jbe store_char ; If the shifted character is still a lowercase letter, store it
                        sub al, 26 ; If it goes past 'z', wrap around to the beginning

                store_char:
                        mov [di], al ; Store the character in String2
                        inc di ; Increment the DI pointer to the next position in String2
                        inc si ; Move to the next char in String1
                        jmp shift_loop ; Repeat the loop for the next character


                end_shift_loop:
                        mov byte ptr [di], '$' ; End the shifted string with a '$' for DOS printing
                        ret

        Caesar_shift ENDP
        ; IO conversion procedures:
        Ascii2DecInput PROC
                ; Gathering input 
                mov si, 0       ; Save the sum
                mov bx, 10      ; for multiplication

                read_loop:
                        mov ah,01H
                        int 21H
                        cmp al,'.' ;the request is to finish the input with .
                        je end_loop ; if its '.' we finish to read

                        sub al,30h ;with we got '5' we convert it to the number 5 with sub 30H in ascii
                        mov cl,al ; save the number we got (not the char)
                        mov ch,0 ; we dont want to take trash from CH so we clear it

                        mov ax,si ;copy the number we got from si to ax
                        mul bx  ;mul ax=bx*ax
                        add ax,cx ;add ax=(ax*bx)+cx
                        mov si,ax ; si=(ax*bx)+cx
                        
                        jmp read_loop           
        

        
                end_loop:
                        mov ax,si       
                        ret
        Ascii2DecInput ENDP








        ; Ascii2DecInput PROC
        ;         mov ah, 0Ah
        ;         mov dx, offset Number
        ;         int 21h

        ;         ; Conversion Setup 
        ;         lea si, [Number] + 2       ; SI points to first typed char
        ;         mov cl, [Number + 1]     ; CX = number of chars typed
        ;         mov ch, 0
        ;         mov ax, 0                ; AX will hold our final number
        ;         mov bx, 10               ; Multiplier

        ;         jcxz end_convert         ; (Jump to end) if CX is 0 else (continue)        

        ; convert_loop:
        ;         mov dx, 0                ; Clear DX for multiplication
        ;         mul bx                   ; AX = AX * 10
                
        ;         mov dl, [si]             ; Get next ASCII char
        ;         sub dl, 30h              ; Convert to digit
        ;         add ax, dx               ; Add digit to total
                
        ;         inc si                   ; Move to next char
        ;         loop convert_loop
        ; end_convert:
        ;         ret
        ; Ascii2DecInput ENDP



        ; Dec2AsciiOutput PROC
        ;         ; This is a basic routine to print AX as a decimal number
        ;         mov cx, 0       ; Count digits
        ;         mov bx, 10      ; Divider

        ; divide_loop:
        ;         mov dx, 0       ; Zeroing dx (the previous iteration's remainer)
        ;         div bx          ; AX / 10, Remainder in DX
        ;         push dx         ; Push the digit (remainder) onto the stack
        ;         inc cx          ; Increment digit count
        ;         test ax, ax     ; Is AX 0?
        ;         jnz divide_loop ; If (AX!=0) keep looping, else continue

        ; print_loop:
        ;         pop dx          ; Pop the last digit saved on the stack 
        ;         add dl, 30h     ; Convert to ASCII
        ;         mov ah, 02h     ; DOS print character function
        ;         int 21h
        ;         loop print_loop
        ;         ret
        ; Dec2AsciiOutput ENDP
        
code ends
end main