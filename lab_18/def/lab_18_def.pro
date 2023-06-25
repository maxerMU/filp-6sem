domains
    listEl = string*.
    pair = pair(string, integer)
    listPair = pair*.

predicates
    valence(string, integer)
    
    append(listPair, listPair, listPair)
    
    move_max_to_end(listPair, listPair)
    bubble_sort(listPair, listPair)
    
    makeValList(listEl, listPair)
    makeValList(listEl, pair, listPair)
    
    checkCmp(pair, listPair, listPair, listPair, listEl)
    
    fndCmp(listPair, listPair, listEl)
    fndCmp(listPair, listEl)
    
    findCompound(listEl, listEl)

clauses
    valence("H", 1).
	valence("Li", 1).
	valence("Be", 2).
	valence("B", 3).
	valence("C", 4).
	valence("N", 3).
	valence("O", 2).
	valence("F", 1).
	valence("Na", 1).
	valence("Mg", 2).
	valence("Al", 3).
	valence("Si", 4).
	valence("P", 5).
	valence("S", 6).
	valence("Cl", 7).
	valence("K", 1).
	valence("Ca", 2).
	valence("Sc", 3).
	valence("Ti", 4).
	valence("V", 2).
	valence("Cr", 6).
	valence("Mn", 2).
	valence("Fe", 3).
	valence("Co", 3).
	valence("Ni", 2).
	valence("Cu", 2).
	valence("Zn", 2).
	valence("Ga", 3).
	valence("Ge", 2).
	valence("As", 5).
	valence("Se", 2).
	valence("Br", 7).
	valence("Kr", 2).
	valence("Rb", 1).
	valence("Sr", 2).
	valence("Y", 3).
	valence("Zr", 2).
	valence("Nb", 5).
	valence("Mo", 2).
	valence("Tc", 7).
	valence("Ru", 2).
	valence("Rh", 5).
	valence("Pd", 1).
	valence("Ag", 3).
	valence("Cd", 2).
	valence("In", 3).
	valence("Sb", 5).
	valence("Te", 6).
	valence("I", 7).
	valence("Xe", 8).
	valence("Cs", 1).
	valence("Ba", 2).
	valence("La", 3).
	valence("Ce", 3).
	valence("Pr", 4).
	valence("Nd", 3).
	valence("Pm", 3).
	valence("Sm", 2).
	valence("Eu", 3).
	valence("Gd", 3).
	valence("Tb", 4).
	valence("Dy", 3).
	valence("Ho", 3).
	valence("Er", 3).
	valence("Tm", 2).
	valence("Yb", 3).
	valence("Lu", 3).
	valence("Hf", 2).
	valence("Ta", 5).
	valence("W", 2).
	valence("Re", 7).
	valence("Os", 2).
	valence("Ir", 6).
	valence("Pt", 1).
	valence("Au", 3).
	valence("Hg", 2).
	valence("Tl", 1).
	valence("Pb", 4).
	valence("Bi", 3).
	valence("Po", 2).
	valence("Fr", 1).
	valence("Ra", 2).
	valence("Ac", 3).
	valence("Th", 4).
	valence("Pa", 4).
	valence("U", 4).
	valence("Np", 3).
	valence("Pu", 4).
	valence("Am", 3).
	valence("Cm", 4).
	valence("Bk", 3).
	valence("Cf", 4).
	valence("Es", 2).
	valence("Fm", 3).
	valence("Md", 2).
	valence("No", 3).
	valence("Lr", 3).
	
    append([H|T], SList, [H|Ans]) :- append(T, SList, Ans), !.
    append([], SList, SList).
        
    move_max_to_end([], []):-!.
    move_max_to_end([Head], [Head]):-!.
    move_max_to_end([pair(Elf, First), pair(Els, Second)|Tail], [pair(Els, Second)|ListWithMaxEnd]):-
        First < Second, !,
        move_max_to_end([pair(Elf, First)|Tail], ListWithMaxEnd).
    move_max_to_end([First, Second|Tail], [First|ListWithMaxEnd]):-
        move_max_to_end([Second|Tail], ListWithMaxEnd).
  
    bubble_sort(SortedList, SortedList):-
        move_max_to_end(SortedList, DoubleSortedList),
        SortedList = DoubleSortedList, !.
    bubble_sort(List, SortedList):-
        move_max_to_end(List, SortedPart),
        bubble_sort(SortedPart, SortedList).
    
    makeValList([H|T], ValList) :- valence(H, NewVal), makeValList(T, pair(H, NewVal), ValList).
    makeValList([], Val, [Val|[]]).
    makeValList([H|T], Val, [Val|ValList]) :- valence(H, NewVal), makeValList(T, pair(H, NewVal), ValList).
    
    checkCmp(pair(El1, 0), [pair(El2, 0)|[]], [], _, [El1, El2]) :- !.
    
    checkCmp(pair(El1, 0), [H2|List], [], Rest, [El1|Ans]) :- 
        checkCmp(H2, List, [], Rest, Ans).
        
    checkCmp(pair(El1, 0), List2, [H|Unused], Rest, [El1|Ans]) :- 
        checkCmp(H, List2, Unused, Rest, Ans).
        
    checkCmp(Pair, [], Unused, [H|Rest], Ans) :- 
        checkCmp(Pair, [H], Unused, Rest, Ans).
    checkCmp(Pair, [], Unused, [_|Rest], Ans) :- 
        checkCmp(Pair, [], Unused, Rest, Ans).
        
    checkCmp(Pair, [pair(El2, 0)|List], Unused, Rest, [El2|Ans]) :- 
        checkCmp(Pair, List, Unused, Rest, Ans).
    
    checkCmp(pair(El1, V1), [pair(El2, V2)|List2], Unused, Rest, Ans) :- 
        V1 > 0,
        V2 > 0,
        NewV1 = V1 - 1,
        NewV2 = V2 - 1,
        checkCmp(pair(El1, NewV1), [pair(El2, NewV2)|List2], Unused, Rest, Ans).
    
    checkCmp(pair(El1, V1), [pair(El2, V2)|List2], Unused, Rest, Ans) :- 
        V1 > 0,
        V2 > 0,
        append(Unused, [pair(El2, V2)], NewUnused),
        checkCmp(pair(El1, V1), List2, NewUnused, Rest, Ans).
    
    fndCmp([pair(El1, V1)|_], [pair(El2, V2)|List2], Ans) :- 
        NewV1 = V1 - 1,
        NewV2 = V2 - 1,
        checkCmp(pair(El1, NewV1), [pair(El2, NewV2)], [], List2, Ans).
    
    fndCmp([_|[H|T]], [], Ans) :- fndCmp([H|T], T, Ans).
    fndCmp(List1, [_|List2], Ans) :- 
        fndCmp(List1, List2, Ans).
    fndCmp([H|T], Ans) :- fndCmp([H|T], T, Ans).
    
    findCompound(List, Ans) :- 
        makeValList(List, Val),
        bubble_sort(Val, SortVal),
        fndCmp(SortVal, Ans).

goal
    %checkCmp(pair("H", 1), [pair("Cl", 3)], [pair("O", 2)], [], Ans).
    %fndCmp([pair("H", 1), pair("O", 2), pair("C", 4), pair("Cl", 7), pair("Es", 2), pair("O", 2)], Ans).
    %fndCmp([pair("O", 2), pair("C", 4), pair("Es", 2), pair("O", 2)], Ans).
    findCompound(["C", "H", "H", "O"], Ans).
    %findCompound(["H", "H", "H", "H"], Ans).
