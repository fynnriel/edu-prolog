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
    student("Ardeeva", "Alfiya", "152127").
    student("Valiullin", "Artur", "141701").
    student("Valitova", "Yulia", "152128").
    student("Bairamova", "Natalya", "141710").
    student("Kuramshin", "Amir", "154801").
    student("Zaripova", "Yulia", "141709").
    student("Ponikarovskaya", "Alisa", "1524141").
    student("Valiulin", "Daniil", "141700").
    student("Saifullina", "Alina", "152144").
    student("Sherishev", "Nikita", "140103").
    student("Kalimullina", "Elina", "152133").
    student("Iskhakova", "Elina", "152132").
    student("Vorona", "Maksim", "152129").
    check_stud() :-
        student(S, N, Num),
        front(Num, 2, Y, _),
        Y = "14",
        assert(old_student(S, N, Num)),
        retract(student(S, N, Num)).

    run() :-

        check_stud,
        save(students_db),
        save(old_students_db),
        fail
        or
        succeed.  % place your own code here

end implement main

goal
    console::run(main::run).
