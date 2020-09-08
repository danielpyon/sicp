#lang racket

; implementation using display

;(define (fringe tree)
;	(cond
;		((null? tree)
;			(void))
;		((not (pair? tree))
;			(begin
;				(display (string-append (number->string tree) " "))
;				(void)))
;		(else
;			(begin
;				(fringe (car tree))
;				(fringe (cdr tree))
;				(void)))))


; implementation without display

(define (fringe tree)
	(cond
		((null? tree) '())
		((not (pair? tree)) (list tree))
		(else (append (fringe (car tree)) (fringe (cdr tree))))))
; cons append list

(define x (list (list 1 2) (list 3 4)))
(fringe x)
(newline)
(fringe (list x x))
(newline)
(fringe (list (list 50 39 7 3) (list (list 13 9 (list 18 9) 3) 11) 323 42))
(newline)
