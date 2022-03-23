(ql:quickload "fiveam")

(load "./task.lisp")

(fiveam:test simple-test
  (fiveam:is (equalp (cons 1 -5) (solve-res 1 4 -5))))

(fiveam:test zero-discriminant-test
  (fiveam:is (equalp (cons -1 -1) (solve-res 1 2 1))))

(fiveam:test complex-test
  (fiveam:is (equalp (cons #C(0.0 1.0) #C(-0.0 -1.0)) (solve-res 1 0 1))))

(fiveam:run!)