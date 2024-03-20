.model small
.stack 100h
.data 
.code

; Створіть визначення функції НСД(алгоритм Евкліда),
; де AX містить перше число, BX містить друге число,
; та результат (найбільший спільний дільник) зберігається в AX.

main PROC
    mov ax, @data

    mov ax, 36
    mov bx, 48

loop_:
    cmp ax, bx
    je end_
    jg a_greater_than_b

b_greater_than_a:
    sub bx, ax       ; bx = bx - ax
    jmp loop_

a_greater_than_b:
    sub ax, bx
    jmp loop_

end_:
    mov ax, 4C00h
    int 21h
main ENDP
END main