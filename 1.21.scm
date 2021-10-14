; Use the smallest-divisor procedure to find the smallest divisor of each of the following numbers: 199, 1999, 19999.

(define (smallest-divisor n)
  (find-divisor n 2))

(define (divides? a b)
  (= (remainder a b) 0))

(define (square x)
  (* x x))

(define (find-divisor n test)
  (cond ((> (square test) n) n)
		((divides? test n) test)
		(else (find-divisor n (+ test 1)))))

(display (smallest-divisor 199))
(newline)

(display (smallest-divisor 1999))
(newline)

(display (smallest-divisor 19999))
(newline)
