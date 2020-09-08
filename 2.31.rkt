#lang racket

; Author: Daniel Pyon
; General purpose map for trees

(define (tree-map f tree)
	(cond
		((null? tree) null)
		((not (pair? tree)) (f tree))
		(else (cons (tree-map f (car tree)) (tree-map f (cdr tree))))))

(tree-map (lambda (x) (* x x)) (list 1 (list 2 (list 3 4) 5) (list 6 7)))
