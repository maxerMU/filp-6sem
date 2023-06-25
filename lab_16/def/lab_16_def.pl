:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_path)).
:- use_module(library(http/http_server_files)).

:- initialization server.

:- dynamic student/3.
:- assert(student("Max", "state", "oop")).
:- assert(student("Kate", "state", "os")).
:- assert(student("Denis", "state", "modeling")).
:- assert(student("Egor", "state", "linguistic")).
:- assert(student("Andrey Alahov", "state", "oop")).
:- assert(student("Denis Nedoluzhko", "state", "cryptography")).
:- assert(student("Random4 Random4", "state", "cryptography")).
:- assert(student("Random5 Random5", "state", "oop")).
:- assert(student("Random6 Random6", "state", "oop")).
:- assert(student("Helen Frolova", "commercial", "db")).
:- assert(student("Fedor Bazaleev", "commercial", "chill")).
:- assert(student("Random1 Random1", "commercial", "chill")).
:- assert(student("Random2 Random2", "commercial", "not oop")).
:- assert(student("Random3 Random3", "commercial", "modeling")).

:- dynamic educator/3.
:- assert(educator("Tassov", [3, 1], "oop")).
:- assert(educator("Ryzanova", [2, 0], "os")).
:- assert(educator("Stroganov", [1, 1], "linguistic")).
:- assert(educator("Gradov", [1, 1], "modeling")).
:- assert(educator("Kostritsky", [2, 2], "not oop")).
:- assert(educator("SWAP", [999, 999], "SWAP")).

append([H|T], SList, [H|Ans]) :- append(T, SList, Ans), !.
append([], SList, SList).

%distribute(Students, NoInteres, Res).

distribute([], [], Res) :- Res = [], !.

distribute([Head | Tail], NoInteres, [[Head, EducatorName] | ResTail]) :- 
    student(Head, StudentForm, StudentInterest),
    StudentForm = "state",
    educator(EducatorName, [EducatorState | EducatorCommercial], StudentInterest),
    EducatorState > 0,
    retract(educator(EducatorName, [EducatorState | EducatorCommercial], StudentInterest)),
    NewState is EducatorState - 1,
    assert(educator(EducatorName, [NewState | EducatorCommercial], StudentInterest)),
    distribute(Tail, NoInteres, ResTail),
    !.

distribute([Head | Tail], NoInteres, [[Head, EducatorName] | ResTail]) :- 
    student(Head, StudentForm, StudentInterest),
    StudentForm = "commercial",
    educator(EducatorName, [EducatorState | EducatorCommercial], StudentInterest),
    EducatorCommercial > 0,
    retract(educator(EducatorName, [EducatorState | EducatorCommercial], StudentInterest)),
    NewCommercial is EducatorCommercial - 1,
    assert(educator(EducatorName, [EducatorState | NewCommercial], StudentInterest)),
    distribute(Tail, NoInteres, ResTail),
    !.

distribute([Head | Tail], NoInterest, ResTail) :- 
    append(NoInterest, [Head], NewNoInterest),
    distribute(Tail, NewNoInterest, ResTail),
    !.

distribute([], [Head | Tail], [[Head, EducatorName] | ResTail]) :-
    student(Head, "state", _),
    educator(EducatorName, [EducatorState | EducatorCommercial], Interest),
    EducatorState > 0,
    retract(educator(EducatorName, [EducatorState | EducatorCommercial], Interest)),
    NewState is EducatorState - 1,
    assert(educator(EducatorName, [NewState | EducatorCommercial], Interest)),
    distribute([], Tail, ResTail),
    !.

distribute([], [Head | Tail], [[Head, EducatorName] | ResTail]) :-
    student(Head, "commercial", _),
    educator(EducatorName, [EducatorState | EducatorCommercial], Interest),
    EducatorCommercial > 0,
    retract(educator(EducatorName, [EducatorState | EducatorCommercial], Interest)),
    NewCommercial is EducatorCommercial - 1,
    assert(educator(EducatorName, [EducatorState | NewCommercial], Interest)),
    distribute([], Tail, ResTail),
    !.


distribute(Res) :-
    findall(Name, student(Name, _, _), Lst),
    distribute(Lst, [], Res).

:- http_handler(root(distribute), distribute_educators, []).
distribute_educators(_Request) :-
    distribute(Res),
    reply_json(json{distribution: Res}), !.

distribute_educators(_Request) :-
    reply_json(json{distribution: []}).

:- http_handler(/, say_hi, []).

say_hi(_Request) :-
    format('Content-type: text/plain~n~n'),
    format('Hello World!~n').

server() :-
        http_server(http_dispatch, [port(3004)]).