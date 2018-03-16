% Natalya Bairamova

implement main
    open core, console

class facts
    male : (string).
    female : (string).
    parent : (string, string).

class predicates
    mother : (string Mother, string Child) nondeterm anyflow.
    father : (string Father, string Child) nondeterm anyflow.
    grandfather : (string Grandpa, string Grandchild) nondeterm anyflow.
    grandmother : (string Grandma, string Grandchild) nondeterm anyflow.

clauses
    male("Афанасий").
    male("Антон").
    male("Владимир").
    male("Николай").
    male("Олег").

    female("Евдокия").
    female("Пелагея").
    female("Лидия").
    female("Марина").
    female("Дарья").
    female("Наталья").

    parent("Афанасий", "Владимир").
    parent("Антон", "Лидия").
    parent("Владимир", "Олег").
    parent("Владимир", "Марина").
    parent("Николай", "Наталья").
    parent("Николай", "Дарья").
    parent("Евдокия", "Владимир").
    parent("Пелагея", "Лидия").
    parent("Лидия", "Марина").
    parent("Марина", "Наталья").
    parent("Марина", "Дарья").

    mother(Mother, Child) :-
        female(Mother),
        parent(Mother, Child).

    father(Father, Child) :-
        male(Father),
        parent(Father, Child).

    grandfather(Grandpa, Grandchild) :-
        male(Grandpa),
        parent(Grandpa, Parent),
        parent(Parent, Grandchild).

    grandmother(Grandma, Grandchild) :-
        female(Grandma),
        parent(Grandma, Parent),
        parent(Parent, Grandchild).

    run() :-
%        mother("Марина", X),
%        write(X),
%        nl,
%        fail
%        or
%        _ = readChar().
%        nl.

        grandmother(X, "Наталья"),
        mother(C, "Наталья"),
        write(X, " ", C),
        nl,
        fail
        or
        _ = readChar().

% place your own code here

end implement main

goal
    console::run(main::run).
