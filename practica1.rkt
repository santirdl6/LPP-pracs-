#lang racket
;Practica 1

;Ejeercicio 1
;Resultados: 3/3/10/0/5/25/#<procedure:+>/#\+/"+"/"hola"/-17/162/84/27/1/#t/#t/#t/#t/0

;Ejercicio 2
;(cons 1 2) - > (1 . 2) Crea una pareja / (car (cons 1 2)) - > 1 Devuelve el primer elemento de la pareja/
;(cdr (cons 1 2)) - > 2 Devuelve el segundo elemento de la pareja / (cons (* 2 3) ( / 4 2)) - > (6 . 2)/
;cons (+ 2 1) (if (> 2 3) "2" "3")) - > (3 . "3") Como no se cumple el if devuelve el segundo elemento/
;(car (car (cons (cons 1 2) 3))) - > 1 / (car (cons (cons 3 4) 2)) - > (3 . 4)
;(cdr (cons (cons 3 4) 2)) - > 2 / (cdr (cons 1 (cons 2 3))) - > (2 . 3) / (cdr (car (cons (cons 1 2) 3))) - > 2

;Ejercicio 3
; (list 1 2 3 4) - > (1 2 3 4) Crea una lista /	(cons 3 '(1 2 3)) - > (3 1 2 3) Añade el elemnto a la primera posicion de la lista 
;(rest (list 1 2 3 4)) - > (2 3 4) Devuelve todos los elementos menos el primero / (rest (cons #t (cons "Hola" (list 1))))
;(first '(1 2 3 4)) - > 1 devuelve el primer elemento de la lista /(first (list (list 1 2) 1 2 3 4)) - > (1 2)
;(first (list #t 1 "Hola")) - > #t /	(first (rest '((1 2) 1 2))) - > 1
;(first (rest (list 1 2 3 4))) - > 2 / (cons '(1 2 3) '(4 5 6)) - > ((1 2 3) 4 5 6)
;(rest (rest '(1 2 3 4))) - > (3 4) / (first (rest (list 1 2 3 4))) - > 2
;(first (rest (rest (list 1 2 3 4)))) - > 3 / (rest (rest (list 1 2 3 4))) - > (3 4)
;(list (* 2 2) (+ 1 2) (/ 4 2)) - > (4 3 2) / (first (rest (rest (rest '(1 2 3 4))))) - > 4
;(list (+ 2 3) (- 3 4) (string-ref "hola" 3)) - > (5 -1 #\a) string-ref devuelve el caracter de la posicion indicada como segundo parametro.


;Ejercico 4
; a) (first (rest (list 1 2 3 4 5)))
; b) (rest (rest (rest (rest (list 1 2 3 4 5)))))
; c) (first (rest (rest (rest (rest (list 1 2 3 4 5))))))
; d) Devolvería (4 5)
; e) Devolvería (4 5)

;Ejercicio 5
;(equal? "hola" "hola") - > #t ya que tienen el mismo tipo de dato/(+ (char->integer(integer->char 1200)) (char->integer #\A)) - > 1265 suma 1200 mas 65 (posicion A en UTF-8) 
;(string-ref "pepe" 1) - > #\e hay que tener en cuenta que empieza por 0 /(string-length (make-string 7 #\E)) - > 7 nos da el tamaño del string
;(substring "buenos dias" 1 4) - > "uen" Devuelve parte de una cadena entre las posiciones dadas /(define a 3) -> no devuelve nada pero se define una variable que contiene 3 /(define b (+ a 1)) -> no devuelve nada pero se define una variable que contiene a + 1, es decir 4
;(= "hola" "hola") - > #t porque las cadenas son iguales / (+ a b (* a b)) - > 19
;(string-ref (substring "buenos dias" 2 5) 1) - > #\n /	(= a b) - > #f no tienen el mismo valor
;(define pi 3.14159) - > no muestra nada por pantalla pero define el valor de pi / (if (and (> a b) (< b (* a b))) b a) - > 3 no se cumple la primera premisa
;pi - > 3.14159 devuelve el valor que le hemos dado a pi / (cond ((= a 4) 6)((= b 4) (+ 6 7 a)) (else 25)) - > 16 se cumple la segunda condición
;"pi" - > "pi"	 / (+ 2 (if (> b a) b a)) - > 6
;(+ pi (+ pi pi)) - > 9.4247699 / (* (cond ((> a b) a) ((< a b) b)(else -1))(+ a 1)) - > 16 se cumple segunda condición, luego se multiplca
;(+ (* pi pi) (- 2 pi pi pi pi)) - > -0.6967722719000005 / ((if (< a b) + -) a b) - > 7 se cumple el if por lo tanto se suma


;Ejercicio 6
(require rackunit)
(define (doble x)
  (* x x))

(define (distancia p1 p2)
  (sqrt (+ (doble (- (car p2) (car p1))) (doble (- (cdr p2) (cdr p1))))))

(check-equal? (distancia '(0 . 0) '(0 . 10)) 10)
(check-equal? (distancia '(0 . 0) '(10 . 0)) 10)
(check-equal? (distancia '(0 . 0) '(10 . 10)) 14.142135623730951)


(define (isosceles-distancias? d1 d2 d3)
  (and
  (not (= d1 d2 d3))
  (or (= d1 d2)(= d1 d3)(= d2 d3))))

;Composición de funciones

(define (isosceles? p1 p2 p3)
  (isosceles-distancias? (distancia p1 p2) (distancia p1 p3) (distancia p2 p3)))


(isosceles? '(0 . 0) '(3 . 0) '(6 . 0)) ; ⇒ #t
(isosceles? '(2 . 2) '(4 . 0) '(0 . 0)) ; ⇒ #t
(isosceles? '(0 . 0) '(0 . 0) '(0 . 0)) ; ⇒ #f
(isosceles? '(0 . 0) '(1 . 1) '(3 . 2)) ; ⇒ #f
