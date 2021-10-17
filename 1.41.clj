(defn double
  [f]
  #(f (f %)))

(println
  (((double (double double)) inc) 5))
