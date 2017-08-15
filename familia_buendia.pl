padre('jose_arcadio_buendia','jose_arcadio').
padre('jose_arcadio_buendia','amaranta').
padre('jose_arcadio_buendia','aureliano_buendia').
padre('jose_arcadio_buendia','rebeca').
padre('jose_arcadio','arcadio').
padre('aureliano_buendia','aureliano_jose').
padre('aureliano_buendia','los_17_aurelianos').
padre('arcadio','remedios_la_bella').
padre('arcadio','jose_arcadio_segundo').
padre('arcadio','aureliano_segundo').
padre('aureliano_segundo','jose_arcadio').
padre('aureliano_segundo','meme').
padre('aureliano_segundo','amaranta_ursula').
padre('mauricio_babilonia','aureliano_babilonia').
padre('aureliano_babilonia','aureliano').

madre('ursula_iguaran','jose_arcadio').
madre('ursula_iguaran','amaranta').
madre('ursula_iguaran','aureliano_buendia').
madre('ursula_iguaran','rebeca').
madre('pilar_ternera','arcadio').
madre('pilar_ternera','aureliano_jose').
madre('santa_sofia_de_la_piedad','remedios_la_bella').
madre('santa_sofia_de_la_piedad','jose_arcadio_segundo').
madre('santa_sofia_de_la_piedad','aureliano_segundo').
madre('fernanda_del_caprio','jose_arcadio').
madre('fernanda_del_caprio','meme').
madre('fernanda_del_caprio','amaranta_ursula').
madre('meme','aureliano_babilonia').
madre('amaranta_ursula','aureliano').


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

