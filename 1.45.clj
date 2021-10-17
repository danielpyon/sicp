(defn fixed-point
  [f first-guess]
  (def tolerance 0.00001)
  (defn close-enough? [a b]
    (< (Math/abs (- a b)) tolerance))
  (defn attempt [guess]
    (let [next (f guess)]
      (println guess)
      (if (close-enough? guess next)
        next
        (attempt next))))
  (attempt first-guess))

(defn average [& nums]
  (/ (reduce + nums) (count nums)))

(defn square-root
  [x]
  (fixed-point #(average % (/ x %))
               1.0))

(defn repeated
  [f n]
  (apply comp (repeat n f)))

(defn nth-root
  [n]
  (defn expt
    [b n]
    (reduce * (repeat n b)))
  (defn root [x]
    (fixed-point (repeated #(average % (/ x (expt % (dec n))))
                           n)
                 (Math/floor (/ (Math/log n) (Math/log 2)))))
  root)

; sqrt needed 1 damp
; cbrt needed 1 damp
; qrrt needed 2 damps
; 5root needed 2 damps
; 6root needed 2 damps
((nth-root 7) (expt 2 7))

