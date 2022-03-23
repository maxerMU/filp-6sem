(defun last-1 (lst)
    (if (eql (cdr lst) nil)
        (car lst)
        (last-1 (cdr lst))))

(defun last-2 (lst)
    (reduce #'(lambda (prev next) next) lst))

(last-1 `(1 2 3 4 5))
(last-1 `(1 (2 3) ((4 5))))

(last-2 `(1 2 3 4 5))
(last-2 `(1 (2 3) ((4 5))))

(defun rem-last-2-arg (lst res)
    (if (cdr lst)
        (rem-last-2-arg (cdr lst) (append res (list (car lst))))
        res))

(defun rem-last-1 (lst)
    (rem-last-2-arg lst ()))

(defun rem-last-2 (lst)
    (cond ((null lst) nil)
          ((null (cdr lst)) nil)
          (t (cons (car lst) (rem-last-2 (cdr lst))))))

(rem-last-1 `(1 2 3 4 5))
(rem-last-2 `(1 2 3 4 5))

(defun is-win-comb (p1 p2)
    (or (eql (+ p1 p2) 7) (eql (+ p1 p2) 11)))

(defun is-repeat (p1 p2)
    (or (and (eql p1 1) (eql p2 1)) (and (eql p1 6) (eql p2 6))))

(defun play-step () 
    (let* ((cube1p (+ (random 6) 1))
           (cube2p (+ (random 6) 1)))
        (cond ((is-win-comb cube1p cube2p) 
               (and (print `(wining combination cube1 - ,cube1p cube2 - ,cube2p))
                    (list t (+ cube1p cube2p))))
              ((is-repeat cube1p cube2p) (play-step))
              (t 
               (and (print `(not wining combination cube1 - ,cube1p cube2 - ,cube2p))
                    (list nil (+ cube1p cube2p)))))))

(defun play-game ()
    (let ((res1 (and (print `(player1 step)) (play-step))))
        (if (first res1)
            (print `(player1 is a winner))
            (let ((res2 (and (print `(player2 step)) (play-step))))
                (if (or (first res2) (> (second res2) (second res1)))
                    (print `(player2 is a winner))
                    (if (eql (second res1) (second res2))
                        (print `(DRAW))
                        (print `(player1 is a winner))))))))

(play-game)
(play-game)
(play-game)
(play-game)
(play-game)
(play-game)