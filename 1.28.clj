(defn expmod [base exp m]
  (defn square [x] (* x x))
  (cond (= exp 0) 1
        (even? exp)
         (let [sq (square (expmod base (/ exp 2) m))]
           (if (and (not (= sq 1))
                    (not (= sq (dec exp)))
                    (= (rem sq exp) 1))
             0
             (rem (square (expmod base (/ exp 2) m))
                  m)))
        :else
         (rem (* base (expmod base (- exp 1) m)) 
              m)))

(defn miller-rabbin-test
  [n]
  (->> (range 2 n)
       (every? #(= (expmod % (dec n) n) 1))))

(println (miller-rabbin-test 12))
