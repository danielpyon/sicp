#lang racket

(define (fib n)
  (define phi (/ (+ 1 (sqrt 5)) 2))
  (define psi (/ (- 1 (sqrt 5)) 2))
  (/ (- (expt phi n) (expt psi n)) (sqrt 5)))