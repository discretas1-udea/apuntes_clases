# Taller 3 – Matemáticas Discretas

## Objetivo de aprendizaje

Al finalizar este taller, usted podrá determinar la validez de formas de argumento mediante tablas de verdad y mediante reglas de inferencia, y traducir argumentos formulados en lenguaje natural a notación proposicional.

## Referencia rápida

### Reglas de inferencia

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

> [!TIP]
> Esta tabla es la que necesitará para los Bloques C y D. Si necesita repasar operadores lógicos, precedencia o equivalencias lógicas, están disponibles en **Anexos completos → Anexo 4**, al final de este documento.

## Enunciados

### Bloque A — Validez mediante tabla de verdad (1-6)

> Utilice tablas de verdad para determinar si las formas de argumento de los ejercicios, mostrados a continuación, son válidas. Indique qué columnas representan las premisas y cuáles representan la conclusión e incluya una frase de explicación de cómo la tabla de verdad apoya su respuesta. Su explicación debe demostrar que entiende lo que significa que una forma de argumento sea válida o no válida.

**1.** Argumento 1:

$$\begin{aligned}
&p \to q \\
&q \to p \\
&\therefore p \lor q
\end{aligned}$$

**2.** Argumento 2:

$$\begin{aligned}
&p \\
&p \to q \\
&\neg p \lor r \\
&\therefore r
\end{aligned}$$

**3.** Argumento 3:

$$\begin{aligned}
&p \lor q \\
&p \to \neg q \\
&p \to r \\
&\therefore r
\end{aligned}$$

**4.** Argumento 4:

$$\begin{aligned}
&p \land q \to \neg r \\
&p \lor \neg q \\
&\neg q \to p \\
&\therefore \neg r
\end{aligned}$$

**5.** Argumento 5: Error converso

$$\begin{aligned}
&p \to q \\
&q \\
&\therefore p
\end{aligned}$$

**6.** Argumento 5: Error contrario

$$\begin{aligned}
&p \to q \\
&\neg p \\
&\therefore \neg q
\end{aligned}$$

> [!NOTE]
> El enunciado original repite "Argumento 5" tanto en el ejercicio 5 como en el 6. Se transcribe tal como aparece en el documento fuente.

### Bloque B — Argumentos en lenguaje natural, validez mediante tabla de verdad (7-11)

> Dadas las siguientes argumentaciones en lenguaje hablado:
> - Defina las proposiciones simples involucradas en cada enunciado del argumento.
> - Exprese en las tres formas (Notación de consecuentes, tautología y notación proposicional) cada caso.
> - Mediante el uso de la tabla de verdad (identificando claramente las columnas asociadas a las premisas y a la conclusión) identifique la validez de cada argumento.

**7.** Argumento 1: Si Tom no está en el equipo A, entonces, Hua está en el equipo B. Si Hua no está en el equipo B, entonces, Tom está en el equipo A. Por lo tanto, Tom no está en el equipo A o Hua no está en el equipo B.

**8.** Argumento 2: Oleg estudia la licenciatura en matemáticas o Oleg estudia la licenciatura en economía. Si Oleg estudia la licenciatura en matemáticas, entonces a Oleg se le requiere que curse Matemáticas 362. Por lo tanto, Oleg estudia la licenciatura en economía o a Oleg no se le requiere que curse Matemáticas 362.

**9.** Argumento 3: Sandra sabe Java y Sandra sabe C++. Por lo tanto, Sandra sabe C++.

**10.** Argumento 4: Si este número es mayor que 2, entonces su cuadrado es mayor que 4. Este número no es mayor que 2. Por lo tanto, el cuadrado de este número no es mayor que 4.

**11.** Argumento 5: Si este programa es correcto, entonces produce la salida correcta cuando se ejecuta con los datos de prueba que me dio el profesor. Este programa genera la salida correcta cuando se ejecuta con los datos de prueba que me dio el profesor. Por lo tanto, el programa es correcto.

### Bloque C — Validez mediante reglas de inferencia (12-15)

> Mediante el empleo de las reglas de inferencia (dadas en la tabla) demuestre la validez para los siguientes argumentos lógicos:

**12.** Argumento 1:

$$\begin{aligned}
&\neg p \lor q \to r \\
&s \lor \neg q \\
&\neg t \\
&p \to t \\
&\neg p \land r \to \neg s \\
&\therefore \neg q
\end{aligned}$$

**13.** Argumento 2:

$$\begin{aligned}
&p \lor q \\
&q \to r \\
&p \land s \to t \\
&\neg r \\
&\neg q \to u \land s \\
&\therefore t
\end{aligned}$$

**14.** Argumento 3:

$$\begin{aligned}
&\neg p \to r \land \neg s \\
&t \to s \\
&u \to \neg p \\
&\neg w \\
&u \lor w \\
&\therefore \neg t
\end{aligned}$$

**15.** Argumento 4:

$$\begin{aligned}
&p \to q \\
&r \lor s \\
&\neg s \to \neg t \\
&\neg q \lor s \\
&\neg s \\
&\neg p \land r \to u \\
&w \lor t \\
&\therefore u \land w
\end{aligned}$$

### Bloque D — Argumentos en lenguaje natural, validez mediante reglas de inferencia (16-17)

> Dadas las siguientes argumentaciones en lenguaje hablado:
> - Defina las proposiciones simples involucradas en cada enunciado del argumento.
> - Exprese en las tres formas (Notación de consecuentes, tautología y notación proposicional) cada caso.
> - Mediante el empleo de las reglas de inferencia (dadas en la tabla) demuestre la validez para las expresiones lógicas a las que llegó.

**16.** Dada la siguiente información sobre un programa de computadora, encuentre el error en el programa.

a. Hay una variable no declarada o hay un error de sintaxis en las primeras cinco líneas.
b. Si hay un error de sintaxis en las primeras cinco líneas, entonces, falta un punto y coma o el nombre de una variable está mal escrito.
c. No falta un punto y coma.
d. No está mal escrito el nombre de una variable.

**17.** En la parte trasera de un viejo armario descubre una nota firmada por un pirata famoso por su extraño sentido del humor y amor a los rompecabezas lógicos. En la nota escribió que él había escondido el tesoro en algún lugar de la propiedad. Hizo una lista de cinco enunciados verdaderos (del a al e que se muestran a continuación) y desafió a quien encuentre la nota a usarlos para averiguar la ubicación del tesoro:

a. Si esta casa está al lado de un lago, entonces el tesoro no está en la cocina.
b. Si el árbol en el patio delantero es un olmo, entonces el tesoro está en la cocina.
c. Esta casa está al lado de un lago.
d. El árbol del patio delantero es un olmo o el tesoro está enterrado bajo el asta de la bandera.
e. Si el árbol del patio trasero es un roble, el tesoro está en el garaje.

¿Dónde está escondido el tesoro?

## ¿Cómo verificar sus propias respuestas?

> [!TIP]
> Antes de dar por terminado un ejercicio, revise:
> 1. En su tabla de verdad, ¿marcó con claridad cuáles columnas son premisas y cuál es la conclusión?
> 2. Para declarar un argumento válido, ¿revisó **todas** las filas donde todas las premisas son verdaderas (no solo una)? Un argumento es válido si en cada una de esas filas la conclusión también es verdadera.
> 3. Si usó reglas de inferencia, ¿cada paso de su demostración cita explícitamente el nombre de la regla aplicada (Modus Ponens, Silogismo Hipotético, etc.)?

## Anexos completos (referencia extendida)

<details>
<summary>Ver Anexo 1 — tipos de enunciados declarativos</summary>

Sean $P$ y $Q$ dos enunciados declarativos cualquiera (simples o compuestos).

| Tipo | Enunciados |
|---|---|
| Conjuntivo | $P$ y $Q$ • $P$, pero $Q$ • $P$ aún $Q$ • $P$ también $Q$ • $P$ todavía $Q$ • $P$, aunque $Q$ • $P$ sin embargo $Q$ • $P$ además $Q$ • $P$ no obstante $Q$ |
| Disyuntivo | $P$ o $Q$ • $P$, a menos que $Q$ • Al menos una entre $P$ y $Q$ |

> [!TIP]
> "A menos que": si una proposición no es verdadera, la otra es, o será, verdadera. Si $Q$ fuera falsa, le correspondería a $P$ ser cierta.

Sobre el enunciado declarativo condicional: en este caso $P$ representa al antecedente y $Q$ el consecuente.

| Tipo | Enunciados |
|---|---|
| Condicionales (Hipotéticos) | Si $P$ entonces $Q$ • Si $P$, $Q$ • $Q$ si $P$ • $P$ sólo si $Q$ • Para $P$, es necesario $Q$ • Es suficiente $P$ para $Q$ • $Q$ en caso de que $P$ • $Q$ siempre que $P$ • Como $P$, $Q$ • $Q$ cuando $P$ • $P$ implica que $Q$ • Cuando $P$, $Q$ |
| Bicondicionales | $P$ si, y solo si, $Q$ • $P$ es suficiente y necesario para $Q$ • $P$ es equivalente a $Q$ • $P$ y $Q$ son equivalentes |

</details>

<details>
<summary>Ver Anexo 2 — indicadores de pasajes argumentativos deductivos</summary>

En los pasajes argumentativos, $P$ representaría a la(s) premisa(s), $Q$ simboliza a la conclusión.

**Indicadores de conclusión**

| Español | Inglés |
|---|---|
| … por lo tanto $Q$ | thus |
| … de ahí que $Q$ | hence |
| … así $Q$ / … así que $Q$ | so |
| … por consiguiente $Q$ | therefore |
| … en consecuencia $Q$ / … consecuentemente $Q$ | consequently |
| … prueba que $Q$ | prove that |
| … como resultado $Q$ | as a result |
| … por esta razón $Q$ / … por estas razones $Q$ | for this reason / for these reasons |
| … de este modo $Q$ | in this way |
| … se sigue que $Q$ | it follows that |
| … se concluye que $Q$ | it is concluded that |
| … lo que muestra que $Q$ | which shows that |
| … lo que quiere decir que $Q$ | — |
| … lo que conlleva a $Q$ | which leads to |
| … lo que implica que $Q$ | which implies that |
| … lo que permite inferir que $Q$ | which allows us to infer that |
| … lo que lleva a la conclusión de que $Q$ | — |
| … podemos inferir que $Q$ | we can infer that |

**Premisas**

| Español | Inglés |
|---|---|
| … puesto que $P$ / … ya que $P$ | since |
| … porque $P$ | because |
| … como $P$ | — |
| … se sigue de $P$ | follows from |
| … como lo muestra $P$ | as it shows |
| … dado que $P$ | given that |
| … como lo indica $P$ | as indicated |
| … la razón es que $P$ | the reason is that |
| … por la razón de que $P$ | for the reason that |
| … puede inferirse de $P$ | can be inferred from |
| … puede derivarse de $P$ | can be derived from |
| … puede deducirse de $P$ | can be deduced from |
| … en vista del hecho de que $P$ | in view of the fact that |

</details>

<details>
<summary>Ver Anexo 3 — indicadores de pasajes argumentativos inductivos</summary>

| Español | Inglés |
|---|---|
| … debe ser el caso que $Q$ | it must be the case that |
| … probablemente $Q$ | probably |
| … por lo tanto, … probablemente $Q$ | therefore, ... probably |
| … debería(n) $Q$ | should |
| … es probable que $Q$ | it is likely that |
| … debe haber sido que $Q$ | there must have been |
| … se puede decir con virtual certeza $Q$ | it can be said with virtual certainty |
| … puede haber tenido $Q$ | may have had |
| … tendría $Q$ | would have |
| … haría $Q$ | would |

</details>

<details>
<summary>Ver Anexo 4 — formulario completo de operadores lógicos</summary>

**Clasificación de las proposiciones según su estructura**

| Tipo | Descripción | Ejemplo |
|---|---|---|
| Simples (atómicas) | No se pueden dividir en partes más pequeñas con valor de verdad. | Hoy es lunes. |
| Compuestas (moleculares) | Formadas al unir dos o más proposiciones simples mediante conectores lógicos. | Hoy es lunes y hace sol. |

**Clasificación de las proposiciones de acuerdo al valor de verdad de todas sus interpretaciones**

| Tipo | Descripción | Ejemplo |
|---|---|---|
| Tautología | Siempre verdadera para todas sus interpretaciones. | $p \lor \neg p$ |
| Contradicción | Siempre falsa en todas las interpretaciones. | $p \land \neg p$ |
| Contingencia | A veces verdadera, a veces falsa, depende de los valores de verdad. | $p \to q$ |

**Operadores lógicos**

| Operador | Símbolo | Nombre | Descripción |
|---|---|---|---|
| Negación | $\neg p$ | No (NOT) | Niega el valor de verdad de una proposición. Si $p$ es verdadera, $\neg p$ es falsa. |
| Conjunción | $p \land q$ | Y (AND) | Es verdadera solo si ambas proposiciones lo son. |
| Disyunción | $p \lor q$ | O (OR) | Es verdadera si al menos una de las proposiciones lo es. |
| Disyunción exclusiva | $p \oplus q$ | O exclusiva (XOR) | Es verdadera si una, y solo una, de las proposiciones es verdadera. |
| Condicional | $p \to q$ | Si … entonces … (Implica) | Solo es falsa cuando $p$ es verdadera y $q$ es falsa. |
| Bicondicional | $p \leftrightarrow q$ | … si y solo si … (Equivale) | Es verdadera cuando ambas proposiciones tienen el mismo valor de verdad. |

**Tablas de verdad de los operadores lógicos**

Negación

| $p$ | $\neg p$ |
|---|---|
| F | V |
| V | F |

Conjunción

| $p$ | $q$ | $p \land q$ |
|---|---|---|
| F | F | F |
| F | V | F |
| V | F | F |
| V | V | V |

Disyunción inclusiva

| $p$ | $q$ | $p \lor q$ |
|---|---|---|
| F | F | F |
| F | V | V |
| V | F | V |
| V | V | V |

Disyunción exclusiva

| $p$ | $q$ | $p \oplus q$ |
|---|---|---|
| F | F | F |
| F | V | V |
| V | F | V |
| V | V | F |

Condicional

| $p$ | $q$ | $p \to q$ |
|---|---|---|
| F | F | V |
| F | V | V |
| V | F | F |
| V | V | V |

Bicondicional

| $p$ | $q$ | $p \leftrightarrow q$ |
|---|---|---|
| F | F | V |
| F | V | F |
| V | F | F |
| V | V | V |

**Precedencia y asociatividad**

| Prioridad | Símbolo | Asociatividad | Ejemplo con paréntesis |
|---|---|---|---|
| 1 (más alta) | $\neg$ | No aplica (unitario) | $\neg p \land q \Longrightarrow ((\neg p) \land q)$ |
| 2 | $\land$ | Izquierda | $p \land q \land r \Longrightarrow ((p \land q) \land r)$ |
| 3 | $\lor$ | Izquierda | $p \lor q \lor r \Longrightarrow ((p \lor q) \lor r)$ |
| 4 | $\oplus$ | Izquierda | $p \oplus q \oplus r \Longrightarrow ((p \oplus q) \oplus r)$ |
| 5 | $\to$ | Derecha | $p \to q \to r \Longrightarrow (p \to (q \to r))$ |
| 6 (más baja) | $\leftrightarrow$ | Derecha | $p \leftrightarrow q \leftrightarrow r \Longrightarrow (p \leftrightarrow (q \leftrightarrow r))$ |

**Clasificación de expresiones condicionales**

| Nombre | Símbolo | Lectura | Significado lógico |
|---|---|---|---|
| Condicional | $p \to q$ | Si $p$ entonces $q$ | Es falsa solo si $p$ es verdadera y $q$ es falsa. |
| Recíproco | $q \to p$ | Si $q$ entonces $p$ | Invierte antecedente y consecuente. |
| Contrarrecíproco | $\neg q \to \neg p$ | Si no $q$ entonces no $p$ | Lógicamente equivalente a la condicional original. |
| Contrario | $\neg p \to \neg q$ | Si no $p$ entonces no $q$ | Negación de ambas partes de la condicional. |

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
