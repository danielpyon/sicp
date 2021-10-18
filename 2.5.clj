(defn expt
  [b n]
  (reduce * (repeat n b)))

(defn cons
  [a b]
  (* (expt 2 a) (expt 3 b)))

; 2^a * 3^b
; 2^2 * 3^3

(defn divides? [a b]
  (= 0 (mod b a)))

(defn car
  ([x counter]
   (if (divides? 2 x)
     (car (/ x 2) (inc counter))
     counter))
  ([x]
   (car x 0)))

(defn cdr
  ([x counter]
   (if (divides? 3 x)
     (cdr (/ x 3) (inc counter))
     counter))
  ([x]
   (cdr x 0)))

(println (car (cons 2 3))) ; 4*27=108
(println (cdr (cons 2 3)))
