(defn make-rat
  [n d]
  (defn gcd [a b]
    (if (zero? b)
      a
      (recur b (mod a b))))
  (let [g (gcd n d)]
    (if (>= (* (/ n g) (/ d g)) 0)
      (conj [] (Math/abs (/ n g)) (Math/abs (/ d g)))
      (conj [] (* -1 (Math/abs (/ n g))) (Math/abs (/ d g))))))

(defn numer
  [x]
  (first x))

(defn denom
  [x]
  (second x))

(println (make-rat 12 2938))
