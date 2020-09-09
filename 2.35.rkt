#lang racket

(define (accumulate op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence) (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
	(accumulate
		(lambda
			(node so-far)
				(if (not (pair? node))
					(+ 1 so-far)
					(so-far)))
		0
		(flatten t)))

(count-leaves (list 1 (list 2 3 4) 5 (list 6 7)))
