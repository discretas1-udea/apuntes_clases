# 🛰️ El Incidente del Discovery One — El Veredicto
### Tablas de Verdad

*Notas de clase — Matemáticas Discretas 1 · Módulo 1: Lógica Proposicional*
*Universidad de Antioquia · Ingeniería de Sistemas*

---

## Contexto de apoyo — Continuación del caso

Este documento continúa directamente el caso trabajado en la sesión anterior: [El Incidente del Discovery One — Proposición, Lenguaje Formal, Axiomas de Verdad y Jerarquía de Operadores](https://discretas1-udea.github.io/discretas1-udea-20261/lessons/mod1/clase2/). Si no ha leído esa sesión, se recomienda hacerlo antes de continuar; aquí no se repite el contexto completo de la misión.

**Recordatorio mínimo**: la nave *Discovery One*, en ruta a Júpiter, tiene a bordo la computadora **HAL 9000**. HAL reportó un fallo en la unidad AE-35 (el componente que alinea la antena con la Tierra) que Bowman no pudo confirmar con una inspección física.

## El caso — Dónde quedamos

En la sesión anterior, usando axiomas de verdad y jerarquía de operadores, se definió la condición de anomalía

$$
A = H \land \neg D \land \neg C, \qquad \text{con } C = H \land D
$$

y se evaluó **únicamente para el caso observado** ($H=V$, HAL reportó el fallo; $D=F$, la inspección no lo detectó), obteniendo $A=V$.

Pero quedó una pregunta sin resolver: **¿es este el único escenario en el que se produce una anomalía, o existen otros?** Evaluar un solo caso no permite responder eso — para saberlo con certeza haría falta revisar **todas** las combinaciones posibles de valores de $H$ y $D$. Esa es exactamente la herramienta que se desarrolla en esta sesión: las **tablas de verdad**.

## Antes de comenzar: lo que ya debería saber

Este documento continúa lo trabajado en la clase anterior. Antes de avanzar, verifique que puede hacer lo siguiente:

- Aplicar los axiomas de verdad de los seis operadores lógicos ($\neg, \land, \lor, \oplus, \rightarrow, \leftrightarrow$).
- Agrupar y evaluar una expresión con varios operadores respetando la jerarquía (prioridad y asociatividad).
- Traducir un enunciado de lenguaje natural a una expresión lógica.

Si alguno de estos puntos no le resulta claro, repáselo antes de continuar en: [Clase 2 — Axiomas de Verdad y Jerarquía de Operadores](https://discretas1-udea.github.io/discretas1-udea-20261/lessons/mod1/clase2/).

---

# Parte I — Tablas de Verdad

## 1.1 Definición y tabla unificada

Una **tabla de verdad** es una herramienta tabular que muestra el resultado de una expresión lógica para todas las combinaciones posibles de valores de verdad de sus variables. Es la alternativa sistemática a evaluar caso por caso — precisamente lo que la sesión anterior dejó pendiente.

| $p$ | $q$ | $\neg p$ | $p\land q$ | $p\lor q$ | $p\oplus q$ | $p\rightarrow q$ | $p\leftrightarrow q$ |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| V | V | F | V | V | F | V | V |
| V | F | F | F | V | V | F | F |
| F | V | V | F | V | V | V | F |
| F | F | V | F | F | F | V | V |

## 1.2 Protocolo de 6 pasos

1. **Identificar las variables proposicionales**: cuántas letras distintas componen la expresión.
2. **Determinar el número de filas**: $N = 2^n$, con $n$ igual al número de variables.
3. **Construir las columnas de las variables**, distribuyendo los valores sistemáticamente.
4. **Agregar columnas auxiliares**, descomponiendo la fórmula en sub-expresiones.
5. **Evaluar la expresión paso a paso**, de izquierda a derecha, respetando la jerarquía de operadores.
6. **Revisar y validar** la tabla completa.

> [!TIP]
> **Compruebe su comprensión**
>
> Construya la tabla de verdad de $p \leftrightarrow \neg q$.
>
> <details><summary>Ver respuesta</summary>
>
> | $p$ | $q$ | $\neg q$ | $p\leftrightarrow\neg q$ |
> |:---:|:---:|:---:|:---:|
> | V | V | F | F |
> | V | F | V | V |
> | F | V | F | V |
> | F | F | V | F |
> </details>

## 1.3 Convención binaria

En este curso, las tablas de verdad emplean la notación binaria de ingeniería: **1 = Verdadero, 0 = Falso**. Es la misma convención empleada en programación con los valores `true`/`false`.

> [!NOTE]
> **Conexión con Lógica y Representación I**: en Python, `True` y `False` son literalmente los mismos dos valores que aquí representamos como 1 y 0. Cuando en ese curso construya una "tabla de casos de prueba" para verificar todas las combinaciones de entrada de una función, estará aplicando el mismo Protocolo de 6 pasos que acaba de ver aquí.

## 1.4 Errores típicos

> [!WARNING]
> - **Número de filas incorrecto**: siempre debe ser $2^n$.
> - **Patrón mal distribuido**: la primera variable alterna cada $2^{n-1}$ filas, la segunda cada $2^{n-2}$, y así sucesivamente.
> - **Alcance incorrecto de la negación**: $\neg(p\land q) \neq \neg p \land q$; use paréntesis para evitar confusión.
> - **Confundir $\lor$ con $\oplus$**: $\lor$ permite que ambas proposiciones sean verdaderas; $\oplus$ no.
> - **Ignorar la jerarquía** al completar columnas auxiliares.

> [!TIP]
> **Compruebe su comprensión**
>
> ¿Cuántas filas requiere la tabla de verdad de una expresión con 4 variables distintas?
>
> <details><summary>Ver respuesta</summary>
> $2^4 = 16$ filas.
> </details>

## 1.5 Clasificación de las proposiciones

Una vez construida la tabla de verdad completa de una proposición compuesta, el patrón de valores en su **columna final** permite clasificarla en uno de tres tipos:

> [!TIP]
> **Definiciones**
>
> - **Tautología**: proposición que es **verdadera en todos los casos posibles** — la columna final de su tabla de verdad es enteramente $V$.
> - **Contradicción**: proposición que es **falsa en todos los casos posibles** — la columna final es enteramente $F$.
> - **Contingencia**: proposición que es **verdadera para algunas combinaciones y falsa para otras** — la columna final combina $V$ y $F$.

Determinar a cuál de los tres tipos pertenece una expresión no requiere ninguna herramienta nueva: basta con construir su tabla de verdad completa (Protocolo de 6 pasos) y observar el patrón de la última columna.

> [!NOTE]
> Ya vio ejemplos de los tres tipos sin nombrarlos. En "Ejercicios resueltos" más abajo: el Ejercicio 1 ($P\land\neg P$) es una **contradicción**, los Ejercicios 2 y 3 son **tautologías**, y el Ejercicio 4 ($R\land S\rightarrow\neg T$) es una **contingencia** — es falso en un caso y verdadero en los otros siete.

> [!NOTE]
> **¿Por qué importa esto en ingeniería?**
>
> Cuando escribe una condición en código (`if temperatura > 90:`) o diseña una condición de seguridad en un sistema, generalmente espera que sea una **contingencia**: que a veces se cumpla y a veces no, dependiendo del estado real del sistema. Si al analizarla con cuidado descubre que en realidad es una **tautología** (siempre se cumple, sin importar los datos) o una **contradicción** (nunca se cumple), eso casi nunca es un caso especial afortunado — casi siempre es señal de un error de lógica.
>
> - Una condición de seguridad que resulta ser una tautología da una falsa sensación de estar "siempre verificando", cuando en realidad nunca estuvo evaluando nada real.
> - Una condición que resulta ser una contradicción vuelve inalcanzable todo el código que depende de ella — lo que en programación se conoce como *código muerto*: esa rama nunca se ejecutará, sin importar la entrada.
>
> Muchos compiladores y herramientas de análisis estático detectan automáticamente este tipo de patrones ("condición siempre verdadera/falsa") precisamente porque casi nunca son intencionales: son la forma más común en que un error de lógica se esconde dentro de una condición que, a simple vista, parece razonable.

---

# 📘 Ejercicios resueltos

**1. $P \land \neg P$**

**Paso 1 — Identificar variables y calcular el número de filas.** Hay una sola variable ($P$), así que $N=2^1=2$ filas.

**Paso 2 — Construir la columna auxiliar y evaluar.** El único operador auxiliar necesario es $\neg P$; luego se evalúa la conjunción completa.

| $P$ | $\neg P$ | $P\land\neg P$ |
|:---:|:---:|:---:|
| 1 | 0 | **0** |
| 0 | 1 | **0** |

**Paso 3 — Interpretar el resultado.** La columna final es **0 en ambas filas** — el resultado es siempre falso, sin importar el valor de $P$.

**2. $P \rightarrow Q \rightarrow \neg P \lor Q$**

**Paso 1 — Agrupar por jerarquía antes de construir columnas.** El condicional asocia a la derecha, así que la expresión se agrupa como $P \rightarrow \big(Q \rightarrow (\neg P \lor Q)\big)$. Esto determina el orden en que se llenarán las columnas auxiliares: primero $\neg P$, luego $\neg P \lor Q$, luego el condicional interno, y por último el condicional externo.

**Paso 2 — Determinar filas.** Hay dos variables ($P, Q$), así que $N=2^2=4$ filas.

**Paso 3 — Construir columnas auxiliares y evaluar en el orden establecido.**

| $P$ | $Q$ | $\neg P$ | $\neg P\lor Q$ | $Q\rightarrow(\neg P\lor Q)$ | $P\rightarrow\big(Q\rightarrow(\neg P\lor Q)\big)$ |
|:---:|:---:|:---:|:---:|:---:|:---:|
| 1 | 1 | 0 | 1 | 1 | **1** |
| 1 | 0 | 0 | 0 | 1 | **1** |
| 0 | 1 | 1 | 1 | 1 | **1** |
| 0 | 0 | 1 | 1 | 1 | **1** |

**Paso 4 — Interpretar.** La columna final es **1 en las cuatro filas** — el resultado es siempre verdadero, sin importar los valores de $P$ y $Q$.

**3. $P \rightarrow Q \land \neg Q \rightarrow \neg P$**

**Paso 1 — Agrupar por jerarquía.** De nuevo por asociatividad a la derecha del condicional, y por prioridad de $\land$ sobre $\rightarrow$: $P \rightarrow \big((Q\land\neg Q) \rightarrow \neg P\big)$.

**Paso 2 — Determinar filas.** $N=2^2=4$.

**Paso 3 — Construir columnas auxiliares y evaluar.**

| $P$ | $Q$ | $\neg Q$ | $Q\land\neg Q$ | $\neg P$ | $(Q\land\neg Q)\rightarrow\neg P$ | $P\rightarrow\big((Q\land\neg Q)\rightarrow\neg P\big)$ |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| 1 | 1 | 0 | 0 | 0 | 1 | **1** |
| 1 | 0 | 1 | 0 | 0 | 1 | **1** |
| 0 | 1 | 0 | 0 | 1 | 1 | **1** |
| 0 | 0 | 1 | 0 | 1 | 1 | **1** |

**Paso 4 — Interpretar.** Otra vez **siempre verdadero**. Note que la columna $Q\land\neg Q$ es siempre 0 — es la misma estructura del Ejercicio 1 escondida dentro de una expresión más grande.

> [!TIP]
> **Antes de continuar, pregúntese**: ¿qué tienen en común los ejercicios 2 y 3 para que ambos resulten siempre verdaderos, sin importar los valores de las variables?
>
> <details><summary>Ver respuesta</summary>
> En ambos casos, una parte interna de la expresión termina siendo siempre verdadera o siempre falsa de una manera que "protege" al condicional externo (en el ejercicio 2, $Q\rightarrow(\neg P\lor Q)$ es siempre verdadera; en el ejercicio 3, $Q\land\neg Q$ es siempre falsa, lo que vuelve verdadero al condicional que la contiene). Cuando eso ocurre, el resultado final queda garantizado sin importar el valor de las demás variables.
> </details>

**4. $R \land S \rightarrow \neg T$**

**Paso 1 — Determinar filas.** Hay tres variables ($R, S, T$), así que $N=2^3=8$ filas — el primer ejercicio de esta sesión que ya no cabe en una tabla de 4 filas.

**Paso 2 — Construir columnas auxiliares y evaluar.**

| $R$ | $S$ | $T$ | $R\land S$ | $\neg T$ | $(R\land S)\rightarrow\neg T$ |
|:---:|:---:|:---:|:---:|:---:|:---:|
| 1 | 1 | 1 | 1 | 0 | **0** |
| 1 | 1 | 0 | 1 | 1 | **1** |
| 1 | 0 | 1 | 0 | 0 | **1** |
| 1 | 0 | 0 | 0 | 1 | **1** |
| 0 | 1 | 1 | 0 | 0 | **1** |
| 0 | 1 | 0 | 0 | 1 | **1** |
| 0 | 0 | 1 | 0 | 0 | **1** |
| 0 | 0 | 0 | 0 | 1 | **1** |

**Paso 3 — Interpretar.** A diferencia de los tres ejercicios anteriores, aquí el resultado **no** es constante: es falso únicamente en la primera fila ($R=S=T=1$), y verdadero en las otras siete. Esto ilustra por qué no basta con evaluar un solo caso para saber si una expresión es siempre verdadera — hacía falta ver las 8 filas para confirmarlo.

**5. Clasifique las siguientes proposiciones como tautología, contradicción o contingencia.**

**(a) $p \lor \neg p$**

**Paso 1 — Determinar filas.** Una variable, $N=2^1=2$.

**Paso 2 — Construir la tabla.**

| $p$ | $\neg p$ | $p\lor\neg p$ |
|:---:|:---:|:---:|
| 0 | 1 | **1** |
| 1 | 0 | **1** |

**Paso 3 — Clasificar.** La columna final es siempre 1 → **Tautología**.

**(b) $p \land \neg p$**

**Paso 1 — Determinar filas.** Una variable, $N=2$.

**Paso 2 — Construir la tabla.**

| $p$ | $\neg p$ | $p\land\neg p$ |
|:---:|:---:|:---:|
| 0 | 1 | **0** |
| 1 | 0 | **0** |

**Paso 3 — Clasificar.** La columna final es siempre 0 → **Contradicción**.

**(c) $(\neg q \lor p) \rightarrow (\neg p \land q)$**

**Paso 1 — Determinar filas.** Dos variables, $N=2^2=4$.

**Paso 2 — Construir columnas auxiliares y evaluar.**

| $p$ | $q$ | $\neg q$ | $\neg q\lor p$ | $\neg p$ | $\neg p\land q$ | $(\neg q\lor p)\rightarrow(\neg p\land q)$ |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| 0 | 0 | 1 | 1 | 1 | 0 | **0** |
| 0 | 1 | 0 | 0 | 1 | 1 | **1** |
| 1 | 0 | 1 | 1 | 0 | 0 | **0** |
| 1 | 1 | 0 | 1 | 0 | 0 | **0** |

**Paso 3 — Clasificar.** La columna final combina 0 y 1 (no es constante) → **Contingencia**.

> [!TIP]
> **Antes de continuar, pregúntese**: de los tres tipos, ¿cuál es el único que garantiza que una expresión sea verdadera sin necesidad de conocer los valores de sus variables?
>
> <details><summary>Ver respuesta</summary>
> La tautología. Por definición, es verdadera en todas las filas de su tabla de verdad, así que su valor de verdad no depende de qué valores tomen sus variables — a diferencia de una contingencia, cuyo valor sí depende de eso.
> </details>

### Problema guiado

> [!TIP]
> Complete la última columna de la tabla de $p \land (q \lor \neg p)$.
>
> | $p$ | $q$ | $\neg p$ | $q\lor\neg p$ | $p\land(q\lor\neg p)$ |
> |:---:|:---:|:---:|:---:|:---:|
> | 1 | 1 | 0 | 1 | ___ |
> | 1 | 0 | 0 | 0 | ___ |
> | 0 | 1 | 1 | 1 | ___ |
> | 0 | 0 | 1 | 1 | ___ |
>
> <details><summary>Ver respuesta</summary>
>
> | $p$ | $q$ | $\neg p$ | $q\lor\neg p$ | $p\land(q\lor\neg p)$ |
> |:---:|:---:|:---:|:---:|:---:|
> | 1 | 1 | 0 | 1 | **1** |
> | 1 | 0 | 0 | 0 | **0** |
> | 0 | 1 | 1 | 1 | **0** |
> | 0 | 0 | 1 | 1 | **0** |
>
> </details>

---

# 📋 Expediente Discovery One — Veredicto

*Se retoma la condición de anomalía definida en la sesión anterior, aplicando ahora el método sistemático de tablas de verdad.*

En la sesión anterior se evaluó la condición de anomalía $A = H \land \neg D \land \neg C$ (con $C = H \land D$) únicamente para el caso observado ($H=V$, $D=F$). Siguiendo el Protocolo de 6 pasos, se construye a continuación la tabla completa, considerando las 4 combinaciones posibles de $H$ y $D$:

**Paso 1 — Variables y filas.** Dos variables ($H, D$), $N=2^2=4$ filas.

**Paso 2 — Columnas auxiliares y evaluación.**

| $H$ | $D$ | $C = H\land D$ | $\neg D$ | $\neg C$ | $A = H\land\neg D\land\neg C$ |
|:---:|:---:|:---:|:---:|:---:|:---:|
| V | V | V | F | F | **F** |
| V | F | F | V | V | **V** |
| F | V | F | F | V | **F** |
| F | F | F | V | V | **F** |

**Paso 3 — Interpretar.** La condición de anomalía resulta verdadera en exactamente **una** de las cuatro combinaciones posibles: $H=V, D=F$ — precisamente el escenario observado en el caso. No es un resultado garantizado de antemano (no ocurre en los otros tres escenarios), pero tampoco es un resultado imposible: existe exactamente una combinación de valores que lo produce, y es justamente la que se observó.

**Veredicto**: el análisis exhaustivo confirma que la situación reportada por HAL corresponde, de manera lógicamente precisa, al único escenario de los cuatro posibles en que el sistema se encuentra en un estado de anomalía real. Esto no revela *por qué* ocurrió la discrepancia — esa parte de la historia se deja para quien desee ver la película completa —, pero sí demuestra, con las herramientas desarrolladas en estas dos sesiones, que la discrepancia es real, específica, y no puede descartarse como una coincidencia o un error de apreciación.

**Un hallazgo adicional**: vale la pena notar qué tipo de proposición es $A$ misma, según la clasificación de la Parte I. La tabla anterior muestra que $A$ es verdadera en una única fila y falsa en las otras tres — es decir, $A$ es una **contingencia**. Esto no es un detalle menor: es justamente lo que se espera de una buena condición de detección de anomalías. Si $A$ hubiera resultado ser una **tautología** (siempre verdadera), HAL habría señalado una anomalía sin importar las circunstancias — una alarma que nunca se apaga es tan inútil como no tener alarma. Si hubiera sido una **contradicción** (siempre falsa), ninguna combinación de datos habría podido activarla, y una anomalía real habría pasado desapercibida sin importar qué tan grave fuera. Que $A$ sea una contingencia es lo que la vuelve, en principio, una condición de detección bien diseñada: distingue el escenario observado de los otros tres posibles, en vez de dispararse (o quedarse muda) sin importar los datos.

Las herramientas empleadas hasta ahora —axiomas de verdad, jerarquía de operadores y tablas de verdad— tienen, sin embargo, un límite práctico: como se vio en el Ejercicio 4, una tabla de verdad tiene $2^n$ filas. Una expresión con 5 variables ya requiere 32 filas; una con 10 variables requeriría 1024. Construir la tabla completa deja de ser una opción práctica mucho antes de eso. La siguiente sesión introduce las **equivalencias lógicas y las Leyes de De Morgan**: un conjunto de reglas que permiten transformar y comparar expresiones sin necesidad de construir la tabla completa cada vez.

---

# Parte II — Ejercicios propuestos

A continuación se presentan ejercicios de autoevaluación. Se recomienda resolverlos antes de consultar el solucionario al final del documento.

### Construcción de tablas de verdad

**E1.** Construya la tabla de verdad de $p \oplus \neg q$.

**E2.** Construya la tabla de verdad de $p \leftrightarrow (q \lor \neg p)$.

**E3.** Construya la tabla de verdad de $(p\land q) \lor (\neg p \land \neg q)$.

**E4.** ¿Cuántas filas tendría la tabla de verdad de una expresión con 6 variables distintas? No construya la tabla completa — solo calcule el número de filas y describa cada cuántas filas alternaría la primera variable.

### Casos aplicados

**E5.** "La alarma se activa si el sensor de humo detecta algo y el sistema no está en modo de prueba, o si se presiona el botón de pánico." Formalice la condición ($s$: el sensor detecta algo; $t$: el sistema está en modo de prueba; $b$: se presiona el botón de pánico) y construya la tabla de verdad completa. ¿En cuántas de las 8 combinaciones posibles se activa la alarma?

**E6.** "El backup automático se ejecuta si y solo si es medianoche y no hay una copia ya en curso." Formalice la condición ($m$: es medianoche; $c$: hay una copia ya en curso) y construya la tabla de verdad completa. ¿En cuántas de las 4 combinaciones posibles se ejecuta el backup?

---

## Resultados de aprendizaje

Al finalizar este documento, usted debería ser capaz de:

- Construir una tabla de verdad completa siguiendo el Protocolo de 6 pasos, para expresiones de cualquier número de variables.
- Determinar el número de filas necesarias para una expresión con $n$ variables.
- Clasificar una proposición compuesta como tautología, contradicción o contingencia, a partir del patrón de su tabla de verdad.
- Evitar los errores típicos de construcción (número de filas, distribución de valores, alcance de la negación).

---

## Ficha de bolsillo

**Protocolo de 6 pasos**: identificar variables → calcular filas ($2^n$) → construir columnas de variables → agregar columnas auxiliares → evaluar respetando jerarquía → validar.

**Convención binaria**: $1 = V$, $0 = F$ (igual que `True`/`False` en Python).

**Errores típicos**: filas $\neq 2^n$; patrón de alternancia mal distribuido; confundir $\neg(p\land q)$ con $\neg p\land q$; confundir $\lor$ con $\oplus$.

**Clasificación**: columna final toda $V$ → Tautología. Toda $F$ → Contradicción. Mezcla de $V$ y $F$ → Contingencia.

---

## Referencias y material para profundizar

### Notas del curso

- **Sitio de notas de clase de Matemáticas Discretas 1**: [discretas1-udea.github.io/discretas1-udea-20261](https://discretas1-udea.github.io/discretas1-udea-20261/). Sitio oficial del curso, actualmente **en construcción**: no todas las sesiones están publicadas todavía, y el contenido disponible puede cambiar a medida que avanza el semestre.

### Libros de texto del curso

- **Rosen, K. H.** *Discrete Mathematics and Its Applications* (8ª ed.). McGraw-Hill. Capítulo 1: "The Foundations: Logic and Proofs".
- **Liben-Nowell, D.** *Connecting Discrete Mathematics and Computer Science*. Cambridge University Press.

### Material web de universidades

- **MIT OpenCourseWare — 6.042J, Mathematics for Computer Science**: [ocw.mit.edu/courses/6-042j-mathematics-for-computer-science-fall-2010](https://ocw.mit.edu/courses/6-042j-mathematics-for-computer-science-fall-2010/). En inglés.
- **Stanford CS103 — Mathematical Foundations of Computing, Lección 3: Propositional Logic**: [web.stanford.edu/class/archive/cs/cs103/cs103.1234/lectures/03](https://web.stanford.edu/class/archive/cs/cs103/cs103.1234/lectures/03/). En inglés.

> [!NOTE]
> Si el acceso a internet es limitado, no es necesario consultar estas fuentes para completar el curso — el contenido de este documento y de las clases es suficiente. Están aquí únicamente para quien desee profundizar por su cuenta.

---

## Solucionario — Parte II

<details>
<summary><b>Presione aquí para ver las respuestas</b></summary>

**E1.** Columna resultado de $p \oplus \neg q$ (para $p,q = VV, VF, FV, FF$): $1, 0, 0, 1$.

**E2.** Columna resultado de $p \leftrightarrow (q \lor \neg p)$: $1, 0, 0, 0$.

**E3.** Columna resultado de $(p\land q) \lor (\neg p \land \neg q)$: $1, 0, 0, 1$.

**E4.** $2^6 = 64$ filas. La primera variable alterna cada $2^{6-1}=32$ filas.

**E5.** $s \land \neg t \lor b$, agrupado como $(s\land\neg t)\lor b$. Evaluando las 8 combinaciones de $s,t,b$: la alarma se activa (resultado 1) en **5 de las 8** combinaciones — todas menos aquellas en que $b=F$ y, simultáneamente, $s=F$ o $t=V$.

**E6.** $m \leftrightarrow \neg c$. Evaluando las 4 combinaciones: se ejecuta el backup (resultado 1) en **2 de las 4** combinaciones: $m=V,c=F$ y $m=F,c=V$.

</details>