% Natalya Bairamova

implement main
    open core, console

class predicates
    zexclude : (integer*, integer* [out]).

clauses
    zexclude([], []).
    zexclude([H | T], Tail) :-
        H = 0,
        !,
        zexclude(T, Tail).
    zexclude([H | T], [H | Tail]) :-
        zexclude(T, Tail).

    run() :-
        zexclude([1, 2, 0, 4, 5, 0], New),
        write(New),
        _ = readLine().  % place your own code here

end implement main

goal
    console::run(main::run).
