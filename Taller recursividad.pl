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
% -------------------------------------------------------------------------------------------------------------

%---------------------------------------------------------------------------------------------------------------
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
