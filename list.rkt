#lang racket

(define (map f l)
  (if (empty? l)
      '()
      (list (f (car l)) (map (cdr l)))))