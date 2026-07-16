# 🛰️ El Incidente del Discovery One
### Axiomas de Verdad, Jerarquía de Operadores y Tablas de Verdad

*Notas de clase — Matemáticas Discretas 1 · Módulo 1: Lógica Proposicional*
*Universidad de Antioquia · Ingeniería de Sistemas*

---

## Contexto de apoyo

A lo largo de este documento se emplea, como hilo narrativo de aplicación, un caso inspirado en la película **2001: Una Odisea del Espacio** (Stanley Kubrick, 1968). No es necesario haber visto la película para seguir las notas; a continuación se ofrece el contexto mínimo necesario.

> 📖 **Para ampliar**: [2001: A Space Odyssey — Wikipedia](https://es.wikipedia.org/wiki/2001:_A_Space_Odyssey_(pel%C3%ADcula)) · [HAL 9000 — Wikipedia](https://es.wikipedia.org/wiki/HAL_9000)
> 🎬 **Video corto (2-3 min)**: [Tráiler oficial](https://www.youtube.com/watch?v=UgGCScAV7qU)

**Dossier de la misión**:

| | |
|---|---|
| **Nave** | *Discovery One* |
| **Destino** | Júpiter |
| **Tripulación despierta** | David Bowman y Frank Poole (los demás tripulantes viajan hibernados) |
| **Sistema de a bordo** | **HAL 9000**, una computadora con capacidad de tomar decisiones sin consultar a los humanos, encargada de controlar los sistemas vitales de la nave |

## El caso

Semanas después de partir, HAL reporta un fallo inminente en la unidad AE-35, el componente que mantiene la antena de la nave alineada con la Tierra. Bowman inspecciona la unidad físicamente y no encuentra ningún fallo. Cuando Tierra analiza el mismo problema con un HAL gemelo, tampoco encuentra ningún error — lo cual resulta extraño, dado que la serie 9000 tiene un historial operativo perfecto.

Queda entonces una pregunta abierta: **¿HAL evaluó incorrectamente una condición lógica, o el error está en otra parte?**

Este documento presenta, en primer lugar, las herramientas teóricas necesarias para responder ese tipo de preguntas de forma rigurosa (Axiomas de Verdad, Jerarquía de Operadores y Tablas de Verdad). Tras cada bloque teórico se incluyen ejercicios resueltos de práctica general y, de manera independiente, un **Expediente** que retoma el caso del Discovery One y aplica lo aprendido para avanzar en su resolución, hasta llegar a un veredicto final.

## Antes de comenzar: lo que usted ya debería saber

Este documento continúa lo trabajado en la clase anterior (Lógica Proposicional — Parte 1). Antes de avanzar, verifique que puede hacer lo siguiente:

- Reconocer una **proposición** (un enunciado declarativo con un único valor de verdad) y distinguirla de preguntas, órdenes o exclamaciones.
- Identificar los **seis operadores lógicos** por su símbolo: negación ($\neg$), conjunción ($\land$), disyunción ($\lor$), disyunción exclusiva ($\oplus$), condicional ($\rightarrow$) y bicondicional ($\leftrightarrow$).
- Traducir un enunciado simple de lenguaje natural a una variable (por ejemplo, "Hoy llueve" → $p$).

**Recordatorio rápido**: una proposición compuesta se forma uniendo proposiciones simples con un operador. Si $p$ = "Hoy llueve" y $q$ = "Hace frío", entonces $p \land q$ se lee "Hoy llueve y hace frío".

Si alguno de estos puntos no le resulta claro, se recomienda repasarlo antes de continuar; el material completo, con más ejemplos, está disponible en: [Clase 01 — Fundamentos de Lógica Proposicional](https://discretas1-udea.github.io/discretas1-udea-20261/lessons/mod1/clase1/). Si en este momento no cuenta con conexión a internet, puede continuar de todas formas: el recordatorio anterior es suficiente para seguir el resto del documento.

---

# Parte I — Axiomas de Verdad

## 1.1 Elementos de formalización

Una **variable proposicional** ($p, q, r, \ldots$) representa un hecho con valor de verdad definido. Los **operadores** ($\neg, \land, \lor, \oplus, \rightarrow, \leftrightarrow$) permiten combinar variables para construir proposiciones compuestas. Los **signos de agrupación** ($(), []$) determinan el orden de evaluación cuando hay varios operadores en juego.

Estos elementos deben combinarse siguiendo **reglas de formación**, que determinan si una expresión está bien formada. Una variable sola ($p$) es una expresión válida; un operador binario aplicado a dos expresiones válidas ($p \land q$) también lo es. En cambio, una secuencia como $p \land \square$ (un operador sin su segundo operando) no es una expresión válida, porque no existe una forma de asignarle un valor de verdad.

## 1.2 Proposiciones simples y compuestas

Una proposición es **simple** (o atómica) cuando expresa un único hecho, sin conectores lógicos. Es **compuesta** (o molecular) cuando resulta de unir dos o más proposiciones simples mediante conectores.

**Ejemplo**: la afirmación *"Jacob y Esaú son hijos de Isaac"* es, pese a contener la palabra "y", una proposición **simple**: describe un único hecho verificable (una relación de parentesco), no dos proposiciones distintas. En cambio, *"Como Jacob le dio un plato de lentejas a su padre, obtuvo la primogenitura"* sí es **compuesta**: contiene una estructura condicional, $L \rightarrow S$, donde $L$ = "Jacob le da el plato de lentejas a su padre" y $S$ = "Jacob obtiene la primogenitura".

> ✅ **Compruebe su comprensión**
>
> Clasifique las siguientes proposiciones como simples o compuestas:
> 1. "El número 7 es primo."
> 2. "Llueve y hace frío."
>
> <details><summary>Ver respuesta</summary>
> (1) Simple: un único hecho. (2) Compuesta: dos hechos unidos por el conector "y" (conjunción).
> </details>

## 1.3 Principio de bivalencia y paradojas

Toda proposición debe cumplir el **Axioma de Bivalencia**: puede clasificarse como verdadera ($V$) o falsa ($F$), pero nunca ambas a la vez ni ninguna de las dos.

No todo enunciado declarativo cumple esta condición. Considere la afirmación *"Esta oración es falsa"*. Si se denota como $Q$ y se supone $Q=V$, entonces lo que afirma es cierto, por lo que $Q$ debería ser falsa — contradicción. Si se supone $Q=F$, entonces lo que afirma es falso, por lo que $Q$ debería ser verdadera — otra contradicción. En consecuencia, $Q$ no admite un valor de verdad fijo: es una **paradoja**, no una proposición válida.

Existe otro tipo de enunciado que tampoco es proposición: el **enunciado abierto**, aquel que contiene variables sin un valor fijo asignado. Por ejemplo, "$x + y = z$" no puede clasificarse como verdadera ni falsa mientras $x$, $y$ y $z$ no tengan valores concretos.

> ✅ **Compruebe su comprensión**
>
> Explique por qué la oración "Esta afirmación no puede probarse ni refutarse" presenta el mismo tipo de problema que el ejemplo anterior.
>
> <details><summary>Ver respuesta</summary>
> Al igual que la paradoja del mentiroso, es una afirmación autorreferencial: cualquier intento de asignarle un valor de verdad fijo entra en conflicto con lo que la propia afirmación establece, violando el axioma de bivalencia.
> </details>

## 1.4 Los seis operadores lógicos

### Negación ($\neg p$)

Invierte el valor de verdad de una proposición.

| $p$ | $\neg p$ |
|:---:|:---:|
| V | F |
| F | V |

### Conjunción ($p \land q$)

Verdadera únicamente cuando ambas proposiciones son verdaderas.

| $p$ | $q$ | $p \land q$ |
|:---:|:---:|:---:|
| V | V | V |
| V | F | F |
| F | V | F |
| F | F | F |

> **Regla corta**: basta una falsedad para que toda la conjunción sea $F$.

### Disyunción ($p \lor q$)

Verdadera cuando al menos una de las proposiciones es verdadera.

| $p$ | $q$ | $p \lor q$ |
|:---:|:---:|:---:|
| V | V | V |
| V | F | V |
| F | V | V |
| F | F | F |

> **Regla corta**: basta una verdad para que toda la disyunción sea $V$.

### Disyunción exclusiva ($p \oplus q$)

Verdadera cuando las dos proposiciones tienen valores diferentes.

| $p$ | $q$ | $p \oplus q$ |
|:---:|:---:|:---:|
| V | V | F |
| V | F | V |
| F | V | V |
| F | F | F |

> **Regla corta**: valores diferentes dan $V$.

> ✅ **Compruebe su comprensión**
>
> Sean $p=V$ y $q=F$. Evalúe $\neg p \lor q$ y $p \oplus \neg q$.
>
> <details><summary>Ver respuesta</summary>
> $\neg p \lor q = F \lor F = F$. $\;\; p \oplus \neg q = V \oplus V = F$.
> </details>

### Condicional ($p \rightarrow q$)

Se lee "Antecedente $\rightarrow$ Consecuente". Según el contexto, también se conoce como Hipótesis $\rightarrow$ Tesis (en demostraciones) o Premisa $\rightarrow$ Conclusión (en argumentos).

| $p$ | $q$ | $p \rightarrow q$ |
|:---:|:---:|:---:|
| V | V | V |
| V | F | **F** |
| F | V | V |
| F | F | V |

> **Regla de oro**: el condicional solo es falso cuando el antecedente es verdadero y el consecuente es falso ($V \rightarrow F = F$). En cualquier otro caso es verdadero, incluso cuando el antecedente es falso.

**Ejemplo**: considere la afirmación *"Si Uribe gana las elecciones, entonces habrá paz"* ($W \rightarrow P$). En un escenario donde efectivamente gana ($W=V$) pero no hay paz ($P=F$): $W \rightarrow P = V \rightarrow F = F$, la implicación resulta falsa, porque se prometió algo que no se cumplió. En un escenario donde no gana ($W=F$) y tampoco hay paz ($P=F$): $W \rightarrow P = F \rightarrow F = V$, la implicación es verdadera, porque nunca se activó la condición que la haría exigible.

> ⚠️ **Errores conceptuales frecuentes con el condicional**
>
> **1. Confundir el condicional con una relación de causa y efecto.** Considere $p$ = "Llueve" y $q$ = "La calle está mojada", con $p \rightarrow q$. Esto no significa que la lluvia sea la *causa* de que la calle esté mojada — solo describe una relación entre valores de verdad. La calle podría estar mojada por otra razón (un carro tanque de agua, por ejemplo) y la proposición $p \rightarrow q$ seguiría siendo verdadera si, cada vez que llueve, la calle también está mojada. El condicional no explica *por qué* ocurre algo; solo compara si dos hechos son consistentes entre sí.
>
> **2. Confundir $p \rightarrow q$ con su recíproco $q \rightarrow p$.** Estas dos expresiones **no** son equivalentes. Con el ejemplo anterior: $p \rightarrow q$ ("Si llueve, la calle está mojada") puede ser verdadera, mientras que $q \rightarrow p$ ("Si la calle está mojada, entonces llovió") puede ser falsa al mismo tiempo — la calle pudo mojarse por otra causa. Antes de dar por hecho que una implicación funciona "en ambos sentidos", verifique con una tabla de verdad si realmente es así; en general, no lo es.

### Bicondicional ($p \leftrightarrow q$)

Verdadero cuando ambas proposiciones comparten el mismo valor de verdad.

| $p$ | $q$ | $p \leftrightarrow q$ |
|:---:|:---:|:---:|
| V | V | V |
| V | F | F |
| F | V | F |
| F | F | V |

> ✅ **Compruebe su comprensión**
>
> Sean $p=F$, $q=V$, $r=F$. Evalúe $(p \rightarrow q) \leftrightarrow r$.
>
> <details><summary>Ver respuesta</summary>
> $p \rightarrow q = F \rightarrow V = V$. $\;\; V \leftrightarrow r = V \leftrightarrow F = F$.
> </details>

---

# Parte II — Jerarquía de Operadores

## 2.1 Tabla de prioridad y asociatividad

Cuando una expresión compuesta no tiene suficientes signos de agrupación, se aplica un orden de precedencia fijo para evitar ambigüedad.

| Prioridad | Símbolo | Asociatividad | Ejemplo con paréntesis |
|:---:|:---:|:---:|---|
| 1 (más alta) | $\neg$ | No aplica (unitario) | $\neg p \land q \mapsto (\neg p) \land q$ |
| 2 | $\land$ | Izquierda | $p \land q \land r \mapsto (p \land q) \land r$ |
| 3 | $\lor$ | Izquierda | $p \lor q \lor r \mapsto (p \lor q) \lor r$ |
| 4 | $\oplus$ | Izquierda | $p \oplus q \oplus r \mapsto (p \oplus q) \oplus r$ |
| 5 | $\rightarrow$ | Derecha | $p \rightarrow q \rightarrow r \mapsto p \rightarrow (q \rightarrow r)$ |
| 6 (más baja) | $\leftrightarrow$ | Derecha | $p \leftrightarrow q \leftrightarrow r \mapsto p \leftrightarrow (q \leftrightarrow r)$ |

## 2.2 Método de evaluación paso a paso

Para evaluar una expresión con valores dados: (1) sustituya cada variable por su valor; (2) resuelva primero las negaciones; (3) continúe según el orden de precedencia de la tabla anterior, resolviendo de adentro hacia afuera cuando existan paréntesis anidados.

**Ejemplo**: dados $p=V$, $q=F$, $r=V$, evalúe $\neg p \lor q \rightarrow r$.

$\neg p = F$. $\;\; \neg p \lor q = F \lor F = F$. $\;\; F \rightarrow r = F \rightarrow V = V$. Resultado: $V$.

> ✅ **Compruebe su comprensión**
>
> Agregue los paréntesis correspondientes, según la jerarquía, a la expresión $p \lor q \land \neg r \rightarrow s$.
>
> <details><summary>Ver respuesta</summary>
> Primero $\neg r$; luego $\land$: $q \land (\neg r)$; luego $\lor$: $p \lor (q \land \neg r)$; luego $\rightarrow$: $\big(p \lor (q \land \neg r)\big) \rightarrow s$.
> </details>

---

# 📘 Bitácora resuelta I

A continuación se presentan los ejercicios resueltos correspondientes a los temas de las Partes I y II.

### Bloque A — Traducción a lenguaje formal

**1. "Juan es estudiante de matemáticas pero no de ciencias de la computación."**

- $p$: Juan es estudiante de matemáticas.
- $q$: Juan es estudiante de ciencias de la computación.
- **Expresión**: $p \land \neg q$

**2. "Ni hace calor ni está soleado."**

- $h$: Hace calor.
- $s$: Está soleado.
- **Expresión**: $\neg h \land \neg s$

**3. "Este número es par o este número es impar."**

- $p$: El número es par.
- $q$: El número es impar.
- **Expresión**: $p \lor q$

> ⚠️ **Error conceptual frecuente**: un entero no puede ser par e impar a la vez —son mutuamente excluyentes— lo que podría sugerir que aquí correspondería usar $\oplus$ en vez de $\lor$. Sin embargo, la convención de traducción es distinta: el "o" del lenguaje natural se traduce como disyunción inclusiva ($\lor$) salvo que el enunciado indique explícitamente exclusividad (por ejemplo, con la construcción "o... o..., pero no ambos"). La traducción $p \lor q$ es correcta como *traducción literal* del enunciado; que $p$ y $q$ no puedan ser verdaderas simultáneamente en este caso particular es una propiedad de los números (mutuamente excluyentes), no algo que cambie la regla de traducción del conector "o".

**4. "Si tiene una contraseña vigente, entonces puede iniciar sesión en la red."**

- $p$: Tiene una contraseña vigente.
- $q$: Puede iniciar sesión en la red.
- **Expresión**: $p \rightarrow q$

**5. "John batirá el récord mundial de la milla solo si corre la milla en menos de cuatro minutos."**

- $p$: John batirá el récord mundial de la milla.
- $q$: Corre la milla en menos de cuatro minutos.
- La construcción "$p$ solo si $q$" se traduce como $p \rightarrow q$ ($q$ es condición necesaria para $p$).
- **Expresión**: $p \rightarrow q$

**6. "Este entero es par si, y solo si, es igual al doble de algún entero."**

- $p$: Este entero es par.
- $q$: Es igual al doble de algún entero.
- **Expresión**: $p \leftrightarrow q$

**7. "Si el pianista toca el concierto, entonces la gente vendrá si los precios no son demasiado altos."**

- $p$: El pianista toca el concierto.
- $q$: La gente vendrá.
- $r$: Los precios son demasiado altos.
- La cláusula interna "la gente vendrá si los precios no son demasiado altos" se traduce como $\neg r \rightarrow q$.
- **Expresión**: $p \rightarrow (\neg r \rightarrow q)$

> 💭 **Antes de continuar, pregúntese**: ¿por qué la cláusula interna se tradujo como $\neg r \rightarrow q$ y no como $r \rightarrow q$?
>
> <details><summary>Ver respuesta</summary>
> Porque el enunciado dice "si los precios <b>no</b> son demasiado altos", es decir, la condición que activa "la gente vendrá" es la negación de $r$, no $r$ directamente.
> </details>

### Bloque B — Evaluación con axiomas de verdad

**8.** Sea $h$ una proposición verdadera ("Hace calor") y $s$ una proposición falsa ("El día está soleado"). Determine:

- $\neg h \land s = \neg V \land F = F \land F = \mathbf{F}$
- $\neg h \land \neg s = F \land \neg F = F \land V = \mathbf{F}$

**9.** Determine el valor de verdad de $p \lor q \land \neg(p \land q)$ cuando:

Por jerarquía, la expresión se agrupa como $p \lor \big(q \land \neg(p \land q)\big)$.

- **$p=V, q=V$**: $p\land q = V$; $\neg(p\land q)=F$; $q\land\neg(p\land q) = V\land F = F$; $p \lor F = V \lor F = \mathbf{V}$
- **$p=V, q=F$**: $p\land q = F$; $\neg(p\land q)=V$; $q\land\neg(p\land q) = F\land V = F$; $p \lor F = V \lor F = \mathbf{V}$

### Bloque C — Deducción con jerarquía

**10.** Sean $P, Q, R$ proposiciones.

**(a)** Si $R \lor P$ y $Q \land P$ son falsas, y $P$ es falsa, ¿qué puede afirmarse de $Q$ y $R$?

Como $P=F$: $R \lor P = R \lor F = R$, y esto debe ser falso, así que $\mathbf{R=F}$. Por otro lado, $Q \land P = Q \land F$ es siempre falsa sin importar el valor de $Q$, de modo que esta condición no aporta información adicional. **El valor de $Q$ queda indeterminado.**

**(b)** Si $Q \rightarrow R \rightarrow P \land Q \lor R$ es falsa, ¿qué puede afirmarse de $P, Q, R$?

Por jerarquía, la expresión se agrupa como $Q \rightarrow \Big(R \rightarrow \big((P\land Q)\lor R\big)\Big)$.

Para que sea falsa se requeriría $R=V$ y, simultáneamente, $(P\land Q)\lor R = F$. Pero si $R=V$, entonces $(P\land Q)\lor R$ es siempre verdadera (por la regla de la disyunción). Esto es una contradicción irresoluble.

**Conclusión**: no existe ninguna combinación de $P, Q, R$ que haga falsa esta expresión — es **siempre verdadera**, sin importar los valores de $P$, $Q$ y $R$.

> 💭 **Antes de continuar, pregúntese**: ¿por qué fue necesario descartar la posibilidad de que la expresión fuera falsa mediante un razonamiento completo, en lugar de probar un solo caso?
>
> <details><summary>Ver respuesta</summary>
> Porque evaluar un único caso solo demuestra que la expresión <i>puede</i> ser verdadera en esa situación particular; no demuestra que sea imposible que sea falsa. Para afirmar que una expresión es siempre verdadera se necesita mostrar que <b>ninguna</b> combinación de valores la hace falsa — ya sea revisando todos los casos posibles, o mediante un argumento por contradicción como el que se usó aquí.
> </details>

### Problema guiado

Complete el paso que falta.

Sean $p=V$, $q=F$. Evalúe $(p \lor q) \rightarrow \neg p$.

- $p \lor q = V \lor F = V$
- $\neg p = \_\_\_$
- $(p \lor q) \rightarrow \neg p = V \rightarrow \_\_\_ = \_\_\_$

<details><summary>Ver respuesta</summary>
$\neg p = F$. $\;\; V \rightarrow F = \mathbf{F}$.
</details>

---

# 📋 Expediente Discovery One — Fase 1

*Se retoma el caso planteado al inicio del documento, aplicando los conceptos de las Partes I y II.*

**Datos disponibles**:
- $H$: "HAL reporta un fallo en la unidad AE-35" (dato del caso: $H=V$, HAL efectivamente emitió este reporte).
- $D$: "La inspección física detecta un fallo real en la unidad" (dato del caso: $D=F$, Bowman no encontró ningún fallo).

**Pieza 1 — Negación**. La inspección de Bowman establece que $D$ es falsa. Aplicando negación, $\neg D$ = "la inspección no detecta ningún fallo" es verdadera ($\neg D = V$).

**Pieza 2 — Conjunción**. Suponga que el protocolo de la misión establece: *"El fallo se declara confirmado si HAL lo reporta y la inspección lo detecta"*, es decir $C = H \land D$. Evaluando: $C = V \land F = \mathbf{F}$. Según el protocolo, el fallo **no** queda confirmado.

**Pieza 3 — Condicional**. Suponga además la regla de seguridad: *"Si el fallo es confirmado, entonces se notifica a Tierra con prioridad alta"*, es decir $C \rightarrow N$. Dado que $C = F$ (Pieza 2), el condicional $C \rightarrow N$ es verdadero sin importar el valor de $N$, por la regla de oro del condicional (antecedente falso implica condicional verdadero). La regla de seguridad no fue violada, independientemente de si la notificación se envió o no.

**Pieza 4 — Expresión compuesta y jerarquía**. Se define la condición de anomalía como $A = H \land \neg D \land \neg C$ (HAL reporta el fallo, la inspección no lo detecta, y el fallo no está confirmado por protocolo). Evaluando con los datos disponibles: $A = V \land V \land \neg F = V \land V \land V = \mathbf{V}$.

La condición de anomalía se cumple: existe una discrepancia lógica real entre lo que HAL reporta y lo que el resto del sistema puede corroborar. Esta discrepancia se examina de forma exhaustiva en la Fase 2, una vez introducidas las tablas de verdad.

---

# Parte III — Tablas de Verdad

## 3.1 Definición y tabla unificada

Una **tabla de verdad** es una herramienta tabular que muestra el resultado de una expresión lógica para todas las combinaciones posibles de valores de verdad de sus variables. Es la alternativa sistemática a evaluar caso por caso.

| $p$ | $q$ | $\neg p$ | $p\land q$ | $p\lor q$ | $p\oplus q$ | $p\rightarrow q$ | $p\leftrightarrow q$ |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| V | V | F | V | V | F | V | V |
| V | F | F | F | V | V | F | F |
| F | V | V | F | V | V | V | F |
| F | F | V | F | F | F | V | V |

## 3.2 Protocolo de 6 pasos

1. **Identificar las variables proposicionales**: cuántas letras distintas componen la expresión.
2. **Determinar el número de filas**: $N = 2^n$, con $n$ igual al número de variables.
3. **Construir las columnas de las variables**, distribuyendo los valores sistemáticamente.
4. **Agregar columnas auxiliares**, descomponiendo la fórmula en sub-expresiones.
5. **Evaluar la expresión paso a paso**, de izquierda a derecha, respetando la jerarquía de operadores.
6. **Revisar y validar** la tabla completa.

> ✅ **Compruebe su comprensión**
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

## 3.3 Convención binaria

En este curso, las tablas de verdad emplean la notación binaria de ingeniería: **1 = Verdadero, 0 = Falso**. Es la misma convención empleada en programación con los valores `true`/`false`.

## 3.4 Errores típicos

- **Número de filas incorrecto**: siempre debe ser $2^n$.
- **Patrón mal distribuido**: la primera variable alterna cada $2^{n-1}$ filas, la segunda cada $2^{n-2}$, y así sucesivamente.
- **Alcance incorrecto de la negación**: $\neg(p\land q) \neq \neg p \land q$; use paréntesis para evitar confusión.
- **Confundir $\lor$ con $\oplus$**: $\lor$ permite que ambas proposiciones sean verdaderas; $\oplus$ no.
- **Ignorar la jerarquía** al completar columnas auxiliares.

> ✅ **Compruebe su comprensión**
>
> ¿Cuántas filas requiere la tabla de verdad de una expresión con 4 variables distintas?
>
> <details><summary>Ver respuesta</summary>
> $2^4 = 16$ filas.
> </details>

---

# 📘 Bitácora resuelta II

**1. $P \land \neg P$**

| $P$ | $\neg P$ | $P\land\neg P$ |
|:---:|:---:|:---:|
| 1 | 0 | **0** |
| 0 | 1 | **0** |

El resultado es **siempre falso**, sin importar el valor de $P$.

**2. $P \rightarrow Q \rightarrow \neg P \lor Q$**

Agrupación por jerarquía: $P \rightarrow \big(Q \rightarrow (\neg P \lor Q)\big)$.

| $P$ | $Q$ | $\neg P$ | $\neg P\lor Q$ | $Q\rightarrow(\neg P\lor Q)$ | Resultado final |
|:---:|:---:|:---:|:---:|:---:|:---:|
| 1 | 1 | 0 | 1 | 1 | **1** |
| 1 | 0 | 0 | 0 | 1 | **1** |
| 0 | 1 | 1 | 1 | 1 | **1** |
| 0 | 0 | 1 | 1 | 1 | **1** |

El resultado es **siempre verdadero**, sin importar los valores de $P$ y $Q$.

**3. $P \rightarrow Q \land \neg Q \rightarrow \neg P$**

Agrupación por jerarquía: $P \rightarrow \big((Q\land\neg Q) \rightarrow \neg P\big)$.

| $P$ | $Q$ | $\neg Q$ | $Q\land\neg Q$ | $\neg P$ | $(Q\land\neg Q)\rightarrow\neg P$ | Resultado final |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| 1 | 1 | 0 | 0 | 0 | 1 | **1** |
| 1 | 0 | 1 | 0 | 0 | 1 | **1** |
| 0 | 1 | 0 | 0 | 1 | 1 | **1** |
| 0 | 0 | 1 | 0 | 1 | 1 | **1** |

El resultado es, otra vez, **siempre verdadero**, sin importar los valores de $P$ y $Q$.

> 💭 **Antes de continuar, pregúntese**: ¿qué tienen en común los ejercicios 2 y 3 para que ambos resulten siempre verdaderos, sin importar los valores de las variables?
>
> <details><summary>Ver respuesta</summary>
> En ambos casos, una parte interna de la expresión termina siendo siempre verdadera (en el ejercicio 2, $Q\rightarrow(\neg P\lor Q)$ es siempre verdadera; en el ejercicio 3, $Q\land\neg Q$ es siempre falsa, lo que también vuelve verdadero el condicional que la contiene). Cuando eso ocurre, el condicional externo termina siendo verdadero sin importar el valor de las demás variables.
> </details>

**4. $R \land S \rightarrow \neg T$**

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

El resultado es **falso únicamente en el caso $R=S=T=1$**; en los otros siete casos es verdadero.

### Problema guiado

Complete la última columna de la tabla de $p \land (q \lor \neg p)$.

| $p$ | $q$ | $\neg p$ | $q\lor\neg p$ | $p\land(q\lor\neg p)$ |
|:---:|:---:|:---:|:---:|:---:|
| 1 | 1 | 0 | 1 | ___ |
| 1 | 0 | 0 | 0 | ___ |
| 0 | 1 | 1 | 1 | ___ |
| 0 | 0 | 1 | 1 | ___ |

<details><summary>Ver respuesta</summary>

| $p$ | $q$ | $\neg p$ | $q\lor\neg p$ | $p\land(q\lor\neg p)$ |
|:---:|:---:|:---:|:---:|:---:|
| 1 | 1 | 0 | 1 | **1** |
| 1 | 0 | 0 | 0 | **0** |
| 0 | 1 | 1 | 1 | **0** |
| 0 | 0 | 1 | 1 | **0** |

</details>

---

# 📋 Expediente Discovery One — Fase 2 (Veredicto)

*Se retoma la condición de anomalía definida en la Fase 1, aplicando el método sistemático de tablas de verdad.*

En la Fase 1 se evaluó la condición de anomalía $A = H \land \neg D \land \neg C$ (con $C = H \land D$) únicamente para el caso observado ($H=V$, $D=F$). Siguiendo el protocolo de 6 pasos, se construye a continuación la tabla completa, considerando las 4 combinaciones posibles de $H$ y $D$:

| $H$ | $D$ | $C = H\land D$ | $\neg D$ | $\neg C$ | $A = H\land\neg D\land\neg C$ |
|:---:|:---:|:---:|:---:|:---:|:---:|
| V | V | V | F | F | **F** |
| V | F | F | V | V | **V** |
| F | V | F | F | V | **F** |
| F | F | F | V | V | **F** |

La condición de anomalía resulta verdadera en exactamente **una** de las cuatro combinaciones posibles: $H=V, D=F$ — precisamente el escenario observado en el caso. No es un resultado garantizado de antemano (no ocurre en los otros tres escenarios), pero tampoco es un resultado imposible: existe exactamente una combinación de valores que lo produce, y es justamente la que se observó.

**Veredicto**: el análisis exhaustivo confirma que la situación reportada por HAL corresponde, de manera lógicamente precisa, al único escenario de los cuatro posibles en que el sistema se encuentra en un estado de anomalía real. Esto no revela *por qué* ocurrió la discrepancia — esa parte de la historia se deja para quien desee ver la película completa —, pero sí demuestra, con las herramientas desarrolladas en este documento, que la discrepancia es real, específica, y no puede descartarse como una coincidencia o un error de apreciación.

Las herramientas empleadas en este documento —axiomas de verdad, jerarquía de operadores y tablas de verdad— son también la base directa de la siguiente sesión del curso, en la que se estudian las **equivalencias lógicas y las Leyes de De Morgan**: un conjunto de reglas que permiten transformar una expresión en otra equivalente sin necesidad de construir la tabla de verdad completa cada vez. Esto no es un simple atajo de conveniencia: como se vio en el Protocolo de 6 pasos, una tabla de verdad tiene $2^n$ filas. Una expresión con 5 variables ya requiere 32 filas; una con 10 variables requeriría 1024. Construir la tabla completa deja de ser una opción práctica mucho antes de eso — de ahí la necesidad de reglas que permitan simplificar y comparar expresiones sin enumerar todos los casos.

---

# Parte IV — Ejercicios propuestos

A continuación se presentan ejercicios de autoevaluación. Se recomienda resolverlos antes de consultar el solucionario al final del documento.

### Traducción a lenguaje formal

**E1.** "El motor se apaga si la temperatura supera los 90 grados."

**E2.** "No es cierto que el escudo esté activo y la energía esté baja."

**E3.** "El piloto automático se activa si y solo si no hay entrada manual."

### Evaluación con axiomas y jerarquía

**E4.** Sean $p=V, q=F, r=V$. Evalúe $(p\land q)\lor\neg r$.

**E5.** Sean $p=F, q=V, r=F$. Evalúe $p\rightarrow(q\leftrightarrow r)$.

**E6.** Sean $A=V, B=V, C=F$. Evalúe $\neg A \lor B \land C \rightarrow A$.

### Construcción de tablas de verdad

**E7.** Construya la tabla de $p \oplus \neg q$.

**E8.** Construya la tabla de $p \leftrightarrow (q \lor \neg p)$.

**E9.** Construya la tabla de $(p\land q) \lor (\neg p \land \neg q)$.

### Casos aplicados

**E10.** "El acceso a la sala de máquinas se concede si el usuario es un oficial autorizado, o si hay una emergencia declarada y el usuario tiene entrenamiento básico." Formalice la condición de acceso ($o$: es oficial autorizado; $e$: hay emergencia declarada; $t$: tiene entrenamiento básico) y evalúe el caso: el usuario no es oficial, sí hay emergencia declarada, no tiene entrenamiento básico. ¿Se concede el acceso?

**E11.** "El sistema entra en modo seguro si y solo si detecta una falla crítica y no está en modo de mantenimiento." Formalice la condición ($f$: detecta falla crítica; $m$: está en modo de mantenimiento) y evalúe el caso: sí detecta falla crítica, sí está en modo de mantenimiento. ¿Se activa el modo seguro?

---

## Resultados de aprendizaje

Al finalizar este documento, usted debería ser capaz de:

- Determinar el valor de verdad de una proposición compuesta aplicando los axiomas de verdad de los seis operadores lógicos.
- Evaluar expresiones lógicas complejas respetando el orden de precedencia y asociatividad de los operadores.
- Traducir enunciados de lenguaje natural a lenguaje formal, y viceversa.
- Construir una tabla de verdad completa siguiendo el protocolo de 6 pasos.
- Reconocer y evitar los errores conceptuales más frecuentes al interpretar el operador condicional (causalidad y confusión con el recíproco).

---

## Ficha de bolsillo

| Operador | Símbolo | Regla de oro |
|---|:---:|---|
| Negación | $\neg p$ | Invierte el valor. |
| Conjunción | $p\land q$ | Basta una falsedad para que todo sea $F$. |
| Disyunción | $p\lor q$ | Basta una verdad para que todo sea $V$. |
| Disyunción exclusiva | $p\oplus q$ | Valores diferentes dan $V$. |
| Condicional | $p\rightarrow q$ | Solo es $F$ cuando $V\rightarrow F$. |
| Bicondicional | $p\leftrightarrow q$ | $V$ cuando ambos coinciden. |

**Jerarquía** (de mayor a menor prioridad): $\neg \;>\; \land \;>\; \lor \;>\; \oplus \;>\; \rightarrow \;>\; \leftrightarrow$
($\land, \lor, \oplus$ asocian a la izquierda; $\rightarrow, \leftrightarrow$ asocian a la derecha)

**Tablas de verdad, 6 pasos**: variables → $2^n$ filas → columnas de variables → columnas auxiliares → evaluar respetando jerarquía → validar.

---

## Referencias y material para profundizar

Las siguientes fuentes son las que respaldan el contenido de este documento y del curso en general. Se incluye una breve nota sobre cada una para que usted pueda elegir según su nivel e idioma preferido.

### Libros de texto del curso

- **Rosen, K. H.** *Discrete Mathematics and Its Applications* (8ª ed.). McGraw-Hill. Capítulo 1: "The Foundations: Logic and Proofs". Es el texto de referencia principal del curso; cubre exactamente los temas de este documento con muchos ejercicios adicionales.
- **Liben-Nowell, D.** *Connecting Discrete Mathematics and Computer Science*. Cambridge University Press. Presenta los mismos conceptos con un enfoque más aplicado a ciencias de la computación, útil para ver la conexión directa con programación.

### Material web de universidades

- **MIT OpenCourseWare — 6.042J, Mathematics for Computer Science**: [ocw.mit.edu/courses/6-042j-mathematics-for-computer-science-fall-2010](https://ocw.mit.edu/courses/6-042j-mathematics-for-computer-science-fall-2010/). Curso completo y gratuito del MIT; la unidad "1.4 Logic & Propositions" incluye diapositivas y apuntes en PDF sobre operadores proposicionales y tablas de verdad. En inglés.
- **Stanford CS103 — Mathematical Foundations of Computing, Lección 3: Propositional Logic**: [web.stanford.edu/class/archive/cs/cs103/cs103.1234/lectures/03](https://web.stanford.edu/class/archive/cs/cs103/cs103.1234/lectures/03/). Explica los mismos operadores y la traducción de lenguaje natural a lógica formal, con ejemplos adicionales de traducción. En inglés.
- **Universidad EAFIT — Lógica proposicional (documento de referencia en español)**: [repository.eafit.edu.co](https://repository.eafit.edu.co/server/api/core/bitstreams/80f3bcca-f425-4529-befa-f3942c57f902/content). Documento en español con un desarrollo formal similar al del curso; útil si se prefiere consultar en español antes de pasar a las fuentes en inglés.

> **Nota**: si el acceso a internet es limitado, no es necesario consultar estas fuentes para completar el curso — el contenido de este documento y de las clases es suficiente. Están aquí únicamente para quien desee profundizar por su cuenta.

---

## Solucionario — Parte IV

<details>
<summary><b>Presione aquí para ver las respuestas</b></summary>

**E1.** $t \rightarrow m$ (t: la temperatura supera los 90 grados; m: el motor se apaga)

**E2.** $\neg(e \land b)$ (e: el escudo está activo; b: la energía está baja)

**E3.** $a \leftrightarrow \neg m$ (a: el piloto automático se activa; m: hay entrada manual)

**E4.** $(p\land q)\lor\neg r = (V\land F)\lor\neg V = F\lor F = \mathbf{F}$

**E5.** $p\rightarrow(q\leftrightarrow r) = F \rightarrow (V\leftrightarrow F) = F\rightarrow F = \mathbf{V}$

**E6.** $\neg A\lor B\land C \rightarrow A$, agrupado como $(\neg A \lor (B\land C))\rightarrow A$: $\neg A=F$; $B\land C = V\land F=F$; $F\lor F=F$; $F\rightarrow A = F\rightarrow V = \mathbf{V}$

**E7.** Columna resultado: $1,0,0,1$ (para $p,q = VV, VF, FV, FF$).

**E8.** Columna resultado: $1,0,0,0$.

**E9.** Columna resultado: $1,0,0,1$.

**E10.** $o \lor (e\land t)$. Evaluado con $o=F, e=V, t=F$: $F\lor(V\land F) = F\lor F = \mathbf{F}$. **No se concede el acceso.**

**E11.** $f \land \neg m$. Evaluado con $f=V, m=V$: $V\land\neg V = V\land F = \mathbf{F}$. **No se activa el modo seguro.**

</details>