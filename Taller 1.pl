%taller hechos y reglas%
%
%(a) un diamante es valioso.
valioso(diamante).
%(b) la capital de colombia es bogota.
capital_de_colombia(bogota).
%(c) a laura le gustan las tortas de arequipe o chocolate.
torta(chocolate).
torta(arequipe).
le_gusta_la_torta(laura):- torta(arequipe).
le_gusta_la_torta(laura):- torta(chocolate).
%(d) Las personas muy altas o muy bajas sufren en el bus
sufre(persona,baja).
sufre(persona,alta).
%(e) A juan le gusta maria pero a maria no le gusta juan
le_gusta(juan,maria):- not(le_gusta(maria,juan)).
%(f) a pedro le gusta ana y nora.
le_gustaa(pedro,ana).
le_gustaa(pedro,nora).
%(g) A todos los que les gusta Nora, les gusta Zulema.
les_gusta(zulema):- les_gusta(nora).
%(h) A julian le gustan las mujeres morenas y gorditas.
les_gusta_las(julian,morena).
les_gusta_las(julian,gorditas).
%(i) A mario le gustan las morenas gordas, y luisa.
le_gustan(mario,morenas_gordas).
le_gustan(mario,luisa).
%(j) A todos los que les gusta, tanto Ana como Luisa, Les gusta Laura
lesgusta(laura):- lesgusta(ana),lesgusta(luisa).


%arbol genealogico

hombre(arthur).
hombre(bill).
hombre(louis).
hombre(teddy).
hombre(percy).
hombre(george).
hombre(fred).
hombre(harry).
hombre(james).
hombre(albus).
hombre(ron).
hombre(hugo).
mujer(molly).
mujer(fleur).
mujer(victoire).
mujer(dominique).
mujer(audrey).
mujer(lucy).
mujer(molly).
mujer(angelina).
mujer(roxanne).
mujer(ginny).
mujer(lily).
mujer(hermione).
mujer(rose).

progenitor(molly,bill).
progenitor(molly,percy).
progenitor(molly,george).
progenitor(molly,ginny).
progenitor(molly,ron).
progenitor(arthur,bill).
progenitor(arthur,percy).
progenitor(arthur,george).
progenitor(arthur,ginny).
progenitor(arthur,ron).
progenitor(bill,victoire).
progenitor(bill,dominique).
progenitor(bill,louis).
progenitor(fleur,victoire).
progenitor(fleur,dominique).
progenitor(fleur,louis).
progenitor(percy,lucy).
progenitor(percy,molly).
progenitor(audrey,lucy).
progenitor(audrey,molly).
progenitor(george,fred).
progenitor(george,roxanne).
progenitor(angelina,fred).
progenitor(angelina,roxanne).
progenitor(ginny,james).
progenitor(ginny,lily).
progenitor(ginny,albus).
progenitor(harry,james).
progenitor(harry,lily).
progenitor(harry,albus).
progenitor(ron,hugo).
progenitor(ron,rose).
progenitor(hermione,hugo).
progenitor(hermione,rose).


pareja(arthur,molly).
pareja(molly,arthur).
pareja(bill,fleur).
pareja(fleur,bill).
pareja(percy,audrey).
pareja(audrey,percy).
pareja(george,angelina).
pareja(angelina,george).
pareja(ginny,harry).
pareja(harry,ginny).
pareja(ron,hermione).
pareja(hermione,ron).
pareja(victoire,teddy).
pareja(teddy,victoire).

padre(X,Y):-hombre(X),progenitor(X,Y).
madre(X,Y):-mujer(X),progenitor(X,Y).
hermanos(X,Y):-progenitor(Z,X),progenitor(Z,Y), not(X==Y).
hermano(X,Y):-hombre(X),hermanos(X,Y).
hermana(X,Y):-mujer(X),hermanos(X,Y).
esposo(X,Y):-pareja(X,Y),hombre(X).
esposa(X,Y):-pareja(X,Y),mujer(X).
suegro(X,Y):-padre(X,Z),pareja(Y,Z).
suegra(X,Y):-madre(X,Z),esposo(Y,Z).
yerno(X,Y):-suegro(Y,X);suegra(Y,X),hombre(X).
nuera(X,Y):-suegro(Y,X);suegra(Y,X),mujer(X).
cuñados(X,Y):-((pareja(X,Z),hermanos(Z,Y));(pareja(Y,Z),hermanos(Z,X))).
cuñado(X,Y):-cuñados(X,Y),hombre(X).
cuñada(X,Y):-cuñados(X,Y),mujer(X).
abuelo(X,Y):-progenitor(Z,Y),padre(X,Z).
abuela(X,Y):-progenitor(Z,Y),madre(X,Z).
nieto(X,Y):-progenitor(Y,Z),progenitor(Z,X),hombre(X).
nieta(X,Y):-progenitor(Y,Z),progenitor(Z,X),mujer(X).
tio(X,Y):-progenitor(Z,Y),(hermano(X,Z);cuñado(X,Z)).
tia(X,Y):-progenitor(Z,Y),(hermana(X,Z);cuñada(X,Z)).
primo(X,Y):-progenitor(Z,X),progenitor(W,Y),hermanos(Z,W),hombre(X).
prima(X,Y):-progenitor(Z,X),progenitor(W,Y),hermanos(Z,W),mujer(X).
