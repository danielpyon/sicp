(def dx 0.00001)

(defn smooth
  [f]
  (defn average [& nums]
    (/ (reduce + nums) (count nums)))
  #(average (f (- % dx)) (f %) (f (+ % dx))))

(defn repeated
  [f n]
  (apply comp (repeat n f)))

(defn n-fold-smooth
  [f n]
  (repeated (smooth f) n))

