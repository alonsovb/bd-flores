:- use_module(library(pce)).
:- dynamic planta/1.

% Define el nombre del archivo de la base de datos
baseDatos('bd.pl').

% metodo principal, inicia el programa
main :- dynamic(planta/1),
	baseDatos(BD),
	consult(BD),
	identify, !.

% Identificar una planta
identify:-
	retractall(known(_,_,_)),
	planta(X),
	mostrarPlanta(X).
identify:-
	noEncontrada.

% Preguntas para cada atributo
tipo(X) :-
	ask(tipo, X).
orden(X) :-
	ask(orden, X).
hojas(X) :-
	ask(hojas, X).
habitat(X) :-
	ask(habitat, X).
% Pregunta con opciones
flores(X) :-
	tipoFlores(Opciones),
	menuask(flores, X, Opciones).
region(X) :-
	ask(region, X).

% Comprobar los valores conocidos
ask(Atributo, Valor):-
	known(si, Atributo, Valor),
	!.
ask(Atributo, Valor):-
	known(_, Atributo, Valor),
	!, fail.
ask(Atributo,_):-
	known(si, Atributo, _),
	!, fail.
% Si no se conoce, se pregunta mediante interfaz
ask(Atributo, Valor):-
	concat('¿El valor del atributo ', Atributo, P1),
	concat(P1, ' es ', P2),
	concat(P2, Valor, P3),
	concat(P3, '?', P4),
	preguntar(P4, R),
	asserta(known(R, Atributo, Valor)),
	R = si.

% Comprobar atributos con opciones
menuask(Atributo, Valor,_):-
	known(si,Atributo,Valor),
	!.
menuask(Atributo,_,_):-
	known(si,Atributo,_),
	!, fail.
% Si no se encuentra, se pregunta mediante interfaz
menuask(Atributo, Valor, Opciones):-
	concat('¿El valor del atributo ', Atributo, P1),
	concat(P1, ' es ', P2),
	concat(P2, '?', P3),
	preguntarLista(P3, Opciones, Respuesta),
	asserta(known(si,Atributo,Respuesta)),
	Valor = Respuesta.

% Dialogo para contestar si o no
preguntar(Pregunta, Respuesta) :-
	new(DPreguntar, dialog('Pregunta')),
	send(DPreguntar, append(label(Pregunta, Pregunta))),
	send(DPreguntar, append(new(MSiNo, menu(resp, marked)))),
	send(DPreguntar, append(button(siguiente, message(DPreguntar,
							  return,
							  MSiNo?selection)))),
	send_list(MSiNo, append, [si, no]),
	send(DPreguntar, gap, size(10,10)),
	send(DPreguntar, background, colour(white)),
	send(DPreguntar, open_centered),
	get(DPreguntar, confirm, Resultado),
	free(DPreguntar),
	Respuesta = Resultado.

% Dialogo para preguntar con varias opciones
preguntarLista(Atributo, Opciones, Respuesta) :-
	new(DPreguntar, dialog('Elija una opción')),
	send(DPreguntar, append(label(Atributo, Atributo))),
	send(DPreguntar, append(new(MOpciones, menu(resp, cycle)))),
	send(DPreguntar, append(button(siguiente, message(DPreguntar,
							  return,
							  MOpciones?selection)))),
	send_list(MOpciones, append, Opciones),
	send(DPreguntar, gap, size(10,10)),
	send(DPreguntar, background, colour(white)),
	send(DPreguntar, open_centered),
	get(DPreguntar, confirm, Resultado),
	free(DPreguntar),
	Respuesta = Resultado.

% Dialogo para mostrar la planta de resultado
mostrarPlanta(Planta) :-
	new(DPlanta, dialog(Planta)),
	concat('imagenes/', Planta, Direccion),
	concat(Direccion, '.jpg', NombreArchivo),
	cargarImagen(DPlanta, NombreArchivo),
	concat('La planta descrita es ', Planta, RPlanta),
	send(DPlanta, append(label(resultado, RPlanta))),
	send(DPlanta, append(button('Volver al inicio', and(message(DPlanta, destroy),
							    message(DPlanta, free),
							    message(@prolog, main))))),
	send(DPlanta, append(button('Salir', message(DPlanta, destroy)))),
	send(DPlanta, gap, size(10,10)),
	send(DPlanta, background, colour(white)),
	send(DPlanta, open_centered).

% Mostrar una imagen si se encuentra, si no un mensaje
cargarImagen(Dialog, NombreArchivo):-
	exists_file(NombreArchivo),
	send(Dialog, append(label(imagen, image(NombreArchivo)))).
cargarImagen(Dialog, _):-
	send(Dialog, append(label(imagen, 'La planta no tiene una imagen asignada'))).

% Cuando la planta descrita no se encuentra, se muestra este dialogo
% que permite elegir entre agregar una nueva planta o salir
noEncontrada :-
	new(DDesconocida, dialog('Planta desconocida')),
	send(DDesconocida, append(label(no, 'No se encuentra la planta indicada. ¿Desea agregarla?'))),
	send(DDesconocida, append(button('Si', and(message(DDesconocida, destroy),
						   message(DDesconocida, free),
						   message(@prolog, agregarPlanta))))),
	send(DDesconocida, append(button('No', and(message(DDesconocida, destroy),
						   message(DDesconocida, free),
						   message(@prolog, main))))),
	send(DDesconocida, append(button('Salir', and(message(DDesconocida, destroy),
						      message(DDesconocida, free))))),
	send(DDesconocida, gap, size(10,10)),
	send(DDesconocida, background, colour(white)),
	send(DDesconocida, open_centered).

% Dialogo para agregar nueva planta
% El usuario debe llenar los datos sobre la planta
agregarPlanta :-
	new(DNueva, dialog('Agregar planta')),
	send(DNueva, gap, size(10,10)),
	send(DNueva, background, colour(white)),
	send(DNueva, append(new(TNombre, text_item('Nombre')))),
	send(DNueva, append(new(TTipo, text_item('Tipo')))),
	send(DNueva, append(new(TOrden, text_item('Orden')))),
	send(DNueva, append(new(THojas, text_item('Hojas')))),
	send(DNueva, append(new(THabitat, text_item('Habitat')))),
	send(DNueva, append(new(TFlores, text_item('Flores')))),
	send(DNueva, append(new(TRegion, text_item('Region')))),
	send(DNueva, append(button('Agregar y volver',
				   and(message(@prolog, % Metodo de insercion en la base de datos
					       insertar_planta,
					       TNombre?selection,
					       TTipo?selection,
					       TOrden?selection,
					       THojas?selection,
					       THabitat?selection,
					       TFlores?selection,
					       TRegion?selection),
				       message(DNueva, destroy),
						   message(DNueva, free),
						   message(@prolog, main))))),
	send(DNueva, append(button('Cancelar', and(message(DNueva, destroy),
						   message(DNueva, free),
						   message(@prolog, main))))),
	send(DNueva, append(button('Salir', and(message(DNueva, destroy),
						   message(DNueva, free))))),

	send(DNueva, open_centered).

% Insertar una planta con los atributos dados
insertar_planta(NP,T,O,HO,HA,F,R):-
	assert((planta(NP):-
	       tipo(T),
	       orden(O),
	       hojas(HO),
	       habitat(HA),
	       flores(F),
	       region(R))),
	agregarFlores(F),
	escribir_arch.

% Comprobar opciones de flores, agregar nuevo si necesario
agregarFlores(F):-
	tipoFlores(Lista),
	member(F,Lista).
agregarFlores(F):-
	tipoFlores(Lista),
	retractall(tipoFlores(_)),
	assert(tipoFlores([F|Lista])).

% Escribir la base de datos al archivo
escribir_arch:-
	baseDatos(BD),
	tell(BD),
	listing(tipoFlores),
	listing(planta),
	told,
	retractall(planta(_)).
