#lang racket

(define (f-iter n a b c i)
  (cond ((< n 3) n)
        ((> i n) a)
        (else (f-iter n (+ a (* 2 b) (* 3 c)) a b (+ i 1)))))

(define (f n)
  (f-iter n 2 1 0 3))

(f 5)
