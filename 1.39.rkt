#lang racket
(require "1.37.rkt")

(define (tan-cf x k)
	(cont-frac
		(lambda (i)
			(if (= i 0)
				x
				(* x x -1)))
		(lambda (i) (+ (* #i2 i) #i1))
		k))

(println (tan-cf 0.7854 100))
