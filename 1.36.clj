(def tolerance 0.00001)
(defn fixed-point
  [f first-guess]
  (defn close-enough?
    [v1 v2]
    (< (Math/abs (- v1 v2)) tolerance))
  (defn attempt
    [guess]
    (let [next (f guess)]
      (println next)
      (if (close-enough? guess next)
        next
        (attempt next))))
  (attempt first-guess))

; computing solution to x^x = 1000
(fixed-point #(/ (Math/log 1000) (Math/log %)) 2.0)

(println "--------------------")

; with average damping
(defn average [& nums]
  (/ (reduce + nums) (count nums)))

(fixed-point #(average % (/ (Math/log 1000) (Math/log %))) 2.0)

