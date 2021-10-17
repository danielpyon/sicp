(defn iterative-improve
 [good-enough? improve]
 (fn [guess]
   (if (good-enough? guess)
     guess
     (recur (improve guess)))))

(defn sqrt
  [x]
  (defn average [& nums]
    (/ (reduce + nums) (count nums)))
  (def tolerance 0.00001)
  (iterative-improve #(< (Math/abs (- (* % %) x)) tolerance)
                     #(average % (/ x %))))



(println ((sqrt 100) 1.0))
