:- module(day01, [solve_day01/2]).
:- use_module([
    library(readutil),
    library(apply),
    library(yall),
    library(clpfd)
]).

% Starting frequency
start_value(0).

solve_day01(Sum, Duplicate) :-
    input_to_list('input01.txt', List),
    sum(List, #=, Sum),
    part2(List, Duplicate).

% Transform input file into a list of numbers
input_to_list(FileName, List) :-
    read_file_to_string(FileName, InputStr, []),
    split_string(InputStr, "\n", " \r", StrList),
    convlist([Str, Num]>>number_string(Num, Str), StrList, List).

add(X, Y, Sum):- Sum #= X + Y.

part2(FreqList, Dup) :-
    start_value(Start),
    part2_(FreqList, [Start], Dup).
part2_([], _, _) :- throw(error("Wrong params")).
part2_(_, [], _) :- throw(error("Wrong params")).
part2_([F|FreqList], [S|SumList], Dup) :- 
    Sum = F + S,
    % print(Sum),
    % nl,
    (   memberchk(Sum, [S|SumList])
    ->  Sum = Dup
    ;   append(FreqList, [F], NewFreqList),
        part2_(NewFreqList, [Sum|[S|SumList]], Dup)
    ).