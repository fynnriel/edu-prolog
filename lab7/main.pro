% Natalya Bairamova

implement main
    open core, console, string

class predicates

    del_spaces : (string, string [out]).

clauses

    del_spaces(A, S) :-
        length(A) = 1,
        S = A,
        !.
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
