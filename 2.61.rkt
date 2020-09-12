#lang racket

; ordered list implementation of set

(define (element-of-set? x set)
	(cond
		((null? set) false)
		((= x (car set)) true)
		((< x (car set)) false)
		(else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
	(cond
		((or (null? set1) (null? set2)) '())
		((< (car set1) (car set2)) (intersection-set (cdr set1) set2))
		((> (car set1) (car set2)) (intersection-set set1 (cdr set2)))
		(else (cons (car set1) (intersection-set (cdr set1) (cdr set2))))))

(element-of-set? 4 (list 1 3 6 10))
(element-of-set? 3 (list 1 3 6 10))
(intersection-set (list 1 3 6 10) (list 5 6 7 8 10))
