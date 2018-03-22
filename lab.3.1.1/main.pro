% Natalya Bairamova

implement main
    open core, console

class predicates
    sum : (integer Num, integer Result [out]).

clauses
    sum(N, -2) :-
        N <= 1,
        write(N, " ", -2),
        nl,
        !.

    sum(N, S) :-
        sum(N - 1, S1),
        S = S1 - 2 * N,
        write(N, " ", S),
        nl.

    run() :-
        sum(6, Result),
        write(Result),
        nl,
        _ = readLine().  % place your own code here

end implement main

goal
    console::run(main::run).
