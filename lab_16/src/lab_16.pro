domains
val, res, accumulator = integer.
predicates
factorial(val, res).
factorial_tmp(val, res, accumulator).

fib(val, res).
fib_tmp(val, val, val, res).

clauses
factorial_tmp(N, Res, Acc) :- N > 1, N1 = N - 1, Acc1 = Acc * N, factorial_tmp(N1, Res, Acc1), !.
factorial_tmp(_, Res, Acc) :- Res = Acc.
factorial(N, Res) :- factorial_tmp(N, Res, 1).

fib_tmp(N, X1, X2, Res) :- N > 2, X11 = X2, X21 = X1 + X2, N1 = N - 1, fib_tmp(N1, X11, X21, Res), !.
fib_tmp(_, _, X2, Res) :- Res = X2.
fib(N, Res) :- fib_tmp(N, 1, 1, Res).

goal
%factorial(5, Res).
fib(5, Res).
