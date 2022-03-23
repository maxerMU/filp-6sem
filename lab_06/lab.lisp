;1
(defun minus-ten (lst)
    (mapcar #'(lambda (x) (- x 10)) lst))

;2
(defun mlt-every-1 (num lst)
    (mapcar #'(lambda (x) (* x num)) lst))

(defun mlt-every-2 (num lst)
    (mapcar #'(lambda (x) 
        (cond ((numberp x) (* x num))
              ((atom x) x)
              (t (mlt-every-2 num x))))
        lst))

;3
(defun to-pairs (lst1 lst2)
    (mapcar #'equal lst1 lst2))

(defun is-same (lst1 lst2)
    (every #'identity (to-pairs lst1 lst2)))

(defun is-palyndrome (lst)
    (is-same lst (reverse lst)))

;4
(defun comp (lst1 lst2)
    (every #'identity (mapcar #'(lambda (elem)
                                    (if (find-if #'(lambda (x) (equal elem x)) lst2) T))
                                lst1)))

(defun set-equal (lst1 lst2) (if (= (length lst1) (length lst2)) (comp lst1 lst2)))

;5
(defun every-sqr (lst)
    (mapcar #'(lambda (x) (* x x)) lst))

;6
(defun betweenp (el b1 b2)
    (< (* (- el b1) (- el b2)) 0))

(defun select-between (lst b1 b2)
    (mapcan #'(lambda (elem) (if (betweenp elem b1 b2) (list elem)))
        lst))

;7
(defun decart (lstx lsty)
    (mapcan #'(lambda (x)
                    (mapcar #'(lambda (y) (list x y)) lsty))
                    lstx))

;9
(defun sum-sizes (lst) 
    (reduce #'(lambda (accum elem) (+ accum (length elem)))
        lst :initial-value 0))

(defun count-atoms (lst res)
    (cond ((null lst) res)
          ((atom (car lst)) (count-atoms (cdr lst) (+ res 1)))
          (t (+ res (count-atoms (cdr lst) 0) (count-atoms (car lst) 0)))))
(defun sum-help (lst)
    (mapcar #'(lambda (x) 
        (cond ((atom x) 1)
              ()
              (t (sum num x))))
        lst))