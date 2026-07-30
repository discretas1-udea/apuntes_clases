# Taller 4 – Matemáticas Discretas

## Objetivo de aprendizaje

Al finalizar este taller, usted podrá evaluar predicados y proposiciones cuantificadas sobre valores concretos, traducir entre lenguaje natural y notación cuantificada en ambas direcciones, y determinar el valor de verdad de enunciados cuantificados considerando el dominio de discurso.

## Referencia rápida

### Prioridad de operadores lógicos

| Prioridad | Operador | Símbolo | Significado |
|---|---|---|---|
| 1 (más alta) | Paréntesis | $( )$ | Agrupación |
| 2 | Cuantificadores | $\forall, \exists$ | Universal / Existencial |
| 3 | Negación | $\neg$ | No |
| 4 | Conjunción | $\land$ | Y |
| 5 | Disyunción | $\lor$ | O |
| 6 | Implicación | $\to$ | Si … entonces … |
| 7 (más baja) | Equivalencia | $\leftrightarrow$ | Si y solo si … |

### Equivalencias entre cuantificadores

| Nombre | Equivalencia lógica |
|---|---|
| Negación de cuantificadores (De Morgan cuántico) | $\neg \forall x\ P(x) \equiv \exists x\ \neg P(x)$ ; $\neg \exists x\ P(x) \equiv \forall x\ \neg P(x)$ |
| Distributividad del cuantificador universal sobre conjunción | $\forall x(P(x) \land Q(x)) \equiv \forall x\ P(x) \land \forall x\ Q(x)$ |
| Distributividad del cuantificador existencial sobre disyunción | $\exists x(P(x) \lor Q(x)) \equiv \exists x\ P(x) \lor \exists x\ Q(x)$ |
| Distribución de cuantificadores (restricciones) | Si la fórmula $Q$ no contiene la variable cuantificada $x$: $\forall x(P(x) \lor Q) \equiv (\forall x\ P(x)) \lor Q$ ; $\exists x(P(x) \land Q) \equiv (\exists x\ P(x)) \land Q$ |

### Reglas de inferencia para lógica cuantificacional

| Regla | Nombre | Forma |
|---|---|---|
| $\forall I$ | Instanciación universal | $\forall x\ P(x) \Rightarrow P(c)$ |
| $\forall G$ | Generalización universal | $P(c) \Rightarrow \forall x\ P(x)$ |
| $\exists I$ | Instanciación existencial | $\exists x\ P(x) \Rightarrow P(c)$ |
| $\exists G$ | Generalización existencial | $P(c) \Rightarrow \exists x\ P(x)$ |

> [!TIP]
> Ningún ejercicio de este taller pide una demostración formal usando $\forall I$, $\forall G$, $\exists I$ o $\exists G$ — se incluyen aquí como referencia completa del formulario. Las **Formas Aristotélicas** (útiles para los Bloques B y C) y el **formulario de lógica proposicional** (equivalencias y reglas de inferencia de talleres anteriores) están disponibles en **Anexos completos**, al final de este documento.

## Enunciados

### Bloque A — Evaluación de predicados y cuantificadores sobre valores concretos (1-4, 11, 13-14)

**1.** Un zoológico tiene siete perros de color café, dos perros de color negro, seis gatos grises, diez gatos negros, cinco pájaros azules, seis pájaros amarillos y un pájaro negro. Determine cuáles de los siguientes enunciados son verdaderos y cuáles son falsos.

- a. Hay un animal en el zoológico que es rojo.
- b. Todo animal en el zoológico o es un ave o es un mamífero.
- c. Todo animal en el zoológico es de color café, gris o negro.
- d. Hay un animal en el zoológico que no es ni un gato ni perro.
- e. Ningún animal en el zoológico es de color azul.
- f. Hay en el zoológico un perro, un gato y un pájaro que todos tienen el mismo color.

**2.** Sea $P(x)$ la proposición "La palabra $x$ contiene la letra $a$" ¿Cuáles son estos valores de verdad?

- a. $P(\text{naranja})$
- b. $P(\text{limon})$
- c. $P(\text{verdadero})$
- d. $P(\text{falso})$

**3.** Sea $Q(n)$ el predicado "$n^2 \le 30$".

- a. Escriba $Q(2)$, $Q(-2)$, $Q(7)$ y $Q(-7)$ e indique cuáles de estos enunciados son verdaderos y cuáles son falsos.
- b. Encuentre el conjunto de verdad de $Q(n)$ si el dominio de $n$ es $\mathbb{Z}$, el conjunto de todos los enteros.
- c. Si el dominio es el conjunto $\mathbb{Z}^+$ de todos los enteros positivos, ¿cuál es el conjunto de verdad de $Q(n)$?

**4.** Sea $Q(x,y)$ la proposición "$x$ es la capital de $y$" ¿Cuáles son estos valores de verdad?

- a. $Q(\text{Medellín}, \text{Antioquia})$
- b. $Q(\text{Montería}, \text{Bolívar})$
- c. $Q(\text{Putumayo}, \text{Mocoa})$
- d. $Q(\text{Tumaco}, \text{Nariño})$

**11.** Sea $Q(x)$ la proposición "$x + 1 > 2x$". Si el dominio consiste en todos los enteros, ¿cuáles son estos valores de verdad?

- a. $Q(0)$
- b. $Q(-1)$
- c. $Q(1)$
- d. $\exists x\ Q(x)$
- e. $\forall x\ Q(x)$
- f. $\exists x\ \neg Q(x)$
- g. $\forall x\ \neg Q(x)$

**13.** Determine el valor de verdad de cada una de estas afirmaciones si el dominio consiste en todos los enteros.

- a. Para todo entero $n$, $n + 1 > n$.
- b. Existe un entero $n$ tal que $2n = 3n$.
- c. Existe un entero $n$ tal que $n = -n$.
- d. Para todo entero $n$, $3n \le 4n$.

**14.** Determine el valor de verdad de cada una de estas afirmaciones si el dominio de cada variable consiste en todos los números reales.

- a. $\exists x\ (x^2 = 2)$
- b. $\exists x\ (x^2 = -1)$
- c. $\forall x\ (x^2 + 2 \ge 1)$
- d. $\forall x\ (x^2 \ne x)$

### Bloque B — Traducción de fórmula cuantificada a lenguaje natural (5, 6, 7, 8, 12)

**5.** Sea $P(x)$ la proposición "$x$ pasa más de cinco horas cada día de la semana en clase", donde el dominio para $x$ consiste en todos los estudiantes. Exprese cada una de estas cuantificaciones en lenguaje natural.

- a. $\exists x\ P(x)$
- b. $\forall x\ P(x)$
- c. $\exists x\ \neg P(x)$
- d. $\forall x\ \neg P(x)$

**6.** Considere el siguiente enunciado: *Para todo jugador de baloncesto $x$, $x$ es alto.* ¿Cuál de las siguientes formas de expresión son equivalentes a este enunciado?

- a. Todo jugador de baloncesto es alto.
- b. Entre todos los jugadores de baloncesto, algunos son altos.
- c. Algunas de las personas altas son jugadores de baloncesto.
- d. Cualquier persona alta es un jugador de baloncesto.
- e. Todas las personas que son jugadores de baloncesto son altos.
- f. Cualquier persona que es un jugador de baloncesto es una persona alta.

**7.** Traduzca estas afirmaciones a lenguaje natural, donde $C(x)$ es "$x$ es un comediante" y $F(x)$ es "$x$ es gracioso" y el dominio consiste en todas las personas.

- a. $\forall x\,(C(x) \to F(x))$
- b. $\forall x\,(C(x) \land F(x))$
- c. $\exists x\,(C(x) \to F(x))$
- d. $\exists x\,(C(x) \land F(x))$

**8.** Exprese las siguientes afirmaciones en lenguaje natural, donde $R(x)$ es "$x$ es un conejo" y $H(x)$ es "$x$ salta" y el dominio consiste en todos los animales.

- a. $\forall x\,(R(x) \to H(x))$
- b. $\forall x\,(R(x) \land H(x))$
- c. $\exists x\,(R(x) \to H(x))$
- d. $\exists x\,(R(x) \land H(x))$

**12.** Sea $P(x)$ la afirmación "$x$ es un atleta profesional" y sea $Q(x)$ la afirmación "$x$ juega fútbol". El dominio de discurso es el conjunto de todas las personas. Escriba cada proposición en palabras y determine el valor de verdad de cada afirmación:

- a. $\forall x\,(P(x) \to Q(x))$
- b. $\exists x\,(P(x) \to Q(x))$
- c. $\forall x\,(Q(x) \to P(x))$
- d. $\exists x\,(Q(x) \to P(x))$
- e. $\forall x\,(P(x) \lor Q(x))$
- f. $\exists x\,(P(x) \lor Q(x))$
- g. $\forall x\,(P(x) \land Q(x))$
- h. $\exists x\,(P(x) \land Q(x))$

### Bloque C — Traducción de lenguaje natural a fórmula cuantificada (9, 10, 17, 19, 20)

**9.** Sea $P(x)$ la proposición "$x$ puede hablar ruso" y sea $Q(x)$ la proposición "$x$ conoce el lenguaje de programación C++". Exprese cada una de estas oraciones en términos de $P(x)$, $Q(x)$, cuantificadores y conectivos lógicos. El dominio para los cuantificadores consiste en todos los estudiantes de su escuela.

- a. Existe un estudiante en tu escuela que puede hablar ruso y que conoce C++.
- b. Existe un estudiante en tu escuela que puede hablar ruso pero que no conoce C++.
- c. Todos los estudiantes de tu escuela pueden hablar ruso o conocen C++.
- d. Ningún estudiante de tu escuela puede hablar ruso o conoce C++.

**10.** Sea $C(x)$ la proposición "$x$ tiene un gato", sea $D(x)$ la proposición "$x$ tiene un perro" y sea $F(x)$ la proposición "$x$ tiene un hurón". Exprese cada una de estas afirmaciones en términos de $C(x)$, $D(x)$, $F(x)$, cuantificadores y conectivos lógicos. El dominio consiste en todos los estudiantes de tu clase.

- a. Un estudiante de tu clase tiene un gato, un perro y un hurón.
- b. Todos los estudiantes de tu clase tienen un gato, un perro o un hurón.
- c. Algún estudiante de tu clase tiene un gato y un hurón, pero no un perro.
- d. Ningún estudiante de tu clase tiene un gato, un perro y un hurón.
- e. Para cada uno de los tres animales, gatos, perros y hurones, hay un estudiante en tu clase que tiene este animal como mascota.

**17.** Sea $D$ el conjunto de todos los estudiantes en su escuela y sea $M(s)$ "$s$ es un estudiante de la licenciatura en matemáticas", sea $C(s)$ "$s$ es un estudiante de ciencias de la computación" y sea $E(s)$ "$s$ es un estudiante de ingeniería". Exprese cada uno de los siguientes enunciados utilizando cuantificadores, variables y los predicados $M(s)$, $C(s)$ y $E(s)$.

- a. Hay un estudiante de ingeniería que es estudiante de matemáticas.
- b. Cada estudiante de ciencias de la computación es un estudiante de ingeniería.
- c. No hay estudiantes de ciencias de la computación que sean estudiantes de ingeniería.
- d. Algunos estudiantes de ciencias de la computación también son estudiantes de matemáticas.
- e. Algunos estudiantes de ciencias de la computación son estudiantes de ingeniería y otros no.

**19.** Traduzca de dos maneras cada una de estas afirmaciones a expresiones lógicas utilizando predicados, cuantificadores y conectivos lógicos. Primero, considere el dominio consistente en los estudiantes de su clase y segundo, considere que consiste en todas las personas.

- a. Todos en su clase tienen un teléfono celular.
- b. Alguien en su clase ha visto una película extranjera.
- c. Hay una persona en su clase que no puede nadar.
- d. Todos los estudiantes de su clase pueden resolver ecuaciones cuadráticas.
- e. Algún estudiante de su clase no quiere ser rico.

**20.** Traduzca cada una de estas afirmaciones a expresiones lógicas usando predicados, cuantificadores y conectivos lógicos.

- a. Nadie es perfecto.
- b. No todos son perfectos.
- c. Todos tus amigos son perfectos.
- d. Al menos uno de tus amigos es perfecto.
- e. Todos son tus amigos y son perfectos.
- f. No todos son tus amigos o alguien no es perfecto.

### Bloque D — Expansión de cuantificadores sobre dominio finito (15, 16)

**15.** Suponga que el dominio de la función proposicional $P(x)$ consiste en los enteros 0, 1, 2, 3 y 4. Escriba cada una de estas proposiciones usando disyunciones, conjunciones y negaciones.

- a. $\exists x\ P(x)$
- b. $\forall x\ P(x)$
- c. $\exists x\ \neg P(x)$
- d. $\forall x\ \neg P(x)$
- e. $\neg \exists x\ P(x)$
- f. $\neg \forall x\ P(x)$

**16.** Suponga que el dominio de la función proposicional $P(x)$ consiste en los enteros 1, 2, 3, 4 y 5. Escriba cada una de estas proposiciones usando disyunciones, conjunciones y negaciones.

- a. $\exists x\ P(x)$
- b. $\forall x\ P(x)$
- c. $\neg \exists x\ P(x)$
- d. $\neg \forall x\ P(x)$
- e. $\forall x\,(x \ne 3 \to P(x)) \lor \exists x\ \neg P(x)$

### Bloque E — Dominios y validez contextual (18)

**18.** Para cada una de estas afirmaciones, encuentre un dominio para el cual la afirmación sea verdadera y un dominio para el cual la afirmación sea falsa.

- a. Todos hablan hindi.
- b. Hay alguien mayor de 21 años.
- c. Cada dos personas tienen el mismo nombre.
- d. Alguien conoce a más de otras dos personas.

## ¿Cómo verificar sus propias respuestas?

> [!TIP]
> Antes de dar por terminado un ejercicio, revise:
> 1. ¿Identificó con claridad el **dominio de discurso** antes de evaluar la proposición? El mismo enunciado puede ser verdadero en un dominio y falso en otro (ver Bloque E).
> 2. Para declarar falso un $\forall x\ P(x)$, ¿encontró un contraejemplo concreto? Para declarar verdadero un $\exists x\ P(x)$, ¿encontró al menos un caso concreto que lo satisfaga?
> 3. Al negar una proposición cuantificada, ¿aplicó correctamente el De Morgan cuántico ($\neg \forall x\ P(x) \equiv \exists x\ \neg P(x)$), en vez de simplemente anteponer $\neg$ sin cambiar el cuantificador?

## Anexos completos (referencia extendida)

<details>
<summary>Ver Anexo 2 — Formas Aristotélicas</summary>

| Forma | Nombre | Proposición | Forma lógica |
|---|---|---|---|
| $A(S,P)$ | Universal afirmativa | Todos los S son P | $\forall x\,(S(x) \to P(x))$ |
| $E(S,P)$ | Universal negativa | Ningún S es P / Todos los S no son P | $\forall x\,(S(x) \to \neg P(x))$ |
| $I(S,P)$ | Particular afirmativa | Algún S es P | $\exists x\,(S(x) \land P(x))$ |
| $O(S,P)$ | Particular negativa | Algún S no es P | $\exists x\,(S(x) \land \neg P(x))$ |

</details>

<details>
<summary>Ver Anexo 3 — Fórmulas de lógica proposicional</summary>

**Equivalencias lógicas**

| Nombre | Equivalencia lógica |
|---|---|
| Conmutatividad | $P \land Q \equiv Q \land P$ ; $P \lor Q \equiv Q \lor P$ |
| Asociatividad | $P \land (Q \land R) \equiv (P \land Q) \land R$ ; $P \lor (Q \lor R) \equiv (P \lor Q) \lor R$ |
| Distributividad | $P \land (Q \lor R) \equiv (P \land Q) \lor (P \land R)$ ; $P \lor (Q \land R) \equiv (P \lor Q) \land (P \lor R)$ |
| Idempotencia | $P \land P \equiv P$ ; $P \lor P \equiv P$ |
| Doble negación | $\neg(\neg P) \equiv P$ |
| Leyes de De Morgan | $\neg(P \land Q) \equiv \neg P \lor \neg Q$ ; $\neg(P \lor Q) \equiv \neg P \land \neg Q$ |
| Identidad | $P \land V \equiv P$ ; $P \lor F \equiv P$ |
| Dominación | $P \land F \equiv F$ ; $P \lor V \equiv V$ |
| Absorción | $P \land (P \lor Q) \equiv P$ ; $P \lor (P \land Q) \equiv P$ |
| Complemento | $P \land \neg P \equiv F$ ; $P \lor \neg P \equiv V$ |
| Implicación | $P \to Q \equiv \neg P \lor Q$ |
| Contrarrecíproco | $P \to Q \equiv \neg Q \to \neg P$ |
| Equivalencia | $P \leftrightarrow Q \equiv (P \to Q) \land (Q \to P)$ |

**Reglas de inferencia**

| Nombre | Regla de inferencia |
|---|---|
| Modus Ponens | $p \to q,\ p\ \therefore q$ |
| Modus Tollens | $p \to q,\ \neg q\ \therefore \neg p$ |
| Silogismo Hipotético (Transitividad) | $p \to q,\ q \to r\ \therefore p \to r$ |
| Silogismo disyuntivo (Eliminación) | $p \lor q,\ \neg p\ \therefore q$ |
| Simplificación | $p \land q\ \therefore p$ |
| Conjunción | $p,\ q\ \therefore p \land q$ |
| Prueba de división por casos | $p \lor q,\ p \to r,\ q \to r\ \therefore r$ |
| Adición | $p\ \therefore p \lor q$ |
| Resolución | $p \lor q,\ \neg p \lor r\ \therefore q \lor r$ |

</details>
