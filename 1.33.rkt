#lang racket

(define (filter f l)
	(cond
		((empty? l) '())
		((f (car l)) (cons (car l) (filter f (cdr l))))
		(else (filter f (cdr l)))))

(define (expmod base exp m)
	(define (square x) (* x x))
	(cond
		((= exp 0) 1)
		((even? exp)
			(remainder
				(square (expmod base (/ exp 2) m)) m))
		(else
			(remainder
				(* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
	(define (try-it a)
		(= (expmod a n n) a))
	(try-it (+ (random (- n 1)))))

(define (fast-prime? n times)
	(cond
		((= times 0) true)
		((fermat-test n) (fast-prime? n (- times 1)))
		(else false)))


;; test

;; even filter
(println (filter (lambda (x) (= (remainder x 2) 0)) (list 1 2 3 4)))

;; prime filter
(define (primes a b)
	(define list-range
		(lambda (start end)
			(if (= start end)
				'()
				(cons start (list-range (+ 1 start) end)))))
	(filter
		(lambda (x) (fast-prime? x x))
		(list-range a b)))

(println (primes 1 10))
