.model small
.stack 100h
.data 
    array dw 20 DUP(0)      ; масив з 20 dw. DUP(0) - пам'ять виділяється, але в масив нічого не записується
.code
main PROC
    mov ax, @data
    mov ds, ax              ; ds - data segment, регістр для зберігання даних програми
    
    mov bx, 0               ; позиція в масиві
    mov cx, 20              ; ітерації циклу
    mov ax, 20              ; елемент, який буде ставитись в масив

array_loop:
    mov [array + bx], ax
    add bx, 2
    dec ax
    dec cx
    loop array_loop

    mov bx, 0
    mov cx, 20
    mov ax, 0
    
reset_loop:
    mov [array + bx], ax
    add bx, 2
    dec cx
    loop reset_loop

    mov bx, 0
    mov cx, 20
    mov ax, 0


fibonacci_prepare:
    mov [array], 0
    mov [array + 2], 1
    
    mov si, 0
    mov di, 1
    mov bx, 4
    mov cx, 18

fibonacci_loop:
    mov ax, si
    add ax, di
    mov [array + bx], ax
    mov si, di
    mov di, ax
    add bx, 2
    loop fibonacci_loop

    mov ax, 4C00h
    int 21h

main ENDP
END main