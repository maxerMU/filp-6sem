(defun D (a b c) (- (* b b) (* 4 a c)))

(defun half-solve (D a b) (cons (/ (- D b) (* 2 a)) (/ (- (+ b D)) (* 2 a))))

(defun solve-res (a b c)
    (half-solve (sqrt (D a b c)) a b))


(defun solve-out (a b c stream)
    (let ((s (solve-res a b c)))
        (if (complexp (car s))
            (format stream
                "x1 = ~,2f + ~,2fi x2 = ~,2f - ~,2fi "
                (realpart (car s)) (imagpart (car s))
                (realpart (cdr s)) (imagpart (car s)))
            (if (= (car s) (cdr s))
                (format stream "x1 = x2 = ~,2f" (car s)) 
                (format stream
                    "x1 = ~,2f x2 = ~,2f" (car s) (cdr s))))))


(defun solve (a b c) (with-open-file (stream "outputFile.txt"
									  :direction :output
									  :if-exists :supersede)
									  (solve-out a b c stream)))
