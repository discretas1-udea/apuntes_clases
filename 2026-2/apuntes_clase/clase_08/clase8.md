![Built with AI](https://img.shields.io/badge/Built%20with-AI-blue.svg)

# 🐔 Expediente Gallinero — El Orden Importa
### Cuantificadores anidados, alcance y precedencia, equivalencias cuantificacionales, y ambigüedad en lógica formal

*Notas de clase — Matemáticas Discretas 1 · Módulo 2: Lógica Cuantificacional (Lógica de Predicados)*
*Universidad de Antioquia · Ingeniería de Sistemas*

---

## Cerrando el caso anterior

La sesión pasada, el ingeniero del gallinero le respondió a su jefe con precisión matemática sobre el líder de sincronización — pero el reporte quedó a medias. El jefe había preguntado, de pasada, algo más:

> *"El gallinero, ¿tiene un único técnico, o cada pollo tiene el suyo?"*

Esa pregunta se quedó pendiente porque exige combinar **dos** cuantificadores en una misma fórmula — uno *dentro* del alcance del otro — y eso era, literalmente, el vacío que dejamos abierto. El ingeniero ya había escrito ambas fórmulas candidatas y sospechaba, por las advertencias del profesor, que no eran la misma afirmación:

$$\forall x\ \exists y\ tecnico(y,x) \qquad\text{vs.}\qquad \exists y\ \forall x\ tecnico(y,x)$$

Hoy cerramos esa pregunta con rigor. Pero antes, una historia que muestra por qué esto no es un simple tecnicismo de notación.

## El caso — un malentendido en la fábrica de microchips

Imagine que visita una fábrica de microchips y el guía le dice: *"Hay una persona que supervisa todos los detalles del proceso de producción."* Esa frase admite, honestamente, dos lecturas muy distintas:

1. **Hay una sola persona** que supervisa, ella sola, cada detalle del proceso.
2. **Para cada detalle** del proceso hay alguien que lo supervisa — pero podrían ser personas distintas para detalles distintos.

Con lenguaje natural, el guía sabe cuál de las dos quiso decir; usted, escuchándolo, podría quedarse con la duda. Esa clase de ambigüedad — una especificación que admite más de una lectura razonable — no es un problema exclusivo del lenguaje cotidiano, y en ingeniería de software ha costado caro más de una vez: la sonda *Mars Climate Orbiter* (1999) se destruyó al entrar a la atmósfera de Marte porque dos equipos asumieron sistemas de unidades distintos sin que los requerimientos lo aclararan; el cohete *Ariane 5* (vuelo 501, 1996) explotó 37 segundos después del despegue por un desbordamiento numérico en software reutilizado sin revalidar sus supuestos; y el sistema de inventario de Hershey's (1999) falló en plena temporada alta por requerimientos ambiguos entre dos módulos que debían comunicarse. Ninguno de los tres fue, específicamente, un error de orden de cuantificadores — pero los tres comparten la misma raíz: alguien leyó una especificación de una manera cuando el sistema necesitaba la otra. El orden de "para todo" y "existe" es, precisamente, uno de los lugares donde esa clase de ambigüedad aparece en lógica formal — y hoy construimos las herramientas para que ahí, al menos, deje de ser posible.

---

## Antes de comenzar — lo que ya debería saber

Este documento continúa directamente los dos anteriores. Antes de seguir, repase mentalmente (no hace falta abrir los otros documentos, aunque puede consultar [Clase 7](clase7.md) y [Clase 8](clase8.md) si quiere el detalle completo):

| Concepto | En una frase | De dónde viene |
|:---|:---|:---|
| Universo / dominio, predicado | El conjunto de objetos sobre el que se razona; una propiedad que se vuelve V o F al aplicarse a un objeto | Clase 7 |
| $\forall x\ P(x)$ / $\exists x\ P(x)$ | *"Para todo"* (falso con un contraejemplo) / *"Existe al menos uno"* (falso solo si ninguno cumple) | Clase 7 |
| Formas aristotélicas | $\forall$ se empareja con $\rightarrow$ (A, E); $\exists$ se empareja con $\land$ (I, O) | Clase 7 |
| Cuantificador de unicidad $\exists!\ x\ P(x)$ | *"Existe exactamente un x"* — combina $\exists$, $\forall$ e igualdad | Clase 8 |
| Negación de cuantificadores | $\neg\forall x\ P(x)\equiv\exists x\ \neg P(x)$ ; $\neg\exists x\ P(x)\equiv\forall x\ \neg P(x)$ | Clase 8 |

Eso es todo lo que se necesita. Este documento no depende de conexión a internet para estudiarlo.

---

# Parte I — Alcance y Precedencia

## I.1 Los cuantificadores se "pegan" a lo que sigue inmediatamente

Al igual que $\neg$ tiene mayor precedencia que $\land$, $\lor$, $\rightarrow$ y $\leftrightarrow$, los cuantificadores $\forall$ y $\exists$ también tienen **mayor precedencia que todos los conectivos lógicos**: sin paréntesis, un cuantificador gobierna solo el predicado atómico que tiene inmediatamente al lado, no todo lo que sigue en la línea.

> [!NOTE]
> Esta es la convención que adoptamos en este curso, siguiendo a Rosen (nuestro libro de texto): sin paréntesis, $\forall x\ \phi$ toma como argumento **una única** subfórmula $\phi$ — el átomo más cercano — nunca una secuencia libre de símbolos sueltos. No es la única convención posible en lógica formal (otros textos tratan el alcance por defecto de forma distinta), pero es la que usaremos siempre aquí. Por eso $\forall x\ P(x)\lor Q(x)$ se lee en este curso como $(\forall x\ P(x))\lor Q(x)$ — y precisamente porque la convención no es universal entre textos, la regla de oro de abajo (paréntesis siempre que haya más de un predicado) importa todavía más: elimina la dependencia de cuál convención esté usando quien lee la fórmula.

> [!WARNING]
> Considere la cadena de símbolos $\forall x\ P(x) \lor Q(x)$, sin paréntesis. Por precedencia, esto se lee como $\bigl(\forall x\ P(x)\bigr) \lor Q(x)$ — el $\forall x$ solo alcanza a $P(x)$. Pero fíjese en el problema: en esa lectura, la $x$ dentro de $Q(x)$ queda **fuera** del alcance de cualquier cuantificador — es una variable libre, sin dueño. Una fórmula con una variable libre no es una proposición cerrada (no tiene, por sí sola, un valor de verdad fijo). Esto no es un defecto del sistema: es la razón por la que, en la práctica, **nunca se escribe un cuantificador seguido de un conectivo sin paréntesis** — si la intención era que la $x$ de $Q(x)$ también estuviera ligada, la forma correcta es $\forall x\ \bigl(P(x) \lor Q(x)\bigr)$, una fórmula completamente distinta (y esta vez sí, correctamente formada).

> [!IMPORTANT]
> **Regla de oro.** Cuando un cuantificador va seguido de más de un predicado o de un conectivo lógico, **use paréntesis siempre** para dejar explícito hasta dónde llega su alcance. No confíe en la precedencia por defecto salvo para el caso más simple: un cuantificador seguido de un único predicado atómico.

## I.2 Alcance (scope)

> [!IMPORTANT]
> El **alcance** de un cuantificador es la porción de la fórmula sobre la cual ese cuantificador —y la variable que introduce— tiene efecto. Sin paréntesis, el alcance se extiende hasta el final de la subfórmula; con paréntesis, el alcance es exactamente lo que queda encerrado.

Tome el enunciado *"todo estudiante lee al menos un libro"*, con $estudiante(x)$, $libro(y)$ y $lee(x,y)$:

$$\forall x\ \underbrace{\Bigl(estudiante(x) \rightarrow \exists y\ \bigl(libro(y)\land lee(x,y)\bigr)\Bigr)}_{\text{alcance de }\forall x}$$

Dentro de ese alcance más grande, hay uno más pequeño:

$$\exists y\ \underbrace{\bigl(libro(y)\land lee(x,y)\bigr)}_{\text{alcance de }\exists y}$$

El alcance de $\forall x$ es *todo* el paréntesis grande (incluyendo el $\exists y$ completo); el alcance de $\exists y$ es solo la conjunción interna. Esto importa por tres razones prácticas: evita ambigüedad (queda claro qué variable pertenece a qué cuantificador), es requisito para que una deducción sea válida (usar una variable fuera de su alcance es un error lógico), y es la base de todo lo que sigue hoy — los cuantificadores anidados.

> [!TIP]
> **Compruebe su comprensión.** En $\exists x\ \bigl(robot(x) \land \forall y\ (bateria(y)\rightarrow compatible(x,y))\bigr)$, ¿cuál es el alcance de $\forall y$?
>
> <details><summary>Ver respuesta</summary>
>
> Solo $bateria(y)\rightarrow compatible(x,y)$ — la implicación que está entre el paréntesis que abre inmediatamente después de $\forall y$. El alcance de $\exists x$, en cambio, es la fórmula completa desde $robot(x)$ hasta el final.
>
> </details>

## I.3 Ocurrencias libres y ligadas — nombrando lo que ya vimos

> [!IMPORTANT]
> Una **ocurrencia** de una variable es **ligada** si está dentro del alcance de un cuantificador que la introduce; si no, es **libre**. En $\forall x\ (estudiante(x)\rightarrow\exists y\ (libro(y)\land lee(x,y)))$, todas las ocurrencias de $x$ y de $y$ son ligadas — no queda ninguna suelta. En el ejemplo mal formado de la advertencia anterior, $\forall x\ P(x)\lor Q(x)$, la $x$ dentro de $Q(x)$ es exactamente una ocurrencia **libre**: por eso la fórmula no es una proposición cerrada.

Esta distinción importa para algo concreto: **sustituir una variable por un objeto específico solo tiene sentido en sus ocurrencias libres** — una ocurrencia ligada ya está "hablando de todos" o "de alguno", no de un objeto en particular, así que no hay nada que sustituir ahí. Esta idea de sustitución es la base formal de las reglas de inferencia cuantificacional (instanciación y generalización) que veremos más adelante en el curso; por ahora basta con reconocer libre vs. ligada a simple vista.

---

# Parte II — Cuantificadores Anidados: el Orden Importa

## II.1 Qué es un cuantificador anidado

> [!IMPORTANT]
> Una fórmula tiene **cuantificadores anidados** cuando un cuantificador aparece dentro del alcance de otro — como el $\exists y$ dentro del $\forall x$ del ejemplo anterior. Muchos enunciados técnicamente importantes necesitan varios cuantificadores a la vez, y el orden en que se escriben **no es intercambiable en general**.

Compare estas dos fórmulas, con dominio de personas y $sigue(x,y)$: *"x sigue a y en redes sociales"*:

$$\forall x\ \exists y\ sigue(x,y) \qquad\text{vs.}\qquad \exists y\ \forall x\ sigue(x,y)$$

La primera dice *"cada persona sigue a alguien"* — el testigo puede **depender de quién sea $x$**: Ana podría seguir a Beto, y Beto a alguien completamente distinto; no hace falta que sea la misma cuenta para todos. La segunda dice *"hay (al menos) una cuenta a la que todos siguen"* — una cuenta común, la misma para cada persona del dominio; podría haber una sola, o incluso más de una, pero el enunciado solo exige que exista al menos esa. Son afirmaciones con contenido claramente distinto, y no es difícil construir una situación donde una es verdadera y la otra falsa.

**Ejemplo concreto.** Sea el dominio $U=\lbrace Ana, Beto, Carla\rbrace$ y la relación $sigue(x,y)$ dada por: Ana sigue a Beto, Beto sigue a Carla, Carla sigue a Ana (un ciclo, sin repeticiones).

| $x$ | ¿A quién sigue $x$? |
|:---:|:---:|
| Ana | Beto |
| Beto | Carla |
| Carla | Ana |

**Verifique $\forall x\ \exists y\ sigue(x,y)$**: Ana → Beto ✓, Beto → Carla ✓, Carla → Ana ✓. Las tres personas siguen a alguien. **Verdadera.**

**Verifique $\exists y\ \forall x\ sigue(x,y)$**: ¿hay alguien seguido por las tres a la vez? Beto solo lo sigue Ana; Carla solo la sigue Beto; Ana solo la sigue Carla. Ningún nombre aparece en las tres filas de la tabla. **Falsa.**

$$\forall x\ \exists y\ sigue(x,y) \text{ es verdadera, pero } \exists y\ \forall x\ sigue(x,y) \text{ es falsa — con la misma relación.}$$

> [!NOTE]
> Cuando **ambos** cuantificadores son del mismo tipo ( $\forall\forall$ o $\exists\exists$ ), el orden sí se puede intercambiar sin cambiar el significado: $\forall x\forall y\ P(x,y) \equiv \forall y\forall x\ P(x,y)$, y lo mismo para $\exists\exists$. El problema aparece únicamente cuando se mezclan $\forall$ y $\exists$.

## II.2 Cinco reglas para trabajar con cuantificadores anidados

1. **El orden importa** cuando se mezclan $\forall$ y $\exists$ — cambiarlo puede cambiar el valor de verdad.
2. **Cada cuantificador usa su propia variable.** Reutilizar el mismo nombre en dos cuantificadores anidados no deja la fórmula sin significado — el cuantificador más interno "sombrea" (captura) al externo, y el significado técnico queda perfectamente definido — pero es una fuente segura de errores de lectura. Evítelo siempre.
3. **El alcance sigue siempre una de dos reglas, nunca "hasta donde parezca":** sin paréntesis, es solo el átomo inmediato (Parte I.1); con paréntesis, es exactamente la subfórmula que encierran (Parte I.2) — nunca algo intermedio o ambiguo.
4. **Use paréntesis siempre que haya duda** sobre qué parte pertenece a qué cuantificador.
5. **El dominio debe quedar explícito** — de qué conjunto provienen las variables cuantificadas.

> [!WARNING]
> **Error frecuente 1 — reutilizar la variable.** $\forall x\ \exists x\ marca(x,x)$ ( una persona $x$ que marca como favorita una página $x$ ) reutiliza $x$ en el segundo cuantificador: la $x$ del $\exists$ "sombrea" (captura) la del $\forall$ — dentro de su alcance, toda referencia a $x$ pertenece al $\exists$, no al $\forall$ externo. De hecho, el $\forall x$ externo queda *vacuo*: todo lo que sigue ( $\exists x\ marca(x,x)$ ) ya no contiene ninguna $x$ libre sobre la que ese $\forall x$ pueda actuar — todas quedaron capturadas por el $\exists$. La fórmula termina significando exactamente lo mismo que $\exists x\ marca(x,x)$ solo, con un $\forall x$ inútil al frente. El significado queda técnicamente definido, pero a simple vista no queda claro cuál es cuál. **Corrección**: $\forall x\ \exists y\ marca(x,y)$ — cada cuantificador con su propia variable, sin ese riesgo de lectura.

> [!WARNING]
> **Error frecuente 2 — invertir el orden sin darse cuenta.** Traducir *"cada persona tiene un plato favorito"* como $\exists y\ \forall x\ favorito(x,y)$ dice, en realidad, *"hay (al menos) un plato que es favorito de todos"* — una afirmación mucho más fuerte y probablemente falsa. La traducción correcta es $\forall x\ \exists y\ favorito(x,y)$: cada quien con el suyo, no necesariamente el mismo.

## II.3 Traducción paso a paso: "cada persona sigue a alguien más"

Tomemos un enunciado con una condición adicional (que no es la misma persona) y traduzcámoslo con método — el mismo patrón que usaremos en la Parte III.

**Paso 1 — Identificar sujeto y predicados.** $persona(x)$: *"x es una persona"*; $sigue(x,y)$: *"x sigue a y"*.

**Paso 2 — Reescribir en lenguaje natural más cercano a la lógica.** *"Cada persona x sigue a alguna otra persona"* → *"para cada persona x, existe una persona y, distinta de x, tal que x sigue a y"*.

**Paso 3 — Formalizar, incluyendo la condición de distinción $x\neq y$.**

$$\forall x\ \Bigl(persona(x) \rightarrow \exists y\ \bigl(persona(y) \land x\neq y \land sigue(x,y)\bigr)\Bigr)$$

> [!NOTE]
> **Anexo opcional — la misma idea en Python.** Si el dominio es una colección finita (una lista, por ejemplo), $\forall x\ \exists y\ P(x,y)$ y $\exists y\ \forall x\ P(x,y)$ se escriben de forma directa con `all()` y `any()` anidados — el orden de anidación en el código refleja exactamente el orden de los cuantificadores:
> ```python
> # ∀x∃y P(x,y) — "todos tienen su y"
> all(any(P(x, y) for y in dominio) for x in dominio)
>
> # ∃y∀x P(x,y) — "hay un y que sirve para todos"
> any(all(P(x, y) for x in dominio) for y in dominio)
> ```
> Fíjese que invertir cuál `for` queda "afuera" y cuál "adentro" es exactamente invertir el orden de los cuantificadores — el mismo cambio de significado, ahora en código.
>
> **Advertencia.** Esta analogía es literal solo cuando el dominio es finito y enumerable, como una lista de nombres o los ocho pollos del gallinero. Casi todos los ejercicios de hoy trabajan sobre $\mathbb{R}$, un dominio infinito — ahí no hay ningún `for` que termine de recorrerlo, y el valor de verdad se determina matemáticamente (con testigos y contraejemplos), no ejecutando código. La lógica de primer orden no es un algoritmo; `all()`/`any()` son una ayuda para la intuición, no una definición.

---

# Parte III — Traducción Metódica: de Lenguaje Natural a Lógica de Predicados

Cuando una frase mezcla varios cuantificadores, conviene un método fijo en vez de traducir "a ojo". Estos son los pasos que usaremos en todos los ejercicios de hoy:

1. **Identifique el dominio** de cada variable (¿personas, números, pollos, técnicos?).
2. **Relacione palabras clave con cuantificadores**: *"todo", "cada", "cualquiera"* → $\forall$ ; *"existe", "algún", "hay al menos uno"* → $\exists$.
3. **Descomponga la oración** en sujeto (quién) y relación (qué ocurre entre sujetos).
4. **Nombre los predicados con claridad** — $lee(x,y)$, $supervisa(x,y)$ — y agregue condiciones si hacen falta ( $x\neq y$, tipos de dominio ).
5. **Delimite el alcance con paréntesis** en cuanto haya más de un cuantificador.

**Ejemplo — "cada profesor supervisa al menos un estudiante".**

Dominio: personas. Predicados: $profesor(p)$, $estudiante(e)$, $supervisa(p,e)$.

$$\forall p\ \Bigl(profesor(p) \rightarrow \exists e\ \bigl(estudiante(e) \land supervisa(p,e)\bigr)\Bigr)$$

Fíjese en el patrón: el cuantificador universal exterior usa una **implicación** (forma A — "todo profesor..."), y el existencial interior usa una **conjunción** (forma I — "...existe un estudiante que..."), exactamente la misma regla de emparejamiento de Clase 7, aplicada ahora dos veces, una anidada en la otra.

---

# Parte IV — Equivalencias Cuantificacionales

## IV.1 Qué significa que dos fórmulas cuantificadas sean equivalentes

> [!IMPORTANT]
> Dos fórmulas $S$ y $T$ con predicados y cuantificadores son **lógicamente equivalentes** ( $S\equiv T$ ) si tienen el **mismo valor de verdad** para cualquier predicado que se sustituya en ellas y para cualquier dominio del discurso que se elija. No basta con que coincidan en un solo ejemplo — deben coincidir siempre.

## IV.2 Negación (repaso — ya demostrado en Clase 8)

$$\neg\ \forall x\ P(x) \equiv \exists x\ \neg P(x) \qquad\qquad \neg\ \exists x\ P(x) \equiv \forall x\ \neg P(x)$$

No repetimos la demostración aquí; si necesita repasar por qué son válidas (no solo memorizarlas), vea la Parte IV de [Clase 8](clase8.md).

## IV.3 Distribución de cuantificadores — cuándo sí funciona

> [!IMPORTANT]
> $$\forall x\ \bigl(P(x) \land Q(x)\bigr) \quad\equiv\quad \forall x\ P(x) \land \forall x\ Q(x)$$
> $$\exists x\ \bigl(P(x) \lor Q(x)\bigr) \quad\equiv\quad \exists x\ P(x) \lor \exists x\ Q(x)$$
> Y si una fórmula $Q$ **no contiene** la variable cuantificada $x$:
> $$\forall x\ \bigl(P(x) \land Q\bigr) \quad\equiv\quad \forall x\ P(x) \land Q \qquad\qquad \exists x\ \bigl(P(x) \lor Q\bigr) \quad\equiv\quad \exists x\ P(x) \lor Q$$

**Justificación en un dominio finito.** Igual que en Clase 8, no se memorizan sueltas — se derivan. Sea $U=\lbrace x_1,\dots,x_n\rbrace$. Por la equivalencia entre $\forall$ y una conjunción extendida (Clase 8, Parte III):

$$\forall x\ (P(x)\land Q(x)) \equiv \bigl(P(x_1)\land Q(x_1)\bigr)\land\cdots\land\bigl(P(x_n)\land Q(x_n)\bigr)$$

Reagrupando por conmutatividad y asociatividad de $\land$ (Clase 6):

$$\equiv \bigl(P(x_1)\land\cdots\land P(x_n)\bigr)\land\bigl(Q(x_1)\land\cdots\land Q(x_n)\bigr) \equiv \forall x\ P(x)\land\forall x\ Q(x)$$

La misma reagrupación, cambiando $\land$ por $\lor$, prueba la versión de $\exists$.

**¿Y en un dominio infinito?** Ahí no hay una conjunción finita que expandir, pero la equivalencia se demuestra directamente por doble implicación, sin asumir nada sobre el tamaño del dominio:

**( $\Rightarrow$ )** Suponga que $\forall x\ (P(x)\land Q(x))$ es verdadera. Entonces, para *cualquier* elemento $a$ del dominio, $P(a)\land Q(a)$ es verdadera — es decir, $P(a)$ es verdadera **y** $Q(a)$ es verdadera. Como $a$ era arbitrario, $P(a)$ es verdadera para todo $a$ (así que $\forall x\ P(x)$ es verdadera), y por separado $Q(a)$ es verdadera para todo $a$ (así que $\forall x\ Q(x)$ es verdadera). Luego $\forall x\ P(x)\land\forall x\ Q(x)$ es verdadera.

**( $\Leftarrow$ )** Suponga ahora que $\forall x\ P(x)\land\forall x\ Q(x)$ es verdadera. Entonces $\forall x\ P(x)$ es verdadera (así que $P(a)$ vale para todo $a$ ) y $\forall x\ Q(x)$ es verdadera (así que $Q(a)$ vale para todo $a$ ). Tome cualquier elemento $a$ del dominio: $P(a)$ es verdadera y $Q(a)$ es verdadera, así que $P(a)\land Q(a)$ es verdadera. Como $a$ era arbitrario, $\forall x\ (P(x)\land Q(x))$ es verdadera.

Como cada lado implica al otro, son equivalentes — y este argumento nunca usó que el dominio fuera finito, así que vale igual para $\mathbb{R}$, $\mathbb{Z}$, o cualquier otro dominio infinito.

Note el patrón: $\forall$ distribuye limpiamente sobre $\land$, y $\exists$ distribuye limpiamente sobre $\lor$ — cada cuantificador con el conectivo de su propia "familia" (recuerde de Clase 7 que $\forall$ ya venía emparejado con $\rightarrow$ y $\exists$ con $\land$ en las formas aristotélicas; aquí el emparejamiento es distinto — $\forall$ con $\land$, $\exists$ con $\lor$ — así que no lo confunda con aquel).

## IV.4 Cuidado — cuándo NO se puede distribuir

> [!WARNING]
> $\forall$ **no** distribuye sobre $\lor$, ni $\exists$ **sobre** $\land$, en general:
> $$\forall x\ \bigl(P(x) \lor Q(x)\bigr) \quad\not\equiv\quad \forall x\ P(x) \lor \forall x\ Q(x)$$
> $$\exists x\ \bigl(P(x) \land Q(x)\bigr) \quad\not\equiv\quad \exists x\ P(x) \land \exists x\ Q(x)$$
> Un solo contraejemplo alcanza para probar que dos fórmulas **no** son equivalentes — no hace falta revisar todos los dominios posibles, solo exhibir uno donde difieran.

**Contraejemplo verificado.** Dominio $\lbrace 1,2\rbrace$, $par(x)$: *"x es par"*, $impar(x)$: *"x es impar"*.

Para la primera fórmula: $par(1)\lor impar(1)$ es verdadero (impar), y $par(2)\lor impar(2)$ es verdadero (par) — así que $\forall x\ (par(x)\lor impar(x))$ es **verdadera** (todo entero es par o impar). Pero $\forall x\ par(x)$ es falsa ( $1$ no es par ), y $\forall x\ impar(x)$ es falsa ( $2$ no es impar ) — así que $\forall x\ par(x) \lor \forall x\ impar(x)$ es **falsa**. Verdadera $\neq$ falsa: no son equivalentes.

Para la segunda fórmula, con el mismo dominio y predicados: $\exists x\ (par(x)\land impar(x))$ pregunta si *algún* entero es par y impar **a la vez** — nunca ocurre, así que es **falsa**. Pero $\exists x\ par(x)$ es verdadera ( $2$ ) y $\exists x\ impar(x)$ es verdadera ( $1$ ), así que $\exists x\ par(x) \land \exists x\ impar(x)$ es **verdadera**. Falsa $\neq$ verdadera: tampoco son equivalentes.

> [!NOTE]
> **Para quien quiera ir más allá — Forma Normal Prenex.** Toda fórmula de lógica de predicados se puede reescribir en una forma equivalente donde *todos* los cuantificadores quedan al frente, seguidos de una fórmula sin cuantificadores — por ejemplo, $\forall x\ (P(x)\rightarrow\exists y\ Q(x,y))$ se puede reescribir como $\forall x\ \exists y\ (P(x)\rightarrow Q(x,y))$. Esa forma se llama **Forma Normal Prenex**, y es la que usan por dentro los demostradores automáticos de teoremas y los motores de resolución de restricciones (SAT/SMT solvers). No es necesaria para este curso — se menciona aquí solo como referencia, por si quiere profundizar (Rosen, ejercicios de la sección 1.4-1.5, o cualquier texto de lógica computacional).

---

# Parte V — Ambigüedad en Lógica Formal

Volviendo al caso de apertura: la ambigüedad en lógica puede aparecer de tres formas distintas.

> [!IMPORTANT]
> **Ambigüedad sintáctica.** Falta claridad en cómo se agrupan los operadores. Ejemplo: $p\lor q\land r$ — ¿es $(p\lor q)\land r$ o $p\lor(q\land r)$? (Se resuelve con la jerarquía de operadores de Clase 5, o con paréntesis.)
>
> **Ambigüedad de alcance.** No queda claro qué parte de la fórmula domina cada cuantificador — exactamente el problema de hoy: $\forall x\ \exists y\ P(x,y)$ y $\exists y\ \forall x\ P(x,y)$ tienen los mismos símbolos, pero no dicen lo mismo.
>
> **Ambigüedad semántica.** La misma estructura admite más de un significado según cómo se interprete el mundo. *"Todos los estudiantes leyeron un libro"* — ¿el mismo libro para todos, o cada quien el suyo? La estructura formal por sí sola no lo decide; hace falta el predicado exacto ( $\exists y\ \forall x\dots$ para "el mismo libro", $\forall x\ \exists y\dots$ para "cada quien el suyo" ).

La lección de las tres es la misma: en matemáticas, lógica formal y ciencia de la computación necesitamos que un enunciado se interprete **exactamente igual** cada vez que se lee — precisamente lo que Mars Climate Orbiter, Ariane 5 y Hershey's no lograron garantizar.

---

# 📘 Ejercicios resueltos — Bloque 1: Verdad y falsedad con cuantificadores anidados

## Ejercicio 1 — Multiplicación, dominio $\mathbb{R}$

Sea $U=\mathbb{R}$ y $P(x,y)$ el predicado $x\cdot y=0$. Determine el valor de verdad de las cuatro combinaciones.

**Paso 1 — $\forall x\ \forall y\ P(x,y)$.** Basta un contraejemplo: $x=1,y=1$ da $1\cdot 1=1\neq 0$. **Falsa.**

**Paso 2 — $\forall x\ \exists y\ P(x,y)$.** Para cualquier $x$ fijo, elija $y=0$: $x\cdot 0=0$ siempre se cumple. **Verdadera** (el testigo $y=0$ funciona para todo $x$, aunque el cuantificador exterior sea $\forall$ ).

**Paso 3 — $\exists x\ \forall y\ P(x,y)$.** Elija $x=0$: $0\cdot y=0$ para todo $y$. **Verdadera**, con testigo $x=0$.

**Paso 4 — $\exists x\ \exists y\ P(x,y)$.** Basta un par: $(x,y)=(0,0)$. **Verdadera.**

## Ejercicio 2 — Multiplicación, otra constante

Sea $U=\mathbb{R}$ y $P(x,y)$ el predicado $x\cdot y=1$.

**Paso 1 — $\forall x\ \forall y\ P(x,y)$.** Contraejemplo $x=1,y=2$: $2\neq 1$. **Falsa.**

**Paso 2 — $\forall x\ \exists y\ P(x,y)$.** Para casi todo $x$ existe $y=1/x$. Pero para $x=0$: no hay ningún $y$ tal que $0\cdot y=1$ (siempre da $0$ ). Un solo $x$ sin testigo basta para refutar el $\forall$ exterior. **Falsa.**

**Paso 3 — $\exists x\ \forall y\ P(x,y)$.** ¿Hay un $x$ que funcione con *todo* $y$? Con $y=0$, $x\cdot 0=0\neq 1$ sin importar $x$. Ningún $x$ pasa esa prueba. **Falsa.**

**Paso 4 — $\exists x\ \exists y\ P(x,y)$.** Testigo $x=y=1$: $1\cdot 1=1$. **Verdadera.**

## Ejercicio 3 — Cuando el orden no importa (mismo tipo de cuantificador)

Sea $P(x,y)$ el predicado $x+y=y+x$ (conmutatividad), dominio $\mathbb{R}$. ¿Son equivalentes $\forall x\ \forall y\ P(x,y)$ y $\forall y\ \forall x\ P(x,y)$?

**Paso único.** Ambas exigen que la igualdad se cumpla para **todas** las parejas del dominio, sin importar en qué orden se recorran — recorrer "primero todo x, luego todo y" o "primero todo y, luego todo x" cubre exactamente el mismo conjunto de parejas. Como vimos en la nota de la Parte II.1, cuando ambos cuantificadores son del mismo tipo, el orden es intercambiable. Ambas son **verdaderas** (la suma de reales siempre conmuta), y $\forall x\forall y\ P(x,y)\equiv\forall y\forall x\ P(x,y)$.

## Ejercicio 4 — Inverso aditivo, el orden sí importa

Sea $Q(x,y)$ el predicado $x+y=0$, dominio $\mathbb{R}$. Compare $\forall x\ \exists y\ Q(x,y)$ con $\exists y\ \forall x\ Q(x,y)$.

**Paso 1 — $\forall x\ \exists y\ Q(x,y)$.** Para cada $x$, el testigo $y=-x$ siempre existe en $\mathbb{R}$ y cumple $x+(-x)=0$. **Verdadera.**

**Paso 2 — $\exists y\ \forall x\ Q(x,y)$.** ¿Hay un único $y$ que sea el inverso de *todo* $x$ a la vez? Si $y$ sirviera para $x=6$, tendría que ser $y=-6$; pero ese mismo $y=-6$ no sirve para $x=1$ ( $1+(-6)=-5\neq0$ ). Ningún $y$ fijo funciona para todos los $x$. **Falsa.**

**Conclusión.** $\forall x\ \exists y\ Q(x,y)\not\equiv\exists y\ \forall x\ Q(x,y)$ — el mismo predicado, verdadero con un orden y falso con el otro.

## Ejercicio 5 — Tres variables, propiedad de clausura

Sea $Q(x,y,z)$ el predicado $x+y=z$, dominio $\mathbb{R}$. Compare $\forall x\ \forall y\ \exists z\ Q(x,y,z)$ con $\exists z\ \forall x\ \forall y\ Q(x,y,z)$.

**Paso 1 — $\forall x\ \forall y\ \exists z\ Q(x,y,z)$.** Para cualquier par $(x,y)$, el testigo $z=x+y$ existe en $\mathbb{R}$ (propiedad de clausura de la suma). **Verdadera.**

**Paso 2 — $\exists z\ \forall x\ \forall y\ Q(x,y,z)$.** ¿Hay un único $z$ que sea la suma de *cualquier* par $(x,y)$? Con $x=2,y=3$ se necesitaría $z=5$; con $x=-2,y=3$ se necesitaría $z=1$. Ningún $z$ fijo sirve para ambos pares. **Falsa.**

---

# 📘 Ejercicios resueltos — Bloque 2: Traducción con cuantificadores anidados

## Ejercicio 6 — Computadores y amistad

Dominio: estudiantes de una escuela. $C(x)$: *"x tiene un computador"*, $F(x,y)$: *"x y y son amigos"*. Traduzca a lenguaje natural: $\forall x\ \bigl(C(x)\lor\exists y\ (C(y)\land F(x,y))\bigr)$.

**Paso 1 — Leer el cuantificador exterior.** Para cada estudiante $x$ de la escuela...

**Paso 2 — Leer la disyunción.** ...$x$ tiene un computador, **o** existe un $y$ tal que $y$ tiene un computador y $x$ es amigo de $y$.

**Paso 3 — Reescribir en lenguaje natural fluido.** *"Cada estudiante de la escuela tiene un computador, o tiene un amigo que tiene un computador."*

## Ejercicio 7 — Amigos que no son amigos entre sí

Mismo dominio y $F(x,y)$ del Ejercicio 6, agregando una tercera variable $z$. Traduzca: $\exists x\ \forall y\ \forall z\ \bigl(F(x,y)\land F(x,z)\land y\neq z \rightarrow \neg F(y,z)\bigr)$.

**Paso 1 — Leer el cuantificador exterior.** Existe un estudiante $x$ tal que...

**Paso 2 — Leer la implicación interna.** ...para cualesquiera estudiantes $y$ y $z$: si $x$ es amigo de $y$, $x$ es amigo de $z$, y $y\neq z$, entonces $y$ y $z$ **no** son amigos entre sí.

**Paso 3 — Reescribir en lenguaje natural fluido.** *"Hay un estudiante cuyos amigos no son amigos entre sí."*

> [!NOTE]
> **Un caso límite que vale la pena notar.** Si $x$ no tiene ningún amigo, la fórmula $\forall y\ \forall z\ (\dots\rightarrow\dots)$ es **verdadera por vacuidad** — no hay ningún par de amigos de $x$ que pueda violar la condición, así que la implicación nunca se pone a prueba. Un estudiante sin amigos técnicamente satisface *"tiene amigos que no son amigos entre sí"*, aunque la lectura intuitiva de la frase sugiera lo contrario. Para excluir ese caso habría que agregar $\exists y\ \exists z\ (F(x,y)\land F(x,z)\land y\neq z)$ como condición adicional — exigir que existan al menos dos amigos distintos.

## Ejercicio 8 — De lenguaje natural a lógica, con condición implícita

Traduzca: *"Si una persona es mujer y es madre, entonces esa persona es la madre de alguien."* Dominio: todas las personas.

**Paso 1 — Definir predicados, con cuidado de no repetir la conclusión en la premisa.** $mujer(x)$: *"x es mujer"*; $esMadre(x)$: *"x tiene registrado el estado civil/parental de madre"* (aquí se trata como un dato atómico dado, sin descomponerlo todavía en "es madre de alguien en particular"); $madreDe(x,y)$: *"x es madre de y"*.

> [!NOTE]
> Si $esMadre(x)$ se hubiera definido directamente como "x es madre de alguien", la traducción sería casi tautológica: el antecedente ya contendría la conclusión, y la implicación no diría nada nuevo. Por eso aquí $esMadre(x)$ se trata como una etiqueta atómica independiente (un dato dado, no derivado) — así la implicación sí aporta algo real: pasa de una etiqueta general a la existencia concreta de al menos un hijo o hija.

**Paso 2 — Identificar la estructura: "si... entonces" es forma A, con un existencial en el consecuente.**

$$\forall x\ \Bigl(mujer(x)\land esMadre(x) \rightarrow \exists y\ madreDe(x,y)\Bigr)$$

## Ejercicio 9 — Unicidad anidada: "todos tienen un único mejor amigo"

Dominio: todas las personas. $B(x,y)$: *"y es el mejor amigo de x"*. Traduzca *"todos tienen un único mejor amigo"*.

**Paso 1 — Reconocer el patrón "para cada uno, exactamente uno".** Esto combina el $\forall$ de hoy con el $\exists!$ de Clase 8.

**Solución 1 — con el cuantificador de unicidad directamente.**

$$\forall x\ \exists!\ y\ B(x,y)$$

**Solución 2 — expandiendo $\exists!$ con las herramientas de Clase 8, dentro del alcance del $\forall x$ de hoy.**

$$\forall x\ \exists y\ \Bigl(B(x,y) \land \forall z\ \bigl(z\neq y \rightarrow \neg B(x,z)\bigr)\Bigr)$$

> [!WARNING]
> **Una tentación que no funciona.** Podría parecer que $\forall x\ \exists y\ \exists z\ \bigl(B(x,y)\land B(x,z)\land z=y\bigr)$ también expresa unicidad, por el aire de "dos variables que terminan siendo iguales". Pero no es así: basta con que $x$ tenga **un solo** mejor amigo (llamémoslo $y_0$ ) para satisfacer la fórmula tomando $y=z=y_0$ — la fórmula nunca llega a comparar $y_0$ contra un *segundo* candidato distinto, así que no descarta que existan más. La unicidad genuina exige, como en la Solución 2, cuantificar sobre un tercer nombre ( $z$ ) e **impedir explícitamente** que sea distinto de $y$ mientras también cumple $B(x,z)$ — no simplemente igualarlos por definición.

---

# 📘 Ejercicios resueltos — Bloque 3: Repaso aplicado (los que usted ya resolvió)

## Ejercicio 10 — El predicado de los correos electrónicos

Sea $Q(x,y)$: *"x ha enviado un correo electrónico a y"*, con dominio los estudiantes de Discretas 1. Traduzca a lenguaje natural cada expresión.

**(a) $\exists x\ \exists y\ Q(x,y)$.** Existe al menos un estudiante que le envió un correo a algún otro estudiante del curso (posiblemente a sí mismo, si nada lo impide).

**(b) $\exists x\ \forall y\ Q(x,y)$.** Existe un estudiante que le envió un correo a **todos** los estudiantes del curso.

**(c) $\forall x\ \exists y\ Q(x,y)$.** Todos los estudiantes del curso enviaron al menos un correo a algún estudiante del curso — no necesariamente al mismo.

**(d) $\forall y\ \exists x\ Q(x,y)$.** Todo estudiante recibió al menos un correo de algún estudiante del curso.

**(e) $\forall y\ \forall x\ Q(x,y)$.** Todos los estudiantes le enviaron un correo a todos los estudiantes del curso — sin excepción.

> [!NOTE]
> Compare (c) y (b): ambas usan $\exists$ y $\forall$, pero en orden distinto y con papeles distintos. (b) exige un **remitente universal** (uno solo, que le escribió a todos); (c) exige que **cada quien** haya escrito al menos un correo, sin exigir que sea el mismo destinatario. Son, otra vez, el mismo par de símbolos con distinto orden y distinto significado.

## Ejercicio 11 — El inverso aditivo, formalizado

Exprese en lenguaje formal: *"cada número real tiene un inverso"* (aditivo).

**Paso 1 — Definir el predicado con precisión.** $P(x,y)$ es el predicado $x+y=0$ — la definición misma de inverso aditivo.

**Paso 2 — Formalizar.**

$$\forall x\ \exists y\ \bigl(x+y=0\bigr)$$

Ya verificamos en el Ejercicio 4 que esta afirmación es verdadera sobre $\mathbb{R}$, y que invertir el orden de los cuantificadores la vuelve falsa.

## Ejercicio 12 — Interpretar una expresión ya formalizada

Diga con palabras qué significa $\forall x\ \forall y\ \bigl((x>0)\land(y>0)\rightarrow xy>0\bigr)$.

**Paso 1 — Leer los dos cuantificadores universales y la implicación.** Para todo número real $x$ y para todo número real $y$: si $x$ es positivo y $y$ es positivo, entonces el producto $xy$ es positivo.

**Paso 2 — Reconocer la ley que describe.** Es la ley de los signos para la multiplicación: el producto de dos números positivos cualesquiera es siempre positivo.

## Ejercicio 13 — Hay una mujer que ha volado en todas las aerolíneas del mundo

Use cuantificadores para expresar: *"Hay una mujer que ha tomado un vuelo en todas las aerolíneas del mundo."*

**Paso 1 — Identificar que hay dos tipos de objetos distintos.** Personas (para las que preguntamos si son mujeres) y aerolíneas (sobre las que se cuantifica "todas"). Dominio único = todas las entidades relevantes (personas y aerolíneas), restringido con predicados.

**Paso 2 — Definir predicados.** $mujer(x)$: *"x es mujer"*; $aerolinea(y)$: *"y es una aerolínea"*; $volo(x,y)$: *"x ha tomado un vuelo en la aerolínea y"*.

**Paso 3 — Reconocer la estructura: "hay una S que P" es forma I (existencial + conjunción); "todas las aerolíneas" dentro de eso es forma A (universal + implicación), anidada dentro del existencial.**

$$\exists x\ \Bigl(mujer(x) \land \forall y\ \bigl(aerolinea(y) \rightarrow volo(x,y)\bigr)\Bigr)$$

> [!TIP]
> **Antes de continuar, pregúntese.** ¿Por qué la parte de "aerolínea" usa $\rightarrow$ y no $\land$, mientras que la parte de "mujer" sí usa $\land$?
>
> <details><summary>Ver respuesta</summary>
>
> Porque son formas aristotélicas distintas, ancladas en cuantificadores distintos. *"Mujer"* está bajo un $\exists$ ("existe **una** que..."), y $\exists$ se empareja con $\land$ (forma I). *"Aerolínea"* está bajo un $\forall$ anidado ("...voló en **todas** las..."), y $\forall$ se empareja con $\rightarrow$ (forma A): no decimos que $y$ sea aerolínea Y que $x$ voló en ella para **cada** $y$ del dominio entero (eso exigiría que absolutamente todo objeto del universo fuera aerolínea) — decimos que **si** $y$ es aerolínea, **entonces** $x$ voló en ella.
>
> </details>

---

# 🐔 Expediente Gallinero — El reporte, esta vez completo

*Este bloque aplica — no explica — los conceptos ya vistos. Toda la teoría quedó atrás; aquí solo se usa.*

Volvamos al ingeniero y a la pregunta pendiente del jefe. Universo de pollos: $U_{pollo}=\lbrace P1,\dots,P8\rbrace$ (ya conocido). Se agrega ahora el universo de técnicos: $U_{tec}=\lbrace T1,T2,T3\rbrace$, y el predicado $tecnico(y,x)$: *"el técnico y da mantenimiento al pollo x"*.

El ingeniero se da cuenta de que la pregunta del jefe en realidad son **tres** preguntas distintas, no una:

| Pregunta | Fórmula |
|:---|:---|
| ¿Cada pollo tiene su técnico? | $\forall x\in U_{pollo}\ \exists y\in U_{tec}\ tecnico(y,x)$ |
| ¿Hay (al menos) un técnico común a los ocho? | $\exists y\in U_{tec}\ \forall x\in U_{pollo}\ tecnico(y,x)$ |
| ¿Hay **exactamente un** técnico común a los ocho? | $\exists!\ y\in U_{tec}\ \forall x\in U_{pollo}\ tecnico(y,x)$ |

> [!NOTE]
> **Dos formas de escribir lo mismo.** Aquí se usa $\forall x\in U_{pollo}$ porque el ingeniero ya tiene dos universos separados y con nombre. Cuando en cambio se trabaja con un solo dominio grande y se filtra con un predicado (como en el Ejercicio 13 o en P3/P8, donde se usa $\forall x\ (robot(x)\rightarrow\dots)$ ), ambas notaciones dicen exactamente lo mismo: $\forall x\in U_{pollo}\ \phi(x)$ es solo una forma abreviada de escribir $\forall x\ (pollo(x)\rightarrow\phi(x))$ sobre un dominio único que incluya a los pollos. Se usa una u otra según si conviene más nombrar los universos por separado o filtrarlos con un predicado — no son reglas distintas.

El ingeniero revisa la bitácora de asignaciones:

| Pollo | Técnico asignado |
|:---:|:---:|
| `P1` | `T1` |
| `P2` | `T1` |
| `P3` | `T2` |
| `P4` | `T2` |
| `P5` | `T3` |
| `P6` | `T3` |
| `P7` | `T1` |
| `P8` | `T2` |

**Pregunta 1 — $\forall x\in U_{pollo}\ \exists y\in U_{tec}\ tecnico(y,x)$**: recorriendo la tabla, cada uno de los ocho pollos tiene exactamente una fila con un técnico asignado — el testigo $y$ depende de $x$ (a `P1` le sirve `T1`; a `P3` le sirve `T2`). **Verdadera.**

**Pregunta 2 — $\exists y\in U_{tec}\ \forall x\in U_{pollo}\ tecnico(y,x)$**: `T1` solo cubre a `P1`, `P2`, `P7`; `T2` solo cubre a `P3`, `P4`, `P8`; `T3` solo cubre a `P5`, `P6`. Ningún técnico aparece en las ocho filas. **Falsa.**

**Pregunta 3 — $\exists!\ y\in U_{tec}\ \forall x\in U_{pollo}\ tecnico(y,x)$**: como la Pregunta 2 ya es falsa —no existe *ningún* técnico común, ni uno solo— la unicidad no tiene nada que evaluar: si no hay ni un testigo, mucho menos hay exactamente un testigo. **Falsa**, por la misma razón que la Pregunta 2, un paso más exigente.

> [!NOTE]
> **Para ver la Pregunta 2 y la Pregunta 3 divergir de verdad**, imagine una bitácora distinta: que tanto `T1` como `T2` estuvieran *cada uno*, por separado, certificados para los ocho pollos (en vez de que `T2` cubra solo a `P3`, `P4`, `P8`). En ese escenario hipotético, $\exists y\ \forall x\ tecnico(y,x)$ sería **verdadera** (`T1` es testigo), pero $\exists!\ y\ \forall x\ tecnico(y,x)$ seguiría siendo **falsa** — porque `T2` es un *segundo* testigo que también cumple, y la unicidad exige descartarlo. Existencia solo pide encontrar uno; unicidad pide, además, comprobar que no hay un segundo.

$$\forall x\in U_{pollo}\ \exists y\in U_{tec}\ tecnico(y,x) \text{ es verdadera}, \qquad \exists y\in U_{tec}\ \forall x\in U_{pollo}\ tecnico(y,x) \text{ es falsa.}$$

El ingeniero ya puede responder con total precisión — y sin ambigüedad de fábrica de microchips.

---

## Ejercicios propuestos

Resuelva los siguientes ejercicios. Las respuestas finales están en el **Solucionario** al final del documento; intente cada uno antes de mirarlas.

**Definiciones para varios ejercicios.** Universo: el laboratorio de robótica ampliado (los ocho pollos robot $P1,\dots,P8$ junto con otros dispositivos y sus componentes). Predicados ya conocidos: $robot(x)$, $funciona(x)$, $tieneVirus(x)$, $bateria(x)$.

**P1.** Sea el dominio $\mathbb{R}$ y $P(x,y)$ el predicado $x-y=0$. Determine el valor de verdad de $\forall x\ \exists y\ P(x,y)$ y de $\exists y\ \forall x\ P(x,y)$. Justifique cada una.

**P2.** Traduzca a lenguaje natural: $\exists x\ \bigl(robot(x)\land\forall y\ (bateria(y)\rightarrow compatible(x,y))\bigr)$, con $compatible(x,y)$: *"la batería y es compatible con el robot x"*.

**P3.** Traduzca: *"Todo pollo tiene al menos un tornillo que le pertenece"*, con $tornillo(y)$ y $pertenece(y,x)$. Luego escriba la versión (probablemente falsa en la práctica) que diría que *"hay un único tornillo compartido por todos los pollos"*, e indique cuál de las dos cuantificaciones corresponde a cada frase.

**P4.** Sea $D=\lbrace 1,2,3\rbrace$ y $P(x,y)$ el predicado $x<y$. Calcule el valor de verdad de las cuatro combinaciones ( $\forall\forall$, $\forall\exists$, $\exists\forall$, $\exists\exists$ ).

**P5.** Dé un contraejemplo (con dominio y predicados propios, distintos a los ya usados en el documento) que muestre que $\exists x\ (P(x)\land Q(x)) \not\equiv \exists x\ P(x)\land\exists x\ Q(x)$.

**P6.** Sea $S(x,y)$: *"x supervisa a y"*, dominio los pollos robot. Traduzca *"hay un pollo que se supervisa a sí mismo, pero ningún otro pollo lo supervisa"* usando cuantificadores anidados y la condición $x\neq y$ donde corresponda.

**P7.** Simplifique la negación de $\forall x\ \exists y\ P(x,y)$ hasta dejarla con el símbolo $\neg$ pegado directamente al predicado. (Ayuda: aplique la ley de De Morgan cuantificacional de Clase 8 dos veces, una por cada cuantificador.)

**P8.** Traduzca: *"Ningún pollo sin batería tiene un técnico asignado"*, e identifique si la estructura general (antes de agregar el cuantificador anidado del técnico) corresponde a alguna forma aristotélica.

**P9.** Sea el predicado $Q(x,y,z)$ dado por $x\cdot y=z$, dominio $\mathbb{R}$. Determine el valor de verdad de $\forall x\ \forall y\ \exists z\ Q(x,y,z)$ y de $\exists z\ \forall x\ \forall y\ Q(x,y,z)$.

**P10.** El jefe hace una última pregunta: *"¿existe una configuración del gallinero en la que un solo técnico sí baste para los ocho pollos?"* Sin usar números concretos, explique con sus propias palabras qué tendría que cambiar en la bitácora de asignaciones para que $\exists y\ \forall x\ tecnico(y,x)$ pasara de falsa a verdadera.

---

## Veredicto — El reporte queda cerrado

El ingeniero completa su respuesta al jefe:

> **Sobre el líder de sincronización** (respondido en Clase 8): hay uno y solo uno, `P1`.
>
> **Sobre el técnico:** *"El gallinero no tiene un técnico común a los ocho pollos — el mantenimiento está distribuido entre tres personas. Lo que sí es cierto es que cada pollo, individualmente, tiene su técnico asignado; ninguno queda sin responsable."* En símbolos: $\forall x\in U_{pollo}\ \exists y\in U_{tec}\ tecnico(y,x)$ es verdadera; $\exists y\in U_{tec}\ \forall x\in U_{pollo}\ tecnico(y,x)$ es falsa.

Con esto, el gallinero queda completamente formalizado: sabemos hablar de todos, de algunos, de exactamente uno, y ahora también de cómo se relacionan varios objetos entre sí incluso cuando un cuantificador depende de otro. Lo que sigue en el curso es usar estas mismas herramientas — universo, predicados, cuantificadores, anidamiento — no solo para *traducir* argumentos, sino para **demostrar** su validez con reglas de inferencia formales, extendiendo a la lógica de predicados el mismo trabajo que ya hicimos con lógica proposicional en el Bug de la Polilla (Clase 6).

---

## Errores frecuentes — repaso rápido

| Error | Por qué está mal | Dónde se explica |
|:---|:---|:---|
| Escribir un cuantificador seguido de un conectivo sin paréntesis | Deja variables libres fuera del alcance pretendido | Parte I |
| Asumir que $\forall x\exists y\ P(x,y)$ y $\exists y\forall x\ P(x,y)$ dicen lo mismo | El orden cambia el significado cuando se mezclan $\forall$ y $\exists$ | Parte II |
| Reutilizar el mismo nombre de variable en dos cuantificadores anidados | El cuantificador más interno sombrea al externo — significado definido, pero imposible de leer con claridad | Parte II |
| Distribuir $\forall$ sobre $\lor$ (o $\exists$ sobre $\land$ ) como si fuera $\land$/$\lor$ respectivamente | No es una equivalencia válida en general — existen contraejemplos | Parte IV |
| Confundir "existen y y z que cumplen P, y además y=z" con unicidad genuina | No descarta un tercer candidato distinto; solo repite el mismo nombre | Ejercicio 9 |
| Asumir que "x tiene [amigos, hijos, técnicos] que cumplen tal condición" excluye el caso de que $x$ no tenga ninguno | Un $\forall y\ \forall z\ (\dots\rightarrow\dots)$ es verdadero por vacuidad si nunca hay un $y$ que dispare la condición | Ejercicio 7 |

---

## Resultados de aprendizaje

Al finalizar este documento, usted debería ser capaz de:

- **Determinar** el alcance de un cuantificador en una fórmula con o sin paréntesis, y **explicar** por qué un cuantificador seguido de un conectivo sin paréntesis puede dejar variables libres.
- **Reconocer** una ocurrencia libre de una ligada, y explicar por qué la sustitución solo tiene sentido en las libres.
- **Traducir y evaluar** cuantificadores anidados, **reconociendo** que el orden de $\forall$ y $\exists$ cambia el significado (y a menudo el valor de verdad) de la expresión, salvo cuando ambos cuantificadores son del mismo tipo.
- **Aplicar** un método sistemático de cinco pasos para traducir enunciados de lenguaje natural con dos o más cuantificadores a lógica de predicados.
- **Aplicar y refutar** las leyes de distribución de cuantificadores sobre $\land$ y $\lor$, construyendo contraejemplos concretos cuando la distribución no es válida.
- **Distinguir** los tres tipos de ambigüedad en lógica formal (sintáctica, de alcance, semántica) y **relacionarlos** con fallas reales de especificación en ingeniería de software.

## Ficha de bolsillo

| Concepto | Símbolo / fórmula | Lectura |
|:---|:---|:---|
| Alcance | La subfórmula que sigue al cuantificador, delimitada por paréntesis (o el átomo inmediato si no hay) | "Hasta dónde llega" el cuantificador |
| Libre vs. ligada | Ligada: dentro del alcance de su cuantificador. Libre: fuera de cualquier alcance | Solo se sustituye lo libre |
| Orden importa (tipos mixtos) | $\forall x\exists y\ P(x,y) \not\equiv \exists y\forall x\ P(x,y)$ | "Cada uno el suyo" vs. "al menos uno, común a todos" |
| Orden no importa (mismo tipo) | $\forall x\forall y\ P \equiv \forall y\forall x\ P$ ; $\exists x\exists y\ P\equiv\exists y\exists x\ P$ | Se puede reordenar libremente |
| Distribución válida | $\forall x(P\land Q)\equiv\forall xP\land\forall xQ$ ; $\exists x(P\lor Q)\equiv\exists xP\lor\exists xQ$ | $\forall$ con $\land$, $\exists$ con $\lor$ |
| Distribución inválida | $\forall x(P\lor Q)\not\equiv\forall xP\lor\forall xQ$ ; $\exists x(P\land Q)\not\equiv\exists xP\land\exists xQ$ | Requiere contraejemplo, no demostración |
| Tres ambigüedades | Sintáctica / de alcance / semántica | Agrupación / orden de cuantificadores / interpretación del mundo |

## Referencias y material para profundizar

### Notas del curso

- **Sitio de notas de clase de Matemáticas Discretas 1**: [discretas1-udea.github.io/discretas1-udea-20261](https://discretas1-udea.github.io/discretas1-udea-20261/). Sitio oficial del curso, actualmente **en construcción**. La página de esta sesión puede aún no estar actualizada allí.
- **[Clase 7](clase7.md)**: universo, predicado, variable, cuantificadores básicos y formas aristotélicas.
- **[Clase 8](clase8.md)**: cuantificador de unicidad, método del contraejemplo, y la negación de cuantificadores demostrada.

### Libros de texto del curso

- **Rosen, K. H.** *Discrete Mathematics and Its Applications* (8ª ed.). McGraw-Hill. Capítulo 1, sección 1.5: *"Nested Quantifiers"* — corresponde exactamente al contenido de hoy.
- **Liben-Nowell, D.** *Connecting Discrete Mathematics and Computer Science*. Cambridge University Press.

### Material web

- **MIT — *Mathematics for Computer Science* (Lehman, Leighton, Meyer)**: [people.csail.mit.edu/meyer/mcs.pdf](https://people.csail.mit.edu/meyer/mcs.pdf). En inglés. Sección 3.6, *"Predicate Formulas"*.
- **Stanford CS103 — *Guide to Logic Translations***: [web.stanford.edu/class/cs103/guide_to_translation](https://web.stanford.edu/class/cs103/guide_to_translation). En inglés. Checklist práctico para traducir a lógica de primer orden.

> [!NOTE]
> Si el acceso a internet es limitado, no es necesario consultar estas fuentes para completar el curso — el contenido de este documento es suficiente.

## Solucionario — Ejercicios propuestos

<details>
<summary><b>Presione aquí para ver las respuestas</b></summary>
<br>

**P1.** $\forall x\ \exists y\ (x-y=0)$: para cualquier $x$, el testigo $y=x$ siempre cumple $x-x=0$. **Verdadera.** $\exists y\ \forall x\ (x-y=0)$: exigiría un único $y$ tal que $x=y$ para *todo* $x$ — imposible salvo que el dominio tuviera un solo elemento. **Falsa.**

**P2.** *"Existe un robot tal que toda batería es compatible con él"* — un robot universalmente compatible con cualquier batería del inventario.

**P3.** *"Todo pollo tiene al menos un tornillo que le pertenece"*: $\forall x\ (robot(x)\rightarrow\exists y\ (tornillo(y)\land pertenece(y,x)))$ — corresponde a $\forall\exists$ (cada uno el suyo). *"Hay un único tornillo compartido por todos"*: $\exists!\ y\ \forall x\ (robot(x)\rightarrow(tornillo(y)\land pertenece(y,x)))$ — el $\exists!$ es imprescindible aquí: sin él, la fórmula solo diría que existe *al menos* un tornillo así, no que sea el único. Es una lectura todavía más fuerte que $\exists\forall$ solo, y en la práctica poco plausible.

**P4.** Con $D=\lbrace 1,2,3\rbrace$ y $P(x,y)$: $x<y$: $\forall x\forall y\ P(x,y)$ es **falsa** (por ejemplo $1<1$ es falso). $\forall x\exists y\ P(x,y)$ es **falsa**: para $x=3$ no existe ningún $y\in D$ con $3<y$. $\exists x\forall y\ P(x,y)$ es **falsa** por la misma razón que la anterior (ningún $x$ es menor que todos, incluyéndose a sí mismo). $\exists x\exists y\ P(x,y)$ es **verdadera**: por ejemplo $1<2$.

**P5.** Ejemplo: dominio $\lbrace gato, perro\rbrace$, $P(x)$: *"x maúlla"*, $Q(x)$: *"x ladra"*. $\exists x\ (P(x)\land Q(x))$ es falsa (ningún animal del dominio hace ambas cosas), pero $\exists x\ P(x)\land\exists x\ Q(x)$ es verdadera (el gato maúlla, el perro ladra). Mismo patrón que el contraejemplo de la Parte IV.4.

**P6.** $\exists x\ \bigl(S(x,x)\land\forall y\ (y\neq x\rightarrow\neg S(y,x))\bigr)$ — existe un pollo que se supervisa a sí mismo, y ningún otro pollo lo supervisa a él.

**P7.** Se cambia cada cuantificador por su contrario, de afuera hacia adentro, hasta que el $\neg$ queda pegado al predicado:

$$\neg\bigl(\forall x\ \exists y\ P(x,y)\bigr) \equiv \exists x\ \neg\bigl(\exists y\ P(x,y)\bigr) \equiv \exists x\ \forall y\ \neg P(x,y)$$

**P8.** *"Ningún pollo sin batería tiene un técnico asignado"*: $\forall x\ \bigl((robot(x)\land\neg bateria(x))\rightarrow\neg\exists y\ tecnico(y,x)\bigr)$. Antes de agregar el cuantificador anidado del técnico, la estructura general ("todo S es no-P", con sujeto compuesto) corresponde a la forma **E** (universal negativa).

**P9.** $\forall x\forall y\exists z\ (x\cdot y=z)$: para cualquier par $(x,y)$, el testigo $z=x\cdot y$ existe en $\mathbb{R}$ (clausura del producto). **Verdadera.** $\exists z\forall x\forall y\ (x\cdot y=z)$: ningún $z$ fijo es el producto de *todo* par — por ejemplo $2\cdot3=6$ pero $2\cdot4=8$. **Falsa.**

**P10.** Tendría que existir (al menos) un técnico, digamos `T1`, que apareciera asignado a los ocho pollos a la vez en la bitácora — es decir, que la columna "Técnico asignado" mostrara `T1` en las ocho filas, sin excepción. (Note que esto solo haría verdadera la Pregunta 2 del Gallinero, $\exists y\ \forall x\ tecnico(y,x)$ — no dice nada todavía sobre si sería el *único* que cumple; para eso haría falta además que ningún otro técnico cubriera también los ocho.) Basta con que **un solo** pollo tenga un técnico distinto para que $\exists y\ \forall x\ tecnico(y,x)$ vuelva a ser falsa — la misma fragilidad que ya vimos en el método del contraejemplo de Clase 8.

</details>
