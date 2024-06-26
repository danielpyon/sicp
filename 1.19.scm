; a = 1, b = 0
; a <- a + b
; b <- a
; 3 5 8 13

; a <- bq + aq + ap
; b <- bp + (bq + aq + ap) q

; a <- (bp+(bq+aq+ap)q)q + (bq+aq+ap)a + (bq+aq+ap)p
; b <- (bp + (bq+aq+ap)q)p + q( (bp+(bq+aq+ap)q)q + (bq+aq+ap)a + (bq+aq+ap)p )

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
				   (+ (* p p) (* q q))
				   (+ (* 2 q p) (* q q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

