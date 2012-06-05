:-dynamic planta/1.

%insertar planta nueva


insertar:-retractall(planta(_)),
	consult('bd.pl'),
	insertar_planta(a,a,a,a,a,a,a),
	escribir_arch.

insertar_planta(NP,T,O,HO,HA,F,R):-
	assert((planta(NP):-
	       tipo(T),
	       orden(O),
	       hojas(HO),
	       habitat(HA),
	       flores(F),
	       region(R))),
	agregarFlores(F).

agregarFlores(F):-tipoFlores(Lista),member(F,Lista).
agregarFlores(F):-tipoFlores(Lista),retractall(tipoFlores(_)),assert(tipoFlores([F|Lista])).

escribir_arch:-tell('bd.pl'),
	       listing(tipoFlores),
	       listing(planta),
	       told.
