(defn sum
  [term a next b]
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

; h/3 (f(a) + 4f(a+h) + 2f(a+2h) + 4f(a+3h) + ... f(a + nh))


(defn incrementer
  []
  (let [counter (atom 0)]
    (fn [] (do (swap! counter inc) @counter))))

(defn integral
  [f a b n] ; n is the number of slices
  (let [h (/ (- b a) n)
        term ((fn []
                (let [counter (atom -1)]
                  (fn [x] (do (swap! counter inc)
                              (* (f x) (cond (= @counter 0) 1
                                             (= @counter (dec b)) 1
                                             (= (rem @counter 2) 1) 4
                                             (= (rem @counter 2) 0) 2)))))))
        next ((fn []
               (let [counter (atom -1)]
                 (fn [x] (do (swap! counter inc)
                            (+ x (* h @counter)))))))]
    (* (/ h 3)
       (sum term a next b))))

(println (integral #(* % %) 0 1 100))
