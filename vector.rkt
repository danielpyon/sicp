#lang racket

(define make-vector cons)
(define xcor car)
(define ycor cdr)

(define make-segment cons)
(define seg-start car)
(define seg-end cdr)

(define (scale-list s l)
  (if (null? 1)
      nil
      (cons ((* (car l) s))
            ((scale-list s (cdr l))))))