#lang racket

(define (cont-frac-iter n d k c)
	(if (= k c)
		(/ (n c) (d c))
		(/ (n c) (+ (d c) (cont-frac-iter n d k (+ c 1))))))
(define (cont-frac n d k)
	(cont-frac-iter n d k 0))

(println (cont-frac (lambda (i) 1.0)
					(lambda (i) 1.0)
					10))
