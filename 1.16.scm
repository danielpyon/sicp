(define (square x)
  (* x x))

(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b n a)
  (cond ((= n 1) a)
		((= (remainder n 2) 0)
		 (expt-iter b
					(/ n 2)
					(* a (square b))))
		(else (expt-iter b
						 (- n 1)
						 (* a b)))))

