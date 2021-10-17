(defn repeated
  [f n]
  (apply comp (repeat n f)))

(defn square
  [x]
  (* x x))

(println ((repeated square 2) 5))
