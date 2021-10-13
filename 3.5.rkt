#lang racket

; Monte Carlo integration
; Compute the area of a region of space described by P(x, y)
; P(x, y) = (x - 5) ^ 2 + (y - 7) ^ 2 <= 3 ^ 2
; Choose a rectangle that contains the region

(define (monte-carlo trials experiment)
	(define (iter trials-remaining trials-passed)
		(cond
			((= trials-remaining 0)
				(/ trials-passed trials))
			((experiment)
				(iter (- trials-remaining 1) (+ trials-passed 1)))
			(else
				(iter (- trials-remaining 1) trials-passed))))
	(iter trials 0))

(define (estimate-integral P x1 y1 x2 y2 trials)
	(define (rect-area x1 y1 x2 y2)
		(* (abs (- x2 x1)) (abs (- y2 y1))))
	(define (experiment)
		(define (random-real a b)
			(+ (* (random) (abs (- a b))) a))
		(let ((x (random-real x1 x2)) (y (random-real y1 y2)))
			(P x y)))
	(exact->inexact (* (rect-area x1 y1 x2 y2) (monte-carlo trials experiment))))

; Should be around 28.3
(define square (lambda (x) (* x x)))
(estimate-integral (lambda (x y) (<= (+ (square (- x 5)) (square (- y 7))) (square 3))) 2 4 8 10 1000)
