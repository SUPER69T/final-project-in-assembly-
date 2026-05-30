; Leon Subbotsky - 323862524, Bar Cohen - 324268309.
data segment
        start_loop_msg db 'Please choose one of the following options: ', 13, 10, '1. Prime number checker', 13, 10, '2. . Caesars shift coder', 13, 10, '3. Exit', 13, 10, '$'
        wrong_start_msg db 13, 10, 'Invalid input...', 13, 10, '$'

        proc_1_msg db 13, 10, 'Enter a positive integer number N (255>N>2):', 13, 10, '$'
        proc_2_msg db 13, 10, 'Enter one decimal digit (between 2 to 9):', 13, 10, '$'

        Number db 4, ?, 4 dup('$') ; Buffer for 3 digits + Carriage Return
        wrong_input1_msg db 13, 10, 'The number has to be greater than 2 and smaller than 255...', 13, 10, '$'

        ORG 100H
        String1 db 101, ?, 101 dup('$') ; Buffer for 100 chars + Carriage Return, initialized to DOS's - '$' delimiter.


        ; Number of type word, and using the pointer: [Number]
        result1 db 'prime', 13, 10, '$'
        result2 db 'not prime', 13, 10, '$'

        result db 13, 10, 'Your result is: $'
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
                mov ah, 9                       ; 2. Tell DOS we want to use the "Print String" function
                int 21h                         ; 3. Trigger the DOS interrupt to execute that function

                call Ascii2DecInput             ; taking input.
                
                cmp ax, 1                       ; relooping if ax < 1
                jb failed_start_eval

                cmp ax, 3                       ; relooping if ax < N
                ja failed_start_eval

                
            


                        ; taking and checking 'Number' in a loop:
                        input1evaluation:

                            ; Printing message1:
                            mov dx, offset start_loop_msg   ; 1. Point DX to the memory address of the message
                            mov ah, 9                       ; 2. Tell DOS we want to use the "Print String" function
                            int 21h                         ; 3. Trigger the DOS interrupt to execute that function

                            call Ascii2DecInput             ; taking input.
                            
                            cmp ax, 3                       ; relooping if N < 3
                            jb failed_eval1

                            cmp ax, 254                     ; relooping if 254 < N
                            jb failed_eval1

                            failed_eval1:
                                mov dx, offset wrong_input1_msg   
                                mov ah, 9                       
                                int 21h
                                loop input1evaluation
                
                            ; push ax                             ; Pushing the first Ascii2DecInput's output (AX) to the stack



                ;            outter: cx = 5
                ;@           outter: cx = 5, inner: cx = 1
                ;@@          outter: cx = 4, inner: cx = 2
                ;@@@         outter: cx = 3, inner: cx = 3
                ;@@@@        outter: cx = 2, inner: cx = 4
                ;@@@@@       outter: cx = 1, inner: cx = 5
                ; outter: cx = 0





        failed_start_eval:
                mov dx, offset wrong_start_msg   
                mov ah, 9                       
                int 21h
                loop start_input_evaluation

        ; Exit to DOS
        mov ax,4c00h                
        int 21h     


        ; printing a right-angled Isosceles triangle (of length-N):
        Print_Triangle PROC
                mov cx, [Number]



        ; print a square (of length-N):  
        Print_Square PROC
                mov cx, [Number]



        ; IO conversion procedures:
        Ascii2DecInput PROC
                ; Gathering input 
                mov ah, 0Ah
                mov dx, offset buffer
                int 21h

                ; Conversion Setup 
                lea si, buffer + 2       ; SI points to first typed char
                mov cl, [buffer + 1]     ; CX = number of chars typed
                mov ch, 0
                mov ax, 0                ; AX will hold our final number
                mov bx, 10               ; Multiplier

                jcxz end_convert         ; (Jump to end) if CX is 0 else (continue)        

        convert_loop:
                mov dx, 0                ; Clear DX for multiplication
                mul bx                   ; AX = AX * 10
                
                mov dl, [si]             ; Get next ASCII char
                sub dl, 30h              ; Convert to digit
                add ax, dx               ; Add digit to total
                
                inc si                   ; Move to next char
                loop convert_loop
        end_convert:
                ret
        Ascii2DecInput ENDP



        Dec2AsciiOutput PROC
                ; This is a basic routine to print AX as a decimal number
                mov cx, 0       ; Count digits
                mov bx, 10      ; Divider

        divide_loop:
                mov dx, 0       ; Zeroing dx (the previous iteration's remainer)
                div bx          ; AX / 10, Remainder in DX
                push dx         ; Push the digit (remainder) onto the stack
                inc cx          ; Increment digit count
                test ax, ax     ; Is AX 0?
                jnz divide_loop ; If (AX!=0) keep looping, else continue

        print_loop:
                pop dx          ; Pop the last digit saved on the stack 
                add dl, 30h     ; Convert to ASCII
                mov ah, 02h     ; DOS print character function
                int 21h
                loop print_loop
                ret
        Dec2AsciiOutput ENDP

code ends
end main
