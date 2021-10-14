(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

; ( * 2 10 )

(define (* a b)
  (cond ((= b 0) 0)
		((= b 1) a)
		((even? b) (double (* a (halve b)))) ; a*b = 2 * (a * b/2)
		(else (+ a (* a (- b 1))))))


