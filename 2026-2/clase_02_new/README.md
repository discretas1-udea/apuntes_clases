# 🛰️ El Incidente del Discovery One
### Axiomas de Verdad, Jerarquía de Operadores y Tablas de Verdad

*Notas de clase — Matemáticas Discretas 1 · Módulo 1: Lógica Proposicional*
*Universidad de Antioquia · Ingeniería de Sistemas*

---

## Antes de subir a bordo

Estas notas usan como hilo conductor la película **2001: Una Odisea del Espacio** (Stanley Kubrick, 1968). Si nunca la has visto, no hay ningún problema — aquí tienes lo esencial:

> 📖 **Para saber más**: [2001: A Space Odyssey — Wikipedia](https://es.wikipedia.org/wiki/2001:_A_Space_Odyssey_(pel%C3%ADcula)) · [HAL 9000 — Wikipedia](https://es.wikipedia.org/wiki/HAL_9000)
> 🎬 **Video corto (2-3 min)**: [Tráiler oficial](https://www.youtube.com/watch?v=UgGCScAV7qU)

**El dossier de la misión**, por si prefieres leerlo en vez de ver el tráiler:

| | |
|---|---|
| **Nave** | *Discovery One* |
| **Destino** | Júpiter |
| **Tripulación despierta** | David Bowman y Frank Poole (los otros tres viajan hibernados) |
| **Sistema de a bordo** | **HAL 9000**, una computadora con capacidad de tomar sus propias decisiones sin consultar a los humanos — controla cada sistema vital de la nave |

Algo importante: HAL no es un antagonista de caricatura. Es, ante todo, un **sistema que evalúa condiciones y decide**. Justo como cualquier programa que escribirás en tu carrera: recibe datos, aplica reglas, y produce un veredicto de **verdadero o falso** que dispara una acción. Esa es la conexión que nos interesa — no los efectos especiales, sino la lógica detrás de cada decisión que HAL toma.

### El incidente

Semanas después de partir, HAL reporta algo inquietante: un fallo inminente en la unidad AE-35, el componente que mantiene la antena de la nave alineada con la Tierra. Sin esa antena, el *Discovery One* queda incomunicado.

Bowman sale a inspeccionar la unidad. La revisa por completo. **No encuentra ningún fallo.**

Cuando Tierra analiza los datos con un HAL gemelo, tampoco encuentra ningún error — y eso es extraño, porque la serie 9000 tiene un historial operativo perfecto: nunca antes se había equivocado.

Bowman y Poole quedan con una sola pregunta, la misma que vas a aprender a responder en este documento:

> **¿HAL evaluó mal una condición lógica, o el error está en otra parte?**

No se puede responder por intuición ni por confianza ciega en la máquina. Hay que **auditar el razonamiento paso a paso**, exactamente como HAL —o cualquier procesador— lo hace: aplicando reglas fijas, sin excepciones, sin importar cuán extraño parezca el resultado.

Eso es lo que vas a aprender a hacer en las siguientes tres partes:

1. **Las leyes que ninguna máquina puede romper** — cómo se comporta cada operador lógico frente a lo verdadero y lo falso.
2. **El orden de ejecución** — en qué secuencia exacta se evalúa una condición compuesta.
3. **El diagnóstico completo** — cómo probar *todos* los escenarios posibles antes de emitir un veredicto que nadie pueda refutar.

Al final, con las tres herramientas en mano, vas a poder cerrar el caso del AE-35 por ti mismo.

---

## Parte I — Las leyes que ninguna máquina puede romper
### *(Axiomas de Verdad)*

### 1.1 Repaso relámpago

Recuerda tres cosas de la clase anterior: una **variable proposicional** ($p, q, r, ...$) representa un hecho con valor de verdad; los **operadores** ($\neg, \land, \lor, \oplus, \rightarrow, \leftrightarrow$) combinan esos hechos; y los **signos de agrupación** ($(), []$) evitan ambigüedad. Con eso, ya podemos entrar a la bitácora de HAL.

### 1.2 El caso Jacob y Esaú

Toda proposición es **simple** (un solo hecho) o **compuesta** (varios hechos unidos por conectores). Un ejemplo clásico ayuda a fijarlo:

- **Simple**: *"Jacob y Esaú son hijos de Isaac"* — a pesar del "y" en el nombre, es un único hecho verificable (una relación de parentesco), no dos proposiciones unidas.
- **Compuesta**: *"Como Jacob le dio un plato de lentejas a su padre, obtuvo la primogenitura"* — aquí sí hay una estructura condicional real: $L \rightarrow S$, donde $L$: "Jacob le da el plato de lentejas a su padre" y $S$: "Jacob obtiene la primogenitura". Ambos hechos son ciertos en el relato, así que $L=V$, $S=V$, y $L\rightarrow S = V \rightarrow V = V$.

> 🎮 **Checkpoint 1** — En el registro de vuelo aparecen dos entradas:
> 1. *"El sistema de soporte vital funciona correctamente."*
> 2. *"La antena está desalineada y la señal se perderá."*
>
> ¿Cuál es simple y cuál es compuesta?
>
> <details><summary>Ver respuesta</summary>
> La (1) es <b>simple</b>: un único hecho verificable. La (2) es <b>compuesta</b>: dos hechos unidos por el conector "y" (conjunción).
> </details>

### 1.3 El acertijo del mentiroso

No toda oración declarativa es una proposición válida. Recuerda el **Axioma de Bivalencia**: todo debe poder clasificarse como $V$ o $F$, nunca ambas, nunca ninguna. La frase *"Esta oración es falsa"* rompe esa regla: si la llamamos $Q$ y suponemos $Q=V$, entonces lo que dice es cierto, así que $Q$ es falsa — contradicción. Si suponemos $Q=F$, entonces lo que dice es falso, así que $Q$ es verdadera — otra contradicción. $Q$ no puede tener un valor de verdad fijo: **no es una proposición**, es una paradoja.

> 🎮 **Checkpoint 2** — HAL transmite: *"Este mensaje que estoy transmitiendo es falso."* ¿Por qué HAL jamás podría emitir este reporte y seguir operando de forma lógicamente consistente?
>
> <details><summary>Ver respuesta</summary>
> Porque es una paradoja autorreferencial: no admite un valor de verdad fijo sin contradecirse. Un sistema de decisión —como el motor lógico de HAL— solo puede operar sobre proposiciones genuinas (con $V$ o $F$ bien definido); una paradoja rompería el axioma de bivalencia sobre el que se apoya cualquier evaluación posterior.
> </details>

### 1.4 Los seis operadores

Cada operador tiene un comportamiento fijo, sin excepciones, resumido en su tabla de verdad:

**Negación ($\neg p$)** — invierte el valor.

| $p$ | $\neg p$ |
|:---:|:---:|
| V | F |
| F | V |

**Conjunción ($p \land q$)** — verdadera solo si ambas lo son.

| $p$ | $q$ | $p \land q$ |
|:---:|:---:|:---:|
| V | V | V |
| V | F | F |
| F | V | F |
| F | F | F |

> **Regla corta**: basta una falsedad para que toda la conjunción sea $F$.

**Disyunción ($p \lor q$)** — verdadera si al menos una lo es.

| $p$ | $q$ | $p \lor q$ |
|:---:|:---:|:---:|
| V | V | V |
| V | F | V |
| F | V | V |
| F | F | F |

> **Regla corta**: basta una verdad para que toda la disyunción sea $V$.

**Disyunción exclusiva ($p \oplus q$)** — verdadera cuando difieren.

| $p$ | $q$ | $p \oplus q$ |
|:---:|:---:|:---:|
| V | V | F |
| V | F | V |
| F | V | V |
| F | F | F |

> **Regla corta**: valores *diferentes* dan $V$.

> 🎮 **Checkpoint 3** — En el registro de sensores: $o$ = "el nivel de oxígeno es normal" ($V$), $t$ = "la temperatura es estable" ($F$). Evalúa $\neg o \lor t$.
>
> <details><summary>Ver respuesta</summary>
> $\neg o = F$, $t = F$, entonces $\neg o \lor t = F \lor F = F$.
> </details>

### 1.5 El condicional a fondo

El condicional ($p \rightarrow q$) es el operador que más confunde, porque no coincide con la intuición cotidiana de "causa y efecto". Se lee **"Antecedente → Consecuente"**, y también se conoce por otros nombres según el contexto: **Hipótesis → Tesis** (en demostraciones), **Premisa → Conclusión** (en argumentos).

| $p$ | $q$ | $p \rightarrow q$ |
|:---:|:---:|:---:|
| V | V | V |
| V | F | **F** |
| F | V | V |
| F | F | V |

> **Regla de oro**: un condicional solo es **falso** cuando el antecedente es verdadero y el consecuente es falso ($V \rightarrow F = F$). En cualquier otro caso, es verdadero — incluso cuando el antecedente es falso, sin importar qué tan absurdo parezca el consecuente.

**Caso de archivo**: consideremos la afirmación *"Si Uribe gana las elecciones, entonces habrá paz"* ($W \rightarrow P$). En un escenario donde efectivamente gana ($W=V$) pero no hay paz ($P=F$): $W \rightarrow P = V \rightarrow F = F$ — la implicación resulta falsa, porque se prometió algo que no se cumplió. En cambio, si no gana ($W=F$) y no hay paz ($P=F$): $W \rightarrow P = F \rightarrow F = V$ — la implicación es verdadera, porque nunca se activó la promesa (no se puede acusar de incumplimiento a algo que nunca prometió bajo esas condiciones).

**El bicondicional ($p \leftrightarrow q$)** — verdadero cuando ambas comparten el mismo valor.

| $p$ | $q$ | $p \leftrightarrow q$ |
|:---:|:---:|:---:|
| V | V | V |
| V | F | F |
| F | V | F |
| F | F | V |

> 🎮 **Checkpoint 4** — Regla de la nave: *"Si el sensor de oxígeno falla, entonces se activa la alarma"* ($f \rightarrow a$). Un informe indica que el sensor falló ($f=V$) pero la alarma **no** se activó ($a=F$). ¿La regla se cumplió?
>
> <details><summary>Ver respuesta</summary>
> $f \rightarrow a = V \rightarrow F = F$. No se cumplió: es justo el único caso en que un condicional es falso. El sistema violó su propia regla — algo anómalo ocurrió.
> </details>

> 🎮 **Checkpoint 5** — Dos lecturas de sensores: $c_1$ = "la puerta está sellada", $c_2$ = "la presión de cabina es estable". En la lectura A, $c_1=V, c_2=V$. En la lectura B, $c_1=F, c_2=V$. ¿En cuál lectura son *equivalentes* ($c_1 \leftrightarrow c_2$)?
>
> <details><summary>Ver respuesta</summary>
> Lectura A: $V \leftrightarrow V = V$ (equivalentes). Lectura B: $F \leftrightarrow V = F$ (no equivalentes).
> </details>

---

## Parte II — El orden de ejecución
### *(Jerarquía de Operadores)*

### 2.1 Por qué el orden importa

Una expresión como $p \lor q \land \neg r \rightarrow s$, sin paréntesis, podría leerse de varias formas distintas — y cada lectura da un resultado diferente. Si el motor de decisión de HAL evaluara sus condiciones en un orden ambiguo, dos ingenieros podrían interpretar el mismo reporte de forma opuesta. Por eso existe un **orden de precedencia fijo**, sin excepciones.

### 2.2 Tabla de prioridad y asociatividad

| Prioridad | Símbolo | Asociatividad | Ejemplo con paréntesis |
|:---:|:---:|:---:|---|
| 1 (más alta) | $\neg$ | No aplica (unitario) | $\neg p \land q \mapsto (\neg p) \land q$ |
| 2 | $\land$ | Izquierda | $p \land q \land r \mapsto (p \land q) \land r$ |
| 3 | $\lor$ | Izquierda | $p \lor q \lor r \mapsto (p \lor q) \lor r$ |
| 4 | $\oplus$ | Izquierda | $p \oplus q \oplus r \mapsto (p \oplus q) \oplus r$ |
| 5 | $\rightarrow$ | Derecha | $p \rightarrow q \rightarrow r \mapsto p \rightarrow (q \rightarrow r)$ |
| 6 (más baja) | $\leftrightarrow$ | Derecha | $p \leftrightarrow q \leftrightarrow r \mapsto p \leftrightarrow (q \leftrightarrow r)$ |

> 🎮 **Checkpoint 6** — HAL transmitió esta condición sin paréntesis: $p \lor q \land \neg r \rightarrow s$. Agrega los paréntesis correctos según la jerarquía.
>
> <details><summary>Ver respuesta</summary>
> Primero $\neg r$; luego $\land$: $q \land (\neg r)$; luego $\lor$: $p \lor (q \land \neg r)$; luego $\rightarrow$: $\big(p \lor (q \land \neg r)\big) \rightarrow s$.
> </details>

### 2.3 Método de evaluación paso a paso

Para evaluar una expresión con valores dados: (1) sustituye cada variable por su valor, (2) resuelve primero las negaciones, (3) sigue el orden de precedencia de la tabla, resolviendo de adentro hacia afuera cuando hay paréntesis anidados.

> 🎮 **Checkpoint 7** — Dados $p=V$, $q=F$, $r=V$, evalúa $\neg p \lor q \rightarrow r$.
>
> <details><summary>Ver respuesta</summary>
> $\neg p = F$. $\neg p \lor q = F \lor F = F$. $F \rightarrow r = F \rightarrow V = V$. <b>Resultado: V.</b>
> </details>

---

## 📂 Bitácora resuelta I — Auditando los primeros reportes

Bowman empieza a revisar, uno por uno, los reportes que generó HAL antes del incidente.

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

Como $P=F$: $R \lor P = R \lor F = R$, y esto debe ser falso, así que $\mathbf{R=F}$.
$Q \land P = Q \land F$, que es **siempre falsa** sin importar el valor de $Q$ — esta condición no aporta información. **$Q$ queda indeterminada**: puede ser $V$ o $F$, el dato no permite decidirlo.

**(b)** Si $Q \rightarrow R \rightarrow P \land Q \lor R$ es falsa, ¿qué puede afirmarse de $P, Q, R$?

Por jerarquía ($\land$ antes que $\lor$, $\rightarrow$ asociando a la derecha), la expresión se agrupa como:
$$Q \rightarrow \Big(R \rightarrow \big((P\land Q)\lor R\big)\Big)$$

Para que sea falsa necesitaríamos $R=V$ (único caso en que un condicional con consecuente evaluado en $R\to\ldots$ falla) y, simultáneamente, $(P\land Q)\lor R = F$. Pero si $R=V$, entonces $(P\land Q)\lor R = (P\land Q)\lor V$, que es **siempre verdadera** por la regla de la disyunción (basta una verdad). Esto es una contradicción irresoluble.

**Conclusión: no existe ninguna combinación de $P, Q, R$ que haga falsa esta expresión** — la fórmula es una **tautología** (siempre verdadera). El reporte, tal como está planteado, nunca podría fallar; si en el registro de HAL apareciera marcado como falso, eso en sí mismo sería la señal de una inconsistencia grave.

---

## Parte III — El diagnóstico completo
### *(Tablas de Verdad)*

### 3.1 Por qué un solo chequeo no basta

Tierra no le cree a HAL con una sola comprobación: exige revisar *todos* los escenarios posibles antes de aceptar (o descartar) que hay un fallo real. Evaluar una expresión con un único conjunto de valores es como probar el sistema de soporte vital en un solo escenario — no basta para certificarlo. Se necesita una herramienta que muestre **todas las combinaciones posibles a la vez**.

### 3.2 Definición y tabla unificada

Una **tabla de verdad** es una herramienta tabular que analiza todos los valores de verdad posibles de una expresión, mostrando su resultado en cada combinación. Es la alternativa sistemática a evaluar caso por caso.

| $p$ | $q$ | $\neg p$ | $p\land q$ | $p\lor q$ | $p\oplus q$ | $p\rightarrow q$ | $p\leftrightarrow q$ |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| V | V | F | V | V | F | V | V |
| V | F | F | F | V | V | F | F |
| F | V | V | F | V | V | V | F |
| F | F | V | F | F | F | V | V |

> 🎮 **Checkpoint 8** — Si tuvieras que auditar 4 sensores distintos de la nave a la vez, ¿cuántas filas necesitaría la tabla de verdad?
>
> <details><summary>Ver respuesta</summary>
> $2^4 = 16$ filas.
> </details>

### 3.3 Protocolo de 6 pasos

1. **Identificar las variables proposicionales** — cuántas letras distintas componen la expresión.
2. **Determinar el número de filas**: $N = 2^n$, con $n$ = número de variables.
3. **Construir las columnas de las variables**, distribuyendo los valores sistemáticamente.
4. **Agregar columnas auxiliares** — descomponer la fórmula en sub-expresiones, sin resolver todo mentalmente.
5. **Evaluar la expresión paso a paso**, de izquierda a derecha, respetando la jerarquía de operadores.
6. **Revisar y validar** la tabla completa.

> 🎮 **Checkpoint 9** — Construye (guiado) la tabla de $p \leftrightarrow \neg q$.
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

### 3.4 Convención de la nave

Para este curso, en las tablas de verdad usamos la notación binaria de ingeniería: **1 = Verdadero, 0 = Falso**. Es la misma convención que usarás al programar con `true`/`false` — un booleano no es más que el resultado final de una tabla de verdad reducida a un solo caso.

> 🎮 **Checkpoint 10** — Traduce esta fila a notación binaria: $p=V, q=F$, resultado $= V$.
>
> <details><summary>Ver respuesta</summary>
> $1, 0, 1$.
> </details>

### 3.5 Errores que delatan a un aprendiz

- **Número de filas incorrecto**: siempre debe ser $2^n$.
- **Patrón mal distribuido**: la primera variable alterna cada $2^{n-1}$ filas, la segunda cada $2^{n-2}$, y así sucesivamente.
- **Alcance incorrecto de la negación**: $\neg(p\land q) \neq \neg p \land q$ — usa paréntesis para evitar confusión.
- **Confundir $\lor$ con $\oplus$**: $\lor$ permite que ambas sean verdaderas; $\oplus$ no.
- **Ignorar la jerarquía** al llenar columnas auxiliares.

---

## 📂 Bitácora resuelta II — El diagnóstico final

Con el protocolo completo, Bowman construye las tablas de los reportes más complejos.

**1. $P \land \neg P$**

| $P$ | $\neg P$ | $P\land\neg P$ |
|:---:|:---:|:---:|
| 1 | 0 | **0** |
| 0 | 1 | **0** |

Siempre falso: es una **contradicción**.

**2. $P \rightarrow Q \rightarrow \neg P \lor Q$**

Agrupación por jerarquía: $P \rightarrow \big(Q \rightarrow (\neg P \lor Q)\big)$.

| $P$ | $Q$ | $\neg P$ | $\neg P\lor Q$ | $Q\rightarrow(\neg P\lor Q)$ | Resultado final |
|:---:|:---:|:---:|:---:|:---:|:---:|
| 1 | 1 | 0 | 1 | 1 | **1** |
| 1 | 0 | 0 | 0 | 1 | **1** |
| 0 | 1 | 1 | 1 | 1 | **1** |
| 0 | 0 | 1 | 1 | 1 | **1** |

Siempre verdadero: es una **tautología**.

**3. $P \rightarrow Q \land \neg Q \rightarrow \neg P$**

Agrupación por jerarquía: $P \rightarrow \big((Q\land\neg Q) \rightarrow \neg P\big)$.

| $P$ | $Q$ | $\neg Q$ | $Q\land\neg Q$ | $\neg P$ | $(Q\land\neg Q)\rightarrow\neg P$ | Resultado final |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| 1 | 1 | 0 | 0 | 0 | 1 | **1** |
| 1 | 0 | 1 | 0 | 0 | 1 | **1** |
| 0 | 1 | 0 | 0 | 1 | 1 | **1** |
| 0 | 0 | 1 | 0 | 1 | 1 | **1** |

Siempre verdadero: otra **tautología** (nota cómo $Q\land\neg Q$ es siempre falso, y un antecedente falso vuelve el condicional automáticamente verdadero).

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

Falso solo en un caso ($R=S=T=1$): es una **contingencia**.

---

## Parte IV — Tu turno en la consola

Ya tienes el protocolo completo. Resuelve estos casos por tu cuenta; las respuestas están al final para que te autoevalúes — intenta resolver primero sin mirarlas.

### Traducción a lenguaje formal

**E1.** "El motor se apaga si la temperatura supera los 90 grados."

**E2.** "No es cierto que el escudo esté activo y la energía esté baja."

**E3.** "El piloto automático se activa si y solo si no hay entrada manual."

### Evaluación con axiomas y jerarquía

**E4.** Sean $p=V, q=F, r=V$. Evalúe $(p\land q)\lor\neg r$.

**E5.** Sean $p=F, q=V, r=F$. Evalúe $p\rightarrow(q\leftrightarrow r)$.

**E6.** Sean $A=V, B=V, C=F$. Evalúe $\neg A \lor B \land C \rightarrow A$.

### Construcción de tablas de verdad

**E7.** Construya la tabla de $p \oplus \neg q$ y clasifique el resultado.

**E8.** Construya la tabla de $p \leftrightarrow (q \lor \neg p)$ y clasifique el resultado.

**E9.** Construya la tabla de $(p\land q) \lor (\neg p \land \neg q)$ y clasifique el resultado.

### Casos de sistemas

**E10.** "El acceso a la sala de máquinas se concede si el usuario es un oficial autorizado, o si hay una emergencia declarada y el usuario tiene entrenamiento básico." Formalice la condición de acceso ($o$: es oficial autorizado; $e$: hay emergencia declarada; $t$: tiene entrenamiento básico) y evalúe: el usuario **no** es oficial, **sí** hay emergencia declarada, **no** tiene entrenamiento básico. ¿Se concede el acceso?

**E11.** "El sistema entra en modo seguro si y solo si detecta una falla crítica y no está en modo de mantenimiento." Formalice la condición ($f$: detecta falla crítica; $m$: está en modo de mantenimiento) y evalúe: **sí** detecta falla crítica, **sí** está en modo de mantenimiento. ¿Se activa el modo seguro?

---

## Cierre — El veredicto sobre HAL

Con las tres herramientas —axiomas de verdad, jerarquía de operadores y tablas de verdad— Bowman y Poole llegan a una primera certeza: si HAL predijo un fallo con total seguridad, y una revisión exhaustiva (la inspección física, más el análisis del HAL gemelo en Tierra) no encuentra ningún fallo, **ambos resultados no pueden ser correctos a la vez** bajo el funcionamiento normal del sistema. Como viste en el Checkpoint 10(b) de la Bitácora I, cuando una condición que "nunca debería fallar" aparece marcada como falsa, eso no es ruido: es la señal de que algo, en algún punto de la cadena de decisión, se rompió.

El resto de la historia —qué decide HAL a partir de ahí, y cómo termina el viaje del *Discovery One*— te lo dejamos para que lo descubras viendo la película completa. Lo que sí te llevas de aquí es la habilidad que Bowman tuvo que usar: **auditar cualquier sistema de decisión, sin excepciones, sin atajos, sin confiar ciegamente en el veredicto que entrega.**

### 🗒️ Ficha de bolsillo

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

## Solucionario — Parte IV

<details>
<summary><b>Presiona aquí para ver las respuestas</b></summary>

**E1.** $t \rightarrow m$ (t: la temperatura supera los 90 grados; m: el motor se apaga)

**E2.** $\neg(e \land b)$ (e: el escudo está activo; b: la energía está baja)

**E3.** $a \leftrightarrow \neg m$ (a: el piloto automático se activa; m: hay entrada manual)

**E4.** $(p\land q)\lor\neg r = (V\land F)\lor\neg V = F\lor F = \mathbf{F}$

**E5.** $p\rightarrow(q\leftrightarrow r) = F \rightarrow (V\leftrightarrow F) = F\rightarrow F = \mathbf{V}$

**E6.** $\neg A\lor B\land C \rightarrow A$, agrupado como $(\neg A \lor (B\land C))\rightarrow A$: $\neg A=F$; $B\land C = V\land F=F$; $F\lor F=F$; $F\rightarrow A = F\rightarrow V = \mathbf{V}$

**E7.** Columna resultado: $1,0,0,1$ (para $p,q = VV, VF, FV, FF$). **Contingencia**.

**E8.** Columna resultado: $1,0,0,0$. **Contingencia**.

**E9.** Columna resultado: $1,0,0,1$. **Contingencia**.

**E10.** $o \lor (e\land t)$. Evaluado con $o=F, e=V, t=F$: $F\lor(V\land F) = F\lor F = \mathbf{F}$. **No se concede el acceso.**

**E11.** $f \land \neg m$. Evaluado con $f=V, m=V$: $V\land\neg V = V\land F = \mathbf{F}$. **No se activa el modo seguro.**

</details>