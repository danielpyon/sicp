(defn make-segment
  [p q]
  (conj [] p q))

(defn start-segment
  [s]
  (first s))

(defn end-segment
  [s]
  (second s))

(defn make-point
  [x y]
  (conj [] x y))

(defn x-point
  [p]
  (first p))

(defn y-point
  [p]
  (second p))

(defn midpoint-segment
  [s]
  (defn average [& nums]
    (/ (reduce + nums) (count nums)))
  (let [start (start-segment s)
        end (end-segment s)]
    (make-point (average (x-point start) (x-point end))
                (average (y-point start) (y-point end)))))


