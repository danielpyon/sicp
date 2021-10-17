(defn iterative-improve
 [good-enough? improve]
 (fn [guess]
   (if (good-enough? guess)
     guess
     (recur (improve guess)))))

(defn iterative-improve-two-args
 [good-enough? improve]
 (fn [guess prev]
   (if (good-enough? guess prev)
     guess
     (recur (improve guess) guess))))

(defn average [& nums]
  (/ (reduce + nums) (count nums)))

(defn sqrt
  [x]
  (def tolerance 0.00001)
  ((iterative-improve #(< (Math/abs (- (* % %) x)) tolerance)
                      #(average % (/ x %)))
   1.0))

(defn fixed-point
  [f first-guess]
  (def tolerance 0.00001)
  ((iterative-improve-two-args #(< (Math/abs (- %1 %2)) tolerance)
                               f)
   first-guess 0))

(println (sqrt 100))
(println (fixed-point #(average % (/ (Math/log 1000)
                                     (Math/log %)))
                      2.0))

