domains
	list = integer*

predicates
	length_tmp(integer, integer, list)
	length(integer, list)

	sum_tmp(integer, integer, list)
	sum(integer, list)

	oddsum_tmp(integer, integer, integer, list)
	oddsum(integer, list)

clauses
	length_tmp(Res, Len, [_ | Tail]) :- NewLen = Len + 1, length_tmp(Res, NewLen, Tail).
	length_tmp(Res, Len, []) :- Res = Len, !.
	length(Res, List) :- length_tmp(Res, 0, List).

	sum_tmp(Res, Sum, [Head | Tail]) :- NewSum = Sum + Head, sum_tmp(Res, NewSum, Tail).
	sum_tmp(Res, Sum, []) :- Res = Sum, !.
	sum(Res, List) :- sum_tmp(Res, 0, List).

	oddsum_tmp(N, Res, Sum, [Head | Tail]) :- N mod 2 = 1, N1 = N + 1, NewSum = Sum + Head, oddsum_tmp(N1, Res, NewSum, Tail), !.
	oddsum_tmp(N, Res, Sum, [Head | Tail]) :- N1 = N + 1, oddsum_tmp(N1, Res, Sum, Tail), !.
	oddsum_tmp(N, Res, Sum, []) :- Res = Sum, !.
	oddsum(Res, List) :- oddsum_tmp(0, Res, 0, List).

goal
	%length(Res, [1, 2, 3, 4]).
	%sum(Res, [1, 2, 3, 4]).
	oddsum(Res, [1, 2, 3, 4]).