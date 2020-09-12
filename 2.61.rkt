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

(define (adjoin-set set1 set2)
	(define (sort-asc l)
		(sort l (lambda (x y) (< x y))))
	(cond
		((null? set1) set2)
		((null? set2) set1)
		((not (= (car set1) (car set2)))
			(sort-asc (cons (car set1) (cons (car set2) (adjoin-set (cdr set1) (cdr set2))))))
		(else
			(sort-asc (cons (car set1) (adjoin-set (cdr set1) (cdr set2)))))))

(element-of-set? 4 (list 1 3 6 10))
(element-of-set? 3 (list 1 3 6 10))
(intersection-set (list 1 3 6 10) (list 5 6 7 8 10))
(adjoin-set (list 1 3 6 10) (list 1 3 6 9 11)) 
