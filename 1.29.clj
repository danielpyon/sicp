(defn sum
  [term a next b]
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

; h/3 (f(a) + 4f(a+h) + 2f(a+2h) + 4f(a+3h) + ... f(a + nh))

(defn integral
  [f a b n] ; n is the number of slices
    (let [h (/ (- b a) n)
          add-2h #(+ % h h)]
      (* (/ h 3)
         (+ (f a)
            (* 2 (sum f a add-2h b))
            (* 4 (sum f (+ a h) add-2h b))
            (f b)))))

(println (integral #(* % %) 0 1 100))
