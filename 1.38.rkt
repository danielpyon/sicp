#lang racket
(require "1.37.rkt")

; Euler's e approximation
(define e
	(+ 2
		(cont-frac
			(lambda (i) 1.0)
			(lambda (i)
				(if (= (remainder i 3) 1) (+ 2 (* 2 (/ (- i 1) 3))) 1.0))
			1000)))

(println e)

