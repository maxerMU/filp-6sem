;1
(defun list-compare (lst1 lst2)
    (cond ((and (null lst1) (null lst2)) T)
          ((eql (car lst1) (car lst2)) (list-compare (cdr lst1) (cdr lst2)))))

(defun is-polyndrome (lst) (list-compare lst (reverse lst)))

;(write (is-polyndrome '(1 2 3 2 1)))
;(write (is-polyndrome '(1 2 3 4 5)))

;2
(defun is-included (inlst outlst)
    (cond ((null inlst) T)
          ((member (car inlst) outlst) (is-included (cdr inlst) outlst))))

(defun set-equal (lst1 lst2)
    (and (eq (length lst1) (length lst2))
         (is-included lst1 lst2)
         (is-included lst2 lst1)))

;(write (set-equal '(1 1 2 5 8) '(5 1 2 8 1)))
;(write (set-equal '(1 1 2 5 8 9) '(4 5 1 2 8 1)))

;3
(defun get-capital (table country)
    (cond ((null table) nil)
          ((equal (caar table) country) (cdar table))
          (T (get-capital (cdr table) country))))

(defun get-country (table capital)
    (cond ((null table) nil)
          ((equal (cdar table) capital) (caar table))
          (T (get-country (cdr table) capital))))

;(write (get-capital '((Russia . Moscow) (France . Paris) (Italy . Rome) (England . London)) 'England))
;(write (get-country '((Russia . Moscow) (France . Paris) (Italy . Rome) (England . London)) 'Rome))

;4
(defun swap-first-last (lst)
    (append (last lst)
            (cdr (reverse (cdr (reverse lst))))
            (cons (car lst) nil)))

;(write (swap-first-last `(1 2 3 4 5)))

;5
(defun append-element (lst el)
    (append lst (cons el nil)))

(defun swap (lst el1 el2 pos1 pos2 res ind)
    (cond ((null lst) res)
          ((eql pos1 ind) (swap (cdr lst) el1 el2 pos1 pos2 (append-element res el2) (+ ind 1)))
          ((eql pos2 ind) (swap (cdr lst) el1 el2 pos1 pos2 (append-element res el1) (+ ind 1)))
          (T (swap (cdr lst) el1 el2 pos1 pos2 (append-element res (car lst)) (+ ind 1)))))

(defun swap-two-elements (lst pos1 pos2)
    (swap lst (nth pos1 lst) (nth pos2 lst) pos1 pos2 () 0))

; (write (swap-two-elements `(1 2 3 4 5) 1 3))

;6
(defun append-element (lst el)
    (append lst (cons el nil)))

(defun swap-to-left (lst)
    (append-element (cdr lst) (car lst)))

(defun swap-to-right (lst)
    (append (last lst) (reverse (cdr (reverse lst)))))

; (write (swap-to-left `(1 2 3 4 5)))
; (write (swap-to-right `(1 2 3 4 5)))

;7
(defun append-element (lst el)
    (append lst (cons el nil)))

(defun existp (lst pair)
    (cond ((null lst) nil)
          ((and (eql (caar lst) (car pair)) (equal (cdar lst) (cdr pair))) T)
          (T (existp (cdr lst) pair))))

(defun add-to-set (pair lst)
    (if (existp lst pair)
        lst
        (append-element lst pair)))

; (write (add-to-set '(1 2) '((1 2) (3 4) (5 6))))
; (write (add-to-set '(7 8) '((1 2) (3 4) (5 6))))

;8
(defun mult-only-numbers (lst num)
    (cons (* (car lst) num) (cdr lst)))

(defun mult-first-number (lst num)
    (cond ((numberp (first lst)) (mult-only-numbers lst num))
          ((numberp (second lst)) (list (first lst) (* (second lst) num) (third lst)))
          ((numberp (third lst)) (list (first lst) (second lst) (* (third lst) num)))))

; (write (mult-only-numbers `(5 2 3) 10))
; (write (mult-first-number `((5) (2 4) 3) 10))

;9
(defun betweenp (el b1 b2)
    (< (* (- el b1) (- el b2)) 0))

(defun select-between (lst b1 b2)
    (cond ((null lst) nil)
          ((betweenp (car lst) b1 b2) (cons (car lst) (select-between (cdr lst) b1 b2)))
          (T (select-between (cdr lst) b1 b2))))

; (write (select-between `(1 2 8 4 3 7 6) 3 8))