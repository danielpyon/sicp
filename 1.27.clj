(defn square [x] (* x x))
(defn expmod [base exp m]
  (cond (= exp 0) 1
        (even? exp)
         (rem (square (expmod base (/ exp 2) m))
              m)
        :else
         (rem (* base (expmod base (- exp 1) m)) 
              m)))


(defn fermat-test
  [n]
  (->> (range 2 n)
       (every? #(= (expmod % n n) %))))

(def carmichael-numbers
  (list 561 1105 1729 2465 2821 6601))

(println (map fermat-test carmichael-numbers))
