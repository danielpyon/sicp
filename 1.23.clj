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

(defn expmod [base exp m]
  (cond (= exp 0) 1
        (even? exp)
         (rem (square (expmod base (/ exp 2) m))
              m)
        :else
         (rem (* base (expmod base (- exp 1) m)) 
              m)))

(def random rand-int)

(defn fermat-test [n]
  (defn try-it [a]
    (= (expmod a n n) a))
  (try-it (inc (random (dec n)))))

(defn fast-prime? [n times]
  (cond (= times 0) true
        (fermat-test n) (fast-prime? n (- times 1))
        :else false))

(defn timed-prime-test [n fast?]
  (let [test (if fast? fast-prime? prime?)]
    (time (test n))))

(defn search-for-primes [low high]
  "Returns a lazy seq of primes in range low to high"
  (filter prime?
          (range (if (odd? low) low (inc low))
                 high)))

(time (search-for-primes 10000 100000))
(time (search-for-primes 100000 1000000))
