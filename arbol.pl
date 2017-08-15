%echos padres y madres
padre(manuel,jhon).
padre(manuel,jairo).
padre(manuel,diana).
padre(manuel,viviana).

padre(jhon,dania).
padre(jhon,dilan).

padre(jairo,angelica).
padre(jairo,lenis).

padre(alejandro,valentina).
padre(alejandro,stefania).

madre(diana,veronica).
madre(diana,hector).

madre(viviana,alejandro).

madre(veronica,diego).

%reglas definidas para hacer las consultas

ancestros(X,Y):-padre(X,Z),padre(Z,Y).
ancestros(X,Y):-padre(X,Z),madre(Z,Y).
ancestros(X,Y):-madre(X,Z),padre(Z,Y).
ancestros(X,Y):-madre(X,Z),madre(Z,Y).
nieto(X,Y) :-ancestro(Y,X).
hermano(X,Y):-padre(Z,X),padre(Z,Y).
hermano(X,Y):-madre(Z,X),madre(Z,Y).
sobrino(X,Y):-hermano(Z,Y),padre(Z,X).
sobrino(X,Y):-hermano(Z,Y),madre(Z,X).
tio(X,Y):-sobrino(Y,X).
primo(X,Y):-tio(X,Z),padre(Z,Y),not(X=Y).
primo(X,Y):-tio(X,Z),madre(Z,Y),not(X=Y).
