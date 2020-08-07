#lang racket

(define (cons a b)
  (lambda (pick)
    (cond ((= pick 1) a)
          ((= pick 2) b))))

(define (car x) (x 1))

(define (cdr x) (x 2))

(define (make-rat x y)
  (cons x y))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

(define (+rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
  
(define (*rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (simplify x)
  (define (gcd a b)
    (if (= b 0)
        a
        (gcd b (modulo a b))))
  (define common (gcd (numer x) (denom x)))
  (make-rat (/ (numer x) common)
            (/ (denom x) common)))

