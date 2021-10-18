(defn make-rectangle
  [w h]
  (conj [] w h))

(defn get-width
  [rect]
  (first rect))

(defn get-height
  [rect]
  (second rect))

(defn area
  [rect]
  (* (get-width rect) (get-height rect)))

(defn perimeter
  [rect]
  (+ (* 2 (get-width rect)) (* 2 (get-height rect))))
