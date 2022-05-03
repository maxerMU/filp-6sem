domains
name, phone, univer = symbol.
model, color = symbol.
bankName = symbol.
amount, price, size = integer.
city, street, house, flat = symbol.
address = address(city, street, house, flat).


property =
    automobile(name, color, price);
    water_transport(name, color, price);
    building(name, price, size);
    land(name, price, size).

predicates

tel(name, phone, address).
deposit(name, bankName, amount).
own(name, property).
property_name_price(name, name, price).

clauses
property_name_price(Surname, Name, Price) :-
    own(Surname, automobile(Name, _, Price)).
property_name_price(Surname, Name, Price) :-
    own(Surname, water_transport(Name, _, Price)).
property_name_price(Surname, Name, Price) :-
    own(Surname, building(Name, Price, _)).
property_name_price(Surname, Name, Price) :-
    own(Surname, land(Name, Price, _)).

own(max, automobile("focus", "blue", 10000000)).
own(max, building("BigHouse", 55000000, 500)).
own(egor, automobile("ford", "black", 10000000)).
own(denis, water_transport("volga water", "black", 10000000)).
own(denis, water_transport("volga", "black", 10000000)).
own(denis, building("VeryBigHouse", 55000000, 500)).


tel(max, "4785237", address("moscow", "baumanskaya", "5", "1")).
tel(egor, "123710", address("moscow", "baumanskaya2", "12", "4")).
tel(egor, "123512", address("moscow", "baumanskaya2", "12", "4")).
tel(denis, "167765", address("moscow", "baumanskaya3", "6", "3")).

deposit(max, "tinkoff", 20000).
deposit(max, "sber", 20000).
deposit(egor, "sber", 1000).
deposit(denis, "raif", 100000).

goal
property_name_price(max, Name, _).
property_name_price(max, Name, Price).
