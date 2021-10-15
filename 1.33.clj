(defn filtered-accumulate
  [combiner predicate null-value term a next b]
  (if (> a b)
    null-value
    (combiner (if (predicate (term a))
                (term a)
                null-value)
              (filtered-accumulate combiner
                                   predicate
                                   null-value
                                   term
                                   (next a)
                                   next
                                   b))))

(defn divides? [a b]
  (= (rem b a) 0))

(defn square [x]
  (* x x))

(defn find-divisor [n test]
  (defn next [x]
    (if (= x 2)
      3
      (+ x 2)))
  (cond (> (square test) n) n
		(divides? test n) test
		:else (recur n (next test))))

(defn smallest-divisor [n]
  (find-divisor n 2))

(defn prime? [x]
  (= x (smallest-divisor x)))


(defn sum-of-squares-of-primes
  [a b]
  (filtered-accumulate #(+ (square %1) %2) prime? 0 identity a inc b))

(println (filtered-accumulate * even? 1 identity 1 inc 10))
(println (reduce * (filter even? (range 1 11))))
(println (sum-of-squares-of-primes 2 100))


