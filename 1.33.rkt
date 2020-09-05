#lang racket

(define (filter f l)
	(cond
		((empty? l) '())
		((f (car l)) (cons (car l) (filter f (cdr l))))
		(else (filter f (cdr l)))))


(define (smallest-divisor n) (find-divisor n 2))
(define (square x) (* x x))
(define (find-divisor n test-divisor)
	(cond
		((> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
		(else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
	(= n (smallest-divisor n)))

;; test

;; even filter
(println (filter (lambda (x) (= (remainder x 2) 0)) (list 1 2 3 4)))

;; prime filter
(define list-range
	(lambda (start end)
		(if (= start end)
			'()
			(cons start (list-range (+ 1 start) end)))))
(define (primes a b)
	(filter
		prime?
		(list-range a b)))

(println (primes 1 10))

;; coprime filter
(define (coprimes n)
	(filter
		(lambda (x) (= (gcd x n) 1))
	 	(list-range 1 n)))

(println (coprimes 10)) 
