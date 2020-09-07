#lang racket

(define (make-interval a b)
	(cons a b))

(define lower-bound car)

(define upper-bound cdr)

(define (add-interval x y)
	(make-interval
		(+ (lower-bound x) (lower-bound y))
		(+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
	(make-interval
		(- (lower-bound x) (upper-bound y))
		(- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
	(let
		((p1 (* (lower-bound x) (lower-bound y)))
		(p2 (* (lower-bound x) (upper-bound y)))
		(p3 (* (upper-bound x) (lower-bound y)))
		(p4 (* (upper-bound x) (upper-bound y))))
	(make-interval
		(min p1 p2 p3 p4)
		(max p1 p2 p3 p4))))

(define (div-interval x y)
	(mul-interval
		x
		(make-interval
			(/ 1.0 (upper-bound y))
			(/ 1.0 (lower-bound y)))))

; test
; 6.8 ohms with 10% tolerance
(define r1 (make-interval (* 0.9 6.8) (* 1.1 6.8)))
; 4.7 ohms with 5% tolerance
(define r2 (make-interval (* 0.95 4.7) (* 1.05 4.7)))
; resistance in parallel
(define r
	(let ((unit-interval (make-interval 1 1)))
	(div-interval
		unit-interval
		(add-interval
			(div-interval unit-interval r1)
			(div-interval unit-interval r2)))))
(println r)
