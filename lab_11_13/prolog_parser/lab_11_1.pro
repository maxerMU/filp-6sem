predicates
    phone(symbol, symbol)
    study(symbol, symbol)
    
    friend(symbol, symbol)
    name_and_phone_by_university(symbol, symbol, symbol)
clauses
    phone(max, "79151070860").
    phone(egor, "89031001249").
    phone(john, "89031041459").
    phone(denis, "791511438714").
    phone(denis, "79845494854").
    phone(dima, "38457928920").
    phone(dima, "27426492359").
    phone(alex, "845830998367").
    
    study(max, bmstu).
    study(egor, mtoosee).
    study(john, tvsu).
    study(denis, nsu).
    study(dima, bmstu).
    study(alex, nsu).
    study(alex, tvsu).
    
    name_and_phone_by_university(Name, Phone, University) :- phone(Name, Phone), study(Name, University).
goal
    name_and_phone_by_university(Name, Phone, bmstu).
