#lang racket

(define (same-parity . l)
	(filter (lambda (x) (= (remainder x 2) (remainder (car l) 2))) l))

(println (same-parity 1 2 3 4 5 6 7))
