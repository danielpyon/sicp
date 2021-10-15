(defn accumulate
  ([combiner null-value term a next b so-far]
   (if (> a b)
     so-far
     (recur combiner null-value term (next a) next b (combiner (term a) so-far))))
  ([combiner null-value term a next b]
   (accumulate combiner null-value term a next b null-value)))

(defn accumulate-recursive
  [combiner null-value term a next b]
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate-recursive combiner
                                    null-value
                                    term
                                    (next a)
                                    next
                                    b))))

(defn sum
  [term a next b]
  (accumulate-recursive + 0 term a next b))

(defn product
  [term a next b]
  (accumulate-recursive * 1 term a next b))

(println (accumulate-recursive + 0 identity 1 inc 10))

(println (sum identity 1 inc 10))
(println (product identity 1 inc 10))
