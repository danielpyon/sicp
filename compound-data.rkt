#lang racket

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

