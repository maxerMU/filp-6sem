(defun hypotenuse (a b) (sqrt (+ (* a a) (* b b))))
(hypotenuse 3 4)

(defun volume (a b c) (* a b c))
(volume 1 2 3)

(defun longer_than (a b) (> (length a) (length b)))
(longer_than '(1 2 3 4 5) '(1 2 3 4))

(defun f-to-c (temp) (* (/ 5 9) (- temp 320)))
(f-to-c 451)
