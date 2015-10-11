kenken_testcase(
  6,
  [
   +(11, [1-1, 2-1]),
   /(2, 1-2, 1-3),
   *(20, [1-4, 2-4]),
   *(6, [1-5, 1-6, 2-6, 3-6]),
   -(3, 2-2, 2-3),
   /(3, 2-5, 3-5),
   *(240, [3-1, 3-2, 4-1, 4-2]),
   *(6, [3-3, 3-4]),
   *(6, [4-3, 5-3]),
   +(7, [4-4, 5-4, 5-5]),
   *(30, [4-5, 4-6]),
   *(6, [5-1, 5-2]),
   +(9, [5-6, 6-6]),
   +(8, [6-1, 6-2, 6-3]),
   /(2, 6-4, 6-5)
  ]
).

transpose([], []).
transpose([F|Fs], Ts) :-
transpose(F, [F|Fs], Ts).

transpose([], _, []).
transpose([_|Rs], Ms, [Ts|Tss]) :-
lists_firsts_rests(Ms, Ts, Ms1),
transpose(Rs, Ms1, Tss).

lists_firsts_rests([], [], []).
lists_firsts_rests([[F|Os]|Rest], [F|Fs], [Os|Oss]) :-
lists_firsts_rests(Rest, Fs, Oss).

%implementation of kenken/3
kenken(N, [], LOL):-
length(LOL, N),
distinct_nc(N, LOL),
transpose(LOL, LOLTrans),
distinct_nc(N, LOLTrans),
statistics.

kenken(N, C, LOL):-
length(C, X),
X #>= 1,
length(LOL, N),
distinct(N, LOL),
transpose(LOL, LOLTrans),
distinct(N, LOLTrans),
constraintCheck(N,C,LOL),
statistics.

distinct(_, []).
distinct(N, [FL|RL]):-
length(FL, N),
fd_all_different(FL),
distinct(N, RL).

distinct_nc(_, []).
distinct_nc(N, [firstList|restLists]):-
length(firstList, N),
fd_domain(firstList,1,N),
fd_all_different(firstList),
fd_labeling(firstList),
distinct_nc(N, restLists).

constraintCheck(_,[],_).
constraintCheck(N,[FC|RC],LOL):-
jjcc(FC,LOL,N),
constraintCheck(N,RC,LOL).

jjcc(+(Num,ListSquares),L,N):-check_add(Num,ListSquares,0,L,N).
jjcc(*(Num,ListSquares),L,N):-check_multiply(Num,ListSquares,1,L,N).
jjcc(/(Num,Q1,Q2),L,N):- check_division(Num,Q1,Q2,L,N).
jjcc(-(Num,Q1,Q2),L,N):- check_subtract(Num,Q1,Q2,L,N).

check_subtract(Num,Q1,Q2,L,N):-
Q1=R1-C1,
Q2=R2-C2,
element(L,R1,C1,E1,N),
element(L,R2,C2,E2,N),
check_sub(E1,E2,Num).

check_add(Num,[],Val,_,_):- Num #= Val.
check_add(Num,[Q1|QR],Val,L,N):-
Q1 = R1-C1,
element(L,R1,C1,Val1,N),
Val2 #= Val + Val1,
check_add(Num,QR,Val2,L,N).

check_multiply(Num,[],Val,_,_):- Num #= Val.
check_multiply(Num,[Q1|QR],Val,L,N):-
Q1 = R1 - C1,
element(L, R1, C1, Val1, N),
Val2 #= Val * Val1,
check_multiply(Num,QR,Val2,L,N).

check_division(Num,Q1,Q2,L,N):-
Q1=R1-C1,
Q2=R2-C2,
element(L,R1,C1,E1,N),
element(L,R2,C2,E2,N),
check_div(E1,E2,Num).

element(ListofList, Row, Col, Value, N):-
nth(Row,ListofList,R),
nth(Col,R,Value),
fd_domain(Value,1,N),
fd_labeling(Value).

check_sub(E1,E2,Result):-Result #=E1-E2.
check_sub(E1,E2,Result):-Result #=E2-E1 .

check_div(E1,E2,Result):-E2*Result #=E1.
check_div(E1,E2,Result):-E1*Result #=E2.





%implementation of plain_kenken/3
plain_kenken(N, [], LOL):-
length(LOL, N),
plain_distinct_nc(N, LOL),
transpose(LOL, LOLTrans),
plain_distinct_nc(N, LOLTrans),
statistics.

plain_kenken(N, C, LOL):-
length(C,X),
X >= 1,
length(LOL, N),
plain_distinct(N, LOL),
plain_constraintCheck(N,C,LOL),
plain_all_distinct(LOL),
transpose(LOL,LOLTranspose),
plain_all_distinct(LOLTranspose),
statistics.

plain_distinct_nc(_, []).
plain_distinct_nc(N, [firstList|restLists]):-
length(firstList, N),
all_in_range(firstList,N),
distinct_helper(firstList),
plain_distinct_nc(N, restLists).

all_in_range([],_).
all_in_range([firstElement|rstElements],N):-
in_range(firstElement,1,N),
all_in_range(rstElements,N).

plain_constraintCheck(_,[],_).
plain_constraintCheck(N,[FC|RC],LOL):-
plain_jjcc(FC,LOL,N),
plain_constraintCheck(N,RC,LOL).

plain_distinct(_, []).
plain_distinct(N, [Lx|Ly]):-
length(Lx, N),
plain_distinct(N, Ly).

plain_jjcc(+(Val,ListSquares),LOL,N):-plain_check_add(Val,ListSquares,0,LOL,N).
plain_jjcc(*(Val,ListSquares),LOL,N):-plain_check_multiply(Val,ListSquares,1,LOL,N).
plain_jjcc(/(Val,Q1,Q2),LOL,N):- plain_check_div(Val,Q1,Q2,LOL,N).
plain_jjcc(-(Val,Q1,Q2),LOL,N):- plain_check_subtract(Val,Q1,Q2,LOL,N).

plain_check_subtract(Val,Q1,Q2,LOL,N):-
Q1= R1-C1,
Q2=R2-C2,
plain_element(LOL,R1,C1,E1,N),
plain_element(LOL,R2,C2,E2,N),
plain_check_sub(E1,E2,Val).

plain_check_add(Val,[],E,_,_):- =(Val, E).
plain_check_add(Val,[Q1|QR],E,LOL,N):-
Q1 = R1-C1,
plain_element(LOL,R1,C1,E1,N),
Esum is E + E1,
plain_check_add(Val,QR,Esum,LOL,N).

plain_check_multiply(Val,[],E,_,_):- =(Val, E).
plain_check_multiply(Val,[Q1|QR],E,LOL,N):-
Q1=R1-C1,
plain_element(LOL,R1,C1,E1,N),
E2 is E * E1,
plain_check_multiply(Val,QR,E2,LOL,N).

plain_check_div(Val,Q1,Q2,LOL,N):-
Q1=R1-C1,
Q2=R2-C2,
plain_element(LOL,R1,C1,E1,N),
plain_element(LOL,R2,C2,E2,N),
plain_check_d(E1,E2,Val).

plain_element(LOL, Row, Col, Value,N):-
nth(Row,LOL,Li),
nth(Col,Li,Value),
in_range(Value,1,N).

plain_check_sub(E1,E2,Result):-
E is E1-E2,
=(Result,E).
plain_check_sub(E1,E2,Result):-
E is E2-E1,
=(Result,E).

plain_check_d(E1,E2,Result):-
E is E2*Result,
=(E,E1).
plain_check_d(E1,E2,Result):-
E is E1*Result,
=(E,E2).

in_range(Low, Low, _).
in_range(Out,Low,High) :- NewLow is Low+1, NewLow =< High, in_range(Out, NewLow, High).

plain_all_distinct([]).
plain_all_distinct([FL|RL]):-
distinct_helper(FL),
plain_all_distinct(RL).

distinct_helper([]).
distinct_helper([FE|RE]):-
\+(member(FE,RE)),
distinct_helper(RE).