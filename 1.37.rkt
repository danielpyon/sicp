#lang racket
(provide cont-frac)

(define (cont-frac-recur n d k c)
	(if (= k c)
		(/ (n c) (d c))
		(/ (n c) (+ (d c) (cont-frac-recur n d k (+ c 1))))))

(define (cont-frac n d k)
	(cont-frac-recur n d k 0))

(define phi (cont-frac
	(lambda (i) 1.0)
	(lambda (i) 1.0)
	10))
