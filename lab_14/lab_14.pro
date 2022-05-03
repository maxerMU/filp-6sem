domains
    name = symbol.
    sex = symbol.

predicates
parent(name, name, sex).
grandparent(name, name, sex, sex).

clauses
grandparent(Child, Grandparent, Line, Sex) :-
    parent(Child, Parent, Line),
    parent(Parent, Grandparent, Sex).

parent(max, marina, female).
parent(max, dima, male).
parent(marina, nina, female).
parent(marina, mark, male).
parent(dima, grandmarina, female).
parent(dima, grandvladimir, male).
parent(vladimir, dima, male).
parent(vladimir, marina, female).

goal
grandparent(max, Grandparent, _, female).
grandparent(max, Grandparent, _, male).
grandparent(max, Grandparent, _, _).
grandparent(max, Grandparent, female, female).
grandparent(max, Grandparent, female, _).
