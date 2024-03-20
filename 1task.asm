.model small
.stack 100h
.data 
    array dw 10*20 DUP(0)
.code

; Скопіювати модифікований код задачі 1B. +
; Винести код розрахунку Y-Y*X у окрему функцію, що повертає результат у AX.  +
; Код запису слова у елемент X:Y масиву - у процедуру, 
; використовуючи BX і DX для координат і AX для значення.


calculate PROC
    mov ax, 20          ; множимо зміщення на кількість стовпчиків
    mul ch              ; ax * Y
    mov dl, cl          ; зберігаємо Y в dl
    xor dh, dh          ; dh = 0
    add ax, dx

    shl ax, 1           ; помножити на два (зсув на один біт вліво)
    xchg ax, bx         ; щоб використовувати bx для визначення позиції в масиві, а ax для зберігання результату

    xor ah, ah          ; ah = 0
    xor bh, bh          ; bh = 0
    mov al, ch          ; зберігаємо X в al
    add al, 5           ; X + 5
    mov bl, cl          ; зберігаємо Y в bl
    mul bx              ; ax = (x + 5) * y  | ax (al) = x + 5, bx (bl) = y 
    ret
calculate ENDP

fillArray PROC
    mov [array + bx], ax
    ret
fillArray ENDP

main PROC
    mov ax, @data
    mov ds, ax

    mov ch, 0           ; для зберігання X (рядків)
    mov cl, 0           ; для зберігання Y (стовпчиків)             X*(Y + 10)              Y * (X + 5)

loop_:
    push cx             ; збережемо CX, оскільки воно буде змінено в calculate
    call calculate
    pop cx
    
    call fillArray


    inc cl
    cmp cl, 20
    jne loop_
    mov cl, 0
    inc ch
    cmp ch, 10
    jne loop_

    mov ax, 4C00h
    int 21h
main ENDP
END main



