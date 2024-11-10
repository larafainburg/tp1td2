; Usando la instruccion ADDINMEM, implementar la funcion processArray que toma un arreglos
; de enteros positivos en memoria y los suma de a pares en memoria, pisando el primer elemento
; de cada par con el resultado. Considerar que el tama-o del arreglo siempre es par.
;
;     processArray(*p,size)
;         for i=0; i<size/2; i=i+2
;             p[i] = p[i] + p[i+1]

main:
	SET R7, 0xFF	;stack
	SET R0, p		;p
	SET R1, 0x10	;size

	CALL |R7|, processArray

halt:
	JMP halt

processArray:
    ; Guardamos los registros en la pila para que arranquen y terminen valiendo lo mismo
    PUSH |R7|, R4
    PUSH |R7|, R3
    PUSH |R7|, R2

    SET R2, 0x00    ;seteamos un contador
    SET R3, 0x02    ;incrementamos para mover el puntero de la pila
    SET R4, 0x01    ;incrementamos contador
    SHR R1, 1

    LOOP:
        CMP R2, R1  ;compara el contador que creamos (R2) con 1 (tamano del arreglo) 
        JZ FIN      ;dependiendo si se cumple la condicion o no pasa a fin, si no se cumple vuelve a LOOP 
        ADD R2, R4  ;sumamos 1 al contador (R2) 
        DB 0x70     ;FUNCION ADDINMEM CREADA EN EL PUNTO 3A
        DB 0x00     ;FUNCION ADDINMEM CREADA EN EL PUNTO 3A
        ADD R0, R3  ;Se incrementa R0 (arreglo) en 2 posiciones (R3) para que se respete lo que pide la consigna (pares)
        JMP LOOP    ;se repite el ciclo explicado antes 
    FIN:
        POP |R7|, R2 ;se recuperan los valores de la pila que pusheamos antes 
        POP |R7|, R3
        POP |R7|, R4   

        RET |R7|           

p:
DB 0x01
DB 0x02
DB 0x04
DB 0x08
DB 0x03
DB 0x03
DB 0xA1
DB 0xC0
DB 0xFF
DB 0x40
DB 0x55
DB 0xCC
DB 0xBD
DB 0x45
DB 0x9A
DB 0xEE
