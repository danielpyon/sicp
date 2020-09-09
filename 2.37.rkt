#lang racket

; cons list append = cla

(define (accumulate op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence) (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
	(if (null? (car seqs))
		null
		(cons
			(accumulate op init (map car seqs))
			(accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
	(accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
	(map
		(lambda (x) (dot-product x v))
	m))

(accumulate-n + 0 '((1 2 3) (4 5 6)))
(matrix-*-vector '((1 2 3) (4 5 6) (7 8 9)) '(1 2 3))
