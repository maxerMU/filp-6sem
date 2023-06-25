:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_path)).
:- use_module(library(http/http_server_files)).

:- initialization server.


:- dynamic student/3.
:- dynamic interes/2.
:- dynamic mentor/4.


student("19u469", "Агеев Даниэль Алиханович", budget).
student("19u112", "Аксенов Егор Юрьевич", budget).
student("19u361", "Алахов Андрей Германович", budget).
student("19u365", "Алферова Ирина Викторовна", budget).
student("19u116", "Андреев Александр Алексеевич", budget).
student("19u367", "Анохина Карина Алексеевна", budget).
student("19u506", "Артемьев Илья Олегович", budget).
student("19u377", "Багиров Саид Низамутдинович", budget).
student("19u125", "Базалеев Фёдор Евгеньевич", budget).
student("19u128", "Барков Максим Дмитриевич", budget).
student("19u131", "Барышникова Юлия Геннадьевна", budget).
student("19u133", "Батраков Денис Вадимович", budget).
student("19u141", "Боренко Анастасия Денисовна", budget).
student("19u390", "Борисов Максим Андреевич", budget).
student("19u750", "Бугаенко Андрей Павлович", budget).
student("19u394", "Буланый Константин Сергеевич", budget).
student("19u755", "Варин Дмитрий Владимирович", budget).
student("19u756", "Варламова Екатерина Алексеевна", budget).
student("19u153", "Власов Денис Владимирович", budget).
student("19u155", "Волков Михаил Максимович", budget).
student("19u413", "Володин Владислав Андреевич", budget).
student("19u159", "Воронин Егор Денисович", budget).
student("19u767", "Гриценко Алексей Михайлович", budget).
student("19u179", "Дегтярев Александр Игоревич", budget).
student("19u770", "Диордиев Кирилл", budget).
student("19uМ070", "Дроздецкая Полина Владимировна", budget).
student("19uМ074", "Евтушенко Евгений Романович", budget).
student("19u442", "Елгин Илья Юрьевич", budget).
student("19u446", "Ефимова Маргарита Владимировна", budget).
student("19u185", "Ефремов Роман Дмитриевич", budget).
student("19u186", "Жабин Дмитрий Владимирович", budget).
student("19u730", "Заборовская Анна Дмитриевна", budget).
student("19u450", "Зайцева Алена Андреевна", budget).
student("19uМ094", "Зоткин Александр Максимович", budget).
student("19uМ905", "Зоткина Наталия Сергеевна", budget).
student("19u462", "Иванова Мария Станиславовна", budget).
student("19u463", "Ивахненко Дмитрий Александрович", budget).
student("19u195", "Иммореева Мария Алексеевна", budget).
student("19u783", "Казаева Татьяна Алексеевна", budget).
student("19u203", "Кишов Гаджи Мурадович", budget).
student("19u485", "Клименко Алексей Константинович", budget).
student("19u486", "Климов Илья Сергеевич", budget).
student("19u206", "Ковалец Кирилл Эдуардович", budget).
student("19u492", "Козлова Ирина Васильевна", budget).
student("19u787", "Коротыч Михаил Дмитриевич", budget).
student("19u788", "Костев Дмитрий Игоревич", budget).
student("19u214", "Костоев Азамат Исаевич", budget).
student("19u791", "Котцов Матвей Дмитриевич", budget).
student("19u792", "Криков Антон Владимирович", budget).
student("19u221", "Крупень Илья Вадимович", budget).
student("19u793", "Кузин Алексей Дмитриевич", budget).
student("19u794", "Кузьмин Кирилл Олегович", budget).
student("19u231", "Лапаев Денис Андреевич", budget).
student("19u232", "Ларин Владимир Николаевич", budget).
student("19u525", "Леонов Владислав Вячеславович", budget).
student("19u798", "Лисичкин Глеб Олегович", budget).
student("19u239", "Лисневский Артем Витальевич", budget).
student("19u534", "Мазур Екатерина Алексеевна", budget).
student("19u801", "Македонская Валерия Михайловна", budget).
student("19u804", "Малышев Иван Алексеевич", budget).
student("19u540", "Маслова Марина Дмитриевна", budget).
student("19u811", "Межеровский Александр Сергеевич", budget).
student("19u548", "Миронов Григорий Александрович", money).
student("19u554", "Михеев Дмитрий Николаевич", money).
student("19u555", "Мицевич Максим Дмитриевич", money).
student("19u558", "Муравьев Илья Александрович", money).
student("19u560", "Мухамедиев Роман Надирович", money).
student("19uМ153", "Напреев Сергей Игоревич", money).
student("19u563", "Недолужко Денис Вадимович", money).
student("19u261", "Никуленко Илья Вячеславович", money).
student("19u818", "Нисхизов Виктор Владимирович", money).
student("19u587", "Параскун София Дмитриевна", money).
student("19u591", "Петрова Анна Алексеевна", money).
student("19u731", "Пилипчук Максим Викторович", money).
student("19u594", "Пинский Марк Григорьевич", money).
student("19u831", "Подпружников Никита Владиславович", money).
student("19u833", "Порошин Даниил Юрьевич", money).
student("19u609", "Прянишников Александр Николаевич", money).
student("19u838", "Руденко Илья Александрович", money).
student("19u290", "Рядинский Кирилл Владимирович", money).
student("19u292", "Салатов Хамит Хетагович", money).
student("19u637", "Серова Мария Николаевна", money).
student("19u638", "Сироткина Полина Юрьевна", money).
student("19u640", "Ском Эрик Павлович", money).
student("19u306", "Скотников Даниил Андреевич", money).
student("19u641", "Слепокурова Мария Федоровна", money).
student("19u648", "Солнцева Татьяна Викторовна", money).
student("19u651", "Супрунова Екатерина Алексеевна", money).
student("19u653", "Сучкова Татьяна Михайловна", money).
student("19u854", "Сысоева Виктория Романовна", money).
student("19u855", "Тагилов Александр Михайлович", money).
student("19u857", "Тартыков Лев Евгеньевич", money).
student("19u659", "Терехин Фёдор Алексеевич", money).
student("19u665", "Тонкоштан Андрей Алексеевич", money).
student("19u668", "Трошкин Николай Романович", money).
student("19u323", "Трунов Андрей Романович", money).
student("19u958", "Тумайкина Дарья", money).
student("19u961", "Филипенков Владислав Александрович", money).
student("19u962", "Фролов Евгений", money).
student("19u681", "Фролова Елена Владимировна", money).
student("19u963", "Халимов Илхом Садриддинович", money).
student("19u863", "Хамзина Регина Ренатовна", money).
student("19u867", "Хрюкин Арсений Александрович", money).
student("19u690", "Цветков Иван Алексеевич", money).
student("19u707", "Шацкий Никита Сергеевич", money).
student("19u708", "Шацкий Ростислав Евгеньевич", money).
student("19u710", "Шелия София Малхазовна", money).
student("19u871", "Шингаров Ильяс Девлетович", money).
student("19u349", "Шумнов Пётр Алексеевич", money).

mentor("stroganov", "Строганов Юрий Владимирович", 3, 2).
mentor("tolpinskaya", "Толпинская Наталья Борисовна", 1, 2).

interes("19u232", "Компьютерная графика").
interes("19u232", "Большие данные").

interes("stroganov", "Компьютерная графика").
interes("stroganov", "Большие данные").
interes("stroganov", "HASKEL").

interes("19u783", "Компьютерная лингвистика").
interes("19u783", "Большие данные").
interes("19u783", "HASKEL").



common_interes(StudentLogin, MentorLogin, Interes):-
    interes(StudentLogin, Interes),
    interes(MentorLogin, Interes).

all_common_interes(StudentLogin, MentorLogin, Interes):-
    bagof(I,common_interes(StudentLogin, MentorLogin, I), Interes).

all_common_interes_count(MentorLogin, StudentLogin, Name, Type, Count):-
    bagof(I,common_interes(StudentLogin, MentorLogin, I), Interes),
    length(Interes,Count),
    student(StudentLogin, Name, Type).

find_students(MentorLogin, StudentsPair, Type):-
    findall([Student, Name, Type, Count], all_common_interes_count(MentorLogin, Student, Name, Type, Count), StudentsPair).

take(N, _, Xs) :- N =< 0, !, N =:= 0, Xs = [].
take(_, [], []).
take(N, [X|Xs], [X|Ys]) :- N > 0, M is N-1, take(M, Xs, Ys).

prepare_students(MentorLogin, StudentsPair, Type, Count):-
    find_students(MentorLogin, UnsortedStudentsPair, Type)
    , sort(2, @>, UnsortedStudentsPair,  StudentsPair)
    %,ghjkl
    .

add_mentor(Login, Name, Budget, Money):-
    assertz(mentor(Login, Name, Budget, Money)).

add_student(Login, Name, Type):-
    assertz(student(Login, Name, Type)).

add_interes(Login, Interes):-
    assertz(interes(Login, Interes)).


	
% :- http_handler(root(.), my_func, []).

% my_func(_Request):-
%     reply_json(json{field:"hello"}).


file_search_path(static, '/home/volodya/Рабочий стол/iu7/falp/server/static').
http:location(static,	root(.), []).
:- http_handler(static(.), serve_files_in_directory(static), [prefix]).




:- http_handler(root(mentor/Mentor), get_mentor_handler(Mentor), []).

get_mentor_handler(AMentor, _Request):-
    atom_string(AMentor, Mentor),
	mentor(Mentor, Name, Budget, Money), !,
    findall(X, interes(Mentor, X), IntersL),
    prepare_students(Mentor, BStudents, budget, Budget), !,
    prepare_students(Mentor, MStudents, money, Money), !,
	reply_json(json{mentor:json{login:Mentor, name: Name, budget:Budget, money:Money, interes: IntersL, students: json{
        budget:BStudents,
        money:MStudents
        }}}).

get_mentor_handler(_, _Request):-
    reply_json(json{}).

:- http_handler(root(student/Student), get_student_handler(Student), []).

get_student_handler(AStudent, _Request):-
    atom_string(AStudent, Student),
	student(Student, Name, Type), !,
    findall(X, interes(Student, X), IntersL),
	reply_json(json{student:json{login:Student, name: Name, type:Type, interes: IntersL}}).

get_student_handler(Student, _Request):-
    reply_json(json{query:Student}).


:- http_handler(root(students), get_students_handler, []).

get_students_handler(_Request):-
    findall(json{login:Student, name: Name, type:Type},student(Student, Name, Type), List),
	reply_json(json{students:List}).


:- http_handler(root(mentors), get_mentors_handler, []).

get_mentors_handler(_Request):-
    findall(json{login:Mentor, name: Name, budget:Budget, money:Money},mentor(Mentor, Name, Budget, Money), List),
	reply_json(json{mentors:List}).

:- http_handler(root(add/mentor), add_mentor_handler, []).

add_mentor_handler(Request):-
    http_parameters(Request,
        [ login(Login, [ string ]),
          name(Name, [ string ]),
          budget(Budget,   [integer]),
          money(Money,   [integer ])
        ]),
        Budget >= 0,
        Money >= 0,
    add_mentor(Login, Name, Budget, Money),
    reply_json(json{status:'ok'}).

add_mentor_handler(Request):-
    reply_json(json{status:'error'}).


:- http_handler(root(add/student), add_student_handler, []).

add_student_handler(Request):-
    http_parameters(Request,
        [ login(Login, [ string ]),
          name(Name, [ string ]),
          type(Type,   [atom])
        ]),
    member(Type, [budget, money]),
    add_student(Login, Name, Type),
    reply_json(json{status:'ok'}).

add_student_handler(_Request):-
    reply_json(json{status:'error'}).

:- http_handler(root(add/interes), add_interes_handler, []).
add_interes_handler(Request):-
    http_parameters(Request,
        [ login(Login, [ string ]),
          interes(Interes, [ string ])
        ]),
    add_interes(Login, Interes),
    reply_json(json{status:'ok'}).



server() :-
        http_server(http_dispatch, [port(3004)]).