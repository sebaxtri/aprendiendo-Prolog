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


