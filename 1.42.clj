(defn compose
  [f g]
  #(f (g %)))

(def square (fn [x] (* x x)))

(println ((compose square inc) 6))
