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
fs(name, model, price, phone).
ss(name, city, street, bankName, phone).

clauses

tel(max, "4785237", address("moscow", "baumanskaya", "5", "1")).
tel(egor, "123710", address("moscow", "baumanskaya2", "12", "4")).
tel(denis, "167765", address("moscow", "baumanskaya3", "6", "3")).
tel(kate, "123456", address("moscow", "baumanskaya4", "1", "2")).
tel(andrey, "987546", address("moscow", "baumanskaya5", "8", "4")).

car(max, "focus", "blue", 10000000).
car(kate, "juke", "red", 15000000).
car(denis, "volga", "black", 20000000).

deposit(egor, "sber", 1000).
deposit(max, "tinkoff", 20000).
deposit(denis, "raif", 100000).
deposit(kate, "sber", 10000).

fs(Name, Model, Price, Phone):- tel(Name, Phone, _), car(Name, Model, _, Price).

ss(Name, City, Street, Banks, Phone):- tel(Name, Phone, address(City, Street, _, _)), deposit(Name, Banks, _).

goal
fs(X, Y, Z, "4785237");
fs(_, Y, _, "4785237");
ss(egor, "moscow", X, Y, Z).