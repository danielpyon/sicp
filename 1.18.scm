; iterative process for multiplication that runs in logarithmic time

(define (* a b)
  (multiply a b 0))

(define (halve x)
  (/ x 2))

(define (double x)
  (+ x x))

; invariant property: a*b = (2a)*(1/2b)
; the expt invariant property was similar: a^b = (a^2)^(b/2)

(define (multiply a b total)
  (cond ((= b 0) total)
		((even? b) (multiply (double a) (halve b) total))
		(else (multiply a (- b 1) (+ total a)))))

