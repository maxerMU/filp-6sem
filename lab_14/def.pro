domains
    name = symbol.
    sex = symbol.
    depth = integer.

predicates
parent(name, name).
person(name, sex).
grandparent(name, name, sex, sex).
motherN(name, name, depth).
brother(name, name).
sister(name, name).
uncle(name, name).
aunt(name, name).
cousine(name, name).
cousena(name, name).
grandfather(name, name).

clauses
grandparent(Child, Grandparent, Line, Sex) :-
    parent(Child, Parent),
    person(Parent, Line),
    parent(Parent, Grandparent),
    person(Grandparent, Sex).

motherN(Child, MotherN, 1) :- parent(Child, MotherN), person(MotherN, female).
motherN(Child, MotherN, N) :- N1 = N - 1, parent(Child, Parent), motherN(Parent, MotherN, N1).


person(rosamum, female).
person(rosa, female).
person(abrammum, female).
person(abram, male).
person(grandmarinamum, female).
person(grandmarinadad, male).
person(nina, female).
person(eugenia, female).
person(konstantin, male).
person(konstantinson, male).
person(alexandra, female).
person(mark, male).
person(marina, female).
person(grandvladimir, male).
person(grandmarina, female).
person(dima, male).
person(vladimir, male).
person(max, male).

parent(rosa, rosamum).
parent(abram, abrammum).
parent(grandmarina, grandmarinamum).
parent(grandmarina, grandmarinadad).
parent(nina, abram).
parent(nina, rosa).
parent(eugenia, abram).
parent(eugenia, rosa).
parent(alexandra, eugenia).
parent(konstantin, abram).
parent(konstantin, rosa).
parent(konstantinson, konstantin).
parent(marina, nina).
parent(marina, mark).
parent(dima, grandvladimir).
parent(dima, grandmarina).
parent(vladimir, dima).
parent(max, dima).
parent(vladimir, marina).
parent(max, marina).

brother(Name, Brother) :- parent(Name, Parent1), parent(Brother, Parent1), person(Parent1, male), 
                          parent(Name, Parent2), parent(Brother, Parent2), person(Parent2, female), 
                          person(Brother, male), Brother <> Name.

sister(Name, Sister) :- parent(Name, Parent1), parent(Sister, Parent1), person(Parent1, male), 
                          parent(Name, Parent2), parent(Sister, Parent2), person(Parent2, female), 
                          person(Sister, female), Sister <> Name.

uncle(Name, Uncle) :- parent(Name, Parent), brother(Parent, Uncle).
aunt(Name, Aunt) :- parent(Name, Parent), sister(Parent, Aunt).

cousine(Name, Cousine) :- uncle(Name, Uncle), parent(Cousine, Uncle), person(Cousine, male).
cousine(Name, Cousine) :- aunt(Name, Aunt), parent(Cousine, Aunt), person(Cousine, male).

cousena(Name, Cousena) :- uncle(Name, Uncle), parent(Cousena, Uncle), person(Cousena, female).
cousena(Name, Cousena) :- aunt(Name, Aunt), parent(Cousena, Aunt), person(Cousena, female).

grandfather(Name, GrandFather) :- grandparent(Name, GrandFather, _, male).
goal
%motherN(max, MotherN, 3).
%brother(max, Brother).
%sister(nina, Sister).
%uncle(marina, Uncle).
%aunt(marina, Aunt).
%cousine(marina, Cousine).
%cousena(marina, Cousena).
grandfather(max, Grandfather).
%grandparent(max, Grandparent, _, female).
%grandparent(max, Grandparent, _, male).
%grandparent(max, Grandparent, _, _).
%grandparent(max, Grandparent, female, female).
%grandparent(max, Grandparent, female, _).
