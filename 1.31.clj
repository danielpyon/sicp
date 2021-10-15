(defn product
  [term a next b]
  (if (> a b)
    1
    (* (term a) (product term (next a) next b))))

(defn product-iter
  ([term a next b product]
   (if (> a b)
     product
     (recur term (next a) next b (* product (term a)))))
  ([term a next b]
   (product-iter term a next b 1)))

(defn product-of-integers
  [n]
  (product identity 1 inc n))

(defn approximate-pi
  [n]
  (defn square [x] (* x x))
  (defn add-2 [x] (+ x 2))
  (* 4 (/ (/ (* 2 (square (product-iter identity 4 add-2 n)))
          (square (product-iter identity 3 add-2 n))) n)))

(println (double (approximate-pi 20)))
