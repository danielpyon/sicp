#lang racket

; cons list append = cla

(define (accumulate op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence) (accumulate op initial (cdr sequence)))))

(define (dot-product v w)
	(accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
	(map
		(lambda (x) (dot-product x v))
		m))

(matrix-*-vector '((1 2 3) (4 5 6) (7 8 9)) '(1 2 3))
