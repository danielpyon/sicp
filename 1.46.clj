(defn iterative-improve
 [good-enough? improve]
 (fn [guess]
   (if (good-enough? guess)
     guess
     (recur (improve guess)))))


 
