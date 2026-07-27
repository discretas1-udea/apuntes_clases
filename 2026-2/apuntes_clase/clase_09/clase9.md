![Built with AI](https://img.shields.io/badge/Built%20with-AI-blue.svg)

# 🐛 Expediente Depuración — Probar Casos no es Demostrar Siempre
### Formas aristotélicas, equivalencias lógicas, y reglas de inferencia para lógica de predicados (instanciación y generalización, universal y existencial)

*Notas de clase — Matemáticas Discretas 1 · Módulo 2: Lógica Cuantificacional (Lógica de Predicados)*
*Universidad de Antioquia · Ingeniería de Sistemas*

---

## Cerrando el caso anterior

En Clase 9 el ingeniero del gallinero cerró su expediente: aprendimos a traducir y evaluar cuantificadores anidados, y a reconocer cuándo el orden de $\forall$ y $\exists$ cambia el significado de una fórmula. Con eso, el gallinero quedó completamente formalizado — pero el propio cierre de Clase 9 dejó una tarea pendiente y explícita: todo lo aprendido hasta ahora nos deja *traducir* y *evaluar* enunciados con cuantificadores, pero no nos ha dado todavía las herramientas para **demostrar** formalmente que un argumento cuantificado es válido — el mismo trabajo que ya hicimos con lógica proposicional en el Bug de la Polilla (Clase 6). Hoy cerramos esa brecha.

## El caso — ¿probar 15 veces es lo mismo que demostrar siempre?

Ana, Beto, Carla y Diego —el mismo equipo de depuración de Clase 6— mantienen ahora el backend de un sistema de pedidos. Beto acaba de escribir una función que valida un lote completo de pedidos antes de despacharlo, y la corrió contra los 15 lotes de prueba del equipo. Los 15 pasaron. Beto quiere subir el cambio a producción antes de salir.

Carla lo detiene con una cita que ya usaron en Clase 6, de Edsger Dijkstra:

> *"Las pruebas de programas pueden mostrar la presencia de errores, pero nunca su ausencia."*

Beto no entiende la objeción: probó 15 casos, los 15 funcionaron, ¿qué más se necesita? Diego, que ya intuye hacia dónde va esto, escribe en el pizarrón:

$$\text{válido}(p_1),\ \text{válido}(p_2),\ \dots,\ \text{válido}(p_{15})$$

*"Esto son quince afirmaciones particulares — quince testigos, uno por uno. Lo que tú quieres afirmar es otra cosa completamente distinta:"*

$$\forall x\ \bigl(\text{pedido}(x) \rightarrow \text{válido}(x)\bigr)$$

*"Y de quince testigos particulares a un 'para todo' hay una distancia que ningún número de pruebas, por sí solo, puede cerrar."* Hoy construimos las reglas que le dicen a Beto exactamente qué se necesita para cerrar esa distancia — y qué no basta, por más pruebas que acumule.

---

## Antes de comenzar — lo que ya debería saber

Este documento continúa directamente los tres anteriores. No hace falta abrir los otros documentos, aunque puede consultar [Clase 7](clase7.md), [Clase 8](clase8.md) y [Clase 9](clase9.md) si quiere el detalle completo:

| Concepto | En una frase | De dónde viene |
|:---|:---|:---|
| Universo / dominio, predicado | El conjunto de objetos sobre el que se razona; una propiedad que se vuelve V o F al aplicarse a un objeto | Clase 7 |
| $\forall x\ P(x)$ / $\exists x\ P(x)$ | *"Para todo"* (falso con un contraejemplo) / *"Existe al menos uno"* (falso solo si ninguno cumple) | Clase 7 |
| Negación de cuantificadores | $\neg\forall x\ P(x)\equiv\exists x\ \neg P(x)$ ; $\neg\exists x\ P(x)\equiv\forall x\ \neg P(x)$ | Clase 8 |
| Cuantificadores anidados, alcance y precedencia | El orden de $\forall$ y $\exists$ mezclados cambia el significado; sin paréntesis, un cuantificador solo gobierna el átomo inmediato | Clase 9 |
| Ocurrencia libre vs. ligada | Ligada: dentro del alcance de su cuantificador. Libre: fuera de cualquier alcance | Clase 9 |
| Del Bug de la Polilla (repaso más lejano) | Una demostración es una cadena de razonamientos donde cada paso se justifica con una regla de inferencia; formato Afirmación–Razón | Clase 6 |

Eso es todo lo que se necesita. Este documento no depende de conexión a internet para estudiarlo.

---

# Parte I — Formas Aristotélicas

> [!IMPORTANT]
> Las **formas aristotélicas** son cuatro patrones básicos de proposición categórica, base del silogismo clásico. Cada una empareja un tipo de cuantificador con un conectivo específico — nunca al azar.

| Forma | Enunciado | Notación | Lógica de predicados |
|:---:|:---|:---:|:---|
| **A** — Universal afirmativa | *"Todos los S son P"* | $A(S,P)$ | $\forall x\ \bigl(S(x)\rightarrow P(x)\bigr)$ |
| **E** — Universal negativa | *"Ningún S es P"* | $E(S,P)$ | $\forall x\ \bigl(S(x)\rightarrow \neg P(x)\bigr)$ |
| **I** — Particular afirmativa | *"Algún S es P"* | $I(S,P)$ | $\exists x\ \bigl(S(x)\land P(x)\bigr)$ |
| **O** — Particular negativa | *"Algún S no es P"* | $O(S,P)$ | $\exists x\ \bigl(S(x)\land \neg P(x)\bigr)$ |

> [!WARNING]
> **Error frecuente.** El emparejamiento no es intercambiable: $\forall$ va con $\rightarrow$ ( formas A, E ), $\exists$ va con $\land$ ( formas I, O ). Escribir $\forall x\ (S(x)\land P(x))$ para *"todos los S son P"* diría, en realidad, que **todo objeto del universo** es simultáneamente S y P — una afirmación mucho más fuerte y casi siempre falsa. Y escribir $\exists x\ (S(x)\rightarrow P(x))$ para *"algún S es P"* resulta trivialmente verdadero apenas exista **cualquier** objeto que no sea S — sin decir nada sobre si existe realmente un S que sea P.

**Ejemplos.**

| Enunciado | Forma | Expresión |
|:---|:---:|:---|
| Todos los hombres son mortales | A | $\forall x\ \bigl(hombre(x)\rightarrow mortal(x)\bigr)$ |
| Ningún cuadrado es círculo | E | $\forall x\ \bigl(cuadrado(x)\rightarrow \neg circulo(x)\bigr)$ |
| Algún estudiante es ingeniero | I | $\exists x\ \bigl(estudiante(x)\land ingeniero(x)\bigr)$ |
| Algún pájaro no vuela | O | $\exists x\ \bigl(pajaro(x)\land \neg vuela(x)\bigr)$ |

> [!TIP]
> **Compruebe su comprensión.** Clasifique y formalice: *"Ningún pedido sin dirección de envío puede despacharse"*, con $pedido(x)$, $tieneDireccion(x)$, $despachable(x)$.
>
> <details><summary>Ver respuesta</summary>
>
> Forma **E** (universal negativa), sobre el sujeto compuesto *"pedido sin dirección"*: $\forall x\ \Bigl(\bigl(pedido(x)\land\neg tieneDireccion(x)\bigr)\rightarrow \neg despachable(x)\Bigr)$.
>
> </details>

---

# Parte II — Repaso: Equivalencias y Reglas de Inferencia Proposicionales

## II.1 Equivalencias lógicas

> [!NOTE]
> Todas las equivalencias de lógica proposicional (Clase 5-6) siguen siendo válidas dentro del alcance de un cuantificador — se aplican a la subfórmula, no a la fórmula cuantificada completa.

| Nombre | Equivalencia |
|:---|:---|
| Conmutatividad | $P\land Q\equiv Q\land P$ &nbsp;&nbsp; $P\lor Q\equiv Q\lor P$ |
| Asociatividad | $P\land(Q\land R)\equiv(P\land Q)\land R$ &nbsp;&nbsp; $P\lor(Q\lor R)\equiv(P\lor Q)\lor R$ |
| Distributividad | $P\land(Q\lor R)\equiv(P\land Q)\lor(P\land R)$ &nbsp;&nbsp; $P\lor(Q\land R)\equiv(P\lor Q)\land(P\lor R)$ |
| Idempotencia | $P\land P\equiv P$ &nbsp;&nbsp; $P\lor P\equiv P$ |
| Doble negación | $\neg(\neg P)\equiv P$ |
| Leyes de Morgan | $\neg(P\land Q)\equiv\neg P\lor\neg Q$ &nbsp;&nbsp; $\neg(P\lor Q)\equiv\neg P\land\neg Q$ |
| Identidad | $P\land \mathbf{V}\equiv P$ &nbsp;&nbsp; $P\lor \mathbf{F}\equiv P$ |
| Dominación | $P\land \mathbf{F}\equiv \mathbf{F}$ &nbsp;&nbsp; $P\lor \mathbf{V}\equiv \mathbf{V}$ |
| Absorción | $P\land(P\lor Q)\equiv P$ &nbsp;&nbsp; $P\lor(P\land Q)\equiv P$ |
| Complemento | $P\land\neg P\equiv \mathbf{F}$ &nbsp;&nbsp; $P\lor\neg P\equiv \mathbf{V}$ |
| Implicación | $P\rightarrow Q\equiv\neg P\lor Q$ |
| Contrarrecíproco | $P\rightarrow Q\equiv\neg Q\rightarrow\neg P$ |
| Equivalencia | $P\leftrightarrow Q\equiv(P\rightarrow Q)\land(Q\rightarrow P)$ |

## II.2 Reglas de inferencia proposicionales (repaso rápido)

Estas reglas ya fueron derivadas y verificadas con tablas de verdad en Clase 6 — aquí solo se listan como referencia constante, porque hoy se combinan con las nuevas reglas de cuantificadores.

| Nombre | Regla | Nombre | Regla |
|:---|:---:|:---|:---:|
| Modus Ponens | $p\rightarrow q,\ p\ \therefore q$ | Simplificación | $p\land q\ \therefore p$ |
| Modus Tollens | $p\rightarrow q,\ \neg q\ \therefore \neg p$ | Conjunción | $p,\ q\ \therefore p\land q$ |
| Silogismo hipotético | $p\rightarrow q,\ q\rightarrow r\ \therefore p\rightarrow r$ | Adición | $p\ \therefore p\lor q$ |
| Silogismo disyuntivo | $p\lor q,\ \neg p\ \therefore q$ | Resolución | $\neg p\lor r,\ p\lor q\ \therefore q\lor r$ |
| Prueba por casos | $p\lor q,\ p\rightarrow r,\ q\rightarrow r\ \therefore r$ | | |

> [!NOTE]
> Si necesita repasar por qué cada una es válida (no solo memorizarla), vea [Clase 6](clase6.md).

---

# Parte III — Repaso: Equivalencias Cuantificacionales

Estas equivalencias ya fueron demostradas por completo — con derivación formal y contraejemplos — en [Clase 9](clase9.md), Parte IV. Aquí solo la tabla de referencia; no se repite la demostración.

> [!WARNING]
> **Corrección aplicada.** La fila de distributividad de $\forall$ sobre $\lor$ en un solo sentido va en la dirección $\forall x\ P(x)\lor\forall x\ Q(x)\rightarrow\forall x\ (P(x)\lor Q(x))$ — la dirección inversa **no** es válida (mismo contraejemplo par/impar de la Parte IV.4 de Clase 9: dominio $\{1,2\}$ hace verdadero el antecedente $\forall x(par(x)\lor impar(x))$ pero falso el consecuente $\forall x\ par(x)\lor\forall x\ impar(x)$ ). Este error venía del PDF fuente de esta sesión — verificado que **Clase 9 no lo tiene**: esa página ya refuta correctamente, con $\not\equiv$ y contraejemplo, la versión de equivalencia plena, y nunca afirma una implicación de un solo sentido en la dirección inválida.

| Nombre | Equivalencia |
|:---|:---|
| De Morgan cuántico | $\neg\forall x\ P(x)\equiv\exists x\ \neg P(x)$ &nbsp;&nbsp; $\neg\exists x\ P(x)\equiv\forall x\ \neg P(x)$ |
| Distributividad de $\forall$ sobre $\land$ | $\forall x\ (P(x)\land Q(x))\equiv \forall x\ P(x)\land\forall x\ Q(x)$ |
| Distributividad de $\exists$ sobre $\lor$ | $\exists x\ (P(x)\lor Q(x))\equiv \exists x\ P(x)\lor\exists x\ Q(x)$ |
| $\forall$ sobre $\lor$ (un solo sentido) | $\forall x\ P(x)\lor\forall x\ Q(x)\rightarrow \forall x\ (P(x)\lor Q(x))$ |
| $\exists$ sobre $\land$ (un solo sentido) | $\exists x\ (P(x)\land Q(x))\rightarrow \exists x\ P(x)\land\exists x\ Q(x)$ |
| Intercambio de cuantificadores del mismo tipo | $\forall x\forall y\ P(x,y)\equiv\forall y\forall x\ P(x,y)$ &nbsp;&nbsp; $\exists x\exists y\ P(x,y)\equiv\exists y\exists x\ P(x,y)$ |
| No conmutatividad entre tipos distintos | $\forall x\exists y\ P(x,y)\not\equiv\exists y\forall x\ P(x,y)$ |

---

# Parte IV — De la Demostración Proposicional a la Demostración Cuantificacional

> [!IMPORTANT]
> Una **demostración** es una cadena de razonamientos en la que cada paso sigue lógicamente del anterior, con el objetivo de justificar que una conclusión se sigue necesariamente de un conjunto de premisas.

En lógica proposicional (Clase 6), las demostraciones se construyen únicamente con los conectivos $\neg,\land,\lor,\rightarrow,\leftrightarrow$ y las reglas de la Parte II.2. Tome el ejemplo más simple — Modus Ponens — escrito en tres notaciones equivalentes que verá usadas indistintamente en el curso y en la bibliografía:

**Notación de consecuentes:**

$$\begin{aligned}&p\rightarrow q\\&p\\ \hline &\therefore q\end{aligned}$$

**Tautología asociada:** $\bigl[(p\rightarrow q)\land p\bigr]\rightarrow q$

**Notación proposicional (turnstile):** $(p\rightarrow q),\ p\ \vdash\ q$

Las tres dicen exactamente lo mismo: si acepta $p\rightarrow q$ y acepta $p$, está obligado a aceptar $q$.

En **lógica de predicados**, además de esos conectivos y reglas, se necesitan los cuantificadores ( $\forall,\exists$ ) y un puente nuevo: reglas que permitan **entrar y salir** de un enunciado cuantificado. Sin ese puente, una premisa como $\forall x\ (S(x)\rightarrow P(x))$ es letra muerta — no hay forma de combinarla con una premisa particular como $S(Sócrates)$ usando solo Modus Ponens, porque Modus Ponens exige que ambas premisas hablen del mismo objeto concreto, y $\forall x\ (\dots)$ todavía habla de *todos*. Las cuatro reglas de la Parte V son exactamente ese puente.

Y esto responde directamente a la pregunta de Beto en la apertura: contar 15 casos particulares — $\text{válido}(p_1),\dots,\text{válido}(p_{15})$ — nunca, por sí solo, produce $\forall x\ \text{válido}(x)$. Lo que sí produce, con la regla correcta, es exactamente el tipo de generalización que viene a continuación — y también sus condiciones, que son las que Beto se está saltando.

---

# Parte V — Reglas de Inferencia con Cuantificadores

> [!IMPORTANT]
> Los argumentos válidos con enunciados cuantificados son una secuencia de afirmaciones, donde cada una es una premisa o se deduce de afirmaciones anteriores mediante reglas de inferencia — las de la Parte II.2 (proposicionales) **más** las cuatro reglas siguientes (cuantificacionales).

| Regla | Nombre | Forma |
|:---:|:---|:---:|
| $\forall I$ | Instanciación universal (UI) | $\forall x\ P(x)\ \Rightarrow\ P(c)$ |
| $\forall G$ | Generalización universal (UG) | $P(c)$ para $c$ arbitrario $\ \Rightarrow\ \forall x\ P(x)$ |
| $\exists I$ | Instanciación existencial (EI) | $\exists x\ P(x)\ \Rightarrow\ P(c)$ para algún $c$ |
| $\exists G$ | Generalización existencial (EG) | $P(c)\ \Rightarrow\ \exists x\ P(x)$ |

## V.1 Instanciación universal (UI)

> [!IMPORTANT]
> Permite pasar de una afirmación válida para **todos** los elementos del dominio a una afirmación válida para **un caso específico** cualquiera.
>
> $$\forall x\ P(x)\ \therefore\ P(c)$$
>
> Si algo es cierto para todos, también lo es para uno en particular — sin restricciones adicionales: $c$ puede ser cualquier objeto del dominio, nombrado o no.

**Ejemplo.** Dominio $U=\{\text{todos los perros}\}$, predicado $C(x)$: *"x es cariñoso"*.

$$\begin{aligned}&\forall x\ C(x) &&\text{Todos los perros son cariñosos}\\ \hline &\therefore C(\text{Firulais}) &&\text{Por lo tanto, Firulais es cariñoso}\end{aligned}$$

## V.2 Generalización universal (UG)

> [!IMPORTANT]
> Permite afirmar que una propiedad se cumple para **todos** los elementos del dominio, si se demuestra que se cumple para un individuo **arbitrario**.
>
> $$P(c)\ \text{para un}\ c\ \text{arbitrario}\ \therefore\ \forall x\ P(x)$$
>
> **Restricción fundamental**: $c$ debe ser genuinamente arbitrario — no puede depender de una premisa o suposición previa sobre un valor particular. Esta regla se usa a menudo, de forma implícita, en demostraciones matemáticas (*"sea x un elemento cualquiera de..."*).

> [!WARNING]
> **Aquí es exactamente donde Beto se equivoca.** $c_1=p_1,\dots,c_{15}=p_{15}$ no son arbitrarios: son quince objetos *específicos*, elegidos de antemano por el equipo como muestra de prueba. De $\text{válido}(p_1),\dots,\text{válido}(p_{15})$ **no** se puede aplicar UG para concluir $\forall x\ \text{válido}(x)$ — eso exigiría demostrar la propiedad para un pedido genérico, sin usar ningún dato específico de $p_1,\dots,p_{15}$. Quince instancias particulares, sin importar cuántas más se agreguen, siguen siendo instancias particulares — y menos aún cuando, como aquí, el universo de "todos los pedidos que el sistema podría recibir" ni siquiera es una lista cerrada que se pueda agotar probando. (La situación sería distinta si el dominio fuera finito y realmente se probaran **todos** sus elementos, uno por uno — eso sí constituye una verificación exhaustiva válida; lo que falla es dar por probado un dominio abierto con una muestra parcial de él.)

## V.3 Instanciación existencial (EI)

> [!IMPORTANT]
> Permite tomar una afirmación $\exists x\ P(x)$ y asumir que existe **un** individuo $c$ (no necesariamente nombrado de antemano) para el cual $P(c)$ es verdadera.
>
> $$\exists x\ P(x)\ \therefore\ P(c)\ \text{para algún}\ c$$

**Ejemplo.** Dominio $U=\{\text{todos los estudiantes}\}$, predicado $N(x)$: *"x sacó 5.0 en el curso"*.

$$\begin{aligned}&\exists x\ N(x) &&\text{Hay alguien que sacó 5.0 en el curso}\\ \hline &\therefore N(a)\ \text{para algún}\ a &&\text{Llamemos } a \text{ a ese alguien — por ejemplo, Bart}\end{aligned}$$

> [!NOTE]
> **El nombre que se elige debe ser nuevo.** Cuando la demostración ya trae otro objeto nombrado (de una premisa anterior, o de otra instanciación previa), el testigo que EI introduce no puede reutilizar ese mismo nombre — necesita uno genuinamente nuevo, sobre el que la demostración no haya asumido nada todavía. Reutilizar sin más un nombre ya conocido mezclaría, sin querer, las propiedades del testigo nuevo con las del objeto anterior.

## V.4 Generalización existencial (EG)

> [!IMPORTANT]
> Permite pasar de una afirmación particular $P(c)$ a una existencial $\exists x\ P(x)$.
>
> $$P(c)\ \text{para un}\ c\ \text{dado}\ \therefore\ \exists x\ P(x)$$
>
> **Restricción fundamental**: si se conoce que alguien (o algo) específico cumple una propiedad, se puede afirmar que existe al menos uno que la cumple — a diferencia de UG, aquí **no** hace falta que $c$ sea arbitrario; basta con que sea real.

**Ejemplo.** Mismo dominio y predicado $N(x)$ del caso anterior.

$$\begin{aligned}&N(\text{Bart}) &&\text{Bart sacó 5.0 en la clase}\\ \hline &\therefore \exists x\ N(x) &&\text{Por lo tanto, al menos un estudiante sacó 5.0}\end{aligned}$$

> [!TIP]
> **Antes de continuar, pregúntese.** ¿Por qué UG exige que $c$ sea arbitrario, pero EG no?
>
> <details><summary>Ver respuesta</summary>
>
> Porque afirman cosas muy distintas. UG quiere concluir que *todos* cumplen la propiedad — si $c$ tuviera algo especial (haber sido elegido, medido, probado), la conclusión "para todos" quedaría injustificada más allá de ese caso especial. EG solo quiere concluir que *existe al menos uno* — y si un objeto específico y conocido cumple la propiedad, eso ya alcanza para garantizar que existe uno, sin necesidad de que sea "cualquiera".
>
> </details>

---

# 📘 Ejercicios resueltos — Bloque 1: Demostraciones guiadas

## Ejemplo 1 — Sócrates es mortal

**Enunciado.** Demuestre que las premisas *"Todos los hombres son mortales"* y *"Sócrates es un hombre"* implican la conclusión *"Sócrates es mortal"*.

**Paso 1 — Definir el dominio y los predicados, antes de traducir nada.** Dominio $U$: todas las personas. Predicados: $hombre(x)$: *"x es un hombre"*; $mortal(x)$: *"x es mortal"*.

**Paso 2 — Traducir cada enunciado por separado, sin mezclar premisas todavía.** Este es exactamente el proceso que conviene hacer explícito paso a paso — identificar primero el cuantificador que corresponde a cada frase, luego el predicado, y solo al final ensamblar la fórmula completa:

- *"Todos los hombres son mortales"* → cuantificador $\forall x$ (la palabra "todos" lo dispara) → forma A, con $\rightarrow$ → $\forall x\ \bigl(hombre(x)\rightarrow mortal(x)\bigr)$.
- *"Sócrates es un hombre"* → no hay cuantificador, es un objeto concreto → $hombre(\text{Sócrates})$.
- *"Sócrates es mortal"* (conclusión) → mismo patrón → $mortal(\text{Sócrates})$.

| # | Enunciado | Representación |
|:---:|:---|:---|
| 1 | Premisa a: Todos los hombres son mortales | $\forall x\ \bigl(hombre(x)\rightarrow mortal(x)\bigr)$ |
| 2 | Premisa b: Sócrates es un hombre | $hombre(\text{Sócrates})$ |
| 3 | Conclusión: Sócrates es mortal | $mortal(\text{Sócrates})$ |

**Paso 3 — Demostrar formalmente, en Afirmación-Razón.** El paso clave es reconocer que la premisa a es universal pero la premisa b habla de un objeto concreto — eso es precisamente lo que la Instanciación Universal permite conectar.

| # | Afirmación | Razón |
|:---:|:---|:---|
| 1 | $\forall x\ \bigl(hombre(x)\rightarrow mortal(x)\bigr)$ | Premisa a |
| 2 | $hombre(\text{Sócrates})\rightarrow mortal(\text{Sócrates})$ | Instanciación universal en 1 |
| 3 | $hombre(\text{Sócrates})$ | Premisa b |
| 4 | $mortal(\text{Sócrates})$ | Modus Ponens 2, 3 |

> [!NOTE]
> **El mismo argumento, visto como proceso.** Antes de llegar a la tabla anterior, vale la pena hacer explícito el camino mental completo: (1) se reconoce el dominio — aquí, personas; (2) se marca cuál palabra dispara cuál cuantificador — *"todos"* dispara $\forall x$; (3) se identifican los dos predicados en juego — $hombre(x)$ y $mortal(x)$ — y se conecta cada uno con la frase que lo describe; (4) se nota que la segunda premisa ya trae un objeto *concreto*, $\text{Sócrates}$, sustituido en el lugar de $x$; (5) esa sustitución concreta es exactamente lo que permite aplicar Instanciación Universal sobre la premisa 1, y de ahí en adelante el argumento es puramente proposicional (Modus Ponens). Este es el mismo orden de trabajo que conviene seguir en cualquier demostración cuantificacional: dominio → predicados → premisas traducidas → identificar dónde hay un objeto concreto que permite instanciar → aplicar la regla de inferencia correspondiente.

## Ejemplo 2 — Josefina y el curso de informática

**Enunciado.** Demuestre que las premisas *"Todos en esta clase de matemáticas discretas han tomado un curso de informática"* y *"Josefina es una estudiante de esta clase"* implican la conclusión *"Josefina ha tomado un curso de informática"*.

**Paso 1 — Definir dominio y predicados.** Dominio $U$: todos los estudiantes. Predicados: $D(x)$: *"x está en esta clase de matemáticas discretas"*; $I(x)$: *"x ha tomado un curso de informática"*.

**Paso 2 — Traducir.**

| # | Enunciado | Representación |
|:---:|:---|:---|
| 1 | Premisa a | $\forall x\ \bigl(D(x)\rightarrow I(x)\bigr)$ |
| 2 | Premisa b | $D(\text{Josefina})$ |
| 3 | Conclusión | $I(\text{Josefina})$ |

**Paso 3 — Demostrar.** Estructura idéntica al Ejemplo 1 — UI seguida de Modus Ponens.

| # | Afirmación | Razón |
|:---:|:---|:---|
| 1 | $\forall x\ \bigl(D(x)\rightarrow I(x)\bigr)$ | Premisa a |
| 2 | $D(\text{Josefina})\rightarrow I(\text{Josefina})$ | Instanciación universal en 1 |
| 3 | $D(\text{Josefina})$ | Premisa b |
| 4 | $I(\text{Josefina})$ | Modus Ponens 2, 3 |

## Ejemplo 3 — El estudiante, el libro y el examen

**Enunciado.** Demuestre que las premisas *"Un estudiante de esta clase no ha leído el libro"* y *"Todos en esta clase aprobaron el primer examen"* implican la conclusión *"Alguien que aprobó el primer examen no ha leído el libro"*.

**Paso 1 — Definir dominio y predicados.** Dominio $U$: todos los estudiantes. Predicados: $C(x)$: *"x está en esta clase"*; $L(x)$: *"x leyó el libro"*; $A(x)$: *"x aprobó el primer examen"*.

**Paso 2 — Traducir.**

| # | Enunciado | Representación |
|:---:|:---|:---|
| 1 | Premisa a | $\exists x\ \bigl(C(x)\land\neg L(x)\bigr)$ |
| 2 | Premisa b | $\forall x\ \bigl(C(x)\rightarrow A(x)\bigr)$ |
| 3 | Conclusión | $\exists x\ \bigl(A(x)\land\neg L(x)\bigr)$ |

**Paso 3 — Demostrar.** Aquí la premisa a es existencial, no universal — el primer paso no puede ser UI, tiene que ser EI: se fija un testigo concreto (llamémoslo $a$ ) y se trabaja con él el resto de la demostración, hasta volver a generalizar al final.

| # | Afirmación | Razón |
|:---:|:---|:---|
| 1 | $\exists x\ \bigl(C(x)\land\neg L(x)\bigr)$ | Premisa a |
| 2 | $C(a)\land\neg L(a)$ | Instanciación existencial en 1 |
| 3 | $C(a)$ | Simplificación en 2 |
| 4 | $\forall x\ \bigl(C(x)\rightarrow A(x)\bigr)$ | Premisa b |
| 5 | $C(a)\rightarrow A(a)$ | Instanciación universal en 4 |
| 6 | $A(a)$ | Modus Ponens 3, 5 |
| 7 | $\neg L(a)$ | Simplificación en 2 |
| 8 | $A(a)\land\neg L(a)$ | Conjunción 6, 7 |
| 9 | $\exists x\ \bigl(A(x)\land\neg L(x)\bigr)$ | Generalización existencial en 8 |

> [!TIP]
> **Compruebe su comprensión.** En el paso 9, ¿por qué es válido usar EG y no hace falta que $a$ sea "arbitrario" como exige UG?
>
> <details><summary>Ver respuesta</summary>
>
> Porque la conclusión que se busca (paso 3) también es existencial — solo se necesita mostrar que *existe* alguien que cumple $A(x)\land\neg L(x)$, y el propio $a$, con lo que ya se demostró de él en los pasos 6 y 7, es ese testigo. EG solo pide que $a$ sea real, no arbitrario.
>
> </details>

---

# 📘 Ejercicios resueltos — Bloque 2: Ejercicios de repaso

## Ejercicio 4 — Números reales: positivo, negativo o cero

**Enunciado.** Premisas: (a) *"Todo número real es positivo o es negativo o es cero"*; (b) *"4 no es un número negativo"*; (c) *"4 no es cero"*. Conclusión: *"4 es un número positivo"*.

**Paso 1 — Predicados.** $pos(x)$: *"x es positivo"*; $neg(x)$: *"x es negativo"*; $cero(x)$: *"x es cero"*.

**Paso 2 — Traducir y demostrar.** La estrategia es aislar $pos(4)$ eliminando, uno por uno, los otros dos disyuntos con Silogismo disyuntivo — para lo cual conviene primero reagrupar la disyunción triple en pares, usando asociatividad.

| # | Afirmación | Razón |
|:---:|:---|:---|
| 1 | $\forall x\ \bigl(pos(x)\lor neg(x)\lor cero(x)\bigr)$ | Premisa a |
| 2 | $pos(4)\lor neg(4)\lor cero(4)$ | Instanciación universal en 1 |
| 3 | $\neg neg(4)$ | Premisa b |
| 4 | $\neg cero(4)$ | Premisa c |
| 5 | $\bigl(pos(4)\lor neg(4)\bigr)\lor cero(4)$ | Asociatividad en 2 |
| 6 | $pos(4)\lor neg(4)$ | Silogismo disyuntivo 5, 4 |
| 7 | $pos(4)$ | Silogismo disyuntivo 6, 3 |

## Ejercicio 5 — Números pares en $\mathbb{Z}$

**Enunciado.** Dominio $\mathbb{Z}$. Premisas: (a) *"Para cada x, si x es par, entonces x+4 es par"*; (b) *"Para cada x, si x es par, entonces x no es impar"*; (c) *"2 es un número par"*. Conclusión: *"2+4 no es un número impar"*.

> [!WARNING]
> **Cuidado conceptual — premisas que se contradicen entre sí.** Si la premisa (b) se leyera *"si x es par, entonces x no es par"*, junto con la premisa (c) ( $par(2)$ ) produciría de inmediato $par(2)$ y $\neg par(2)$ a la vez — una contradicción, de la cual ninguna de las reglas de este curso permite concluir nada útil. Un conjunto de premisas consistente es requisito para que una demostración tenga sentido; por eso la lectura correcta de (b), y la que se usa aquí, es *"si x es par, entonces x no es impar"* — la única que efectivamente permite llegar a la conclusión pedida sin contradicción.

**Paso 1 — Predicados.** $par(x)$: *"x es par"*; $impar(x)$: *"x es impar"*.

**Paso 2 — Demostrar.**

| # | Afirmación | Razón |
|:---:|:---|:---|
| 1 | $\forall x\ \bigl(par(x)\rightarrow par(x+4)\bigr)$ | Premisa a |
| 2 | $par(2)\rightarrow par(2+4)$ | Instanciación universal en 1 |
| 3 | $par(2)$ | Premisa c |
| 4 | $par(2+4)$ | Modus Ponens 2, 3 |
| 5 | $\forall x\ \bigl(par(x)\rightarrow\neg impar(x)\bigr)$ | Premisa b (corregida) |
| 6 | $par(2+4)\rightarrow\neg impar(2+4)$ | Instanciación universal en 5 |
| 7 | $\neg impar(2+4)$ | Modus Ponens 4, 6 |

## Ejercicio 6 — Ballenas y contaminación

**Enunciado.** *"Alguien en esta clase disfruta observar ballenas, toda persona que disfruta observar ballenas se preocupa por la contaminación del océano."* Por lo tanto, *"hay una persona en esta clase que se preocupa por la contaminación del océano"*.

**Paso 1 — Predicados.** $C(x)$: *"x está en esta clase"*; $B(x)$: *"x disfruta observar ballenas"*; $O(x)$: *"x se preocupa por la contaminación del océano"*.

**Paso 2 — Demostrar.** Igual que el Ejemplo 3: la premisa existencial se instancia primero (EI), y solo al final se vuelve a generalizar (EG).

| # | Afirmación | Razón |
|:---:|:---|:---|
| 1 | $\exists x\ \bigl(C(x)\land B(x)\bigr)$ | Premisa a |
| 2 | $C(a)\land B(a)$ | Instanciación existencial en 1 |
| 3 | $C(a)$ | Simplificación en 2 |
| 4 | $B(a)$ | Simplificación en 2 |
| 5 | $\forall x\ \bigl(B(x)\rightarrow O(x)\bigr)$ | Premisa b |
| 6 | $B(a)\rightarrow O(a)$ | Instanciación universal en 5 |
| 7 | $O(a)$ | Modus Ponens 4, 6 |
| 8 | $C(a)\land O(a)$ | Conjunción 3, 7 |
| 9 | $\exists x\ \bigl(C(x)\land O(x)\bigr)$ | Generalización existencial en 8 |

## Ejercicio 7 — Nueva Jersey y el océano

**Enunciado.** *"Toda persona en Nueva Jersey vive a menos de 50 millas del océano. Alguien en Nueva Jersey nunca ha visto el océano."* Por lo tanto, *"alguien que vive a menos de 50 millas del océano nunca ha visto el océano"*.

**Paso 1 — Predicados.** $N(x)$: *"x es una persona de Nueva Jersey"*; $M(x)$: *"x vive a menos de 50 millas del océano"*; $V(x)$: *"x ha visto el océano"*.

**Paso 2 — Demostrar.** Misma estructura del Ejercicio 6 — cambia solo el contenido, no la forma del argumento; es la mejor señal de que ya se domina el patrón.

| # | Afirmación | Razón |
|:---:|:---|:---|
| 1 | $\exists x\ \bigl(N(x)\land\neg V(x)\bigr)$ | Premisa b |
| 2 | $N(a)\land\neg V(a)$ | Instanciación existencial en 1 |
| 3 | $N(a)$ | Simplificación en 2 |
| 4 | $\neg V(a)$ | Simplificación en 2 |
| 5 | $\forall x\ \bigl(N(x)\rightarrow M(x)\bigr)$ | Premisa a |
| 6 | $N(a)\rightarrow M(a)$ | Instanciación universal en 5 |
| 7 | $M(a)$ | Modus Ponens 3, 6 |
| 8 | $M(a)\land\neg V(a)$ | Conjunción 7, 4 |
| 9 | $\exists x\ \bigl(M(x)\land\neg V(x)\bigr)$ | Generalización existencial en 8 |

## Ejercicio 8 — Una cadena numérica con bicondicional

**Enunciado.** Premisas: (a) $\forall x\ \bigl((x<4\land 4<5)\rightarrow x<5\bigr)$; (b) $\forall x\ (-4<x\leftrightarrow x<4)$; (c) $4<5$. Deduzca: $3<5$ y $-4<-3$.

> [!NOTE]
> Los pasos 4 y 8 de la demostración usan hechos aritméticos básicos ( $3<4$, $-3<4$ ) como datos ya conocidos, no como algo que se derive de las tres premisas — el ejercicio pone a prueba el manejo de Instanciación Universal y la bicondicional, no la aritmética elemental de $\mathbb{R}$.

**Paso 1 — Deducir $3<5$.**

| # | Afirmación | Razón |
|:---:|:---|:---|
| 1 | $\forall x\ \bigl((x<4\land 4<5)\rightarrow x<5\bigr)$ | Premisa a |
| 2 | $4<5$ | Premisa c |
| 3 | $3<4$ | Hecho aritmético básico |
| 4 | $(3<4\land 4<5)\rightarrow 3<5$ | Instanciación universal en 1 ( $x=3$ ) |
| 5 | $3<4\land 4<5$ | Conjunción 3, 2 |
| 6 | $3<5$ | Modus Ponens 4, 5 |

**Paso 2 — Deducir $-4<-3$.**

| # | Afirmación | Razón |
|:---:|:---|:---|
| 7 | $\forall x\ (-4<x\leftrightarrow x<4)$ | Premisa b |
| 8 | $-3<4$ | Hecho aritmético básico |
| 9 | $-4<-3\leftrightarrow -3<4$ | Instanciación universal en 7 ( $x=-3$ ) |
| 10 | $(-4<-3\rightarrow -3<4)\land(-3<4\rightarrow -4<-3)$ | Equivalencia (bicondicional) en 9 |
| 11 | $-3<4\rightarrow -4<-3$ | Simplificación en 10 |
| 12 | $-4<-3$ | Modus Ponens 8, 11 |

## Ejercicio 9 — Cadena de resolución con cuatro predicados

**Enunciado.** Premisas: (a) $\forall x\ (R(x)\lor Z(x))$; (b) $\forall x\ (\neg T(x)\rightarrow\neg R(x))$; (c) $\exists x\ (\neg Z(x)\lor Q(x))$. Deduzca: $\exists x\ \bigl(T(x)\lor Q(x)\lor M(x)\bigr)$.

**Paso 1 — Fijar el testigo con EI y traer las universales a ese mismo testigo.** Como la única premisa existencial es la (c), esa es la que da el testigo $a$; las universales (a) y (b) se instancian después, en ese mismo $a$.

| # | Afirmación | Razón |
|:---:|:---|:---|
| 1 | $\exists x\ (\neg Z(x)\lor Q(x))$ | Premisa c |
| 2 | $\neg Z(a)\lor Q(a)$ | Instanciación existencial en 1 |
| 3 | $\forall x\ (R(x)\lor Z(x))$ | Premisa a |
| 4 | $R(a)\lor Z(a)$ | Instanciación universal en 3 |
| 5 | $\forall x\ (\neg T(x)\rightarrow\neg R(x))$ | Premisa b |
| 6 | $\neg T(a)\rightarrow\neg R(a)$ | Instanciación universal en 5 |
| 7 | $R(a)\rightarrow T(a)$ | Contrarrecíproco en 6 |

**Paso 2 — Combinar por resolución hasta llegar a $T(a)\lor Q(a)$, y cerrar con Adición + EG.**

| # | Afirmación | Razón |
|:---:|:---|:---|
| 8 | $R(a)\lor Q(a)$ | Resolución 4, 2 |
| 9 | $\neg R(a)\lor T(a)$ | Implicación en 7 |
| 10 | $Q(a)\lor T(a)$ | Resolución 8, 9 |
| 11 | $T(a)\lor Q(a)$ | Conmutatividad en 10 |
| 12 | $T(a)\lor Q(a)\lor M(a)$ | Adición en 11 |
| 13 | $\exists x\ \bigl(T(x)\lor Q(x)\lor M(x)\bigr)$ | Generalización existencial en 12 |

> [!NOTE]
> **Una ruta más corta, si ya domina la doble negación.** Los pasos 6-7 pasan por el Contrarrecíproco antes de aplicar Implicación, para hacer explícito el cambio de forma. Quien ya maneje con soltura $\neg(\neg P)\equiv P$ puede aplicar Implicación directamente sobre el paso 6 ( $\neg T(a)\rightarrow\neg R(a)$ ), obteniendo $\neg\neg T(a)\lor\neg R(a)$, que por Doble negación es $T(a)\lor\neg R(a)$ — el mismo resultado del paso 9, en un paso menos. Ambas rutas son igualmente válidas; aquí se deja la más explícita.

---

# 🐛 Expediente Depuración — El lote que "pasó todos los tests"

*Este bloque aplica — no explica — los conceptos ya vistos. Toda la teoría quedó atrás; aquí solo se usa.*

Volvamos al equipo. Universo $U_{pedido}$: todos los pedidos que puede recibir el sistema. Predicado $válido(x)$: *"x tiene un estado válido"*.

Beto probó el lote de quince pedidos de prueba, $p_1,\dots,p_{15}$, y todos pasaron. En símbolos, lo único que eso le da, uno a la vez, es:

$$válido(p_1),\ válido(p_2),\ \dots,\ válido(p_{15})$$

Carla señala lo que ya vimos en la Parte V.2: cada uno de esos quince es una instancia **particular**, con $p_1,\dots,p_{15}$ elegidos de antemano por el equipo — no arbitrarios. Ninguna cantidad de instancias particulares, por Generalización Universal, produce $\forall x\ válido(x)$; esa regla exige un $c$ que no dependa de ninguna elección previa.

Diego propone la única vía legítima para demostrar $\forall x\ válido(x)$: tomar un pedido **arbitrario** $x$ — sin asumir nada específico de él, ni siquiera que esté en la lista de prueba — y argumentar directamente desde la estructura del código: *"la función de validación revisa que el campo `estado` esté en el conjunto fijo `{pendiente, enviado, entregado, cancelado}`; y todo constructor de la clase `Pedido` del sistema asigna necesariamente uno de esos cuatro valores al crear el objeto."* Ese argumento sí trata a $x$ como arbitrario desde el principio — nunca usa un valor concreto de la lista de prueba — así que sí autoriza aplicar Generalización Universal:

$$válido(x)\text{ para un }x\text{ arbitrario} \quad\therefore\quad \forall x\ válido(x)$$

Ana, mientras tanto, revisa un reporte de producción: *"existe al menos un pedido activo con estado inválido"* — $\exists x\ \bigl(pedido(x)\land\neg válido(x)\bigr)$. Para depurarlo, aplica exactamente Instanciación Existencial: fija un testigo concreto, el pedido `#4821`, y lo examina directamente — $pedido(\text{\#4821})\land\neg válido(\text{\#4821})$. Ese es, en la práctica diaria del equipo, el uso más común de EI: un reporte de bug siempre da un testigo existencial concreto sobre el cual investigar, no una propiedad universal.

> [!NOTE]
> **Anexo opcional — la misma idea en Python.** El error de Beto tiene una versión exacta en código: `all(valido(p) for p in casos_de_prueba)` solo recorre la lista finita `casos_de_prueba` — es, estrictamente, una conjunción de instancias particulares, no una cuantificación sobre *todos* los pedidos posibles que el sistema podría recibir algún día. Que ese `all(...)` devuelva `True` nunca implica `all(valido(p) for p in TODOS_LOS_PEDIDOS_POSIBLES)` — el segundo `all` recorrería un conjunto que, en la práctica, ni siquiera existe todavía como lista. Por eso la demostración de Diego no itera nada: argumenta directamente sobre la estructura del constructor, sin recorrer ningún caso — la versión formal de "para $x$ arbitrario".

El equipo cierra el caso con una regla de trabajo, no solo una anécdota.

---

## Ejercicios propuestos

Resuelva los siguientes ejercicios. Las respuestas finales están en el **Solucionario** al final del documento; intente cada uno antes de mirarlas.

**P1.** Clasifique según su forma aristotélica (A, E, I u O) y formalice: *"Ningún servidor sin certificado SSL puede aceptar conexiones seguras"*, con $servidor(x)$, $tieneSSL(x)$, $aceptaSeguras(x)$.

**P2.** Clasifique y formalice: *"Algún módulo del sistema no tiene pruebas automatizadas"*, con $modulo(x)$, $tienePruebas(x)$.

**P3.** Dadas las premisas $\forall x\ \bigl(programador(x)\rightarrow conoce(x,\text{Python})\bigr)$ y $programador(\text{Marta})$, demuestre en Afirmación-Razón que $conoce(\text{Marta},\text{Python})$.

**P4.** Dadas las premisas *"Todo empleado certificado puede aprobar despliegues"* y *"Diego no puede aprobar despliegues"*, demuestre que *"Diego no es un empleado certificado"*. (Ayuda: la regla clave no es Modus Ponens.)

**P5.** Dadas las premisas *"Algún commit de esta semana rompió la compilación"* y *"Todo commit que rompe la compilación genera una alerta automática"*, demuestre que *"algún commit de esta semana generó una alerta automática"*.

**P6.** El siguiente argumento es **inválido**. Identifique cuál paso viola una restricción de la Parte V y explique por qué:
$$\begin{aligned}&1.\ \ mayorDeEdad(\text{Camilo}) &&\text{Premisa}\\ &2.\ \ \forall x\ \ mayorDeEdad(x) &&\text{"Generalización universal" en 1}\end{aligned}$$

**P7.** Dadas las premisas $\forall x\ (S(x)\lor T(x))$, $\forall x\ (\neg U(x)\rightarrow\neg S(x))$ y $\exists x\ (\neg T(x)\lor W(x))$, demuestre $\exists x\ \bigl(U(x)\lor W(x)\bigr)$.

**P8.** Dadas las premisas $\forall x\ \bigl((x>2\land 2>1)\rightarrow x>1\bigr)$ y $2>1$, deduzca $5>1$. Indique explícitamente cuál hecho aritmético básico usa y en qué paso.

**P9.** Explique, en sus propias palabras y con un ejemplo distinto a los del documento, por qué Instanciación Existencial nunca podría aplicarse dos veces sobre la misma variable existencial para obtener dos testigos *distintos* de forma automática.

**P10.** Dadas las premisas *"Todo microservicio con más de 500 líneas necesita revisión de arquitectura"* y *"El microservicio de pagos no necesita revisión de arquitectura"*, formalice ambas y demuestre que *"el microservicio de pagos no tiene más de 500 líneas"*.

**P11.** El siguiente argumento es **inválido**. Identifique cuál paso viola una restricción de la Parte V y explique por qué:
$$\begin{aligned}&1.\ \ \exists x\ falla(x) &&\text{Premisa}\\ &2.\ \ falla(\text{srv-01}) &&\text{"Instanciación existencial" en 1}\\ &3.\ \ \exists x\ (falla(x)\land x\neq\text{srv-01}) &&\text{Premisa}\\ &4.\ \ falla(\text{srv-01})\land \text{srv-01}\neq\text{srv-01} &&\text{"Instanciación existencial" en 3}\end{aligned}$$

**P12.** Dadas las premisas *"Existe un servidor del clúster con latencia por encima del umbral"* y *"Todo servidor con latencia por encima del umbral es removido del balanceador de carga"*, demuestre que *"existe un servidor removido del balanceador de carga"*.

---

## Veredicto — El equipo cierra el caso

Diego resume la lección en el canal del equipo:

> *"Quince tests que pasan te dan quince instancias — ninguna cantidad de instancias particulares te da un 'para todo' por sí sola. Para eso hace falta un argumento que trate el caso como genuinamente arbitrario, no una lista de casos conocidos, por larga que sea. Y cuando un test falla, ese sí es un testigo existencial legítimo: úsenlo para investigar el caso concreto, no para generalizar en la dirección contraria."*

Beto no sube el cambio esa tarde. En su lugar, reescribe la validación como una propiedad que puede argumentarse para un pedido arbitrario a partir de la definición del constructor — y agrega, aparte, los quince tests como una red de seguridad adicional, no como la demostración.

Con esto, el equipo tiene ya el repertorio completo de traducción, evaluación y demostración para lógica de predicados: formas aristotélicas, equivalencias, y las cuatro reglas que permiten entrar y salir de un cuantificador con rigor. Lo que sigue en el curso es dar el siguiente paso natural — usar exactamente estas herramientas para construir y evaluar **demostraciones más largas**, con varias premisas cuantificadas combinadas, y para reconocer los patrones de argumento que aparecen una y otra vez en matemáticas discretas y en la verificación de programas.

---

## Errores frecuentes — repaso rápido

| Error | Por qué está mal | Dónde se explica |
|:---|:---|:---|
| Usar $\land$ con $\forall$, o $\rightarrow$ con $\exists$, al formalizar "todos" o "algún" | Invierte el emparejamiento aristotélico — cambia radicalmente el significado | Parte I |
| Aplicar Generalización Universal sobre un objeto que en realidad es un caso particular ya probado | UG exige que el testigo sea genuinamente arbitrario, no elegido de una lista conocida | Parte V.2 |
| Aplicar Instanciación Universal antes de resolver una premisa existencial cuando ambas comparten variable | El testigo de la existencial debe fijarse primero (EI); las universales se instancian después, en ese mismo testigo | Ejemplo 3, Ejercicios 6, 7, 9 |
| Suponer que EG necesita un objeto "arbitrario" como UG | EG solo pide que el objeto sea real y cumpla la propiedad, sin ninguna restricción de arbitrariedad | Parte V.4 |
| Tratar una disyunción de tres o más términos como si Silogismo disyuntivo se aplicara de una sola vez | Hay que reagrupar (asociatividad) y aplicar la regla un par a la vez | Ejercicio 4 |
| Reutilizar, al aplicar Instanciación Existencial, un nombre ya usado antes en la misma demostración | El testigo de una nueva existencial debe ser una constante nueva — reutilizar una ya conocida puede mezclar propiedades de dos objetos distintos, o incluso producir una contradicción | Parte V.3, Ejercicio P11 |

---

## Resultados de aprendizaje

Al finalizar este documento, usted debería ser capaz de:

- **Clasificar** un enunciado cuantificado según las cuatro formas aristotélicas (A, E, I, O) y **formalizarlo** con el conectivo correcto para cada una.
- **Distinguir** una demostración cuantificacional de una simple evaluación o traducción, reconociendo que se necesitan reglas adicionales (UI, UG, EI, EG) para conectar premisas universales con premisas particulares.
- **Aplicar** Instanciación Universal, Generalización Universal, Instanciación Existencial y Generalización Existencial, respetando explícitamente la restricción de arbitrariedad de UG.
- **Construir** demostraciones completas en formato Afirmación-Razón que combinen reglas proposicionales (Clase 6) con las cuatro reglas cuantificacionales de hoy.
- **Explicar**, con un ejemplo concreto, por qué un número finito de casos de prueba nunca justifica, por sí solo, una generalización universal.

## Ficha de bolsillo

| Concepto | Forma | Restricción |
|:---|:---|:---|
| Formas aristotélicas | A: $\forall(S\rightarrow P)$ · E: $\forall(S\rightarrow\neg P)$ · I: $\exists(S\land P)$ · O: $\exists(S\land\neg P)$ | $\forall$ con $\rightarrow$, $\exists$ con $\land$ — nunca al revés |
| Instanciación universal (UI) | $\forall x\ P(x)\ \therefore P(c)$ | Ninguna — $c$ puede ser cualquier objeto |
| Generalización universal (UG) | $P(c)\ \therefore \forall x\ P(x)$ | $c$ debe ser genuinamente arbitrario |
| Instanciación existencial (EI) | $\exists x\ P(x)\ \therefore P(c)$ | $c$ es un testigo, no necesariamente nombrado antes |
| Generalización existencial (EG) | $P(c)\ \therefore \exists x\ P(x)$ | Ninguna — basta con que $c$ sea real |
| Orden típico en una demostración | Instanciar primero lo existencial (EI); instanciar lo universal después, en el mismo testigo (UI); cerrar con generalización si la conclusión lo pide (UG o EG) | — |

## Referencias y material para profundizar

### Notas del curso

- **Sitio de notas de clase de Matemáticas Discretas 1**: [discretas1-udea.github.io/discretas1-udea-20261](https://discretas1-udea.github.io/discretas1-udea-20261/). Sitio oficial del curso, actualmente **en construcción**. La página de esta sesión puede aún no estar actualizada allí.
- **[Clase 6](clase6.md)**: demostración en lógica proposicional, formato Afirmación-Razón, reglas de inferencia básicas.
- **[Clase 7](clase7.md)**: universo, predicado, variable, cuantificadores básicos.
- **[Clase 9](clase9.md)**: cuantificadores anidados y equivalencias cuantificacionales, con sus demostraciones completas.

### Libros de texto del curso

- **Rosen, K. H.** *Discrete Mathematics and Its Applications* (8ª ed.). McGraw-Hill. Capítulo 1, sección 1.6: *"Rules of Inference"* — corresponde exactamente al contenido de hoy.
- **Liben-Nowell, D.** *Connecting Discrete Mathematics and Computer Science*. Cambridge University Press.

> [!NOTE]
> Si el acceso a internet es limitado, no es necesario consultar estas fuentes para completar el curso — el contenido de este documento es suficiente.

## Solucionario — Ejercicios propuestos

<details>
<summary><b>Presione aquí para ver las respuestas</b></summary>
<br>

**P1.** Forma **E**: $\forall x\ \Bigl(\bigl(servidor(x)\land\neg tieneSSL(x)\bigr)\rightarrow\neg aceptaSeguras(x)\Bigr)$. El sujeto $S(x)$ de la forma E no es un predicado simple aquí, sino el compuesto $servidor(x)\land\neg tieneSSL(x)$ — "servidor sin SSL" — y $P(x)$ es $aceptaSeguras(x)$; el patrón $\forall x\ (S(x)\rightarrow\neg P(x))$ se mantiene idéntico, solo que $S(x)$ mismo es una conjunción.

**P2.** Forma **O**: $\exists x\ \bigl(modulo(x)\land\neg tienePruebas(x)\bigr)$.

**P3.** $\forall x\ (programador(x)\rightarrow conoce(x,\text{Python}))$ — Premisa; $programador(\text{Marta})\rightarrow conoce(\text{Marta},\text{Python})$ — UI; $programador(\text{Marta})$ — Premisa; $conoce(\text{Marta},\text{Python})$ — Modus Ponens.

**P4.** Con $E(x)$: *"x es empleado certificado"*, $D(x)$: *"x puede aprobar despliegues"*: $\forall x\ (E(x)\rightarrow D(x))$ — Premisa; $E(\text{Diego})\rightarrow D(\text{Diego})$ — UI; $\neg D(\text{Diego})$ — Premisa; $\neg E(\text{Diego})$ — Modus Tollens.

**P5.** Con $C(x)$: *"x es un commit de esta semana"*, $R(x)$: *"x rompió la compilación"*, $A(x)$: *"x generó una alerta automática"*: EI sobre $\exists x(C(x)\land R(x))$ para obtener $C(a)\land R(a)$; Simplificación da $R(a)$; UI + MP sobre $\forall x(R(x)\rightarrow A(x))$ da $A(a)$; Simplificación da $C(a)$; Conjunción da $C(a)\land A(a)$; EG da $\exists x(C(x)\land A(x))$.

**P6.** El paso 2 es inválido: Camilo no es un objeto arbitrario, es un individuo *nombrado* en la premisa 1 — UG exige que el objeto no dependa de ninguna suposición particular previa, y aquí depende exactamente de eso.

**P7.** EI sobre la premisa existencial da un testigo $a$ con $\neg T(a)\lor W(a)$; UI sobre las dos universales da $S(a)\lor T(a)$ y $\neg U(a)\rightarrow\neg S(a)$ (equivalente a $S(a)\rightarrow U(a)$ por contrarrecíproco); dos aplicaciones de Resolución encadenan $S(a)\lor T(a)$, $\neg S(a)\lor U(a)$ y $\neg T(a)\lor W(a)$ hasta $U(a)\lor W(a)$; EG cierra con $\exists x\ (U(x)\lor W(x))$.

**P8.** Usa el hecho aritmético básico $5>2$ (dado como conocido, no derivado) para instanciar la premisa universal en $x=5$ y luego aplicar Conjunción con $2>1$ y Modus Ponens — igual que en el Ejercicio 8 del documento.

**P9.** Dos aplicaciones de EI sobre la misma fórmula $\exists x\ P(x)$ no garantizan dos testigos *distintos*: la regla solo asegura que existe *algún* $c$ con $P(c)$, y nada impide que ambas aplicaciones "encuentren" el mismo objeto — para garantizar dos testigos distintos hace falta una premisa adicional que lo exija explícitamente (por ejemplo, $\exists x\exists y\ (P(x)\land P(y)\land x\neq y)$ ), no dos usos sueltos de EI.

**P10.** Con $M(x)$: *"x es un microservicio con más de 500 líneas"*, $R(x)$: *"x necesita revisión de arquitectura"*: $\forall x\ (M(x)\rightarrow R(x))$ — Premisa; $M(\text{pagos})\rightarrow R(\text{pagos})$ — UI; $\neg R(\text{pagos})$ — Premisa; $\neg M(\text{pagos})$ — Modus Tollens.

**P11.** El paso 4 es inválido: `srv-01` ya fue fijado como testigo en el paso 2 (por EI sobre la premisa 1) — no es un nombre nuevo. La premisa 3 pide un testigo *distinto* de `srv-01`, así que instanciar la existencial de 3 reutilizando exactamente ese mismo nombre produce la contradicción `srv-01`$\neq$`srv-01`, que es falsa por definición. El testigo de la premisa 3 debía ser una constante nueva (por ejemplo `srv-02`), no la ya usada en 2.

**P12.** Con $C(x)$: *"x es un servidor del clúster"*, $L(x)$: *"x tiene latencia por encima del umbral"*, $R(x)$: *"x es removido del balanceador de carga"*: $\exists x\ (C(x)\land L(x))$ — Premisa; $C(a)\land L(a)$ — EI; $C(a)$, $L(a)$ — Simplificación; $\forall x\ (L(x)\rightarrow R(x))$ — Premisa; $L(a)\rightarrow R(a)$ — UI; $R(a)$ — Modus Ponens; $C(a)\land R(a)$ — Conjunción; $\exists x\ (C(x)\land R(x))$ — Generalización existencial.

</details>
