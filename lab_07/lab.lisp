;1
(defun move-to (lst result)
    (cond ((null lst) result)
          (T (move-to (cdr lst) (cons (car lst) result)))))

(defun my-reverse (lst)
    (move-to lst ()))

;2
(defun flistp (lst)
    (cond ((null (car lst)) Nil)
          ((listp (car lst)) (car lst))
          (T (flistp (cdr lst)))))

;3
(defun select-between (lst)
    (cond ((null lst) nil)
          ((and (> (car lst) 1) (< (car lst) 10)) (cons (car lst) (select-between (cdr lst))))
          (T (select-between (cdr lst)))))

;4
(defun mlt-1 (num lst)
    (cond ((null lst) nil)
          (t (cons (* (car lst) num) (mlt-1 num (cdr lst))))))

(defun mlt-any (num lst)
    (cond ((null lst) nil)
          ((numberp (car lst)) (cons (* (car lst) num) (mlt-any num (cdr lst))))
          ((atom (car lst)) (cons (car lst) (mlt-any num (cdr lst))))
          (t (cons (mlt-any num (car lst)) (mlt-any num (cdr lst))))))

;5
(defun betweenp (el b1 b2)
    (< (* (- el b1) (- el b2)) 0))

(defun select-between (lst b1 b2)
    (cond ((null lst) nil)
          ((betweenp (car lst) b1 b2) (cons (car lst) (select-between (cdr lst) b1 b2)))
          (T (select-between (cdr lst) b1 b2))))

;6
(defun add (lst res)
    (cond ((null lst) res) 
          ((numberp (car lst)) (add (cdr lst) (+ (car lst) res)))
          (t (add (cdr lst) res))))

(defun rec-add (lst) (add lst 0))

(defun add (lst res)
    (cond ((null lst) res) 
          ((numberp (car lst)) (add (cdr lst) (+ (car lst) res)))
          ((listp (car lst)) (+ res (add (car lst) 0) (add (cdr lst) 0)))
          (t (add (cdr lst) res))))

(defun rec-add (lst) (add lst 0))

;7
(defun recnth (lst ind) 
    (cond ((null lst) nil)
          ((= ind 0) (car lst))
          (T (recnth (cdr lst) (- 1 ind)))))

;8
(defun sub (lst res)
    (cond ((null lst) res)
          (T (sub (cdr lst) (and res (oddp (car lst)))))))

(defun allodd (lst)
    (sub lst T))

;9
(defun fodd (lst)
    (cond ((null lst) nil) 
    ((numberp (car lst)) (if (oddp (car lst)) (car lst) (fodd (cdr lst))))
    ((listp (car lst)) (let ((tmp (fodd (car lst)))) (if (null tmp) (fodd (cdr lst)) tmp)))
    (T (fodd (cdr lst)))))

;10
(defun sqr (lst)
    (cond ((null lst) nil)
          (t (cons (* (car lst) (car lst)) (sqr (cdr lst))))))