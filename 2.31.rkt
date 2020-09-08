#lang racket

; Author: Daniel Pyon
; General purpose map for trees

(define (tree-map f tree)
	(cond
		((null? tree) null)
		((not (pair? tree)) (f tree))
		(else (cons (tree-map (car tree)) (tree-map (cdr tree))))
