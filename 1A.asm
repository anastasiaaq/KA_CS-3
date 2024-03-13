.model small
.stack 100h
.data 
    array dw 20 DUP(0)      ; масив з 20 dw. DUP(0) - пам'ять виділяється, але в масив нічого не записується

.code
main PROC
    mov ax, @data
    mov ds, ax              ; ds - data segment, регістр для зберігання даних програми
    
    mov bx, 0               ; позиція в масиві
    mov cx, 20               ; ітерації циклу
    mov ax, 20              ; елемент, який буде ставитись в масив

array_loop:
    mov [array + bx], ax
    add bx, 2
    dec ax
    dec cx
    loop array_loop

    mov ax, 4C00h
    int 21h
main ENDP
END main