% Natalya Bairamova

implement main
    open core, console

class predicates
    recur : (integer, integer [out]).
    sum_odd1 : (integer, integer [out]) nondeterm.
    sum_odd2 : (integer, integer) nondeterm.
    sum_odd2 : (integer, integer, integer, integer) nondeterm.

clauses
    recur(0, 1) :-
        !.
    recur(1, 2) :-
        !.
    recur(N, X) :-
        N1 = N - 1,
        N2 = N - 2,
        recur(N1, X1),
        recur(N2, X2),
        X = X1 - 2 * X2.

    % non-tail recursion
    sum_odd1(0, 0) :-
        !.
    sum_odd1(N, 0) :-
        N < 3,
        !.
    sum_odd1(3, 3) :-
        !.
    sum_odd1(N, S) :-
        N mod 4 = 3,
        NewN = N - 4,
        sum_odd1(NewN, S1),
        S = S1 + N.
    sum_odd1(N, S) :-
        N mod 4 <> 3,
        NewN = N - 1,
        sum_odd1(NewN, S).

    % tail recursion
    sum_odd2(N, S) :-
        sum_odd2(N, 3, S, 0).
    sum_odd2(N, K, S, S) :-
        N < K,
        !.
    sum_odd2(N, K, S, S1) :-
        S2 = S1 + K,
        NewK = K + 4,
        sum_odd2(N, NewK, S, S2).

clauses
    run() :-
        write("Ex. 1"),
        nl,
        sum_odd1(read(), S),
        write(S),
        nl,

        write("Ex 2"),
        nl,
        sum_odd2(read(), S),
        write(S),
        nl,

        write("Ex 3"),
        nl,
        recur(read(), R),
        write(R),
        nl,
        fail.
    run() :-
        succeed().

end implement main

goal
    console::run(main::run).
