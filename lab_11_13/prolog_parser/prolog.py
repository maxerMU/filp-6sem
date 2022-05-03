from operator import le
import sys
import re

term_states = {"const": 0, "var": 1, "complex": 2, "anonym": 3}
term_regex = r"[a-zA-Z0-9_]+\(.*\)|[a-zA-Z0-9_\"]+"

class Term:
    def __init__(self, functor=None, rules=None, body=None) -> None:
        self.functor = functor
        self.rules = rules
        self.body = body

    def term_state(self):
        if self.rules or self.body:
            return term_states["complex"]

        is_var = r"[A-Z].*"
        if re.match(is_var, self.functor):
            return term_states["var"]
        
        if self.functor[0] == "_":
            if (len(self.functor) == 1):
                return term_states["anonym"]
            else:
                return term_states["var"]
        
        return term_states["const"]
    
    def contains_var(self, var_name):
        if self.rules:
            for rule in self.rules:
                if rule == var_name:
                    return True
        
        return False

    def copy_from_term(self, term):
        self.functor = term.functor
        self.rules = term.rules
        self.body = term.body
    
    def replace(self, variable, term):
        self_state = self.term_state()
        if self_state == term_states["anonym"] or self_state == term_states["const"]:
            return

        if self_state == term_states["var"]:
            if self.functor == variable:
                self.copy_from_term(term)
            
            return

        for i in range(len(self.rules)):
            self.rules[i].replace(variable, term)
        
        if (self.body):
            for i in range(len(self.body)):
                print("HERE", variable)
                print("HERE", term)
                self.body[i].replace(variable, term)
    
    # def __repr__(self) -> str:
    #     return "{functor: " + str(self.functor) + "\nrules: " + str(self.rules) + "\nbody: " + str(self.body) + "}\n"

    def __repr__(self) -> str:
        result = ""
        if self.functor:
            result += self.functor
        
        if self.rules:
            result += "("
            for i in range(len(self.rules)):
                result += self.rules[i].__repr__()
                if i != len(self.rules) -1:
                    result += ", "
            result += ")"
        
        return result

class Parser:
    def __init__(self, file) -> None:
        self.file = file
        self.clauses = []
        self.goals = []

        self.buf = ""
        self.read_buf()
        self.parse_buffer()

    def read_buf(self):
        with open(self.file, "r") as f:
            self.buf = f.read()
            # print(self.buf)

    def parse_body(self, body):
        res = []
        balance = 0
        prev = 0
        flag = 0
        for i in range(len(body)):
            if body[i] == '(':
                flag = 1
                balance += 1
            elif body[i] == ')':
                balance -= 1

            if balance == 0 and flag:
                flag = 0
                res.append(body[prev: i+1])
                prev = i + 1
        
        return res
    
    def extern_functor(self, header):
        pos = header.find('(') 
        if pos == -1:
            return header, None
        return header[ : pos], header[pos+1 : -1]

    def parse_header(self, header):
        res = re.findall(term_regex, header)
        header = res[0]

        functor, last = self.extern_functor(header)
        if last is None:
            return functor, None
        
        args = []
        open = 0
        state = 0
        brace_before = 0
        term = ""
        for lt in last:
            if state == 0:
                if lt != '(' and lt != ',':
                    term += lt
                elif lt == ',':
                    if brace_before != 1:
                        args.append(term.strip())
                    term = ""
                else:
                    state = 1
                    open = 1
                    term += "("
            else:
                if lt == '(':
                    open += 1
                    term += lt
                elif lt == ')':
                    open -= 1
                    term += lt
                    if open == 0:
                        state = 0
                        args.append(term.strip())
                        term = ""
                        brace_before = 1
                        continue
                else:
                    term += lt
            brace_before = 0
        
        if len(term) > 0:
            args.append(term.strip())
        return functor, args

    
    def parse_predicat(self, predicat):
        res = Term()
        body_predicates = []
        body_pos = predicat.find(":-")
        header = ""
        body = ""
        if body_pos != -1:
            res.body = []
            body = predicat[body_pos + 3:]
            body_predicates = self.parse_body(body)
            for body_predicat in body_predicates:
                res.body.append(self.parse_predicat(body_predicat))

        if body_pos == -1:
            header = predicat[:]
        else:
            header = predicat[:body_pos]

        functor, params = self.parse_header(header)

        res.functor = functor
        if params:
            res.rules = list(map(self.parse_predicat, params))
            # res.rules = head_res[1:]

        return res

    def parse_buffer(self):
        clause_ind = self.buf.find("clauses")
        goal_ind = self.buf.find("goal")

        clauses_str = self.buf[clause_ind + 8: goal_ind]
        self.parse_clauses(clauses_str)

        goals_str = self.buf[goal_ind + 5: -1]
        self.parse_goals(goals_str)

    def parse_clauses(self, clauses_str):
        clauses = list (filter(lambda x: re.search(term_regex, x), clauses_str.split(".")))
        for clause in clauses:
            term = self.parse_predicat(clause)
            if (term.functor):
                self.clauses.append(term)
    
    def parse_goals(self, goals_str):
        goals = list (filter(lambda x: re.search(term_regex, x), goals_str.split(".")))
        for goal in goals:
            term = self.parse_predicat(goal)
            if (term.functor):
                self.goals.append(term)


class Prolog:
    def __init__(self, clauses, goal) -> None:
        self.clauses = clauses
        self.goal = goal

        self.stack = []
        self.work_space = set()
        self.result = []

        self.last_replace_vars = [""]
        self.last_replace_terms = [Term()]
    
    # def eat(self):
    #     i = 0
    #     resolventa = [self.goal]
    #     while i < len(self.clauses):
    #         for term in resolventa:
    #             failure = self.unific(term, )

    #         failure = self.unific()
    #         if not failure:
    #             if self.clauses[i].body:
    #                 resolventa.clear()
    #                 self.stack.clear()
    #                 print(self.clauses[i].body)
    #                 print(len(self.clauses[i].body))
    #                 for j in range(len(self.clauses[i].body)):
    #                     for k in range(len(self.last_replace_vars)):
    #                         self.clauses[i].body[j].replace(self.last_replace_vars[k], self.last_replace_terms[k])
    #                     resolventa.append(self.clauses[i].body[j])
    #                 i = 0
    #             else:
    #                 i += 1
    #         else:
    #             i += 1
    
    def test_goal(self):
        for i in range(len(self.clauses)):
            failure = self.unific(self.goal, self.clauses[i])
            
            if not failure:
                print("-----------------------------------")
                print("solved: ", self.goal, " = ", self.clauses[i])
                self.print_result()

                if self.clauses[i].body:
                    print("Term has body need more iterations")
                    print("body terms:")
                    for term in self.clauses[i].body:
                        print(term)
                print("-----------------------------------")

    def unific(self, term1, term2) -> bool:
        failure = False
        self.stack.clear()
        self.result.clear()
        self.stack = [(term1, term2)]

        while len(self.stack) > 0 and not failure:
            print("~~~~~~~~~~~~~~~")
            print("stack")
            print(self.stack)
            print("~~~~~~~~~~~~~~~")
            self.work_space = self.stack.pop()
            failure = self.handle()


        return failure
    
    def handle(self): # Failure == True
        S = self.work_space[0]
        T = self.work_space[1]
        print("==========")
        print("handle")
        print("S term: ", S, "\nT term: ", T)
        print("==========")

        if S.term_state() == T.term_state() == term_states["const"]:
            return S.functor != T.functor
        
        if S.term_state() == term_states["var"]:
            if T.term_state() == term_states["complex"]:
                if T.contains_var(S.functor):
                    return True
            
            self.result.append((S, T))
            self.replace(S.functor, T)

        elif T.term_state() == term_states["var"]:
            if S.term_state() == term_states["complex"]:
                if S.contains_var(T.functor):
                    return True
            
            self.result.append((S, T))
            self.replace(T.functor, S)
        
        elif T.functor != S.functor or len(T.rules) != len(S.rules):
            return True
        
        else:
            for i in range(len(T.rules) -1, -1, -1):
                self.stack.append((S.rules[i], T.rules[i]))
        
        return False
            

    def replace(self, variable, term):
        # TODO Костылище (время половина пятого)
        self.last_replace_vars.append(variable)
        self.last_replace_terms.append(term)
        for i in range(len(self.stack)):
            self.stack[i][0].replace(variable, term)
            self.stack[i][1].replace(variable, term)

        for i in range(len(self.result)):
            self.result[i][0].replace(variable, term)
            self.result[i][1].replace(variable, term)
    
    def print_result(self):
        for i in range(len(self.result)):
            print(self.result[i][0], " = ", self.result[i][1])


def main():
    file = sys.argv[1]

    parser = Parser(file)
    # print(parser.clauses)
    # print(parser.goals)
    for goal in parser.goals:
        prolog = Prolog(parser.clauses, goal)
        prolog.test_goal()

if __name__ == "__main__":
    main()