#lang racket
(require rackunit)
(require "lpp.rkt")
(require "practica2.rkt")


;Ejercicio 1
;a)
;Usamos la función menor de la práctica anterior

(define (minimo lista)
  (if (= (length lista) 1)
      (first lista)
      (menor (first lista) (minimo (rest lista)))))


(check-equal? (minimo '(2)) 2)
(check-equal? (minimo  '(1 8 6 4 3)) 1)
(check-equal? (minimo '(1 -1 3 -6 4)) -6)


;a.2)
;(minimo '(1 8 6 4 3)) ; ⇒ 1
;La primera lista que se pasa es '(8 6 4 3) es decir el rest de '(1 8 6 4 3)
;Devuelve el mínimo de esa lista es decir 3
;Con el primer elemento de la lista y la funciin minimo pasando como argumento el resto de la lista

;b)
(define (concatena lista-chars)
  (if (null? lista-chars)
      ""
      (string-append (string (first lista-chars)) (concatena (rest lista-chars)))))

(check equal? (concatena '()) "")
(check-equal? (concatena '(#\H #\o #\l #\a)) "Hola")
(check-equal? (concatena '(#\S #\c #\h #\e #\m #\e #\space #\m #\o #\l #\a)) "Scheme mola")

;c)



(define (cifra-cadena cad desplazamiento)
  (if (= (string-length cad) 0)
  ""
  (string-append (string (cifra-caracter (string-ref cad 0) desplazamiento))
                 (cifra-cadena (substring cad 1 (string-length cad)) desplazamiento))))

(define (descifra-cadena cad desplazamiento)
  (cifra-cadena cad (- desplazamiento)))


(check-equal? (cifra-cadena "En un lugar de la Mancha, de cuyo nombre no quiero acordarme" 10)
              "Ox ex veqkb no vk Wkxmrk, no meiy xywlbo xy aesoby kmybnkbwo")
(check-equal? (descifra-cadena "Ox ex veqkb no vk Wkxmrk, no meiy xywlbo xy aesoby kmybnkbwo" 10)
              "En un lugar de la Mancha, de cuyo nombre no quiero acordarme"
)


(define (contiene? lista elemento)
  (if (null? lista)
      #f
      (or (equal? (first lista) elemento) (contiene? (rest lista) elemento))))


(check-equal? (contiene?  '(algo 3 #\A) 3) #t)
(check-equal? (contiene?  '(algo 3 #\A) "algo") #f)
(check-equal? (contiene?  '(algo 3 #\A) 'algo) #t)

(define (str-contiene? cadena char)
  (contiene? (string->list cadena) char))

(check-equal? (str-contiene? "Hola" #\o) #t)
(check-equal? (str-contiene? "Esto es una frase" #\space) #t)
(check-equal? (str-contiene? "Hola" #\h) #f)


;Ejercicio 2
;a)
(define (todos-iguales? lista)
  (if (or (null? lista)(null? (rest lista)))
      #t
      (and (equal? (first lista) (second lista)) (todos-iguales? (rest lista)))))

;(todos-iguales? '()) ; ⇒ #t
;(todos-iguales? '(a)) ; ⇒ #t
;(todos-iguales? '(a a a a a a a)) ; ⇒ #t
;(todos-iguales? '((a b) (a b) (a b))) ; ⇒ #t
;(todos-iguales? '(a a a a a b)) ; ⇒ #f


;b)

(define (todos-distintos? lista)
  (if (or (null? lista) (null? (rest lista)))
      #t
      (and (not (contiene? (rest lista) (first lista))) (todos-distintos? (rest lista)))))

;(todos-distintos? '()) ; ⇒ #t
;(todos-distintos? '(a)) ; ⇒ #t
;(todos-distintos? '(a b c)) ; ⇒ #t
;(todos-distintos? '(a b c a)) ; ⇒ #f


(define (solo-dos-iguales? lista)
  (if (or (null? lista) (null? (rest lista)))
      #f
     (or (and (contiene? (rest lista) (first lista)) (todos-distintos? (rest lista)))
         (and (solo-dos-iguales? (rest lista)) (not (contiene? (rest lista) (first lista)))))))

;(solo-dos-iguales? '()) ; ⇒ #f
;(solo-dos-iguales? '(a)) ; ⇒ #f
;(solo-dos-iguales? '(a b c a)) ; ⇒ #t
;(solo-dos-iguales? '(a b c b a a)) ; ⇒ #f
;(solo-dos-iguales? '(a b c a a)) ; ⇒ #f



;Ejercicio 3

;a.1

(define p1
  (list
   (cons 'a 'b) 'c (list 'd 'e)))

;(caja-puntero p1)
;a.2
;Expresion que de vuelve b
;(cdr (first p1))
;Expresion que de vuelve d
;(first (third p1))

;b.1
(define p2
  (list (list (cons 'a (cons 'b 'c)) (list 'd 'e) 'f)'g))

;(caja-puntero p2)
;b.2

;Expesion que devuelve c
;(cddr (first (first p2)))
;Expresión que devulve e
;(second (second (first p2)))

;Ejercicio 4

(define (contar-datos-iguales lista-parejas)
  (if (null? lista-parejas)
      0
      (if (equal? (car(first lista-parejas)) (cdr(first lista-parejas)))
          (+ 1 (contar-datos-iguales (rest lista-parejas)))
          (contar-datos-iguales (rest lista-parejas)))))

;(contar-datos-iguales '((2 . 3) ("hola" . "hola") (\#a . \#a) (true . false))) ; ⇒ 2
;(contar-datos-iguales '((2 . "hola") ("hola" . 3) (\#a . true) (\#b . false))) ; ⇒ 0


;Ejercicio 5
(define (palo-carta carta1)
  (cdr (carta carta1)))

;(palo-carta 'A♠) ; ⇒ Picas
;(palo-carta '2♣) ; ⇒ Tréboles
;(palo-carta '3♥) ; ⇒ Corazones
;(palo-carta '4♦) ; ⇒ Diamantes


;b)

(define (veces-palo lista palo)
  (if (null? lista)
      0
      (if (equal? (palo-carta (first lista)) palo)
          (+ (veces-palo (rest lista) palo) 1)
          (veces-palo (rest lista) palo))))

;(veces-palo '(5♠ 6♣ 7♥ 8♦ 9♠) 'Picas) ; ⇒ 2
;(veces-palo '(J♠ Q♣ K♥) 'Diamantes) ; ⇒ 0
;(veces-palo '(A♣ 2♥ 3♠) 'Corazones) ; ⇒ 1
;(veces-palo '() 'Tréboles) ; ⇒ 0

(define (color1? mano)
  (= (veces-palo mano (palo-carta (first mano))) (length mano)))

(define (color? mano)
  (if (or (null? mano) (null? (rest mano)))
      #t
      (and (equal? (palo-carta (first mano)) (palo-carta(second mano))) (color? (rest mano)))))

;(color1? '(5♣ J♦ J♣ Q♠ Q♥)) ; ⇒ #f
;(color1? '(2♦ 5♦ 6♦ J♦ K♦)) ; ⇒ #t


;c)

(define (escalera? lista)
  (if (or (null? lista) (null? (rest lista)))
      #t
      (and (= (+ 1 (valor-carta (first lista))) (valor-carta (second lista)))
           (escalera? (rest lista)))))

;(escalera? '(5♣ 4♦ 3♣)) ; ⇒ #f
;(escalera? '(8♣ 9♦ J♣ Q♦)) ; ⇒ #t
;(escalera? '(8♣ 2♣)) ; ⇒ #f
;(escalera? '(A♣ 2♦ 3♣)) ; ⇒ #t


;Ejercicio 6

;a)
(define (suma-der pareja n)
  (cons (car pareja) (+ n (cdr pareja))))
(define (suma-izq pareja n)
  (cons (+ n (car pareja)) (cdr pareja)))

;(suma-izq (cons 10 20) 3)  ; ⇒ (13 . 20)
;(suma-der (cons 10 20) 5)  ; ⇒ (10 . 25)


;b)
(define (suma-impares-pares lista-num)
  (if (null? lista-num)
      '(0 . 0)
      (if (even? (first lista-num))
          (suma-der (suma-impares-pares (rest lista-num)) (first lista-num))
          (suma-izq (suma-impares-pares (rest lista-num)) (first lista-num)))))

;(suma-impares-pares '(3 2 1 4 8 7 6 5)) ; ⇒ (16 . 20)
;(suma-impares-pares '(3 1 5))           ; ⇒ (9 . 0)

;c

(define (cadena-mayor lista)
  (if (null? lista)
      '("" . 0)
      (if (> (string-length (first lista)) (cdr (cadena-mayor (rest lista))))
          (cons (first lista) (string-length (first lista)))
          (cadena-mayor (rest lista)))))

;(cadena-mayor '("vamos" "a" "obtener" "la" "cadena" "mayor")) ; ⇒  ("obtener" . 7)
;(cadena-mayor '("prueba" "con" "maximo" "igual")) ; ⇒ ("maximo" . 6)
;(cadena-mayor '()) ; ⇒ ("" . 0)
