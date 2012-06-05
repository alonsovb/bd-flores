% -----------------------------
% | BASE DE DATOS DE PERSONAS |
% -----------------------------
% 
% Se muestra la explicación de algunos predicados que se utilizan más
% adelante.
% --------------------------------------------------------------------
% 
% findall(+Template, :Goal, -Bag) -- recibe como primer parámetro una
% plantilla "Template" que define el formato de como se mostrarán los
% datos en el resultado "Bag". La idea es instanciar todos los valores
% que se encuentren en el objetivo "Goal" en una lista "Bag", según sea
% el formato establecido en "Template". Así por ejemplo en el predicado
% "masculino(pedro)" que vimos en clase, si invocamos el predicado
% findall(A,masculino(A),Res), se unificará en Res, la lista de todos
% los valores "A" que se encontraron para el objetivo "masculino".
% 
% Res = [valor1, valor2, valor3].
% 
% Si cambiaramos el "Template" a "[A]", entonces obtendríamos una lista
% con sublistas, donde cada sublista tendría el valor de "A" para cada
% instancia del objetivo "masculino"
% 
% Res = [[valor1], [valor2], [valor3]].

% 

:- dynamic datos/4.

connect :-
	write('BD name: '),read(Bd),    %deben escribirse en formato String de prolog usando las comillas simples (')
	write('user: '),read(User),     %deben escribirse en formato String de prolog usando las comillas simples (')
	write('password: '),read(Pass), %deben escribirse en formato String de prolog usando las comillas simples (')
	odbc_connect(Bb, _, [user(User),password(Pass),alias(prolog),open(once)]),
	odbc_set_connection(prolog,auto_commit(true)).

disconnect :- odbc_disconnect(prolog).

% predicado para almacenar nuevos hechos a la base de datos de personas
add :-
	write('nombre: '),read(Nombre),
	findall(Rr,datos(Rr,_,_,_),Nombres), % busca todos los nombres de la base de datos de conocimiento (BDC)
	(member(Nombre,Nombres)->
	write('El dato ya existe') % si el nombre que se quiere insertar ya es miembro, pues no se inserta
	; % or
	write('celular: '),read(Celular),
	 write('mail: '),read(Mail),
	 write('direccion: '),read(Direccion),
	 assert(datos(Nombre,Celular,Mail,Direccion)),nl, % si no hubo errores, se inserta en la BDC
	 write('Ingreso exitoso')).

% predicado para eliminar datos de la BDC
remove :-
	write('nombre: '),read(Nombre),
	datos(Nombre,_,_,_)->
	retract(datos(Nombre,_,_,_)),
	write('Borrado exitoso')
	; % or
	write('El dato no existe').

% predicado para salvar los datos de la BDC en la BDP (P = POSTGRES) 
save :-
	connect,
	findall((N,C,E,D),odbc_query(prolog,'select * from datos',row(N,C,E,D)),_),
	findall((X,Y,Z,W),datos(X,Y,Z,W),L),
	odbc_query(prolog,'delete from datos where 1 = 1'),
	%antes de llamar a guarda, se espera que en L esté una lista con todos los datos de la BDC en el formato [(X1,Y1,Z1,W1),(X2,Y2,Z2,W2),etc]
	guarda(L),
	disconnect.


guarda([]) :- write('datos guardados').
guarda([H|T]) :- %los datos que venían en el formato antes expuesto se toman uno por uno y se insertan en la BDP
	(Nombre,Celular,Mail,Direccion) = H,
	% hay que concatenar los elementos de la consulta INSERT. No veo otra forma de hacer esto!!!
	string_concat('INSERT INTO datos(nombre,celular,mail,direccion) VALUES (\'',Nombre,N1),
	string_concat(N1,'\',\'',R1),
	string_concat(R1,Celular,C1),
	string_concat(C1,'\',\'',R2),
	string_concat(R2,Mail,M1),
	string_concat(M1,'\',\'',R3),
	string_concat(R3,Direccion,D1),
	string_concat(D1,'\')',Res),
	odbc_query(prolog,Res,_), %inserción de cada dato en la BDP
	guarda(T).

% predicado para cargar datos de la base de datos
load :-
	connect,
	borra,
	carga,
	disconnect.

%predicado para cargar todos los datos de la BDP a la BDC
carga:-
	findall((N,C,E,D),
		odbc_query(prolog,'select * from datos',row(N,C,E,D)),L),
	% los datos vienen en el formato antes descrito para el caso del "save" 
	iter(L).

append :-
	connect,
	carga,
	disconnect.

borra :-
	retract(datos(_,_,_,_)).
borra.

% uno por uno se insertan en la BDC los daros obtenidos de la BDP
iter([]).
iter([H|T]) :-
	(N,C,E,D) = H,
	assert(datos(N,C,E,D)),
	iter(T).

member(X,[X|_]).
member(X,[_|Y]) :- member(X,Y).




