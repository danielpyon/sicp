(defn cubic
  [a b c]
  (defn cube [x] (* x x x))
  (defn square [x] (* x x))
  #(+ (cube %) (* a (square %)) (* b %) c))

