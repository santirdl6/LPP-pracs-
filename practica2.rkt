#lang racket
(require rackunit)

; Santiago Redondo De La Rica
; 48712164G

; Ejercicio 1
; a)

(define (cuadrado x)
  (* x x))
(define (cubo x)
  (* x x x))
(define (convierte-digito num posicion)
  (* num (expt 2 posicion)))

(define (binario-a-decimal b3 b2 b1 b0)
  (+ (convierte-digito b3 3) (convierte-digito b2 2) (convierte-digito b1 1) b0))


(check-equal? (binario-a-decimal 1 1 1 1) 15)
(check-equal? (binario-a-decimal 0 1 1 0) 6)
(check-equal? (binario-a-decimal 0 0 1 0) 2)

;b)

(define (numero-a-hexadecimal n)
  (if (> n 9)
  (integer->char (+ (char->integer #\F) (- n 15))) ; Cogemos el máximo valor posible y le quitamos la diferencia
  (integer->char (+ n (char->integer #\0)))))

(define (binario-a-hexadecimal b3 b2 b1 b0)
 (numero-a-hexadecimal (binario-a-decimal b3 b2 b1 b0)))


(check-equal? (binario-a-hexadecimal 1 1 1 1) #\F)
(check-equal? (binario-a-hexadecimal 0 1 1 0) #\6)
(check-equal? (binario-a-hexadecimal 1 0 1 0) #\A)

;---------------------------------------------------
; Eejercicio 2


(define (encuentra-indice char)
      (- (char->integer char) (char->integer #\a)))


(check-equal? (encuentra-indice #\a) 0)
(check-equal? (encuentra-indice #\b) 1)
(check-equal? (encuentra-indice #\m) 12)
(check-equal? (encuentra-indice #\z) 25)


(define (encuentra-caracter n)
  (integer->char(+ n (char->integer #\a))))


(check-equal? (encuentra-caracter 0) #\a)
(check-equal? (encuentra-caracter 1) #\b)
(check-equal? (encuentra-caracter 12) #\m)
(check-equal? (encuentra-caracter 25) #\z)


(define (entre-az? char)
  (and (>= (char->integer char) (char->integer #\a)) (<= (char->integer char) (char->integer #\z))))


(check-equal? (entre-az? #\ó) #f)
(check-equal? (entre-az? #\m) #t)
(check-equal? (entre-az? #\z) #t)
(check-equal? (entre-az? #\´) #f)
(check-equal? (entre-az? #\{) #f)


(define (rota-indice indice desplazamiento)
  (modulo (+ indice desplazamiento) 26))


(check-equal? (rota-indice 4 24) 2)
(check-equal? (rota-indice 4 -5) 25)

(define (cifra-caracter char desplazamiento)
  (if (entre-az? (char-downcase char))
      (if (char-upper-case? char)
          (char-upcase  (encuentra-caracter (rota-indice (encuentra-indice (char-downcase char)) desplazamiento)))
          (encuentra-caracter (rota-indice (encuentra-indice char) desplazamiento)))
  char))

(define (descifra-caracter char desplazamiento)
  (cifra-caracter char (* desplazamiento -1)))


(check-equal? (cifra-caracter #\c 5) #\h)
(check-equal? (cifra-caracter #\z -1) #\y)
(check-equal? (cifra-caracter #\j 40) #\x)
(check-equal? (cifra-caracter #\D 3) #\G)
(check-equal? (cifra-caracter #\ñ 3) #\ñ)
(check-equal? (cifra-caracter #\a -1) #\z)
(check-equal? (cifra-caracter #\a -1) #\z)
(check-equal? (cifra-caracter #\n 10) #\x)
(check-equal? (cifra-caracter #\n 13) #\a)


(check-equal? (descifra-caracter #\d 3) #\a)
(check-equal? (descifra-caracter #\y -1) #\z)
(check-equal? (descifra-caracter #\x 40) #\j)
(check-equal? (descifra-caracter #\G 3) #\D)
(check-equal? (descifra-caracter #\tab 3) #\tab)


;--------------------------------------------------------
;Ejercicio 3

;version 1 con el uso de if

(define (menor-de-tres n1 n2 n3)
  (if (and (< n1 n2) (< n1 n3))
      n1
      (if (< n2 n3)
          n2
          n3)))


(check-equal? (menor-de-tres 2 8 1) 1)
(check-equal? (menor-de-tres 3 0 3) 0)
(check-equal? (menor-de-tres 2 8 -1) -1)


;version 2 función auxiliar
(define (menor x y)
  (if (< x y)
      x
      y))
(define (menor-de-tres-v2 n1 n2 n3)
  (menor (menor n1 n2) n3))


(check-equal? (menor-de-tres-v2 2 8 1) 1)
(check-equal? (menor-de-tres-v2 3 0 3) 0)
(check-equal? (menor-de-tres-v2 2 8 -1) -1)



;------------------------------------
; Ejercicio 4

(define (f x)
    (cons x 2))

(define (g x y)
    (cons x y))

;(g (f (+ 2 1)) (+ 1 1)) Tenemos la siguiente expresion

; Mediante el modelo de sustitución con orden aplicativo la evaluación
; de la expresión anterior sería;
; Primero: (g (f 3) (+ 1 1)) se realizaría la suma
; Segundo: (g (cons 3 2) (+ 1 1)) sustituimos f por el cuerpo evaluando antes los argumentos
; Tercero: (g (3 . 2) 2)
; Cuarto: (cons (3 . 2) 2) sustituimos g por el cuerpo evaluando antes sus argumentos
; final ((3 . 2) . 2)


; Mediante el modelo de sustitución con orden normal
; Nos quedaría una expresión asi
; (cons (cons (+ 2 1) 2) (+ 1 1)))
; a partir de aqui empezamos a resolver en orden
; (cons (cons 3 2) (+ 1 1))
; (cons (3 . 2) 2)
; ((3 . 2) . 2)





;Apartado b)

(define (func-1 x)
    (/ x 0))

(define (func-2 x y)
    (if (= x 0)
        0
        y))

;(func-2 0 (func-1 10))

;Orden aplcativo
;(func-2 0 (/ 10 0)) ----> ERROR: division by zero
;Orden normal
;(= 0(/ 10 0)) ----> ERROR: division by zero
;------------------------------------------------
; Ejercicio 5
(define (cadena-mayor-primer-elemento lista1 lista2)
  (if (> (string-length (first lista1)) (string-length (first lista2)))
  (first lista1)
  (if (= (string-length (first lista1)) (string-length (first lista2)))
      (first lista1)
      (first lista2))))

(define (cadenas-mayores lista1 lista2)
  (list(cadena-mayor-primer-elemento lista1 lista2)
        (cadena-mayor-primer-elemento (rest lista1) (rest lista2))
        (cadena-mayor-primer-elemento (rest (rest lista1)) (rest (rest lista2)))))


(check-equal? (cadenas-mayores '("hola" "que" "tal") '("meme" "y" "adios")) '("hola" "que" "adios"))
(check-equal? (cadenas-mayores '("esto" "es" "lpp") '("hoy" "hay" "clase")) '("esto" "hay" "clase"))



;--------------------------------------------------
;Ejercicio 6



(define (obten-palo char)
  (cond
    ((equal? char #\♥) 'Corazones)
    ((equal? char #\♠) 'Picas)
    ((equal? char #\♦) 'Diamantes)
    (else 'Tréboles)))

(check-equal? (obten-palo #\♠) 'Picas)
(check-equal? (obten-palo #\♥) 'Corazones)
(check-equal? (obten-palo #\♣) 'Tréboles)

(define (valores-especiales char)
  (cond
    ((equal? char #\A) 1)
    ((equal? char #\J) 10)
    ((equal? char #\Q) 11)
    (else 12)))

(define (obten-valor char)
  (if (char-numeric? char)
      (- (char->integer char) (char->integer #\0))
      (valores-especiales char)))


(check-equal? (obten-valor #\3) '3)
(check-equal? (obten-valor #\J) '10)
(check-equal? (obten-valor #\5) '5)
(check-equal? (obten-valor #\K) '12)

;Función final
(define (carta simbolo)
  (cons (obten-valor (string-ref (symbol->string simbolo) 0))
        (obten-palo (string-ref (symbol->string simbolo) 1))))

(define tres-de-picas '3♠)
(define as-de-corazones 'A♥)
(define jota-de-diamantes 'J♦)

;Comprobaciones

(check-equal? (carta tres-de-picas) '(3 . Picas))
(check-equal? (carta as-de-corazones) '(1 . Corazones))
(check-equal? (carta 'K♣) '(12 . Tréboles))
;Ejercicio 7
(define (primer-objeto-carta carta1)
  (car (carta carta1)))

(define (es-pareja n)
  (string-append "pareja de " (number->string n)))

(define (jugada-mano-simple n1 n2 n3)
  (if (= n1 n2 n3)
      (string-append "trío de " (number->string n1))
      (cond ((= n1 n2) (es-pareja n1))
            ((= n1 n3) (es-pareja n3))
               ((= n2 n3) (es-pareja n2))
               (else "nada"))))

(define (jugada-mano carta1 carta2 carta3)
  (jugada-mano-simple (primer-objeto-carta carta1) (primer-objeto-carta carta2) (primer-objeto-carta carta3)))


(check-equal? (jugada-mano '3♥ '3♣ '3♥) "trío de 3")
(check-equal? (jugada-mano 'K♦ '7♠ 'K♥) "pareja de 12")
(check-equal? (jugada-mano '5♣ '4♣ '6♣) "nada")

