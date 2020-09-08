#lang racket

(define (deep-reverse t)
	(if
		(pair? t)
			(reverse (map deep-reverse t))
		t))

(deep-reverse (list (list 1 2) (list 3 4)))
; ((4 3) (2 1))
