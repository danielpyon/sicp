#lang racket

(define (sum a b next term)
  (if (> a b)
      0
      (+ (term a)
         (sum (next a) b next term))))

(define (sum-sq a b)
  (define (sq x) (* x x))
  (sum a b (lambda (x) (+ x 1)) sq))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (fixed-point
   (lambda (y) (average (/ x y) y))
   1.0))

(define (fixed-point f start)
  (define tolerance 0.0001)
  (define (close-enuf? u v)
    (< (abs (- u v)) tolerance))
  (define (iter old new)
    (if (close-enuf? old new)
        new
        (iter new (f new))))
  (iter start (f start)))
