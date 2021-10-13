; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

(define (square x)
  (* x x))

(define (sum-of-squares . numbers)
  (foldr + 0 (map square numbers)))

(define (sum-of-larger-squares x y z)
  (- (sum-of-squares x y z) (square (min x y z))))

(display (sum-of-squares 1 2 3))
(display "\n")
