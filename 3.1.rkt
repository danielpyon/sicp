#lang racket

(provide make-accumulator)

(define (make-accumulator n)
	(lambda (x)
		(begin
			(set! n (+ n x))
			n)))

