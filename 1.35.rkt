#lang racket

(define phi (/ (+ 1 (sqrt 5)) 2))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
	(define (close-enough? v1 v2)
		(< (abs (- v1 v2)) tolerance))
	(define (try guess)
		(let ((next (f guess)))
			(if (close-enough? guess next)
			next
			(try next))))
	(try first-guess))

(println
	(fixed-point (lambda (x) (+ #i1 (/ #i1 x))) #i2))

(println phi)
