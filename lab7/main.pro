% Natalya Bairamova

implement main
    open core, console, string

class predicates
    sign : (char) determ.
    del_spaces : (string, string [out]).

clauses

    sign(A) :-
        A = '.'
        or
        A = ','
        or
        A = ';'
        or
        A = ':'
        or
        A = '?'
        or
        A = '!'
        or
        A = '-',
        !.
    sign(_) :-
        fail.

    del_spaces(A, S) :-
        frontChar(A, C1, B),
        frontChar(B, C2, _),
        C1 = ' ',
        C2 = ' ',
        del_spaces(B, D),
        S = D,
        !.
    del_spaces(A, S) :-
        frontChar(A, C1, B),
        frontChar(B, C2, _),
        C1 = ' ',
        sign(C2),
        del_spaces(B, D),
        S = D,
        !.
    del_spaces(A, S) :-
        frontChar(A, C1, B),
        del_spaces(B, D),
        S = concat(createFromCharList([C1]), D),
        !.
    del_spaces(_, "").
    run() :-
        write("Write a string:"),
        nl,
        A = readLine(),
        del_spaces(A, O),
        write(O),
        fail
        or
        succeed.  % place your own code here

end implement main

goal
    console::run(main::run).
