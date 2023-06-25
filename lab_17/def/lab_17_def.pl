first(Lst, Res) :- Res = Lst.

secir(List, List, [], 0).
secir([H|T], HalfList, [H|Ans], HalfLen) :- NewHalfLen is HalfLen - 1,
                                            secir(T, HalfList, Ans, NewHalfLen).

append([H|T], SList, Center, [H|Ans]) :- append(T, SList, Center, Ans), !.
append([], SList, Center, [Center|SList]).

append([H|T], SList, [H|Ans]) :- append(T, SList, Ans), !.
append([], SList, SList).
    
merge([H|T], SList, Ans, 1) :- append(T, SList, H, Ans).
merge(List, SList, Ans, 0) :- append(List, SList, Ans).

second(List, Ans) :- length(List, Len),
                     HalfLen is Len div 2,
                     Odd is Len mod 2,
                     secir(List, HalfList, SList, HalfLen),
                     merge(HalfList, SList, Ans, Odd), !.

third([A], [A]) :- !.
third([], []) :- !.
third([A, B | Tail], [B, A | Res]) :- third(Tail, Res).

reverse([],Z,Z).
reverse([H|T],Z,Acc) :- reverse(T,Z,[H|Acc]).

fourth(List, Ans) :- length(List, Len),
                     HalfLen is Len div 2,
                     Odd is Len mod 2,
                     secir(List, HalfList, SList, HalfLen),
                     reverse(SList, Rev, []),
                     merge(HalfList, Rev, Ans, Odd), !.
