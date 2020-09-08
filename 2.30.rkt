#lang racket

(define (square-tree tree)
	(define (square x) (* x x))
	(cond
		((null? tree) null)
		((not (pair? tree)) (square tree))
		(else (cons (square-tree (car tree)) (square-tree (cdr tree))))))

(square-tree
	(list 1 (list 2 (list 3 4) 5) (list 6 7)))