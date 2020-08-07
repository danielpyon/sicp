#lang racket

; generalized summation procedure
(define (sum a b next term)
  (if (> a b)
      0
      (+ (term a)
         (sum (next a) b next term))))

; sum of squares from a to b
(define (sum-sq a b)
  (define (sq x) (* x x))
  (sum a b (lambda (x) (+ x 1)) sq))

(define (average x y)
  (/ (+ x y) 2))

; first version (does not use average-damp)
(define (sqrt x)
  (fixed-point
   (lambda (y) (average (/ x y) y))
   1.0))

; second version (uses average-damp)
; we are "dampening" the oscillation of f(x)=c/x so that we approach sqrt(c)
(define (sqrt x)
  (define (average-damp f)
    (lambda (x) (average (f x) x)))
  (fixed-point
   (average-damp (lambda (y) (/ x y)))
   1))

; iterates on f until we reach the fixed point
(define (fixed-point f start)
  (define tolerance 0.0001)
  (define (close-enuf? u v)
    (< (abs (- u v)) tolerance))
  (define (iter old new)
    (if (close-enuf? old new)
        new
        (iter new (f new))))
  (iter start (f start)))
