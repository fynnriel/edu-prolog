% Natalya Bairamova

implement main
    open core, console, stdio, string

domains
    surname = string.
    name = string.
    number = string.

class facts - students_db
    student : (surname, name, number).

class facts - old_students_db
    old_student : (surname, name, number).

class predicates
    check_stud : () nondeterm.

clauses
    check_stud() :-
        student(S, N, Num),
        front(Num, 2, Y, _),
        Y = "14",
        assert(old_student(S, N, Num)),
        retract(student(S, N, Num)).

    run() :-
        file::consult("students_db.txt", students_db),
        check_stud,
        file::save("gap_year.txt", old_students_db),
        file::save("normal.txt", students_db),
        %save(students_db),
        %save(old_students_db),
        fail
        or
        succeed.  % place your own code here

end implement main

goal
    console::run(main::run).
