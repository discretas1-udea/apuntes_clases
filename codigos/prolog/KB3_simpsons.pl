% ---------------------------
% Hechos (Facts)
% ---------------------------

% Miembros de la familia Simpson
miembro(homero, familia_simpson).
miembro(marge, familia_simpson).
miembro(bart, familia_simpson).
miembro(lisa, familia_simpson).
miembro(maggie, familia_simpson).

% Estructura familiar
padre(homero, bart).
padre(homero, lisa).
padre(homero, maggie).

madre(marge, bart).
madre(marge, lisa).
madre(marge, maggie).

% Profesiones
ocupacion(homero, inspector).
ocupacion(marge, ama_de_casa).

% Edades relativas
mayor_que(bart, lisa).
mayor_que(lisa, maggie).

% Características individuales
es_travieso(bart).
es_genio(lisa).
es_bebe(maggie).
no_habla(maggie).
es_tierna(maggie).

% Mascotas
perro(ayudante_de_santa).
gato(bola_de_nieve).
mascota(ayudante_de_santa).
mascota(bola_de_nieve).

mascota_de(ayudante_de_santa, familia_simpson).
mascota_de(bola_de_nieve, familia_simpson).

% ---------------------------
% Reglas (Rules)
% ---------------------------

% Un individuo es hijo si tiene un padre o madre
hijo(X, Y) :- padre(Y, X).
hijo(X, Y) :- madre(Y, X).

% Un individuo es progenitor si es padre o madre
progenitor(X, Y) :- padre(X, Y).
progenitor(X, Y) :- madre(X, Y).

% Dos individuos son hermanos si comparten padre y madre y no son la misma persona
hermano(X, Y) :-
    padre(P, X), padre(P, Y),
    madre(M, X), madre(M, Y),
    X \= Y.

% Un miembro es parte de la familia Simpson si aparece como miembro de ella
es_miembro_familia_simpson(X) :- miembro(X, familia_simpson).

% Un individuo es hijo menor si todos los otros hijos son mayores
hijo_menor(X) :-
    hijo(X, P),
    \+ (hijo(Y, P), Y \= X, mayor_que(X, Y)).

% Un individuo es mascota si es un perro o un gato
es_mascota(X) :- perro(X).
es_mascota(X) :- gato(X).

% Una mascota pertenece a la familia Simpson si está registrada como mascota de ella
mascota_familia_simpson(X) :-
    mascota_de(X, familia_simpson).

% Un individuo es persona si es miembro de la familia Simpson y no es mascota
persona(X) :-
    miembro(X, familia_simpson),
    \+ mascota(X).
