% Natalya Bairamova

implement main
    open core, console

domains
    treetype =
        tree(integer, treetype, treetype);
        empty.

class predicates
    print_tree : (treetype).
    make_lst : (treetype, integer* [out]).
    conc : (integer*, integer*, integer* [out]).

clauses
    conc([], L, L).
    conc([X | L1], L2, [X | L3]) :-
        conc(L1, L2, L3).

    print_tree(empty) :-
        !.
    print_tree(tree(Root, Left, Right)) :-
        print_tree(Left),
        write(Root, "  "),
        print_tree(Right).
    make_lst(empty, []).
    make_lst(tree(Root, Left, Right), Lst) :-
        make_lst(Left, Lst_left),
        make_lst(Right, Lst_right),
        conc(Lst_right, [Root | Lst_left], Lst).
    run() :-
        write("Listing of roots"),
        nl,
        print_tree(tree(5, tree(3, tree(6, empty, empty), tree(4, empty, empty)), tree(10, tree(2, empty, empty), tree(8, empty, empty)))),
        nl,
        write("Resultative list:"),
        nl,
        make_lst(tree(5, tree(3, tree(6, empty, empty), tree(4, empty, empty)), tree(10, tree(2, empty, empty), tree(8, empty, empty))), Lst),
        write(Lst),
        _ = readLine().  % place your own code here

end implement main

goal
    console::run(main::run).
