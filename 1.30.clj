(defn sum
  [term a next b]
  (defn iter [a result]
    (if (> a b)
        result
        (recur (next a) (+ result (term a)))))
  (iter a 0))

(defn sum-integers
  [n]
  (sum identity 1 inc n))

(println (sum-integers 5))
