#lang racket

(define (cons x y)
	(lambda (m) (m x y)))

(define (car z)
	(z (lambda (p q) p)))

(define (cdr z)
	(z (lambda (p q) q)))

(println (car (cons 1 2)))
(println (cdr (cons 1 2)))
