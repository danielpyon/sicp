#lang racket

(define (map f l)
  (if (empty? l)
      '()
      (list (f (car l)) (map f (cdr l)))))

(define (for-each f l)
  (cond ((empty? l) "done")
        (else (f (car l))
              (for-each f (cdr l)))))