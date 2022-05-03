domains
name, phone, univer = symbol.
model, color = symbol.
bankName = symbol.
amount, price = integer.
city, street, house, flat = symbol.
address = address(city, street, house, flat).

predicates

tel(name, phone, address).
car(name, model, color, price).
deposit(name, bankName, amount).
pred (model, color, name, city, phone, bankName) .

clauses
pred (Model, Color, Name, City, Phone, Bank) :-
car(Name, Model, Color, _),
tel(Name, Phone, address(City, _, _, _)),
deposit(Name, Bank, _).

car(max, "ford", "red", 10000000).
car(egor, "focus", "blue", 10000000).
car(max, "focus", "blue", 10000000).
car(denis, "volga", "black", 20000000).

tel(max, "4785237", address("moscow", "baumanskaya", "5", "1")).
tel(egor, "123710", address("moscow", "baumanskaya2", "12", "4")).
tel(denis, "167765", address("moscow", "baumanskaya3", "6", "3")).

deposit(max, "tinkoff", 20000).
deposit(max, "sber", 20000).
deposit(egor, "sber", 1000).
deposit(denis, "raif", 100000).

goal
pred("opel", "white", Name, City, Phone, Bank).
pred("volga", "black", Name, City, Phone, Bank).
pred("focus", "blue", Name, City, Phone, Bank).
