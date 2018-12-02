:- use_module(library(dcg/basics)).
:- set_prolog_flag(double_quotes, codes).

input_list(List) :-
    read_file_to_string('input.txt', InputStr, []),
    split_string(InputStr, "\n", " \r", StrList),
    convlist([Str, Num]>>number_string(Num, Str), StrList, List).

run(Chars) :-
    phrase_from_file(match(Chars), 'input.txt').
    
match(Chars) -->
    lines(Codes),
    { maplist(string_codes, Chars, Codes) }.
    
lines([])     --> eos, !.
lines([L|Ls]) --> line(L), lines(Ls).

line([])     --> ( "\n" | eos ), !.
line([C|Cs]) --> [C], line(Cs).

%line(Codes) -->  string_without("\n", Codes).