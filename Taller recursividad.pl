%-----------------------------------------------------------------------------------------------------------
%(A) promedio
total([],0).
total([T|Ts],S):-
    total(Ts,S2),
    S is S2 + 1.

suma_elementos([],0).
suma_elementos([Y|Ys],Z):-
    suma_elementos(Ys,Z2),
    Z is Z2 + Y.

promedio([],0). %criterio de parada
promedio(X,V):-  
    total(X,A),  %funcion que suma la cantidad de casillas de la lista
    suma_elementos(X,B), %suma todos los numeros
    V is B/A.
%PREGUNTA:                         RESPUESTA: 
%?- promedio([1,2,3],X).           X=2
%?- promedio([1,2,3,4,5,6],X).     X=3.5

%--------------------------------------------------------------------------------------------------------------
%(B)
list_max(M, [X|Xs]):-
          list_max2(M, X, Xs).

list_max2(M, M, []):- !.

list_max2(X, Y, [Z|Zs]):-
          Z >= Y,
          !,
          list_max2(X, Z, Zs).

list_max2(X, Y, [Z|Zs]):-
          Z =< Y,
          list_max2(X, Y, Zs).
%
%PREGUNTA:                       RESPUESTA:
%?- list_max(M, [5,3,9,2,8,7]).  M = 9
%--------------------------------------------------------------------------------------------------------------
%(C)
lista(N,L) :-
    lista_aux(1,N,L).


lista_aux(_,0,[]).
lista_aux(N,M,[N|L]) :-
    M > 0,
    M1 is M-1,
    N1 is N+1,
    lista_aux(N1,M1,L).
    
%PREGUNTA:                              RESPUESTA:
%?- lista(3,L).                         L = [1, 2, 3]
%?- lista(7,L).                         L = [1, 2, 3, 4, 5, 6, 7] 
% -------------------------------------------------------------------------------------------------------------
%(D)
my_last_element([Y], Y).

my_last_element([_|Xs], Y):-
          my_last_element(Xs, Y)
%PREGUNTA:                               RESPUESTA:
%?- my_last_element([m,j,k,e,w], X).     X = w
%---------------------------------------------------------------------------------------------------------------
%(E)
penultimo([F,_],F).

penultimo([_|Resto],R):-
    penultimo(Resto,R).
%PREGUNTA:                             RESPUESTA:
%?- penultimo([a,b,c,j,e],R).          R=j
%?- penultimo([a,b,c,d,e],R).          R=d
%----------------------------------------------------------------------------------------------------------------
%(F)

%-----------------------------------------------------------------------------------------------------------------
%(G)
my_n_element([Y|_], 1, Y).

my_n_element([_|Xs], N, Y):-
          N2 is N - 1,
          my_n_element(Xs, N2, Y).
%PREGUNTA:                                            RESPUESTA:
%?- my_n_element([m,j,k,e,w], 3, X).                  X = k
%-----------------------------------------------------------------------------------------------------------------
%(H)Concatenar listas
concatenar([],L,L).
concatenar([X|Y],Z,[X|U]):- concatenar(Y,Z,U).
%PREGUNTAS:                                                                     RESPUESTAS:
%? concatenar([a, b, c], [d, e, f], X).                                         X= [a, b, c, d, e, f]
%? concatenar([a, b, c], X, [a, b, c, d, e]).                                   X= [d, e]
%? concatenar([a, b, c], X, [a, c, d, e]).                                      no
%? concatenar(X, Y, [a, b, c, d, e]).                                           X=[ ] Y=[a, b, c, d, e] ;
%                                                                               X=[a] Y=[b, c, d, e] ;
%                                                                               X=[a, b] Y=[c, d, e] ;
%                                                                               X=[a, b, c] Y=[d, e] ;
%                                                                               X=[a, b, c, d] Y=[e] ;
%                                                                               X=[a, b, c, d, e] Y=[ ] ; 
%----------------------------------------------------------------------------------------------------------------
%(I)
my_remove_element_n(1, [_|Xs], Xs).

my_remove_element_n(I, [X|Xs], [X|Ys]):-
          I2 is I - 1,
          my_remove_element_n(I2, Xs, Ys).
%PREGUNTAS:                                                    RESPUESTA:
%?- my_remove_element_n(5, [a,b,c,d,e,f,g,h], Zs).             Zs = [a,b,c,d,f,g,h]
%-----------------------------------------------------------------------------------------------------------------
%(J)
longitud_par([]).
longitud_par([_|L]) :-
longitud_impar(L).
longitud_impar([_]).
longitud_impar([_|L]) :-
longitud_par(L).
%PREGUNTA:                                 RESPUESTA:
%?- longitud_par([a,b]).                   true
%?- longitud_par([a]).                     false
%----------------------------------------------------------------------------------------------------------------
%(K)
rota([X|L1],L) :-
append(L1,[X],L).
%PREGUNTA:                                             RESPUESTA.
%?- rota([a,b,c,d],L).                                 L = [b, c, d, a]
%?- rota([k,b,c,d],L).                                 L = [b, c, d, k].
%------------------------------------------------------------------------------------------------------------------
%(L)
inversa_1([],[]).
inversa_1([X|L1],L2) :-
    inversa_1(L1,L3),
    append(L3,[X],L2).
%PREGUNTA:                                 RESPUESTA:
%?- inversa_1([a,b,c],L).                  L = [c, b, a].
%?- inversa_1([j,k,l],L).                  L = [l, k, j].
%------------------------------------------------------------------------------------------------------------------
%(M)Palindromo
invertir([],[]). 
invertir([X|L1], L):- invertir(L1,Y), append(Y, [X], L). 
palindroma(X):- invertir(X, L), X==L. 
 
%PREGUNTA:                              RESPUESTA:
%?- palindroma([p,e,l,o,t,a]).          false. 
%?- palindroma([r,e,c,o,n,o,c,e,r]).    true.
%?- palindroma([a,b,c,b,a]).            true. 
%?- palindroma([f,f,g,e]).              false. 
