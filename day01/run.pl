:- use_module(day01).
:- initialization(main).

main :-
    ( solve_day01(Sum, Dup),
      print(Sum),
      nl,
      print(Dup),
      halt
    )
    ; halt.