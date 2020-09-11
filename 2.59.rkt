#lang racket

(define (element-of-set? x set)
	(cond
		((null? set) #f)
		((equal? x (car set)) #t)
		(else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
	(if (element-of-set? x set)
		set
		(cons x set)))

(define (intersection-set set1 set2)
	(cond
		((or (null? set1) (null? set2)) '())
		((element-of-set? (car set1) set2)
			(cons (car set1) (intersection-set (cdr set1) set2)))
		(else (intersection-set (cdr set1) set2))))

(define (subtract-set set1 set2)
	(cond
		((null? set2) set1)
		((null? set1) set2)
		((element-of-set? (car set2) set1)
			(subtract-set (remove (car set2) set1) (cdr set2)))
		(else (subtract-set (cons set1 (car set2)) (cdr set2)))))
		
(define (union-set set1 set2)
	(subtract-set (append set1 set2) (intersection-set set1 set2)))

(subtract-set '(1 2 3) '(1 4 5))
