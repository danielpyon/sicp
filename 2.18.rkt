#lang racket

(define (reverse l)
	(define (reverse-iter l pos)
		(if (= pos 0)
			(cons (list-ref l pos) null)
			(cons (list-ref l pos) (reverse-iter l (- pos 1)))))
	(reverse-iter l (- (length l) 1)))

(println (reverse (list 1 2 3 4)))
