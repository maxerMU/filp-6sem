predicates
    max_of_two(real, real, real).
    max_of_two_1(real, real, real).
    max_of_three(real, real, real, real).
    max_of_three_1(real, real, real, real).

clauses
    max_of_two(A, B, A) :- A >= B.
    max_of_two(A, B, B) :- A < B.

    max_of_two_1(A, B, A) :- A >= B, !.
    max_of_two_1(_, B, B).

    max_of_three(A, B, C, A) :- A >= B, A >= C.
    max_of_three(A, B, C, B) :- B >= A, B >= C.
    max_of_three(A, B, C, C) :- C >= B, C >= A.

    max_of_three_1(A, B, C, A) :- A >= B, A >= C, !.
    max_of_three_1(_, B, C, B) :- B >= C, !.
    max_of_three_1(_, _, C, C).

goal
    max_of_two(1, 2, Max); % 2
    max_of_two(1, -2, Max); % 1
    max_of_two(1, 1, Max); % 1, 1

    max_of_two_1(1, 2, Max); % 2
    max_of_two_1(1, -2, Max); % 1
    max_of_two_1(1, 1, Max); % 1

    max_of_three(1, 2, 3, Max); % 3
    max_of_three(1, 3, 2, Max); % 3
    max_of_three(2, 1, 3, Max); % 3
    max_of_three(2, 2, 3, Max); % 3
    max_of_three(2, 3, 2, Max); % 3
    max_of_three(3, 2, 1, Max); % 3
    max_of_three(3, 1, 2, Max); % 3
    max_of_three(3, 2, 2, Max); % 3
    max_of_three(111, 111, 111, Max); % 111 111 111

    max_of_three_1(1, 2, 3, Max); % 3
    max_of_three_1(1, 3, 2, Max); % 3
    max_of_three_1(3, 2, 1, Max); % 3
    max_of_three_1(3, 1, 2, Max); % 3
    max_of_three_1(2, 1, 3, Max); % 3
    max_of_three_1(2, 2, 3, Max); % 3
    max_of_three_1(2, 3, 2, Max); % 3
    max_of_three_1(3, 2, 2, Max); % 3
    max_of_three_1(111, 111, 111, Max). % 111