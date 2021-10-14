(define (smallest-divisor n)
  (find-divisor n 2))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x)
  (* x x))

(define (find-divisor n test)
  (cond ((> (square test) n) n)
		((divides? test n) test)
		(else (find-divisor n (+ test 1)))))

(define (prime? x)
  (= x (smallest-divisor x)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(import (chicken random))
(import (chicken time))
(define random pseudo-random-integer)

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (timed-prime-test n)
  (time (prime? n)))

(timed-prime-test 1838)


