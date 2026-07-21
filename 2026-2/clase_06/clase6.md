![Built with AI](https://img.shields.io/badge/Built%20with-AI-blue.svg)

# 🐛 El Bug de la Polilla — Cazando Errores con Lógica
### Validez de Argumentos: Tablas de Verdad, Silogismo y Reglas de Inferencia (Enfoque Axiomático)

*Notas de clase — Matemáticas Discretas 1 · Módulo 1: Lógica Proposicional*
*Universidad de Antioquia · Ingeniería de Sistemas*

---

## Cerrando el caso anterior

En la sesión pasada dejamos a Sherlock Holmes con una ecuación en la mano —$\neg(L\land F)\rightarrow\neg R$— pero sin forma de decidir entre dos testimonios que se contradecían. *"Eso no es álgebra de proposiciones"*, concluyó, *"es validez de argumentos."*

Las herramientas de esta sesión le habrían dado el cierre en pocas líneas. Con la declaración del Sr. Finch confirmando que sí tuvo acceso a la llave **y** se ausentó del salón ($L\land F$), y aplicando un solo paso de razonamiento —el que en esta clase llamaremos *Modus Tollens*— Holmes descarta a Whitmore y señala a Finch sin margen de duda. El caso queda cerrado.

Pero lo que hizo Holmes por *intuición entrenada*, nosotros vamos a hacerlo por *método*. Y para presentar ese método, conviene mirar a alguien que convirtió la cacería de una pista escurridiza en una disciplina de ingeniería.

## Antes de comenzar — lo que ya debería saber

Este documento aplica directamente las herramientas de las sesiones anteriores. Antes de continuar, verifique que puede hacer lo siguiente:

- Construir e interpretar la **tabla de verdad** de una expresión con cualquier número de variables.
- Clasificar una proposición como **tautología**, **contradicción** o **contingencia**.
- Aplicar la **Implicación** ($p\rightarrow q\equiv\neg p\lor q$), las **Leyes de De Morgan** y el **Contrarrecíproco** ($p\rightarrow q\equiv\neg q\rightarrow\neg p$) — se usan de forma directa en las demostraciones de esta sesión.

Si alguno de estos puntos no le resulta claro, repáselo en las sesiones anteriores ([Clase 5](clase5.md) y previas) antes de continuar. Este documento no depende de conexión a internet para poder estudiarlo — todo lo necesario está aquí.

---

## Contexto: Grace Hopper y la primera "polilla"

<img src="images/grace-hopper.jpg" alt="Grace Hopper, contralmirante de la Marina de EE. UU. y pionera de la computación" width="260" align="right" style="margin-left: 1rem;">

En 1947, un equipo de la Universidad de Harvard trabajaba en el **Mark II**, una computadora electromecánica gigantesca hecha de relés y cables. En algún momento la máquina empezó a arrojar errores consistentes. Tras revisar el hardware pieza por pieza, el equipo encontró la causa entre los contactos del **Relé #70, Panel F**: una polilla atrapada. La retiraron, la pegaron con cinta en la bitácora del laboratorio y anotaron al lado:

> *"First actual case of bug being found."*
> (Primer caso real de un *bug* encontrado.)

<img src="images/first-bug.jpg" alt="Página de la bitácora del Mark II de 1947 con la polilla pegada y la anotación 'First actual case of bug being found'" width="420">

Entre quienes trabajaban en ese equipo estaba **Grace Hopper**, matemática y luego contralmirante de la Marina de los Estados Unidos, una de las mentes más influyentes de la computación temprana: fue pionera de los **compiladores** (los programas que traducen código a lenguaje de máquina) y del lenguaje **COBOL**, y ayudó a popularizar los términos *bug* y *debugging* que usted usará el resto de su carrera.

> [!NOTE]
> **Nota histórica honesta.** La anécdota de la polilla es real y esa bitácora se conserva hoy en el Smithsonian. Sin embargo, el término *bug* ("bicho", en el sentido de fallo técnico) ya se usaba antes en ingeniería —se le atribuye incluso a Thomas Edison—, y hay cierto debate sobre quién exactamente halló la polilla ese día. Lo tomamos como lo que es: una buena historia, no un dato absoluto. Lo que sí es indiscutible es el método.

Lo importante para nosotros no es la polilla. Es *cómo* se encontró: no adivinando, sino **aislando la causa de forma sistemática**, descartando lo que no podía ser hasta que solo quedó una posibilidad. Ese es exactamente el razonamiento que esta clase convierte en matemática.

---

## El caso — un bug que nadie logra reproducir

Un equipo pequeño mantiene una aplicación en producción. Desde hace días, un error aparece de forma intermitente y nadie logra ponerse de acuerdo sobre su causa. En la reunión de depuración, cada integrante aporta una observación que ha confirmado revisando los registros (*logs*) del sistema:

- **Ana:** *"Si el error aparece, entonces el servicio de pagos registró un tiempo de espera agotado (timeout)."*
- **Beto:** *"En los logs no hay ningún timeout del servicio de pagos."*
- **Carla:** *"O bien falló el servicio de pagos, o bien falló la caché — el monitoreo confirma que uno de los dos falló."*
- **Diego:** *"Si falló la caché, entonces el tiempo de respuesta se disparó por encima de un segundo."*

Cada afirmación, por separado, es un hecho verificado. La pregunta del equipo es: **con estos hechos, ¿qué podemos concluir con certeza sobre la causa?** ¿Se puede *demostrar* dónde está el problema, o cada quien está adivinando?

Al final de esta sesión volveremos a esta reunión y cerraremos el caso — no por votación ni por corazonada, sino con una deducción que cualquiera del equipo pueda verificar paso a paso.

---

# Parte I — ¿Qué es un Argumento y cuándo es Válido?

## I.1 Argumentos: premisas y conclusión

En lógica proposicional, un **argumento** es una secuencia de proposiciones. Todas, excepto la última, se llaman **premisas**; la última se llama **conclusión**. Lo escribimos poniendo las premisas sobre una línea y la conclusión debajo:

$$\dfrac{P_1 \quad P_2 \quad \cdots \quad P_n}{Q}$$

Las premisas $P_1,P_2,\dots,P_n$ son los hechos o suposiciones de partida; la conclusión $Q$ es lo que se pretende deducir de ellos. La barra horizontal se lee *"por lo tanto"* ($\therefore$).

La **forma** del argumento es su estructura lógica: el esqueleto que conecta las premisas con la conclusión, independientemente de sobre qué traten. Como veremos enseguida, la validez es una propiedad de esa forma, no del contenido.

## I.2 Verdad no es lo mismo que Validez

En el lenguaje cotidiano usamos *verdadero* y *válido* casi como sinónimos. En lógica son cosas distintas, y confundirlas es una de las principales fuentes de error al razonar.

- La **verdad** es una propiedad de una **proposición**. Depende del contexto: una proposición es verdadera si lo que afirma coincide con los hechos. *"Medellín está en Colombia"* es verdadera; *"Medellín está en Brasil"* es falsa.
- La **validez** es una propiedad de un **argumento**. Depende solo de su **forma**, no de si sus proposiciones son verdaderas en el mundo real.

> [!IMPORTANT]
> Un argumento es **válido** si, y solo si, es imposible que su conclusión sea falsa cuando todas sus premisas son verdaderas. Es decir: siempre que las premisas se cumplan, la conclusión está obligada a cumplirse.

El punto sutil es que la validez **no exige que las premisas sean verdaderas en la realidad**. Exige que la estructura sea correcta. Compare estos dos argumentos, que tienen **la misma forma**:

$$\dfrac{\text{Si llueve, la calle se moja.} \quad \text{Llueve.}}{\text{La calle se moja.}}$$

$$\dfrac{\text{Si la Luna es de queso, hay ratones astronautas.} \quad \text{La Luna es de queso.}}{\text{Hay ratones astronautas.}}$$

Ambos tienen exactamente la forma $p\rightarrow q$; $p$; por lo tanto $q$, y ambos son **válidos**. En el segundo, las premisas son un disparate — pero eso no lo hace inválido. La validez solo garantiza que *si aceptáramos* las premisas, la conclusión sería inevitable.

> [!TIP]
> **Validez** no significa que lo que dice el argumento sea verdad en la vida real. Significa que, si aceptamos las premisas (aunque sean absurdas), la conclusión se sigue por obligación. La lógica se ocupa de la **forma del razonamiento**, no de verificar hechos.

## I.3 Tres formas de escribir el mismo argumento

A lo largo del curso usaremos tres notaciones equivalentes para representar un argumento. Conviene reconocer las tres, porque las usaremos según el contexto (demostración manual, enunciado compacto o validación por tabla).

| Forma | Representación | ¿Cuándo se usa? |
|:---|:---:|:---|
| **Estándar (barra)** | $\dfrac{p\rightarrow q \quad p}{q}$ | Para demostraciones paso a paso. |
| **Horizontal (secuente)** | $p\rightarrow q,\ p\ \vdash\ q$ | Para enunciar un problema de forma compacta. El símbolo $\vdash$ se lee *"se deduce"*. |
| **Condicional (gran implicación)** | $\bigl[(p\rightarrow q)\land p\bigr]\rightarrow q$ | Para validar con **tabla de verdad**. |

La forma condicional es clave: convierte todo el argumento en **una sola proposición**. La conjunción de todas las premisas se pone como antecedente, y la conclusión como consecuente:

$$(P_1\land P_2\land\cdots\land P_n)\rightarrow Q$$

Y aquí está el puente con lo que ya sabe: **el argumento es válido si, y solo si, esta proposición es una tautología**. Validar un argumento se reduce a comprobar una tautología — algo que ya domina desde la Clase 3.

## I.4 Identificar premisas y conclusión en lenguaje natural

No siempre es evidente cuál es la conclusión de un argumento escrito en palabras. Ciertos adverbios y conectores actúan como señales:

| Indican **premisa** | Indican **conclusión** |
|:---|:---|
| Puesto que, dado que, ya que | Por lo tanto, por consiguiente |
| Como, porque, considerando | Se sigue que, se infiere que |
| Si, siempre que, toda vez que | Luego, en consecuencia, se deduce que |

Regla práctica: la conclusión suele ir después de un conector del tipo *"por lo tanto"*, y las premisas son todo lo demás que la sostiene.

## I.5 Un ejemplo clásico: el argumento de Sócrates

El ejemplo más antiguo y conocido de argumento válido:

$$\dfrac{\text{Si Sócrates es hombre, entonces es mortal.} \quad \text{Sócrates es hombre.}}{\text{Sócrates es mortal.}}$$

Definiendo $p$: *"Sócrates es un hombre"* y $q$: *"Sócrates es mortal"*, la forma es:

$$p\rightarrow q,\quad p\quad\vdash\quad q$$

Esta forma —afirmar el antecedente de un condicional para obtener el consecuente— es tan común y tan segura que tiene nombre propio: **Modus Ponens**. La veremos formalizada en la Parte III, junto con las demás reglas de inferencia.

---

# Parte II — Validación por Tablas de Verdad (Enfoque basado en Modelos)

El primer método para decidir si un argumento es válido es directo y mecánico: **construir la tabla de verdad** de su forma condicional y revisar todos los escenarios posibles. Lo llamamos *enfoque basado en modelos* porque examina, uno por uno, todos los "mundos posibles" (todas las combinaciones de valores de verdad).

> [!NOTE]
> En las tablas de verdad de esta sesión usaremos la codificación **1 = Verdadero** y **0 = Falso**, igual que en las clases anteriores.

## II.1 El concepto clave: renglón crítico

No todas las filas de la tabla importan por igual. La validez se decide observando solo un tipo especial de fila:

> [!IMPORTANT]
> Un **renglón crítico** es una fila en la que **todas las premisas son verdaderas** a la vez. El argumento es:
> - **Válido** si en *todos* los renglones críticos la conclusión también es verdadera.
> - **No válido** si existe *al menos un* renglón crítico donde la conclusión es falsa.

Un solo renglón crítico con conclusión falsa basta para tumbar el argumento: es el contraejemplo que muestra que las premisas pueden cumplirse sin obligar a la conclusión.

## II.2 Procedimiento

1. **Identifique** las premisas y la conclusión de la forma del argumento.
2. **Construya** la tabla de verdad con una columna por cada premisa y una para la conclusión.
3. **Localice** los renglones críticos (todas las premisas en 1) e inspeccione la conclusión en ellos.

## II.3 Ejemplo ilustrativo: un argumento no válido

Determine la validez del siguiente argumento:

$$\dfrac{p\rightarrow(q\lor\neg r) \quad q\rightarrow(p\land r)}{p\rightarrow r}$$

**Premisas:** $p\rightarrow(q\lor\neg r)$ y $q\rightarrow(p\land r)$. **Conclusión:** $p\rightarrow r$.

| $p$ | $q$ | $r$ | $q\lor\neg r$ | $p\land r$ | $p\rightarrow(q\lor\neg r)$ | $q\rightarrow(p\land r)$ | $p\rightarrow r$ | ¿Crítico? |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| 0 | 0 | 0 | 1 | 0 | 1 | 1 | 1 | ✔ (concl. V) |
| 0 | 0 | 1 | 0 | 0 | 1 | 1 | 1 | ✔ (concl. V) |
| 0 | 1 | 0 | 1 | 0 | 1 | 0 | 1 | — |
| 0 | 1 | 1 | 1 | 0 | 1 | 0 | 1 | — |
| **1** | **0** | **0** | **1** | **0** | **1** | **1** | **0** | **✔ (concl. F)** |
| 1 | 0 | 1 | 0 | 1 | 0 | 1 | 1 | — |
| 1 | 1 | 0 | 1 | 0 | 1 | 0 | 0 | — |
| 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | ✔ (concl. V) |

En la fila $p=1,\ q=0,\ r=0$ las dos premisas valen 1 (es un renglón crítico) pero la conclusión $p\rightarrow r$ vale 0. Ese único contraejemplo es suficiente: **el argumento es no válido.**

> [!WARNING]
> **No confunda "premisas falsas en la vida real" con "argumento no válido".** Que un argumento sea no válido *no* depende de que sus premisas sean falsas — depende de que exista un escenario (un renglón crítico) donde las premisas se cumplan pero la conclusión falle. La invalidez es un defecto de **forma**, detectable con la tabla, no una opinión sobre el contenido.

## II.4 La falacia de afirmar el consecuente

Un error de razonamiento muy frecuente —y con nombre propio— es **afirmar el consecuente**. Tiene esta forma:

$$\dfrac{p\rightarrow q \quad q}{p}$$

Parece razonable ("si estudio, apruebo; aprobé; luego estudié"), pero es **no válida**. La tabla lo revela:

| $p$ | $q$ | $p\rightarrow q$ | $q$ | $p$ (concl.) | ¿Crítico? |
|:-:|:-:|:-:|:-:|:-:|:-:|
| 0 | 0 | 1 | 0 | 0 | — |
| **0** | **1** | **1** | **1** | **0** | **✔ (concl. F)** |
| 1 | 0 | 0 | 0 | 1 | — |
| 1 | 1 | 1 | 1 | 1 | ✔ (concl. V) |

En la fila $p=0,\ q=1$ ambas premisas son verdaderas pero la conclusión es falsa. Intuitivamente: uno pudo aprobar por muchas otras causas (el examen estaba fácil, hizo trampa, tuvo suerte). Ver el resultado ($q$) no permite deducir una única causa ($p$).

> [!TIP]
> **Antes de continuar, pregúntese:** ¿en qué se diferencia la forma válida (Modus Ponens: $p\rightarrow q,\ p\vdash q$) de esta falacia ($p\rightarrow q,\ q\vdash p$)?
>
> <details><summary>Ver respuesta</summary>
>
> En Modus Ponens se afirma el **antecedente** ($p$) para obtener el consecuente ($q$) — y eso es válido. En la falacia se afirma el **consecuente** ($q$) para intentar recuperar el antecedente ($p$) — y eso no se puede: un mismo efecto puede tener muchas causas. La dirección de la flecha $\rightarrow$ solo garantiza el paso de causa a efecto, no de efecto a causa.
>
> </details>

## II.5 El problema de este método: la escalabilidad

Las tablas de verdad son **infalibles**: revisan todos los escenarios. Pero tienen un defecto práctico grave. Con $n$ variables proposicionales, la tabla tiene $2^n$ filas:

| Variables ($n$) | Filas ($2^n$) |
|:-:|:-:|
| 3 | 8 |
| 5 | 32 |
| 10 | 1 024 |
| 20 | 1 048 576 |

Para más de 5 o 6 variables, construir la tabla completa a mano es impráctico. Necesitamos un método que no dependa de revisar todos los mundos posibles, sino que **construya una cadena corta de pasos justificados**. Ese es el enfoque axiomático de la Parte III — pero antes, veamos un ejemplo que resuelve el *mismo* argumento por *ambos* métodos, para comparar.

---

# 📘 Ejercicio resuelto — El mismo argumento, dos métodos

Este ejercicio resuelve un mismo argumento de dos formas distintas. El objetivo es que vea, con sus propios ojos, que el enfoque por tablas y el enfoque axiomático llegan **a la misma conclusión** — y por qué el segundo es preferible cuando hay muchas variables.

**Argumento (forma condicional):**

$$\bigl[\,p\land(p\rightarrow q)\land(s\lor r)\land(r\rightarrow\neg q)\,\bigr]\rightarrow(s\lor t)$$

En forma estándar, con sus cuatro premisas:

- $p$ &nbsp; (a)
- $p\rightarrow q$ &nbsp; (b)
- $s\lor r$ &nbsp; (c)
- $r\rightarrow\neg q$ &nbsp; (d)
- **Conclusión:** $\therefore\ s\lor t$

## Método 1 — Tabla de verdad (fuerza bruta)

Hay $n=5$ variables ($p,q,r,s,t$), así que la tabla completa tiene $2^5=32$ filas. En vez de reproducirla entera, aplicamos lo que ya sabemos: solo importan los **renglones críticos** (donde las cuatro premisas valen 1 simultáneamente).

Analizando las premisas: para que $p$ (a) y $p\rightarrow q$ (b) sean ambas verdaderas, se necesita $p=1$ y $q=1$. Con $q=1$, la premisa (d) $r\rightarrow\neg q$ se vuelve $r\rightarrow 0$, que solo es verdadera si $r=0$. Con $r=0$, la premisa (c) $s\lor r$ obliga a $s=1$. La variable $t$ queda libre.

Esto deja exactamente **dos renglones críticos**:

| $p$ | $q$ | $r$ | $s$ | $t$ | Premisas (a·b·c·d) | Conclusión $s\lor t$ |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| 1 | 1 | 0 | 1 | 0 | **1** | **1** |
| 1 | 1 | 0 | 1 | 1 | **1** | **1** |

En los dos renglones críticos la conclusión $s\lor t$ es verdadera (porque $s=1$ en ambos). No existe ningún renglón crítico con conclusión falsa: **el argumento es válido.**

## Método 2 — Enfoque axiomático (reglas de inferencia)

En lugar de revisar 32 filas, construimos una cadena de deducciones. Cada línea se justifica por una **regla de inferencia** o una **ley de equivalencia** (las de la Clase 5), citando de qué líneas anteriores proviene. Estas reglas se presentan formalmente en la Parte III; aquí las usamos por adelantado para mostrar el contraste.

**Paso 1 — Obtener $q$.** De la premisa $p$ (a) y $p\rightarrow q$ (b), por Modus Ponens.

**Paso 2 — Reescribir la premisa (d) para poder encadenarla.** La premisa $r\rightarrow\neg q$ tiene $r$ en el antecedente, pero lo que ya tenemos es $q$. Aplicamos Contrarrecíproco para "darle la vuelta" y luego Doble Negación para limpiarla, dejándola como $q\rightarrow\neg r$.

**Paso 3 — Obtener $\neg r$.** Ahora sí: de $q$ (línea 3) y $q\rightarrow\neg r$ (línea 6), por Modus Ponens.

**Paso 4 — Cerrar.** Con $\neg r$ y la premisa $s\lor r$ (c), por Eliminación (silogismo disyuntivo) obtenemos $s$; y de $s$, por Adición, se sigue $s\lor t$.

| # | Afirmación | Razón |
|:---:|:---:|:---|
| 1 | $p$ | Premisa (a) |
| 2 | $p\rightarrow q$ | Premisa (b) |
| 3 | $q$ | Modus Ponens en 1 y 2 |
| 4 | $r\rightarrow\neg q$ | Premisa (d) |
| 5 | $\neg(\neg q)\rightarrow\neg r$ | Contrarrecíproco en 4 |
| 6 | $q\rightarrow\neg r$ | Doble negación en 5 |
| 7 | $\neg r$ | Modus Ponens en 3 y 6 |
| 8 | $s\lor r$ | Premisa (c) |
| 9 | $s$ | Eliminación (silogismo disyuntivo) en 7 y 8 |
| 10 | $s\lor t$ | Adición en 9 |

Por lo tanto se obtiene $s\lor t$ — **el argumento es válido.**

> [!TIP]
> **Compare el costo de ambos métodos.** Con 5 variables, la tabla exigió razonar sobre $2^5=32$ filas (aunque el atajo de los renglones críticos nos ahorró escribirlas todas). El enfoque axiomático llegó a la misma conclusión en 10 líneas cortas, sin importar cuántas variables hubiera. Con 10 variables, la tabla tendría 1 024 filas; la demostración axiomática seguiría teniendo un puñado de pasos. **Esa es la razón de ser del enfoque axiomático.**

---

# Parte III — Silogismo y Reglas de Inferencia (Enfoque Axiomático)

## III.1 El silogismo

Un **silogismo** es un argumento que consiste en **dos premisas y una conclusión**. La primera premisa se llama **premisa mayor** y la segunda, **premisa menor**.

La forma de silogismo más famosa es el **Modus Ponens**, el mismo del argumento de Sócrates:

$$\dfrac{\text{Si tiene contraseña vigente, puede iniciar sesión.} \quad \text{Tiene contraseña vigente.}}{\text{Puede iniciar sesión.}}$$

Simbólicamente, con $p$: *"tiene contraseña vigente"* y $q$: *"puede iniciar sesión"*:

$$p\rightarrow q,\quad p\quad\vdash\quad q$$

## III.2 ¿Qué es una regla de inferencia?

Vimos que validar con tablas es infalible pero costoso. La alternativa es el **enfoque axiomático** (o *sintáctico*): en lugar de evaluar el argumento en todos los modelos, construimos una **demostración** —una cadena de pasos— donde cada línea está justificada por una regla que ya sabemos válida.

> [!IMPORTANT]
> Una **regla de inferencia** es una forma de argumento que ya se demostró válida. La usamos como una "pieza de construcción" segura: cada vez que en una demostración aparezcan las premisas de una regla, tenemos permiso de escribir su conclusión como una nueva verdad.

Piénselo como el enfoque axiomático de la Clase 5, pero un nivel más arriba: allá transformábamos *una* expresión en otra equivalente (con leyes de equivalencia); aquí **derivamos** una conclusión nueva a partir de varias premisas (con reglas de inferencia).

## III.3 Tabla de reglas de inferencia

Estas son las reglas que usaremos. En cada fracción, lo que está **arriba** de la barra son las premisas (verdades que ya posee) y lo que está **debajo** es la conclusión (lo que tiene permiso de escribir).

<table>
  <thead>
    <tr><th>Nombre</th><th>Regla</th><th>Idea intuitiva</th></tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Modus Ponens</strong></td>
      <td>$$\dfrac{\begin{array}{c} p\rightarrow q \\ p \end{array}}{q}$$</td>
      <td>Si se da la causa, ocurre el efecto.</td>
    </tr>
    <tr>
      <td><strong>Modus Tollens</strong></td>
      <td>$$\dfrac{\begin{array}{c} p\rightarrow q \\ \neg q \end{array}}{\neg p}$$</td>
      <td>Si no veo el efecto, la causa no ocurrió.</td>
    </tr>
    <tr>
      <td><strong>Silogismo hipotético</strong> (Transitividad)</td>
      <td>$$\dfrac{\begin{array}{c} p\rightarrow q \\ q\rightarrow r \end{array}}{p\rightarrow r}$$</td>
      <td>Si <em>p</em> lleva a <em>q</em> y <em>q</em> lleva a <em>r</em>, entonces <em>p</em> lleva a <em>r</em>.</td>
    </tr>
    <tr>
      <td><strong>Silogismo disyuntivo</strong> (Eliminación)</td>
      <td>$$\dfrac{\begin{array}{c} p\lor q \\ \neg p \end{array}}{q}$$</td>
      <td>Si tengo dos opciones y descarto una, queda la otra.</td>
    </tr>
    <tr>
      <td><strong>Simplificación</strong></td>
      <td>$$\dfrac{p\land q}{p}$$</td>
      <td>Si tengo el todo, tengo cada parte.</td>
    </tr>
    <tr>
      <td><strong>Adición</strong></td>
      <td>$$\dfrac{p}{p\lor q}$$</td>
      <td>Si algo es verdad, "eso o cualquier cosa" también.</td>
    </tr>
    <tr>
      <td><strong>Conjunción</strong></td>
      <td>$$\dfrac{\begin{array}{c} p \\ q \end{array}}{p\land q}$$</td>
      <td>Puedo unir dos verdades independientes.</td>
    </tr>
    <tr>
      <td><strong>Prueba por casos</strong></td>
      <td>$$\dfrac{\begin{array}{c} p\lor q \\ p\rightarrow r \\ q\rightarrow r \end{array}}{r}$$</td>
      <td>Si mis dos opciones llevan al mismo sitio, ese sitio es seguro.</td>
    </tr>
    <tr>
      <td><strong>Resolución</strong></td>
      <td>$$\dfrac{\begin{array}{c} \neg p\lor r \\ p\lor q \end{array}}{q\lor r}$$</td>
      <td>Se cancela la variable que aparece afirmada y negada; queda el resto.</td>
    </tr>
  </tbody>
</table>


> [!WARNING]
> **Modus Tollens no es la falacia de afirmar el consecuente.** Ambas parten de $p\rightarrow q$, pero Modus Tollens usa $\neg q$ (niega el efecto) para concluir $\neg p$ — y es **válida**. La falacia usa $q$ (afirma el efecto) para concluir $p$ — y es **inválida**. La diferencia está en si se niega o se afirma el consecuente.

## III.4 El formato Afirmación–Razón para argumentos

Igual que en la Clase 5, escribimos las demostraciones en una tabla de dos columnas: **Afirmación** (la proposición que se establece) y **Razón** (qué regla la justifica y de qué líneas proviene).

> [!NOTE]
> **Una diferencia importante frente a la Clase 5.** Allá, cada fila era una *transformación* de la expresión anterior en otra **equivalente** ($\equiv$): la primera fila y la última decían "lo mismo" con distinta forma. Aquí, cada fila es un *nuevo hecho deducido* de las líneas anteriores mediante una regla de inferencia. No transformamos una sola expresión: **construimos** hechos nuevos hasta alcanzar la conclusión. Las premisas se listan primero (razón: "Premisa"), y a partir de ahí cada paso cita las líneas de las que se obtuvo.

Para validar un argumento con este método:

1. **Liste** las premisas, numeradas, con razón "Premisa".
2. **Identifique la meta**: tenga clara cuál es la conclusión a la que debe llegar.
3. **Busque patrones**: encuentre dos (o una) líneas que encajen con alguna regla de la tabla.
4. **Derive**: escriba la conclusión de esa regla en una línea nueva, citando la regla y las líneas usadas.
5. **Itere** hasta obtener la meta.

---

# 📘 Ejercicios resueltos — Enfoque axiomático

Los tres ejercicios siguientes se resuelven íntegramente con reglas de inferencia y el formato Afirmación–Razón. Preste atención a cómo, en cada uno, la estrategia empieza por *identificar la meta* y luego buscar qué reglas acercan a ella.

## Ejercicio 1

Demuestre que el siguiente argumento es válido:

- $p\rightarrow q$ &nbsp; (a)
- $r\lor s$ &nbsp; (b)
- $\neg s\rightarrow\neg t$ &nbsp; (c)
- $\neg q\lor s$ &nbsp; (d)
- $\neg s$ &nbsp; (e)
- $(\neg p\land r)\rightarrow u$ &nbsp; (f)
- $w\lor t$ &nbsp; (g)
- **Conclusión:** $\therefore\ u\land r$

**Estrategia.** La meta es $u\land r$. Para $u$ necesitamos disparar la premisa (f), cuyo antecedente es $\neg p\land r$ — es decir, hay que conseguir $\neg p$ y $r$ por separado. Tenemos $\neg s$ (e) como palanca inicial: combinada con (d) da $\neg q$, y de ahí con (a) sale $\neg p$; combinada con (b) da $r$.

**Paso 1 — Obtener $\neg q$.** De $\neg q\lor s$ (d) y $\neg s$ (e), por Eliminación.

**Paso 2 — Obtener $\neg p$.** De $p\rightarrow q$ (a) y $\neg q$ (recién obtenido), por Modus Tollens.

**Paso 3 — Obtener $r$.** De $r\lor s$ (b) y $\neg s$ (e), por Eliminación.

**Paso 4 — Ensamblar y disparar (f).** Unimos $\neg p$ y $r$ por Conjunción, aplicamos (f) por Modus Ponens para obtener $u$, y unimos con $r$ para la meta.

| # | Afirmación | Razón |
|:---:|:---:|:---|
| 1 | $p\rightarrow q$ | Premisa (a) |
| 2 | $r\lor s$ | Premisa (b) |
| 3 | $\neg s\rightarrow\neg t$ | Premisa (c) |
| 4 | $\neg q\lor s$ | Premisa (d) |
| 5 | $\neg s$ | Premisa (e) |
| 6 | $(\neg p\land r)\rightarrow u$ | Premisa (f) |
| 7 | $w\lor t$ | Premisa (g) |
| 8 | $\neg q$ | Eliminación en 4 y 5 |
| 9 | $\neg p$ | Modus Tollens en 1 y 8 |
| 10 | $r$ | Eliminación en 2 y 5 |
| 11 | $\neg p\land r$ | Conjunción en 9 y 10 |
| 12 | $u$ | Modus Ponens en 6 y 11 |
| 13 | $u\land r$ | Conjunción en 12 y 10 |

Por lo tanto se obtiene $u\land r$ — **el argumento es válido.**

> [!NOTE]
> Note que las premisas (c) y (g) nunca se usaron. Esto es normal y perfectamente válido: un argumento puede contener premisas que no hacen falta para llegar a la conclusión. Lo que importa es que exista *un* camino desde las premisas hasta la meta, no que se usen todas.

## Ejercicio 2

Demuestre que el siguiente argumento es válido:

- $(\neg p\lor q)\rightarrow r$ &nbsp; (a)
- $s\lor\neg q$ &nbsp; (b)
- $\neg t$ &nbsp; (c)
- $p\rightarrow t$ &nbsp; (d)
- $(\neg p\land r)\rightarrow\neg s$ &nbsp; (e)
- **Conclusión:** $\therefore\ \neg q$

**Estrategia.** La meta es $\neg q$. Si logramos $\neg s$, entonces con (b) por Eliminación sale $\neg q$. Para $\neg s$ hay que disparar (e), cuyo antecedente es $\neg p\land r$. Y $\neg p$ sale de (d) con $\neg t$; con $\neg p$ conseguimos también $r$ a través de (a).

**Paso 1 — Obtener $\neg p$.** De $p\rightarrow t$ (d) y $\neg t$ (c), por Modus Tollens.

**Paso 2 — Obtener $r$.** De $\neg p$ se sigue $\neg p\lor q$ por Adición; y con (a), por Modus Ponens, se obtiene $r$.

**Paso 3 — Disparar (e).** Unimos $\neg p$ y $r$ por Conjunción y aplicamos (e) por Modus Ponens para obtener $\neg s$.

**Paso 4 — Cerrar.** De $s\lor\neg q$ (b) y $\neg s$, por Eliminación, la meta $\neg q$.

| # | Afirmación | Razón |
|:---:|:---:|:---|
| 1 | $(\neg p\lor q)\rightarrow r$ | Premisa (a) |
| 2 | $s\lor\neg q$ | Premisa (b) |
| 3 | $\neg t$ | Premisa (c) |
| 4 | $p\rightarrow t$ | Premisa (d) |
| 5 | $(\neg p\land r)\rightarrow\neg s$ | Premisa (e) |
| 6 | $\neg p$ | Modus Tollens en 4 y 3 |
| 7 | $\neg p\lor q$ | Adición en 6 |
| 8 | $r$ | Modus Ponens en 1 y 7 |
| 9 | $\neg p\land r$ | Conjunción en 6 y 8 |
| 10 | $\neg s$ | Modus Ponens en 5 y 9 |
| 11 | $\neg q$ | Eliminación en 2 y 10 |

Por lo tanto se obtiene $\neg q$ — **el argumento es válido.**

## Ejercicio 3 — De lenguaje natural a demostración

Considere el siguiente argumento:

> *"Si la ley no fue aprobada, entonces la constitución del país queda sin modificaciones. Si la constitución queda sin modificaciones, no se pueden elegir nuevos diputados. O se eligen nuevos diputados o el informe del presidente se retrasará. El informe no se retrasó. Por lo que la ley fue aprobada."*

Verifique su validez mediante una prueba formal.

**Paso 1 — Identificar premisas y conclusión.** El conector *"por lo que"* marca la conclusión (*"la ley fue aprobada"*); todo lo anterior son premisas.

**Paso 2 — Definir proposiciones simples.**

- $L$: la ley fue aprobada.
- $C$: la constitución queda sin modificaciones.
- $D$: se pueden elegir nuevos diputados.
- $I$: el informe del presidente se retrasará.

**Paso 3 — Traducir al lenguaje formal.**

- $\neg L\rightarrow C$ &nbsp; (a)
- $C\rightarrow\neg D$ &nbsp; (b)
- $D\lor I$ &nbsp; (c)
- $\neg I$ &nbsp; (d)
- **Conclusión:** $\therefore\ L$

**Paso 4 — Estrategia y demostración.** La meta es $L$. De (c) y (d) sale $D$; con (b) y $D$, por Modus Tollens, sale $\neg C$; con (a) y $\neg C$, otra vez Modus Tollens, sale $\neg(\neg L)$; y Doble Negación cierra en $L$.

| # | Afirmación | Razón |
|:---:|:---:|:---|
| 1 | $\neg L\rightarrow C$ | Premisa (a) |
| 2 | $C\rightarrow\neg D$ | Premisa (b) |
| 3 | $D\lor I$ | Premisa (c) |
| 4 | $\neg I$ | Premisa (d) |
| 5 | $D$ | Eliminación en 3 y 4 |
| 6 | $\neg C$ | Modus Tollens en 2 y 5 |
| 7 | $\neg(\neg L)$ | Modus Tollens en 1 y 6 |
| 8 | $L$ | Doble negación en 7 |

Por lo tanto se obtiene $L$ — **el argumento es válido: la ley fue aprobada.**

> [!TIP]
> **Antes de continuar, pregúntese:** en el paso 6, ¿por qué de $C\rightarrow\neg D$ y $D$ se concluye $\neg C$?
>
> <details><summary>Ver respuesta</summary>
>
> Es Modus Tollens. La premisa es $C\rightarrow\neg D$; su "efecto" es $\neg D$. Tener $D$ es tener $\neg(\neg D)$, es decir, la negación del efecto. Modus Tollens ($p\rightarrow q,\ \neg q\vdash\neg p$, con $p=C$ y $q=\neg D$) niega entonces la causa: $\neg C$.
>
> </details>

---

# 🐛 Bitácora de Depuración — Cerrando el caso del bug

Volvamos a la reunión del equipo. Ana, Beto, Carla y Diego tienen cuatro observaciones confirmadas en los *logs*, pero nadie ha sabido combinarlas. Vamos a hacer lo que hizo Grace Hopper con la polilla: no adivinar, sino **aislar la causa** con un razonamiento que cualquiera pueda auditar.

## Fase 1 — Formalizar los testimonios

Primero traducimos cada observación a lenguaje formal. Definimos las proposiciones simples:

- $E$: aparece el error.
- $T$: el servicio de pagos registró un *timeout*.
- $F_p$: falló el servicio de pagos.
- $F_c$: falló la caché.
- $R$: el tiempo de respuesta superó un segundo.

Los cuatro testimonios, más un hecho técnico que el equipo da por sabido (*"un fallo del servicio de pagos siempre se registra como un timeout de pagos"*, es decir $F_p\rightarrow T$), quedan así:

- $E\rightarrow T$ &nbsp; — Ana (a)
- $\neg T$ &nbsp; — Beto (b)
- $F_p\lor F_c$ &nbsp; — Carla (c)
- $F_c\rightarrow R$ &nbsp; — Diego (d)
- $F_p\rightarrow T$ &nbsp; — hecho técnico (e)

La meta no la fija nadie de antemano: es *descubrir* qué falló. Vamos a dejar que las reglas nos lleven.

## Fase 2 — Deducir la causa

**Paso 1 — Descartar el servicio de pagos.** Beto confirmó que no hubo *timeout* ($\neg T$). Pero un fallo de pagos siempre produce *timeout* (e). Por Modus Tollens, si no hubo *timeout*, no pudo fallar el servicio de pagos: $\neg F_p$. *(Este es exactamente el movimiento de Holmes descartando a un sospechoso, y el de Hopper descartando un relé sano.)*

**Paso 2 — Señalar al culpable.** Carla confirmó que uno de los dos falló: $F_p\lor F_c$. Ya descartamos $F_p$. Por Eliminación, solo queda una posibilidad: $F_c$ — **falló la caché**.

**Paso 3 — Predecir un síntoma verificable.** Si falló la caché, Diego nos dice que el tiempo de respuesta se disparó (d). Por Modus Ponens: $R$. Esto es una **predicción comprobable**: el equipo puede ir a los *logs* de rendimiento y confirmar que, en efecto, hubo respuestas por encima de un segundo — lo que valida toda la cadena.

| # | Afirmación | Razón |
|:---:|:---:|:---|
| 1 | $E\rightarrow T$ | Premisa (a) |
| 2 | $\neg T$ | Premisa (b) |
| 3 | $F_p\lor F_c$ | Premisa (c) |
| 4 | $F_c\rightarrow R$ | Premisa (d) |
| 5 | $F_p\rightarrow T$ | Premisa (e) |
| 6 | $\neg F_p$ | Modus Tollens en 5 y 2 |
| 7 | $F_c$ | Eliminación en 3 y 6 |
| 8 | $R$ | Modus Ponens en 4 y 7 |

Por lo tanto se obtiene $F_c\land R$ — **falló la caché, y el tiempo de respuesta se disparó.**

## El veredicto

El equipo no votó ni siguió una corazonada. Partiendo de cuatro observaciones que cada quien tenía por separado, tres pasos de razonamiento formal señalaron la caché como causa y predijeron un síntoma que se puede verificar. La discusión de días se resolvió en ocho líneas que **cualquiera del equipo puede revisar y confirmar** — que es, al final, de lo que se trata una buena depuración.

Observe también que la premisa de Ana ($E\rightarrow T$) no se usó en la cadena. Como en el Ejercicio 1, sobraba información: no toda pista es necesaria, y parte del oficio es distinguir la que sostiene la conclusión de la que solo acompaña.

---

# Ejercicios propuestos

Resuelva cada ejercicio a mano antes de consultar el solucionario (al final del documento). Para los que piden validación, indique siempre el método usado y justifique cada paso.

**Validación por tablas de verdad**

**P1.** Determine, con una tabla de verdad, si el siguiente argumento es válido: $\ p\rightarrow q,\ \ q\rightarrow r\ \vdash\ p\rightarrow r$.

**P2.** Determine, con una tabla de verdad, si es válido: $\ p\lor q,\ \ \neg p\ \vdash\ q$.

**P3.** Determine, con una tabla de verdad, si el siguiente argumento es válido o corresponde a una falacia. Si es falacia, señale el renglón crítico que lo demuestra: $\ p\rightarrow q,\ \ \neg p\ \vdash\ \neg q$.

**Validación por enfoque axiomático (reglas de inferencia)**

**P4.** Demuestre que es válido: $\ p\rightarrow q,\ \ q\rightarrow r,\ \ p\ \vdash\ r$.

**P5.** Demuestre que es válido: $\ p\lor q,\ \ \neg p,\ \ q\rightarrow r\ \vdash\ r$.

**P6.** Demuestre que es válido: $\ p\rightarrow q,\ \ r\rightarrow s,\ \ p\lor r,\ \ \neg q\ \vdash\ s$.

**P7.** Demuestre que es válido: $\ (p\land q)\rightarrow r,\ \ p,\ \ q\ \vdash\ r$.

**P8.** Traduzca a lenguaje formal y demuestre la validez del siguiente argumento:

> *"Si el despliegue fue exitoso, el sitio está en línea. El sitio no está en línea. O el despliegue fue exitoso o hubo un* rollback*. Si hubo* rollback*, se envió una alerta. Por lo tanto, se envió una alerta."*

**P9.** Demuestre que es válido: $\ a\rightarrow b,\ \ b\rightarrow c,\ \ \neg c,\ \ a\lor d,\ \ d\rightarrow e\ \vdash\ e$.

**P10.** El siguiente argumento *parece* válido pero no lo es. Identifique de qué falacia se trata y constrúyala como tabla de verdad para probar su invalidez: $\ p\rightarrow q,\ \ q\ \vdash\ p$.

---

## Cierre — El olfato, la lógica y una polilla

Empezamos esta sesión con Grace Hopper y una polilla atrapada en un relé. Terminamos con un equipo que resolvió, en ocho líneas, un bug que llevaba días sin explicación. Entre ambos hay casi un siglo de distancia y la misma idea: **la deducción rigurosa no adivina, aísla**.

Lo que Holmes hacía por intuición entrenada, lo que Hopper convirtió en método de laboratorio, y lo que este curso convierte en matemática, es exactamente la misma habilidad — y trasciende cualquier carrera. Un médico que descarta diagnósticos, una abogada que arma un caso, un ingeniero que caza un error en producción: todos están haciendo, con más o menos formalidad, lo mismo que usted acaba de aprender a escribir en una tabla de Afirmación–Razón.

Hopper no fue solo la persona junto a la primera "polilla". Fue una de las mentes que hizo posible que hoy usted programe en lenguajes legibles en vez de en ceros y unos. Que una de las fundadoras de la disciplina en la que se está formando haya sido una matemática con un olfato extraordinario para los errores no es un dato decorativo: es un recordatorio de quiénes construyeron este campo, y de que el rigor lógico —no la corazonada— es lo que lo sostiene.

> [!NOTE]
> **Hacia la próxima sesión.** Hasta ahora todos nuestros argumentos han tratado sobre proposiciones completas ($p$, $q$, "llueve", "falló la caché"). Pero muchos razonamientos reales hablan de *"todos"* y *"algunos"*: *"todo usuario autenticado tiene permisos"*, *"existe al menos un registro corrupto"*. Para formalizar eso, la lógica proposicional se queda corta — necesitaremos los **cuantificadores** de la lógica de predicados. Ahí es donde seguimos.

---

## Resultados de aprendizaje

Al finalizar este documento, usted debería ser capaz de:

- Distinguir con precisión entre la **verdad** de una proposición y la **validez** de un argumento, reconociendo que un argumento válido puede tener premisas falsas.
- Representar un mismo argumento en sus tres notaciones (estándar, horizontal con $\vdash$, y condicional).
- Determinar la validez de un argumento mediante **tablas de verdad**, identificando renglones críticos.
- Reconocer la **falacia de afirmar el consecuente** y explicar por qué es inválida.
- Demostrar la validez de un argumento mediante el **enfoque axiomático**, aplicando reglas de inferencia en formato Afirmación–Razón.
- Decidir cuándo conviene el enfoque por tablas (pocas variables) y cuándo el axiomático (muchas variables), justificando la elección por escalabilidad.

## Ficha de bolsillo

**Verdad vs. validez**: la verdad es de las *proposiciones* (depende del contexto); la validez es de los *argumentos* (depende solo de la forma). Un argumento válido puede tener premisas falsas.

**Criterio de validez**: un argumento es válido $\iff$ su forma condicional $(P_1\land\cdots\land P_n)\rightarrow Q$ es una **tautología** $\iff$ en todo **renglón crítico** (premisas todas en 1) la conclusión es 1.

**Las 9 reglas de inferencia**:

| Regla | De… | …se obtiene |
|:---|:---:|:---:|
| Modus Ponens | $p\rightarrow q,\ p$ | $q$ |
| Modus Tollens | $p\rightarrow q,\ \neg q$ | $\neg p$ |
| Silogismo hipotético | $p\rightarrow q,\ q\rightarrow r$ | $p\rightarrow r$ |
| Silogismo disyuntivo (Eliminación) | $p\lor q,\ \neg p$ | $q$ |
| Simplificación | $p\land q$ | $p$ |
| Adición | $p$ | $p\lor q$ |
| Conjunción | $p,\ q$ | $p\land q$ |
| Prueba por casos | $p\lor q,\ p\rightarrow r,\ q\rightarrow r$ | $r$ |
| Resolución | $\neg p\lor r,\ p\lor q$ | $q\lor r$ |

**Dos falacias que NO son reglas** (parecen válidas, no lo son):
- Afirmar el consecuente: $p\rightarrow q,\ q\ \not\vdash\ p$.
- Negar el antecedente: $p\rightarrow q,\ \neg p\ \not\vdash\ \neg q$.

**Estrategia de demostración**: (1) liste premisas, (2) fije la meta, (3) busque patrones de reglas, (4) derive citando líneas, (5) itere. Sobran premisas sin usar — es normal.

## Referencias y material para profundizar

### Notas del curso

- **Sitio de notas de clase de Matemáticas Discretas 1**: [discretas1-udea.github.io/discretas1-udea-20261](https://discretas1-udea.github.io/discretas1-udea-20261/). Sitio oficial del curso, actualmente **en construcción**. La página de esta sesión puede aún no estar actualizada allí.

### Libros de texto del curso

- **Rosen, K. H.** *Discrete Mathematics and Its Applications* (8ª ed.). McGraw-Hill. Capítulo 1: "The Foundations: Logic and Proofs", sección "Rules of Inference".
- **Liben-Nowell, D.** *Connecting Discrete Mathematics and Computer Science*. Cambridge University Press.

### Material web

- **MIT OpenCourseWare — 6.042J, Mathematics for Computer Science**: [ocw.mit.edu/courses/6-042j-mathematics-for-computer-science-fall-2010](https://ocw.mit.edu/courses/6-042j-mathematics-for-computer-science-fall-2010/). En inglés.
- **Grace Hopper y el primer *bug* (bitácora original)** — National Museum of American History (Smithsonian): [americanhistory.si.edu/collections/object/nmah_334663](https://americanhistory.si.edu/collections/object/nmah_334663). Fuente del contexto histórico de esta sesión.

> [!NOTE]
> Si el acceso a internet es limitado, no es necesario consultar estas fuentes para completar el curso — el contenido de este documento es suficiente.

## Solucionario — Ejercicios propuestos

<details>
<summary><b>Presione aquí para ver las respuestas</b></summary>
<br>

**P1.** **Válido** (es la regla de Silogismo Hipotético). En la tabla, ningún renglón crítico tiene conclusión falsa.

**P2.** **Válido** (es la regla de Silogismo Disyuntivo / Eliminación). Ningún renglón crítico con conclusión falsa.

**P3.** **No válido** — es la falacia de *negar el antecedente*. Renglón crítico que lo demuestra: $p=0,\ q=1$: ambas premisas ($p\rightarrow q=1$ y $\neg p=1$) son verdaderas, pero la conclusión $\neg q=0$ es falsa.

**P4.** **Válido**. Una derivación posible: (1) $p\rightarrow q$ Prem.; (2) $q\rightarrow r$ Prem.; (3) $p$ Prem.; (4) $q$ Modus Ponens 1,3; (5) $r$ Modus Ponens 2,4.

**P5.** **Válido**. (1) $p\lor q$; (2) $\neg p$; (3) $q\rightarrow r$; (4) $q$ Eliminación 1,2; (5) $r$ Modus Ponens 3,4.

**P6.** **Válido**. (1) $p\rightarrow q$; (2) $r\rightarrow s$; (3) $p\lor r$; (4) $\neg q$; (5) $\neg p$ Modus Tollens 1,4; (6) $r$ Eliminación 3,5; (7) $s$ Modus Ponens 2,6.

**P7.** **Válido**. (1) $(p\land q)\rightarrow r$; (2) $p$; (3) $q$; (4) $p\land q$ Conjunción 2,3; (5) $r$ Modus Ponens 1,4.

**P8.** Proposiciones: $D$: el despliegue fue exitoso; $S$: el sitio está en línea; $R$: hubo *rollback*; $A$: se envió una alerta. Formal: $D\rightarrow S,\ \neg S,\ D\lor R,\ R\rightarrow A\ \vdash\ A$. Derivación: (1) $D\rightarrow S$; (2) $\neg S$; (3) $D\lor R$; (4) $R\rightarrow A$; (5) $\neg D$ Modus Tollens 1,2; (6) $R$ Eliminación 3,5; (7) $A$ Modus Ponens 4,6. **Válido.**

**P9.** **Válido**. (1) $a\rightarrow b$; (2) $b\rightarrow c$; (3) $\neg c$; (4) $a\lor d$; (5) $d\rightarrow e$; (6) $a\rightarrow c$ Silogismo Hipotético 1,2; (7) $\neg a$ Modus Tollens 6,3; (8) $d$ Eliminación 4,7; (9) $e$ Modus Ponens 5,8.

**P10.** Es la falacia de **afirmar el consecuente**. Tabla:

| $p$ | $q$ | $p\rightarrow q$ | $q$ | $p$ (concl.) |
|:-:|:-:|:-:|:-:|:-:|
| 0 | 0 | 1 | 0 | 0 |
| **0** | **1** | **1** | **1** | **0** |
| 1 | 0 | 0 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |

El renglón $p=0,\ q=1$ es crítico (ambas premisas en 1) con conclusión $p=0$ falsa. **No válido.**

</details>