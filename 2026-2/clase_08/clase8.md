![Built with AI](https://img.shields.io/badge/Built%20with-AI-blue.svg)

# 🐔 Expediente Gallinero — Uno y Solo Uno
### Cuantificador de unicidad, dependencia del dominio, cuantificadores como conjunción/disyunción, y la negación cuantificacional revisitada

*Notas de clase — Matemáticas Discretas 1 · Módulo 2: Lógica Cuantificacional (Lógica de Predicados)*
*Universidad de Antioquia · Ingeniería de Sistemas*

---

## Cerrando el caso anterior (parcialmente)

La sesión pasada, el ingeniero del gallinero terminó su tablero de monitoreo con casi todo resuelto — pero se topó con una frase que no pudo formalizar del todo:

> *"Existe un pollo, un tornillo y una batería tales que el tornillo y la batería pertenecen al mismo pollo, y los tres fallan a la vez."*

Dejamos ahí un vacío explícito: sabíamos escribir varios cuantificadores **independientes** en una misma fórmula (como en $\neg\exists x\ C(x) \land \neg\exists y\ T(y)$, donde cada uno abre y cierra su propio alcance sin depender del otro), pero no sabíamos **anidar** cuantificadores — escribir uno *dentro* del alcance de otro, de modo que uno dependa del otro.

**Ese vacío sigue abierto.** La anidación de cuantificadores merece su propia sesión completa — es material denso y se presta a confusiones que no queremos apurar — así que la dejamos para la próxima clase. Lo que sí resolvemos hoy son otras piezas que también faltaban: qué hacer cuando queremos decir que existe **exactamente un** objeto con cierta propiedad, y por qué el valor de verdad de una afirmación cuantificada puede cambiar por completo según el universo que elijamos — algo que ya intuimos en el Ejercicio propuesto P10 de la sesión pasada, pero que hoy formalizamos con una técnica de refutación con nombre propio.

---

## Antes de comenzar — lo que ya debería saber

Este documento continúa directamente el anterior. Antes de seguir, repase mentalmente (no hace falta abrir el otro documento, aunque puede consultar [Clase 7](clase7.md) si quiere el detalle completo):

| Concepto | En una frase |
|:---|:---|
| Universo / dominio | El conjunto de todos los objetos sobre los que se razona |
| Predicado | Una propiedad o relación que se vuelve V o F al aplicarse a un objeto, ej. $funciona(x)$ |
| Cuantificador universal $\forall x\ P(x)$ | *"Para todo x, se cumple P"* — falso si hay un solo contraejemplo |
| Cuantificador existencial $\exists x\ P(x)$ | *"Existe al menos un x que cumple P"* — falso solo si ninguno lo cumple |
| Formas aristotélicas | $\forall$ se empareja con $\rightarrow$ (formas A, E); $\exists$ se empareja con $\land$ (formas I, O) |
| Negación básica | $\neg\forall x\ P(x)\equiv\exists x\ \neg P(x)$, y $\neg\exists x\ P(x)\equiv\forall x\ \neg P(x)$ |

Eso es todo lo que se necesita. Este documento no depende de conexión a internet para estudiarlo.

---

## El caso — una pregunta del jefe del ingeniero

El ingeniero recibe un correo de su jefe con una pregunta para el reporte semanal:

> *"¿Hay un pollo que actúe como 'líder de sincronización' de la bandada — uno y solo uno?"*

Es una pregunta que suena sencilla, pero *"uno y solo uno"* es más exigente que *"al menos uno"* — con lo que sabemos hasta la sesión pasada, no bastaba con un $\exists$. Al final del documento el ingeniero le responde a su jefe con precisión matemática.

> [!NOTE]
> El jefe también preguntó, de pasada, si el gallinero tiene un único técnico o si cada pollo tiene el suyo. Esa pregunta va a tener que esperar: para responderla con rigor hace falta combinar dos cuantificadores en una misma fórmula, y eso es justo lo que la sesión pasada dejó pendiente y esta todavía no cubre. Vuelve al cierre de este documento.

---

# Parte I — El Cuantificador de Unicidad ( $\exists!$ )

## I.1 Cuando "existe uno" no basta

El cuantificador existencial $\exists x\ P(x)$ solo garantiza que **hay al menos un** objeto que cumple $P$ — podría haber uno, podría haber cien. Muchas veces necesitamos algo más fuerte: decir que hay **uno y solo uno**.

> [!IMPORTANT]
> El **cuantificador de unicidad**, $\exists!\ x\ P(x)$, afirma que **existe exactamente un** elemento del dominio que cumple $P(x)$. Se lee *"existe un único x tal que..."*, *"existe exactamente un x tal que..."*, o *"hay uno y solo un x tal que..."*.

Antes de formalizarlo, compare los tres cuantificadores que ya conoce (o casi) sobre la **misma** población de caritas y el mismo predicado $smiling(x)$: *"x sonríe"*.

**∃ — al menos una.** Basta con que una sonría — no importa cuántas más frunzan el ceño.

<img src="images/exists.png" alt="Grupo de caritas donde solo una sonríe y las demás no; alcanza con esa para que el existencial sea verdadero" width="220">

**∀ — todas.** Se exige que todas sonrían — una sola que no sonría lo arruina.

<img src="images/for-all.png" alt="Grupo de caritas donde todas sonríen; se necesita esto para que el universal sea verdadero" width="220">

**∃! — exactamente una (nuevo hoy).** Se exige que sonría una, y ninguna más — ni cero, ni dos o más.

<img src="images/only-one.png" alt="Grupo de caritas donde exactamente una sonríe; el cuantificador de unicidad es verdadero" width="220">

Fíjese que en el dibujo de $\exists!$ la población es, de hecho, la misma que la de $\exists$ (una sola sonríe): ahí $\exists x\ smiling(x)$ y $\exists!\ x\ smiling(x)$ son **ambas** verdaderas a la vez — no son cuantificadores que compitan, sino que $\exists!$ simplemente exige más que $\exists$.

## I.2 No es un cuantificador nuevo, es un atajo

$\exists!$ no agrega poder expresivo nuevo al lenguaje: es una abreviatura de algo que ya podemos escribir combinando $\exists$, $\forall$ y la igualdad. La idea tiene dos partes:

| Parte | Qué exige | En símbolos |
|:---|:---|:---|
| **Existencia** | Que haya al menos un objeto que cumpla $P$ | $\exists x\ P(x)$ |
| **Unicidad** | Que cualquier otro objeto que también cumpla $P$ sea, en realidad, ese mismo objeto | $\forall y\ \bigl(P(y) \rightarrow y = x\bigr)$ |

Uniendo ambas partes:

$$\exists!\ x\ P(x) \quad\equiv\quad \exists x\ \Bigl(P(x) \land \forall y\ \bigl(P(y) \rightarrow y = x\bigr)\Bigr)$$

que se lee *"existe un x que cumple P, y además cualquier y que también cumpla P es igual a ese mismo x"*.

**Ejemplo genérico.** Sea el dominio $\mathbb{Z}^+$ (enteros positivos) y el predicado $P(x)$: *"x es par y primo"*. ¿Es verdadera $\exists!\ x\ P(x)$?

$$\underbrace{2}_{\text{par y primo}},\quad \underbrace{4, 6, 8, \dots}_{\text{pares, pero no primos (divisibles entre 2 y otro número)}},\quad \underbrace{3, 5, 7, \dots}_{\text{primos, pero no pares}}$$

El número $2$ cumple $P$: es par y primo. Y es el **único** — cualquier otro número par mayor que $2$ es divisible entre $2$ y entre sí mismo, así que tiene al menos tres divisores y no es primo. Por lo tanto $\exists!\ x\ P(x)$ es **verdadera**, con **testigo** $x=2$ (llamamos *testigo* al objeto concreto que se exhibe para probar una afirmación existencial).

> [!WARNING]
> Un error común es declarar $\exists!\ x\ P(x)$ verdadera apenas se encuentra **un** testigo, sin comprobar que sea el único. Encontrar un testigo solo resuelve la mitad del trabajo (la existencia); todavía falta revisar el resto del dominio para descartar un segundo testigo. Basta con que aparezca uno más para que $\exists!$ se vuelva falsa — aunque $\exists$ (sin el símbolo de admiración) siga siendo perfectamente verdadera.

> [!TIP]
> **Compruebe su comprensión.** Sea el dominio $\{1,2,3,4,5\}$ y $Q(x)$: *"x es múltiplo de 3"*. ¿Es verdadera $\exists!\ x\ Q(x)$?
>
> <details><summary>Ver respuesta</summary>
>
> Sí. El único múltiplo de $3$ en $\{1,2,3,4,5\}$ es $3$ mismo ( $1,2,4,5$ no lo son). Existencia: $Q(3)$ es verdadero. Unicidad: ningún otro elemento del dominio cumple $Q$. Por lo tanto $\exists!\ x\ Q(x)$ es verdadera.
>
> </details>

---

# Parte II — El Valor de Verdad Depende del Dominio

## II.1 La misma fórmula, universos distintos

Ya habíamos visto (Ejercicio propuesto P10 de la sesión anterior) que una misma afirmación cuantificada puede ser verdadera en un universo y falsa en otro. Formalicémoslo con tres casos que muestran las distintas combinaciones posibles.

Sea el predicado $P(x)$: *"x < 2"*.

| Dominio $U$ | $\exists x\ P(x)$ | $\forall x\ P(x)$ | Explicación |
|:---|:---:|:---:|:---|
| $\mathbb{Z}^+ = \{1, 2, 3, \dots\}$ | **V** | **F** | $1<2$ es verdadero (existe al menos uno), pero $2<2$ es falso (no todos) |
| $\mathbb{Z}^- = \{\dots, -3, -2, -1\}$ | **V** | **V** | Todo entero negativo es menor que $2$: se cumple para al menos uno y para todos a la vez |
| $\{3, 4, 5\}$ | **F** | **F** | Ningún elemento del dominio es menor que $2$ |

La lección: **ni el predicado ni la fórmula cambiaron** — lo único que cambió fue el universo, y eso bastó para mover el valor de verdad de ambos cuantificadores de manera independiente. Por eso, cuando el dominio no se especifica en un ejercicio, la traducción está incompleta.

## II.2 El método del contraejemplo, formalizado

Para refutar una afirmación existencial ( $\exists x\ P(x)$ es falsa) hay que revisar *todo* el dominio y comprobar que ninguno cumple $P$. Pero para refutar una afirmación **universal** basta con mucho menos trabajo:

> [!IMPORTANT]
> **Método del contraejemplo.** Es la técnica de refutación que consiste en encontrar **un solo caso** donde una proposición universal ( $\forall x\ P(x)$ ) no se cumple. Formalmente: encontrar un elemento $x_0$ del dominio tal que $P(x_0)$ sea falso. Un único contraejemplo basta para declarar falsa toda la afirmación — sin importar cuántos elementos sí la cumplan.

Ya usamos esta técnica sin nombrarla en la sesión anterior, al mostrar que $\forall x\in\mathbb{R},\ x^2\geq x$ es falsa con el contraejemplo $x_0 = \tfrac{1}{2}$. La volveremos a usar, ya con nombre propio, en los ejercicios resueltos.

---

# Parte III — Cuantificadores como Conjunción y Disyunción

## III.1 En un dominio finito, cuantificar es "desenrollar"

Ya sabemos que $\forall x\ P(x)$ exige que $P$ se cumpla para todos, y $\exists x\ P(x)$ exige que se cumpla para al menos uno. Cuando el dominio es **finito**, esta idea se puede escribir sin ningún cuantificador — reemplazándolo por una larga conjunción o disyunción.

> [!IMPORTANT]
> Si el dominio finito es $U=\{x_1, x_2, \dots, x_n\}$, entonces:
> $$\forall x\ P(x) \;\equiv\; P(x_1) \land P(x_2) \land \cdots \land P(x_n)$$
> $$\exists x\ P(x) \;\equiv\; P(x_1) \lor P(x_2) \lor \cdots \lor P(x_n)$$
> Esta equivalencia **no** se puede aplicar en dominios infinitos — ahí no hay forma de escribir la conjunción o disyunción completa.

**Ejemplo.** Sea el dominio $U=\{Martin, Nelson, Bart\}$ y el predicado $aprobo(x)$: *"x aprobó"*.

<img src="images/martin-nelson-bart.png" alt="Martin, Nelson y Bart, los tres estudiantes que forman el dominio U del ejemplo" width="320">

Enunciado *"Todos los estudiantes aprobaron"*:

$$\forall x\ aprobo(x) \;\equiv\; aprobo(Martin) \land aprobo(Nelson) \land aprobo(Bart)$$

Enunciado *"Algunos estudiantes aprobaron"*:

$$\exists x\ aprobo(x) \;\equiv\; aprobo(Martin) \lor aprobo(Nelson) \lor aprobo(Bart)$$

La primera dice que los tres aprobaron, todos a la vez (basta con que uno repruebe para que toda la conjunción sea falsa). La segunda dice que al menos uno aprobó (basta con que uno apruebe para que toda la disyunción sea verdadera). Este es el mismo patrón que ya conoce de las tablas de verdad: $\forall$ se comporta como un $\land$ gigante, y $\exists$ como un $\lor$ gigante.

---

# Parte IV — La Negación de Cuantificadores, Revisitada

## IV.1 La regla ya la sabemos — ahora vemos de dónde sale

En la sesión anterior aprendimos la regla de negación de cuantificadores sin demostrarla:

$$\begin{aligned}
\neg\ \forall x\ P(x) &\equiv \exists x\ \neg P(x) \\
\neg\ \exists x\ P(x) &\equiv \forall x\ \neg P(x)
\end{aligned}$$

Estas dos equivalencias se conocen como las **leyes de De Morgan para cuantificadores**, por su parecido con las leyes de De Morgan de lógica proposicional ( $\neg(p\land q)\equiv\neg p\lor\neg q$ ). Y, en efecto, se pueden **derivar** aplicando solamente la regla de la doble negación y la regla básica de negación, sin agregar nada nuevo.

**Derivación.** Partimos de una afirmación universal cualquiera, $\forall x\ funciona(x)$, y le aplicamos doble negación (que no cambia nada, $\neg\neg p \equiv p$ ):

$$\begin{aligned}
\forall x\ funciona(x) &\equiv \neg\neg\bigl(\forall x\ funciona(x)\bigr) \\
&\equiv \neg\bigl(\neg\ \forall x\ funciona(x)\bigr) \\
&\equiv \neg\ \exists x\ \neg funciona(x)
\end{aligned}$$

El último paso usa exactamente la regla básica que ya conocíamos ( $\neg\forall x\ P(x)\equiv\exists x\ \neg P(x)$ ) aplicada adentro del paréntesis. El resultado dice algo revelador: *"todos los computadores funcionan"* es exactamente lo mismo que decir *"no existe ninguno que no funcione"* — la misma idea, expresada con el cuantificador contrario.

> [!WARNING]
> El error más común al negar una afirmación cuantificada es cambiar **solo el cuantificador** y olvidar negar el predicado interno. $\neg\bigl(\forall x\ funciona(x)\bigr)$ **no** es $\exists x\ funciona(x)$ — eso diría que sigue habiendo un computador que funciona, lo cual no niega nada. La negación correcta es $\exists x\ \neg funciona(x)$: tiene que haber uno que **no** funcione. Cambiar el cuantificador sin negar adentro es el paso a medias más frecuente en este tema — revise siempre que el $\neg$ haya quedado pegado al predicado, no perdido en el camino.

> [!TIP]
> **Antes de continuar, pregúntese.** ¿Cuáles son los dos pasos mecánicos para negar una afirmación cuantificada, sin importar qué tan complicado sea el predicado interno?
>
> <details><summary>Ver respuesta</summary>
>
> 1. **Cambiar el cuantificador** ( $\forall\to\exists$ o $\exists\to\forall$ ).
> 2. **Negar la proposición interna** ( $P\to\neg P$ ), simplificando dobles negaciones si aparecen ( $\neg\neg P\equiv P$ ).
>
> </details>

---

# 📘 Ejercicios resueltos — Bloque 1: Verdad y falsedad según el dominio

Estos son los ejercicios que se resolvieron en clase.

## Ejercicio 1 — Enunciados universales y existenciales sobre dominios explícitos

**(a)** Sea $D=\{1,2,3,4,5\}$. Demuestre que $\forall x\in D,\ x^2\geq x$ es verdadero.

**Paso 1 — Reconocer que, en un dominio finito, un universal se verifica caso por caso.** Como $D$ tiene solo cinco elementos, basta con comprobar la desigualdad para cada uno.

$$
\begin{array}{c|c|c}
x & x^2 & x^2 \geq x \\\hline
1 & 1 & 1\geq 1\ \checkmark \\
2 & 4 & 4\geq 2\ \checkmark \\
3 & 9 & 9\geq 3\ \checkmark \\
4 & 16 & 16\geq 4\ \checkmark \\
5 & 25 & 25\geq 5\ \checkmark
\end{array}
$$

**Paso 2 — Concluir.** Los cinco elementos cumplen la desigualdad, así que $\forall x\in D,\ x^2\geq x$ es **verdadero**.

**(b)** Considere $\forall x\in\mathbb{R},\ x^2\geq x$. Encuentre un contraejemplo que demuestre que es falso.

**Paso 1 — Aplicar el método del contraejemplo (Parte II.2).** Basta con un solo real que rompa la desigualdad. Los números entre $0$ y $1$ son buenos candidatos, porque al elevarlos al cuadrado se hacen *más pequeños*, no más grandes.

**Paso 2 — Probar $x_0=\tfrac12$.**

$$x_0^2 = \left(\frac12\right)^2 = \frac14 \qquad\text{y}\qquad \frac14 < \frac12$$

Como $x_0^2 < x_0$, la desigualdad falla en $x_0=\tfrac12\in\mathbb{R}$. Por lo tanto $\forall x\in\mathbb{R},\ x^2\geq x$ es **falso** — un solo contraejemplo basta.

## Ejercicio 2 — Enunciados existenciales sobre dominios explícitos

**(a)** Demuestre que $\exists m\in\mathbb{Z}^+$ tal que $m^2=m$ es verdadero.

**Paso 1 — Para un existencial, basta con un testigo.** No hace falta revisar todo $\mathbb{Z}^+$: alcanza con encontrar un solo entero positivo que cumpla la igualdad.

**Paso 2 — Probar $m=1$.** $1^2 = 1 = m$. Se cumple. Por lo tanto $\exists m\in\mathbb{Z}^+,\ m^2=m$ es **verdadero**, con testigo $m=1$.

**(b)** Sea $E=\{5,6,7,8\}$. Demuestre que $\exists m\in E$ tal que $m^2=m$ es falso.

**Paso 1 — Para refutar un existencial hace falta revisar todo el dominio finito**, porque hay que garantizar que *ninguno* lo cumple.

**Paso 2 — Revisar los cuatro elementos de $E$.**

$$5^2=25\neq 5 \qquad 6^2=36\neq 6 \qquad 7^2=49\neq 7 \qquad 8^2=64\neq 8$$

Ninguno cumple la igualdad. Por lo tanto $\exists m\in E,\ m^2=m$ es **falso**.

## Ejercicio 3 — Un universal verdadero sobre los reales

Sea $P(x)$ la afirmación $x+1>x$. ¿Cuál es el valor de verdad de $\forall x\ P(x)$, con dominio $\mathbb{R}$?

**Paso 1 — Reescribir la desigualdad de forma más simple.** $x+1>x$ es equivalente a $1>0$ (restando $x$ a ambos lados), una afirmación que no depende en absoluto de $x$.

**Paso 2 — Concluir.** Como $1>0$ es verdadera siempre, y no importa qué real se sustituya por $x$, $\forall x\in\mathbb{R},\ P(x)$ es **verdadero**: no existe ningún real que pueda romperla.

## Ejercicio 4 — Un universal falso sobre los reales

Sea $Q(x)$ la afirmación $x<2$. ¿Cuál es el valor de verdad de $\forall x\ Q(x)$, con dominio $\mathbb{R}$?

**Paso 1 — Buscar un contraejemplo.** Basta un real que no sea menor que $2$.

**Paso 2 — Probar $x_0=2$.** $2<2$ es falso. Por lo tanto $\forall x\in\mathbb{R},\ Q(x)$ es **falso**.

## Ejercicio 5 — Otro universal falso, con un contraejemplo menos obvio

Supongamos que $P(x)$ es la afirmación $x^2>0$. ¿Cuál es el valor de verdad de $\forall x\ P(x)$, con dominio $\mathbb{R}$?

**Paso 1 — Recordar que el cuadrado de un real nunca es negativo, pero sí puede ser cero.** El caso frontera que hay que probar es $x=0$.

**Paso 2 — Probar $x_0=0$.** $0^2=0$, y $0>0$ es falso. Por lo tanto $\forall x\in\mathbb{R},\ P(x)$ es **falso** — el contraejemplo es precisamente el elemento neutro de la suma.

## Ejercicio 6 — Interpretar, sin evaluar verdad o falsedad

¿Qué significa la afirmación $\forall x\ N(x)$ si $N(x)$ es *"la computadora x está conectada a la red"* y el dominio consta de todas las computadoras del campus?

**Paso único — Traducir el cuantificador y el predicado en conjunto.** $\forall x$ exige la propiedad para *cada* elemento del dominio, y aquí el dominio son *todas las computadoras del campus* (no solo las de un laboratorio). Por lo tanto, la afirmación significa: **"todas las computadoras del campus están conectadas a la red"**. No hay excepciones permitidas: bastaría una sola computadora desconectada para hacerla falsa.

## Ejercicio 7 — El mismo predicado, dos dominios distintos

¿Cuál es el valor de verdad de $\forall x\ (x^2\geq x)$ si el dominio son todos los números reales? ¿Y si el dominio son todos los números enteros?

**Paso 1 — Caso $\mathbb{R}$.** Ya lo resolvimos en el Ejercicio 1(b): el contraejemplo $x_0=\tfrac12$ lo hace **falso**.

**Paso 2 — Caso $\mathbb{Z}$.** Ahora no hay fracciones disponibles como contraejemplo. Separamos por casos: si $x\leq 0$, entonces $x^2\geq 0\geq x$ (el cuadrado nunca es negativo, y $x$ sí lo es o es cero), así que se cumple. Si $x\geq 1$, entonces $x^2 = x\cdot x \geq x\cdot 1 = x$ (porque $x\geq1$ ), así que también se cumple. No queda ningún entero sin cubrir.

**Paso 3 — Concluir.** Sobre $\mathbb{Z}$, $\forall x\ (x^2\geq x)$ es **verdadero** — exactamente el mismo predicado que era falso sobre $\mathbb{R}$, cambia de valor de verdad al restringir el dominio a los enteros (el contraejemplo $\tfrac12$ ya no está disponible).

## Ejercicio 8 — Un existencial verdadero

Sea $P(x)$ la afirmación $x>3$. ¿Cuál es el valor de verdad de $\exists x\ P(x)$, con dominio $\mathbb{R}$?

**Paso único — Un testigo basta.** $x=4$ cumple $4>3$. Por lo tanto $\exists x\in\mathbb{R},\ P(x)$ es **verdadero**.

## Ejercicio 9 — Un existencial falso

Sea $Q(x)$ el enunciado $x=x+1$. ¿Cuál es el valor de verdad de $\exists x\ Q(x)$, con dominio $\mathbb{R}$?

**Paso 1 — Analizar si la ecuación tiene solución.** $x=x+1$ es equivalente, restando $x$ a ambos lados, a $0=1$ — una contradicción que no depende de $x$.

**Paso 2 — Concluir.** Como ningún real puede satisfacer $0=1$, no hay ningún testigo posible. Por lo tanto $\exists x\in\mathbb{R},\ Q(x)$ es **falso**.

---

# 📘 Ejercicios resueltos — Bloque 2: Traducción y negación de cuantificadores

## Ejercicio 10 — Negar un existencial y un universal en lenguaje cotidiano

¿Cuáles son las negaciones de *"Hay un político honesto"* y *"Todos los colombianos comen frijoles con mazamorra"*?

**Paso 1 — Formalizar la primera frase.** Dominio: colombianos. Predicados: $P(x)$: *"x es político"*, $H(x)$: *"x es honesto"*. *"Hay un político honesto"* es una forma I (particular afirmativa): $\exists x\ (P(x)\land H(x))$.

**Paso 2 — Negar aplicando las leyes de De Morgan cuantificacionales (Parte IV).**

$$\begin{aligned}
\neg\ \exists x\ \bigl(P(x)\land H(x)\bigr) &\equiv \forall x\ \neg\bigl(P(x)\land H(x)\bigr) \\
&\equiv \forall x\ \bigl(\neg P(x) \lor \neg H(x)\bigr)
\end{aligned}$$

**Paso 3 — Reconocer la disyunción como una implicación.** La expresión $\neg P(x)\lor\neg H(x)$ tiene la misma forma que el condicional de lógica proposicional ( $\neg p\lor q \equiv p\rightarrow q$, aquí con $q=\neg H(x)$ ), así que:

$$\forall x\ \bigl(\neg P(x) \lor \neg H(x)\bigr) \;\equiv\; \forall x\ \bigl(P(x) \rightarrow \neg H(x)\bigr)$$

En lenguaje natural: *"para todo x, si x es político, entonces no es honesto"*, es decir, **"ningún político es honesto"**.

**Paso 4 — Formalizar la segunda frase.** Predicado: $F(x)$: *"x come frijoles con mazamorra"*. *"Todos los colombianos comen frijoles con mazamorra"* es $\forall x\ F(x)$ (el dominio ya está restringido a colombianos, no hace falta conectivo).

**Paso 5 — Negar.** $\neg\ \forall x\ F(x) \equiv \exists x\ \neg F(x)$: **"existe al menos un colombiano que no come frijoles con mazamorra"**.

## Ejercicio 11 — Negar la forma A y su contraparte existencial

¿Cuáles son las negaciones de *"Todos los estudiantes de esta clase han tomado un curso de Java"* y *"Uno o más estudiantes de esta clase han hecho un curso de Java"*?

**Paso 1 — Formalizar ambas.** Dominio: estudiantes de esta clase. Predicado: $J(x)$: *"x ha tomado un curso de Java"*. La primera es $\forall x\ J(x)$. La segunda ( *"uno o más"* es el mismo patrón que *"existe al menos uno"* ) es $\exists x\ J(x)$.

**Paso 2 — Negar la primera.** $\neg\ \forall x\ J(x)\equiv\exists x\ \neg J(x)$: **"existe al menos un estudiante de esta clase que no ha tomado un curso de Java"**.

**Paso 3 — Negar la segunda.** $\neg\ \exists x\ J(x)\equiv\forall x\ \neg J(x)$: **"ningún estudiante de esta clase ha tomado un curso de Java"**.

## Ejercicio 12 — Negar proposiciones puramente matemáticas

¿Cuáles son las negaciones de $\forall x\ (x^2>x)$ y $\exists x\ (x^2=2)$?

**Paso 1 — Negar la primera aplicando la regla mecánica (cambiar cuantificador, negar el interior).** $\neg\bigl(x^2>x\bigr)$ es $x^2\leq x$ (la negación de "mayor que" es "menor o igual que"). Entonces:

$$\neg\ \forall x\ (x^2>x) \;\equiv\; \exists x\ (x^2\leq x)$$

**Paso 2 — Negar la segunda.** $\neg(x^2=2)$ es $x^2\neq 2$. Entonces:

$$\neg\ \exists x\ (x^2=2) \;\equiv\; \forall x\ (x^2\neq 2)$$

## Ejercicio 13 — Formalizar especificaciones de un sistema

Utilice predicados y cuantificadores para expresar: *"Todo mensaje de correo mayor a un megabyte será comprimido"* y *"Si un usuario está activo, al menos un enlace de red estará disponible"*.

**Paso 1 — Definir el diccionario de la primera especificación.** Dominio: los correos. $M(x)$: *"x es un mensaje de correo mayor a un megabyte"*, $C(x)$: *"x será comprimido"*. La estructura es *"todo M es C"* — forma A.

**Paso 2 — Formalizar.**

$$\forall x\ \bigl(M(x) \rightarrow C(x)\bigr)$$

**Paso 3 — Definir el diccionario de la segunda.** Aquí hay dos ideas distintas: el estado de un usuario, y la disponibilidad de *algún* enlace de red. Sea $A$: *"el usuario está activo"* (una condición simple del contexto) y $D(y)$: *"el enlace de red y está disponible"*, con $y$ recorriendo el conjunto de enlaces de red.

**Paso 4 — Formalizar como una implicación cuyo consecuente es, en sí mismo, una afirmación existencial.**

$$A \rightarrow \exists y\ D(y)$$

Este es un buen ejemplo de por qué la traducción cuidadosa importa en ingeniería de software: leer mal esta especificación (por ejemplo, exigir que *todos* los enlaces estén disponibles en vez de *al menos uno*) cambiaría por completo el comportamiento esperado del sistema.

## Ejercicio 14 — Traducción con tres predicados y una trampa de lenguaje

Sea el dominio de discurso un conjunto de objetos, con $F(x)$: *"x es un cachivache"*, $S(x)$: *"x es un aparato raro"*, $T(x)$: *"x es una cosa"*. Escriba en lenguaje formal: *"Nada es un aparato raro"*; *"Todos los cachivaches son aparatos raros"*; *"Algunos cachivaches son cosas"*; *"Si algún cachivache es un aparato raro, entonces también es una cosa"*; *"Cualquier cachivache que sea aparato raro, es también una cosa"*.

**Paso 1 — "Nada es un aparato raro" es una negación de existencial disfrazada.** Decir que *nada* cumple $S$ es lo mismo que decir que no existe ningún $x$ que la cumpla: $\neg\exists x\ S(x)$, que por la Parte IV equivale a $\forall x\ \neg S(x)$.

**Paso 2 — "Todos los cachivaches son aparatos raros" es forma A.** $\forall x\ (F(x)\rightarrow S(x))$.

**Paso 3 — "Algunos cachivaches son cosas" es forma I.** $\exists x\ (F(x)\land T(x))$.

**Paso 4 — Las dos últimas frases son, en realidad, la misma afirmación con distintas palabras.** Aunque *"si algún cachivache es..."* contiene la palabra *"algún"*, la estructura *"si... entonces"* aplicada objeto por objeto es universal, no existencial — es la misma trampa que ya vimos con la forma I en la sesión anterior, pero en sentido inverso: aquí el *"algún"* no dispara un $\exists$, porque la frase completa describe una regla que aplica a *cualquier* cachivache que además sea aparato raro. Ambas se traducen igual:

$$\forall x\ \bigl((F(x)\land S(x)) \rightarrow T(x)\bigr)$$

## Ejercicio 15 — El silogismo de los leones de Lewis Carroll

Traduzca a lógica de predicados: *"Todos los leones son feroces"*, *"Algunos leones no toman café"*, *"Algunas criaturas feroces no toman café"*.

**Paso 1 — Definir el diccionario.** $L(x)$: *"x es un león"*, $F(x)$: *"x es feroz"*, $C(x)$: *"x toma café"*.

**Paso 2 — La primera es forma A.** $\forall x\ (L(x)\rightarrow F(x))$.

**Paso 3 — La segunda es forma O (particular negativa).** *"Algunos leones no toman café"* es *"algún L es no-C"*: $\exists x\ (L(x)\land\neg C(x))$.

**Paso 4 — La tercera, la conclusión, también es forma O**, pero sobre "criaturas feroces" en vez de "leones": $\exists x\ (F(x)\land\neg C(x))$.

> [!NOTE]
> **Un vistazo adelante.** Fíjese que la conclusión realmente *se deduce* de las dos premisas: si existe un león que no toma café (premisa 2), y ese león en particular es feroz porque todo león lo es (premisa 1), entonces ese mismo individuo es una criatura feroz que no toma café — exactamente la conclusión. Encadenar cuantificadores de esta manera para demostrar argumentos es el tema de una sesión posterior del curso.

## Problema guiado — Negar cuatro expresiones, una ya resuelta

> [!TIP]
> **Niegue cada una de las siguientes expresiones, simplificando hasta que el símbolo $\neg$ quede pegado directamente al predicado (nunca delante de un cuantificador).** El primer caso ya está resuelto como modelo — seguido usted con los otros tres.
>
> **(a)** $\forall x\ \neg P(x)$
>
> **Resuelto:** $\neg\bigl(\forall x\ \neg P(x)\bigr) \equiv \exists x\ \neg\neg P(x) \equiv \exists x\ P(x)$. (Se cambió $\forall\to\exists$, se negó el interior, y $\neg\neg P(x)$ se simplificó a $P(x)$.)
>
> **(b)** $\exists x\ Q(x)$
>
> **(c)** $\forall x\ \bigl(P(x)\rightarrow Q(x)\bigr)$ — forma A. Recuerde de Clase 7 que $\neg(p\rightarrow q)\equiv p\land\neg q$.
>
> **(d)** $\exists x\ \bigl(P(x)\land\neg Q(x)\bigr)$ *(forma O)*
>
> <details><summary>Ver solución de (b), (c) y (d)</summary>
>
> **(b)** $\neg\bigl(\exists x\ Q(x)\bigr) \equiv \forall x\ \neg Q(x)$.
>
> **(c)** Primero se cambia el cuantificador y se niega el interior; luego se niega el condicional con la equivalencia proposicional ya conocida ( $\neg(p\rightarrow q)\equiv p\land\neg q$ ):
> $$\neg\Bigl(\forall x\ \bigl(P(x)\rightarrow Q(x)\bigr)\Bigr) \equiv \exists x\ \neg\bigl(P(x)\rightarrow Q(x)\bigr) \equiv \exists x\ \bigl(P(x)\land\neg Q(x)\bigr)$$
>
> **(d)** Mismo procedimiento, en sentido contrario ( $\neg p\lor q\equiv p\rightarrow q$ ):
> $$\neg\Bigl(\exists x\ \bigl(P(x)\land\neg Q(x)\bigr)\Bigr) \equiv \forall x\ \neg\bigl(P(x)\land\neg Q(x)\bigr) \equiv \forall x\ \bigl(\neg P(x)\lor Q(x)\bigr) \equiv \forall x\ \bigl(P(x)\rightarrow Q(x)\bigr)$$
>
> Fíjese en algo bonito: **(c) y (d) resultaron ser la negación exacta una de la otra** — la negación de una forma A es siempre una forma O, y viceversa. No es casualidad: así funcionan las cuatro formas aristotélicas en pares (A↔O, E↔I).
>
> </details>

---

# 🐔 Expediente Gallinero — El reporte para el jefe

*Este bloque aplica — no explica — los conceptos ya vistos. Toda la teoría quedó atrás; aquí solo se usa.*

Volvamos al ingeniero y a la pregunta de su jefe. Recordemos el vocabulario que ya construimos en la sesión anterior: universo $U=\{P1,\dots,P8\}$ (los ocho pollos robot).

## El líder de sincronización (unicidad)

La pregunta del jefe — *"¿hay un pollo que actúe como líder de sincronización, uno y solo uno?"* — es una pregunta de unicidad. Sea el predicado $lider(x)$: *"x es el líder de sincronización de la bandada"*. La pregunta se formaliza directamente con lo visto en la Parte I:

$$\exists!\ x\ lider(x)$$

El ingeniero revisa su sistema: en efecto, exactamente el pollo `P1` está configurado como emisor de la señal de sincronización, y los demás solo la reciben. La afirmación es verdadera, con testigo `P1`.

---

## Ejercicios propuestos

Resuelva los siguientes ejercicios. Las respuestas finales están en el **Solucionario** al final del documento; intente cada uno antes de mirarlas.

**Definiciones para varios ejercicios.** Universo: el laboratorio de robótica ampliado, que incluye los ocho pollos robot ( $P1,\dots,P8$ ) junto con otros dispositivos. Predicados: $robot(x)$, $funciona(x)$, $tieneVirus(x)$, $bateria(x)$ (ya definidos en clases anteriores).

**P1.** Sea el dominio $\mathbb{Z}^+$ menor que $20$, y $Q(x)$ la afirmación *"x es múltiplo de 7"*. ¿Es verdadera $\exists!\ x\ Q(x)$? Justifique.

**P2.** Proponga un dominio donde la afirmación *"todos hablan inglés"* sea verdadera, y otro donde sea falsa. (Mismo principio del Ejercicio 7.)

**P3.** Proponga un contraejemplo que demuestre que $\forall x\in\mathbb{R},\ x^3\geq x$ es falsa. Luego proponga un dominio finito de al menos dos elementos donde la misma afirmación sí sea verdadera.

**P4.** En un sistema de autenticación, sea $A(x)$: *"x es el administrador activo del sistema"*. La política de seguridad exige que $\exists!\ x\ A(x)$. Explique en una frase qué garantiza esta política, y qué cambiaría si en su lugar se hubiera exigido solo $\exists x\ A(x)$.

**P5.** Sea el dominio $U=\{u1,u2,u3\}$ (tres usuarios) y el predicado $activo(x)$. Escriba $\forall x\ activo(x)$ y $\exists x\ activo(x)$ como conjunción y disyunción, respectivamente, sin usar cuantificadores.

**P6.** Escriba la negación de *"Todo estudiante entregó la tarea a tiempo"*, simplificada hasta dejarla como un existencial.

**P7.** Traduzca a predicados y cuantificadores: *"Si un archivo supera los 500 MB, se enviará una alerta"*. Luego escriba su negación.

**P8.** Sea $P(x)$: *"x es primo"*, con dominio $\mathbb{Z}^+$. Determine el valor de verdad de $\exists!\ x\ (P(x) \land x<3)$.

**P9.** Traduzca: *"Ningún pollo robot sin batería está operativo"*, e identifique la forma aristotélica correspondiente.

**P10.** Sea el predicado $S(x,y)$: *"x supervisa a y"*, dominio los pollos robot. Traduzca *"hay un pollo que se supervisa a sí mismo"* usando un cuantificador existencial y una igualdad.

---

## Veredicto (parcial) — El reporte queda a medias

El ingeniero responde el correo de su jefe:

> **Respuesta a la pregunta del líder de sincronización** — *"Sí: hay un único líder de sincronización de la bandada."* En símbolos: $\exists!\ x\ lider(x)$ es verdadera, con testigo `P1`.

Con eso, el ingeniero envía su reporte — pero todavía le debe a su jefe la respuesta sobre el técnico. Ya sabe cómo se vería esa pregunta escrita con dos cuantificadores: *"cada pollo tiene su técnico"* sería algo como $\forall x\ \exists y\ tecnico(y,x)$, y *"hay un único técnico para todos"* sería algo como $\exists y\ \forall x\ tecnico(y,x)$ — y sospecha, por las advertencias del profesor, que **no son la misma afirmación**. Pero comprobarlo con rigor —decidir cuál es la verdadera, y entender por qué invertir el orden de dos cuantificadores puede cambiar completamente el significado— es exactamente el trabajo de la próxima sesión, cuando por fin aprendamos a **anidar** cuantificadores.

---

## Resultados de aprendizaje

Al finalizar este documento, usted debería ser capaz de:

- **Distinguir** el cuantificador de unicidad ( $\exists!$ ) del cuantificador existencial ( $\exists$ ), y **expresar** el primero como una combinación del segundo con el cuantificador universal y la igualdad.
- **Determinar** el valor de verdad de una proposición cuantificada sobre distintos dominios, y **aplicar** el método del contraejemplo para refutar afirmaciones universales con el mínimo trabajo posible.
- **Convertir** entre cuantificadores y conjunciones/disyunciones extendidas cuando el dominio es finito, y **explicar** por qué esa conversión no es posible en dominios infinitos.
- **Derivar** las leyes de De Morgan para cuantificadores a partir de la doble negación, en vez de memorizarlas como una regla aislada.

## Ficha de bolsillo

| Concepto | Símbolo / fórmula | Lectura |
|:---|:---|:---|
| Unicidad | $\exists!\ x\ P(x) \equiv \exists x\bigl(P(x)\land\forall y(P(y)\rightarrow y=x)\bigr)$ | "Existe exactamente un x que cumple P" |
| Método del contraejemplo | Encontrar $x_0$ tal que $P(x_0)$ es falso | Refuta $\forall x\ P(x)$ con un solo caso |
| $\forall$ como $\land$ (dominio finito) | $\forall x\ P(x) \equiv P(x_1)\land\cdots\land P(x_n)$ | Todos a la vez |
| $\exists$ como $\lor$ (dominio finito) | $\exists x\ P(x) \equiv P(x_1)\lor\cdots\lor P(x_n)$ | Al menos uno |
| Negación de cuantificadores | $\neg\forall x\ P(x)\equiv\exists x\ \neg P(x)$ ; $\neg\exists x\ P(x)\equiv\forall x\ \neg P(x)$ | Cambia el cuantificador, niega el interior |

## Referencias y material para profundizar

### Notas del curso

- **Sitio de notas de clase de Matemáticas Discretas 1**: [discretas1-udea.github.io/discretas1-udea-20261](https://discretas1-udea.github.io/discretas1-udea-20261/). Sitio oficial del curso, actualmente **en construcción**. La página de esta sesión puede aún no estar actualizada allí.
- **[Clase 7](clase7.md)**: introduce universo, predicado, variable, cuantificadores básicos y formas aristotélicas — prerrequisito directo de este documento.

### Libros de texto del curso

- **Rosen, K. H.** *Discrete Mathematics and Its Applications* (8ª ed.). McGraw-Hill. Capítulo 1, sección 1.4 (cuantificadores) para lo cubierto hoy; la sección 1.5 ("Nested Quantifiers") corresponde a la próxima sesión.
- **Liben-Nowell, D.** *Connecting Discrete Mathematics and Computer Science*. Cambridge University Press.

### Material web

- **MIT — *Mathematics for Computer Science* (Lehman, Leighton, Meyer)**: [people.csail.mit.edu/meyer/mcs.pdf](https://people.csail.mit.edu/meyer/mcs.pdf). En inglés. La sección 3.6 ("Predicate Formulas") es un buen adelanto de la próxima sesión (cuantificadores anidados), si quiere ir preparándose.
- **Stanford CS103 — *Guide to Logic Translations***: [web.stanford.edu/class/cs103/guide_to_translation](https://web.stanford.edu/class/cs103/guide_to_translation). En inglés. Checklist práctico para traducir a lógica de primer orden.

> [!NOTE]
> Si el acceso a internet es limitado, no es necesario consultar estas fuentes para completar el curso — el contenido de este documento es suficiente.

## Solucionario — Ejercicios propuestos

<details>
<summary><b>Presione aquí para ver las respuestas</b></summary>
<br>

**P1.** Falsa. En $\{1,\dots,19\}$ hay **dos** múltiplos de $7$: el propio $7$ y $14$. La existencia se cumple, pero falla la unicidad — hay más de un testigo, así que $\exists!\ x\ Q(x)$ es falsa. (Si el dominio fuera "menor que $10$ ", el único testigo sería $7$ y la respuesta sí sería verdadera — la unicidad es sensible al tamaño exacto del dominio.)

**P2.** Un ejemplo: universo = "los miembros de la delegación diplomática británica" (verdadera); universo = "todos los seres humanos" (falsa, la mayoría no habla inglés).

**P3.** Contraejemplo: $x=-2$, pues $(-2)^3=-8$ y $-8\geq -2$ es falso (también sirve $x=0.5$: $0.125\geq 0.5$ es falso). Dominio finito donde sí es verdadera: $\{0,1\}$, pues $0^3=0\geq 0$ y $1^3=1\geq 1$.

**P4.** $\exists!\ x\ A(x)$ garantiza que hay **exactamente un** administrador activo a la vez — ni cero (el sistema siempre tiene responsable) ni más de uno (no hay conflicto de autoridad simultánea). Con solo $\exists x\ A(x)$, el sistema permitiría que dos o más administradores estuvieran activos al mismo tiempo, sin garantizar que la responsabilidad esté claramente asignada a una sola persona.

**P5.** $\forall x\ activo(x) \equiv activo(u1)\land activo(u2)\land activo(u3)$. $\exists x\ activo(x) \equiv activo(u1)\lor activo(u2)\lor activo(u3)$.

**P6.** *"Todo estudiante entregó la tarea a tiempo"* es $\forall x\ E(x)$. Su negación: $\exists x\ \neg E(x)$ — *"existe al menos un estudiante que no entregó la tarea a tiempo"*.

**P7.** $A(x)$: *"x es un archivo que supera los 500 MB"*, $V(x)$: *"se enviará una alerta por x"*. Traducción: $\forall x\ (A(x)\rightarrow V(x))$. Negación: $\exists x\ (A(x)\land\neg V(x))$ — *"existe un archivo que supera los 500 MB y no genera alerta"*.

**P8.** Los primos menores que $3$ en $\mathbb{Z}^+$: solo el $2$ ( $1$ no es primo). Verdadera, con testigo $x=2$.

**P9.** $\forall x\ \bigl((robot(x)\land\neg bateria(x))\rightarrow\neg funciona(x)\bigr)$ — forma **E** (universal negativa), con sujeto compuesto "pollo robot sin batería".

**P10.** $\exists x\ S(x,x)$ — *"existe un x tal que x se supervisa a sí mismo"*.

</details>
