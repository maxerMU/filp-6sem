(defun near-even (x) 
  (if (equal (rem x 2) 0)
    x
    (+ x 1)
  )
)

;(near-even 9)
;(near-even 10)

(defun abs-plus-1 (x) 
  (if (> x 0)
    (+ x 1)
    (- x 1)
  )
)


;(abs-plus-1 10)
;(abs-plus-1 -10)

(defun sort-pair (x y) 
  (if (> x y)
    (list x y)
    (list y x)
  )
)

;(sort-pair 10 11)
;(sort-pair 10 -11)

(defun between (x y z) 
  (and (> x y) (< x z))
)

;(between 10 11 12)
;(between 10 9 12)

(defun greather-equal (x y) 
  (>= x y)
)

;(greather-equal 10 10)
;(greather-equal 10 11)
;(greather-equal 10 9)

(defun between-if (x y z) 
  (if (> x y) 
    (if (< x z)
      t
    )
  )
)

;(between-if 10 11 12)
;(between-if 10 9 12)

(defun between-cond (x y z) 
  (cond
    ((<= x y) nil)
    ((< x z) t)
  )
)

(between-cond 10 11 12)
(between-cond 10 9 12)
