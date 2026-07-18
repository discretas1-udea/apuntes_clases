# 🕵️ El Caso del Broche de Zafiro
### Equivalencia Lógica, Leyes de De Morgan, Variantes del Condicional y Condiciones de Necesidad y Suficiencia

*Notas de clase — Matemáticas Discretas 1 · Módulo 1: Lógica Proposicional*
*Universidad de Antioquia · Ingeniería de Sistemas*

---

## Contexto de apoyo

Sherlock Holmes, el detective consultor creado por Arthur Conan Doyle, es célebre por resolver casos mediante deducción rigurosa: elimina explicaciones imposibles, contrasta coartadas y detecta cuándo dos testimonios no pueden ser ciertos al mismo tiempo. No es una coincidencia estilística: el método de Holmes es, en esencia, razonamiento lógico formal aplicado a hechos cotidianos — precisamente las herramientas que se desarrollan en esta sesión.

El caso que sigue es original (no corresponde a ninguna obra publicada de Conan Doyle); solo toma prestado el estilo del detective y su compañero, el Dr. Watson.

## El caso — El enigma de las dos versiones

En una cena en Ashworth Manor, un broche de zafiro desaparece de una vitrina en el estudio del anfitrión, Lord Ashworth. El estudio permaneció cerrado con llave durante los treinta minutos que duró el robo, y la cerradura no fue forzada. Durante ese intervalo, cinco personas —Lord Ashworth, Lady Constance (su esposa), el Coronel Whitmore, la Srta. Eleanor Hart (sobrina del anfitrión) y el Sr. Alistair Finch (secretario personal de Lord Ashworth)— se encontraban, en teoría, reunidas en el salón contiguo tomando café.

Al interrogarlos, Holmes obtiene dos testimonios que no pueden ser ciertos simultáneamente:

- El **Coronel Whitmore** declara: *"Finch salió del salón, y tuvo tiempo de conseguir una llave."*
- La **Srta. Hart**, en defensa de Finch, declara: *"Finch no salió del salón, o no tuvo acceso a ninguna llave."*

¿Son estas dos declaraciones realmente incompatibles, o podría existir una lectura que las concilie? Responder esto con precisión —no por intuición— es el primer problema que resuelve esta sesión.

## Antes de comenzar: lo que ya debería saber

Este documento retoma las herramientas construidas en la sesión anterior. Antes de continuar, verifique que puede hacer lo siguiente:

- Construir la tabla de verdad de una expresión con cualquier número de variables (Protocolo de 6 pasos: identificar variables → calcular filas $2^n$ → construir columnas → agregar columnas auxiliares → evaluar respetando jerarquía → validar).
- Clasificar una proposición como **tautología** (columna final siempre $V$), **contradicción** (siempre $F$) o **contingencia** (mezcla de $V$ y $F$).
- Aplicar la jerarquía y asociatividad de los operadores ($\neg$ primero; luego $\land$; luego $\lor$; luego $\oplus$; luego $\rightarrow$, que asocia a la derecha; y por último $\leftrightarrow$).

Si alguno de estos puntos no le resulta claro, repáselo en la sesión anterior (Tablas de Verdad) antes de continuar.

---

# Parte I — Equivalencia Lógica

## I.1 Definición

Dos proposiciones compuestas $p$ y $q$ son **lógicamente equivalentes** (o simplemente *equivalentes*) si la proposición $p \leftrightarrow q$ es una **tautología**: es decir, si $p$ y $q$ tienen exactamente el mismo valor de verdad en todas las combinaciones posibles de sus variables.

- **Notación**: $p \leftrightarrow q$ o $p \equiv q$ (ambas se usan indistintamente para afirmar la equivalencia).
- Esto no requiere ninguna herramienta nueva: basta con construir la tabla de verdad de $p\leftrightarrow q$ (o, de forma equivalente, construir las tablas de $p$ y de $q$ por separado y comparar columna por columna) y verificar que coinciden en todas las filas.

> [!IMPORTANT]
> **La herramienta más usada de esta sesión**: la definición del condicional en términos de disyunción.
> $$p \rightarrow q \equiv \neg p \lor q$$
> Esta equivalencia es la base de casi todas las demostraciones que siguen — apréndala de memoria.

## I.2 Demostración: $\neg p \lor q \equiv p \rightarrow q$

| $p$ | $q$ | $\neg p$ | $\neg p \lor q$ | $p\rightarrow q$ |
|:---:|:---:|:---:|:---:|:---:|
| 1 | 1 | 0 | 1 | 1 |
| 1 | 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 1 | 1 |
| 0 | 0 | 1 | 1 | 1 |

Las columnas $\neg p \lor q$ y $p\rightarrow q$ son idénticas en las cuatro filas, así que $\neg p\lor q \equiv p\rightarrow q$.

## I.3 Leyes de De Morgan

August De Morgan estableció que la negación de una conjunción o una disyunción sigue un patrón fijo:

$$\neg(p\land q) \equiv \neg p\lor\neg q \qquad\qquad \neg(p\lor q) \equiv \neg p\land\neg q$$

En palabras: **negar** una expresión unida por "y"/"o" **invierte el conector** y **niega cada componente por separado**. Ambas leyes se demuestran en la sección de Ejercicios resueltos.

> [!WARNING]
> **La "falsa distributiva"**: un error frecuente es asumir que la negación simplemente "se reparte" sin cambiar el conector, es decir, creer que $\neg(p\land q) \equiv \neg p \land \neg q$. Esto es **falso** — compruébelo con $p=1, q=0$: $\neg(p\land q) = \neg(0) = 1$, pero $\neg p\land\neg q = 0\land 1 = 0$. Las Leyes de Morgan exigen cambiar también el conector, no solo negar cada término.

> [!TIP]
> **Compruebe su comprensión**
>
> Usando la primera Ley de Morgan, escriba una expresión equivalente a $\neg(r\land\neg s)$.
>
> <details><summary>Ver respuesta</summary>
> $\neg(r\land\neg s) \equiv \neg r\lor\neg(\neg s) \equiv \neg r \lor s$ (aplicando Morgan y luego doble negación).
> </details>

> [!NOTE]
> **Conexión con Lógica y Representación I**: Morgan también mejora la legibilidad del código, no solo la notación matemática. En vez de escribir `if not (sensor_activo and lectura_valida):`, conviene escribir `if not sensor_activo or not lectura_valida:` — es la misma ley aplicada directamente. Además de ser más legible, esta segunda forma evalúa en **cortocircuito**: si `sensor_activo` es falso, Python ni siquiera evalúa `lectura_valida`.

---

# Parte II — Variantes del Condicional

## II.1 Recíproco, contrarrecíproco y contrario

A partir de una proposición condicional original $p\rightarrow q$, se derivan tres variantes cambiando el orden y aplicando negaciones:

| Nombre | Fórmula | Se obtiene... |
|---|:---:|---|
| **Original** | $p\rightarrow q$ | — |
| **Recíproco** (converse) | $q\rightarrow p$ | intercambiando hipótesis y conclusión |
| **Contrarrecíproco** (contrapositive) | $\neg q\rightarrow \neg p$ | intercambiando y negando ambas |
| **Contrario / Inverso** (inverse) | $\neg p\rightarrow \neg q$ | negando ambas, sin intercambiar |

> [!WARNING]
> **Falacia de afirmación del consecuente**: asumir que $p\rightarrow q$ y su recíproco $q\rightarrow p$ son equivalentes es uno de los errores lógicos más comunes. En general **no lo son** — se demuestra en los Ejercicios resueltos.

## II.2 ¿Cuáles variantes son equivalentes al original?

Solo dos de las cuatro formas comparten siempre el mismo valor de verdad:

$$p\rightarrow q \;\equiv\; \neg q\rightarrow\neg p \qquad\qquad q\rightarrow p \;\equiv\; \neg p\rightarrow\neg q$$

Es decir: **el original es equivalente a su contrarrecíproco**, y **el recíproco es equivalente al contrario**. Esto se demuestra con tabla de verdad en los Ejercicios resueltos, pero también puede obtenerse por **cadena algebraica**, encadenando herramientas que ya conoce (la definición del condicional de la Parte I, y dos de las leyes de la tabla de referencia de la Parte V):

$$
\begin{aligned}
p\rightarrow q &\equiv \neg p\lor q &&\text{(definición del condicional)}\\
&\equiv q\lor\neg p &&\text{(conmutativa)}\\
&\equiv \neg(\neg q)\lor\neg p &&\text{(doble negación)}\\
&\equiv \neg q\rightarrow\neg p &&\text{(definición del condicional, en sentido inverso)}
\end{aligned}
$$

Esta cadena no es una herramienta nueva — es un adelanto de lo que la próxima sesión formalizará como método general: encadenar leyes para transformar una expresión sin construir la tabla completa.

> [!NOTE]
> **Conexión con Lógica y Representación I**: en programación, reformular una condición usando su contrarrecíproco suele simplificar el código mediante *cláusulas de guarda* (verificar primero el caso de fallo para salir temprano):
> ```python
> # Original: "si el sensor es válido, procesamos la lectura"
> if sensor_valido:
>     procesar_lectura()
>
> # Contrarrecíproco: "si no vamos a procesar, es porque el sensor no es válido"
> if not sensor_valido:
>     return
> procesar_lectura()
> ```
> Esta reescritura reduce el anidamiento sin cambiar el significado lógico — es un argumento de la Unidad 4 (condiciones de parada) del curso de programación: verificar la condición de fallo primero es, en el fondo, razonar con el contrarrecíproco.

---

# Parte III — Condiciones de Necesidad y Suficiencia

## III.1 Definiciones

Dado un condicional $p\rightarrow q$:

- **$p$ es condición suficiente para $q$**: basta con que $p$ ocurra para garantizar que $q$ ocurra. (Es decir, $p\rightarrow q$ es verdadero.)
- **$p$ es condición necesaria para $q$**: sin $p$, $q$ no puede ocurrir. Esto equivale a decir que $q\rightarrow p$ es verdadero (o, lo que es lo mismo por el contrarrecíproco, $\neg p\rightarrow\neg q$).
- **$p$ es necesaria y suficiente para $q$**: ambas relaciones se cumplen a la vez, es decir, $p\leftrightarrow q$.

> [!TIP]
> **Regla práctica**: para decidir, hágase estas dos preguntas por separado (la respuesta debe ser SÍ para afirmar cada una):
> 1. **Suficiencia**: *"Si tengo $p$, ¿$q$ está 100% garantizado?"*
> 2. **Necesidad**: *"Si NO tengo $p$, ¿$q$ se vuelve imposible?"*
>
> Note que estas dos preguntas son independientes — una puede ser cierta sin que lo sea la otra, como se verá en los Ejercicios resueltos.
>
> **Cuando la intuición no basta — prueba del contraejemplo**: las mismas dos preguntas, convertidas en un procedimiento de búsqueda activa (no es una herramienta nueva, es la definición del condicional aplicada como algoritmo):
> - **Suficiencia**: busque un caso con $p$ verdadero y $q$ falso. Si lo encuentra, **no** es suficiente; si no existe ninguno, **sí** lo es.
> - **Necesidad**: busque un caso con $q$ verdadero y $p$ falso. Si lo encuentra, **no** es necesaria; si no existe ninguno, **sí** lo es.
>
> *Ejemplo breve*: sea $p$: "el número es múltiplo de 10" y $q$: "el número es múltiplo de 5". ¿Existe un caso con $p$ verdadero y $q$ falso? No — todo múltiplo de 10 es múltiplo de 5. → **suficiente**. ¿Existe un caso con $q$ verdadero y $p$ falso? Sí, el 15. → **no necesaria**. Un solo contraejemplo bastó para cerrar la segunda pregunta sin razonar en abstracto.

## III.2 Indicadores lingüísticos

| Indicadores de suficiencia ($p\rightarrow$) | Indicadores de necesidad ($\rightarrow q$) |
|---|---|
| Si..., entonces... | ...solo si... |
| Cuando... | ...solamente si... |
| Cada vez que... | ...únicamente si... |
| Siempre que... | ...es una condición necesaria para... |
| Basta que... | ...es un requisito para... |
| Es suficiente que... | ...implica... |

> [!TIP]
> **Compruebe su comprensión**
>
> En el enunciado "Cuando el motor se sobrecalienta, se activa la alarma", ¿"el motor se sobrecalienta" es la condición necesaria o suficiente para "se activa la alarma"?
>
> <details><summary>Ver respuesta</summary>
> Suficiente. "Cuando..." introduce el antecedente (Parte III.2): sobrecalentarse basta para que la alarma se active. Esto no descarta que existan otras causas que también activen la alarma — solo afirma que esta es una de ellas y que, si ocurre, la alarma es inevitable.
> </details>


> [!WARNING]
> **La trampa del "solo si"**: la expresión "$p$ **solo si** $q$" se traduce como $p\rightarrow q$ (no como $q\rightarrow p$), aunque en el lenguaje cotidiano $q$ suela mencionarse como si fuera un requisito previo en el tiempo. El "solo si" siempre introduce el **consecuente**, sin importar el orden en que aparezcan las palabras en la oración.

---

# Parte IV — Traducción de Lenguaje Natural a Lógica Formal

## IV.1 Tabla de conectores

| Conector lógico | Forma simbólica | Expresiones equivalentes en español |
|---|:---:|---|
| Conjunción | $p\land q$ | • $p$ y $q$<br>• $p$, pero $q$<br>• $p$ aun $q$<br>• $p$, aunque $q$<br>• $p$ sin embargo $q$ |
| Disyunción (inclusiva) | $p\lor q$ | • $p$ o $q$<br>• $p$, a menos que $q$<br>• al menos una entre $p$ y $q$ |
| Disyunción exclusiva | $p\oplus q$ | • $p$ o $q$, pero no ambos<br>• exactamente uno de $p$ y $q$ |
| Condicional | $p\rightarrow q$ | • si $p$, entonces $q$<br>• $q$ si $p$<br>• $p$ solo si $q$<br>• $q$ siempre que $p$<br>• $p$ implica $q$ |
| Bicondicional | $p\leftrightarrow q$ | • $p$ si y solo si $q$<br>• $p$ es necesario y suficiente para $q$<br>• $p$ y $q$ son equivalentes |

> [!NOTE]
> **No existe una única regla para nombrar variables.** El estilo clásico ($p,q,r$) es el estándar en matemáticas; el estilo semántico (nombres descriptivos como `sensorActivo`) es el estándar en programación. El nombre de la variable nunca cambia la lógica — en esta sesión se usan ambos estilos.

## IV.2 Receta mecánica para "a menos que"

"$p$ a menos que $q$" equivale a la disyunción $p\lor q$, pero traducirla de memoria puede llevar a error. Existe un procedimiento mecánico —documentado en la literatura de razonamiento condicional aplicado, que dedica material extenso a esta traducción por ser una fuente frecuente de errores— que evita derivar la equivalencia desde cero cada vez:

1. Lo que sigue inmediatamente a "a menos que" se coloca como el **consecuente**.
2. El resto de la oración se **niega** y se coloca como el **antecedente**.

> [!TIP]
> **Aplicación**: "Saldremos a caminar, a menos que esté lloviendo."
>
> - Sea $p$: saldremos a caminar. $s$: está lloviendo.
> - Paso 1 — lo que sigue a "a menos que": "esté lloviendo" → consecuente $s$.
> - Paso 2 — el resto de la oración, negado: "no saldremos a caminar" → antecedente $\neg p$.
> - Resultado: $\neg p\rightarrow s$ ("Si no salimos a caminar, entonces está lloviendo").
>
> Esta receta no reemplaza el razonamiento por equivalencia — produce el **contrarrecíproco** de la forma que se obtiene leyendo "a menos que" directamente como $\neg s\rightarrow p$ (si no llueve, entonces salimos). Ambas son correctas y equivalentes entre sí (Parte II); la receta es solo un atajo mecánico para enunciados largos o ambiguos.

## IV.3 Traducción en dirección inversa: de lógica a lenguaje natural

El proceso también funciona al revés: dada una fórmula, se identifica el conector principal (respetando la jerarquía) y se reconstruye la oración. Por ejemplo, dado $\neg s\rightarrow r$ con $s$: "el sistema detecta señal" y $r$: "se activa el modo manual", la traducción es: *"Si el sistema no detecta señal, entonces se activa el modo manual"*.

> [!NOTE]
> **Conexión con Lógica y Representación I**: leer especificaciones de software con precisión —distinguir si un requisito describe una condición necesaria, suficiente o ambas— es exactamente la misma habilidad de traducción que se practica aquí. Un requisito mal traducido de lenguaje natural a código es una de las causas más comunes de errores de lógica en un programa.

> [!TIP]
> **Compruebe su comprensión**
>
> Traduzca a lenguaje natural la expresión $b\rightarrow\neg c$, donde $b$: "el usuario está bloqueado" y $c$: "puede iniciar sesión".
>
> <details><summary>Ver respuesta</summary>
> "Si el usuario está bloqueado, entonces no puede iniciar sesión."
> </details>

---

# Parte V — Álgebra de Proposiciones (adelanto)

Las herramientas anteriores —tablas de verdad, equivalencia, Morgan— permiten comparar y transformar expresiones, pero construir una tabla completa deja de ser práctico cuando el número de variables crece ($2^n$ filas). Existe un conjunto de **leyes del álgebra de proposiciones** que permite transformar expresiones sin construir la tabla completa cada vez. Por ahora, basta con conocer la tabla de referencia; **su aplicación para simplificar expresiones se desarrollará en la próxima sesión**.

| Nombre de la ley | Forma con $\land$ | Forma con $\lor$ |
|---|:---:|:---:|
| Identidad | $p\land V \equiv p$ | $p\lor F \equiv p$ |
| Dominación | $p\land F \equiv F$ | $p\lor V \equiv V$ |
| Idempotencia | $p\land p \equiv p$ | $p\lor p \equiv p$ |
| Doble negación | $\neg(\neg p) \equiv p$ | (aplica igual, no depende de $\land$/$\lor$) |
| Conmutativa | $p\land q \equiv q\land p$ | $p\lor q \equiv q\lor p$ |
| Asociativa | $(p\land q)\land r \equiv p\land(q\land r)$ | $(p\lor q)\lor r \equiv p\lor(q\lor r)$ |
| Distributiva | $p\land(q\lor r)\equiv(p\land q)\lor(p\land r)$ | $p\lor(q\land r)\equiv(p\lor q)\land(p\lor r)$ |
| De Morgan | $\neg(p\land q)\equiv\neg p\lor\neg q$ | $\neg(p\lor q)\equiv\neg p\land\neg q$ |
| Absorción | $p\land(p\lor q)\equiv p$ | $p\lor(p\land q)\equiv p$ |

> [!NOTE]
> Cada una de estas leyes puede demostrarse con el Protocolo de 6 pasos que ya conoce (construir la tabla de ambos lados y comparar columnas) — es exactamente el mismo procedimiento usado en la Parte I para demostrar las Leyes de Morgan. Lo que falta todavía no es la herramienta de verificación, sino el criterio para *usar* estas leyes en cadena y simplificar una expresión compleja paso a paso. Eso —y su conexión con la simplificación de condiciones compuestas en código (Unidad 3 y 4 de Lógica y Representación I)— es el tema de la próxima sesión.

---

# 📘 Ejercicios resueltos — Equivalencia y Leyes de Morgan

**1. Demuestre la primera Ley de Morgan: $\neg(p\land q) \equiv \neg p\lor\neg q$**

**Paso 1 — Determinar filas.** Dos variables, $N=2^2=4$.

**Paso 2 — Construir columnas auxiliares y evaluar ambos lados.**

| $p$ | $q$ | $p\land q$ | $\neg(p\land q)$ | $\neg p$ | $\neg q$ | $\neg p\lor\neg q$ |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| 1 | 1 | 1 | 0 | 0 | 0 | 0 |
| 1 | 0 | 0 | 1 | 0 | 1 | 1 |
| 0 | 1 | 0 | 1 | 1 | 0 | 1 |
| 0 | 0 | 0 | 1 | 1 | 1 | 1 |

**Paso 3 — Interpretar.** Las columnas $\neg(p\land q)$ y $\neg p\lor\neg q$ son idénticas en las cuatro filas. **Confirmado**: $\neg(p\land q) \equiv \neg p\lor\neg q$.

**2. Demuestre la segunda Ley de Morgan: $\neg(p\lor q) \equiv \neg p\land\neg q$**

**Paso 1 — Determinar filas.** $N=2^2=4$.

**Paso 2 — Construir columnas auxiliares y evaluar.**

| $p$ | $q$ | $p\lor q$ | $\neg(p\lor q)$ | $\neg p$ | $\neg q$ | $\neg p\land\neg q$ |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| 1 | 1 | 1 | 0 | 0 | 0 | 0 |
| 1 | 0 | 1 | 0 | 0 | 1 | 0 |
| 0 | 1 | 1 | 0 | 1 | 0 | 0 |
| 0 | 0 | 0 | 1 | 1 | 1 | 1 |

**Paso 3 — Interpretar.** Nuevamente las columnas coinciden en las cuatro filas. **Confirmado**: $\neg(p\lor q) \equiv \neg p\land\neg q$.

> [!TIP]
> **Antes de continuar, pregúntese**: ¿por qué las dos leyes de Morgan invierten el conector ($\land \leftrightarrow \lor$) al negar, en vez de simplemente negar cada término?
>
> <details><summary>Ver respuesta</summary>
> Porque negar "ambas cosas son ciertas" ($p\land q$) no significa que "ambas son falsas" — basta con que **una** de las dos falle. Por eso la negación de una conjunción se convierte en una disyunción de negaciones (basta que una falle), y simétricamente, negar "al menos una es cierta" ($p\lor q$) exige que **ambas** sean falsas a la vez, por eso se convierte en una conjunción.
> </details>

---

# 🕵️ Expediente del Broche de Zafiro — Fase 1: La Contradicción

*Se retoman las declaraciones presentadas en "El caso — El enigma de las dos versiones".*

Holmes formaliza las dos declaraciones. Sea $F$: "Finch salió del salón durante el intervalo", y $L$: "Finch tuvo acceso a una llave del estudio durante el intervalo".

- **Coronel Whitmore**: "Finch salió del salón, y tuvo tiempo de conseguir una llave" → $F\land L$
- **Srta. Hart**: "Finch no salió del salón, o no tuvo acceso a ninguna llave" → $\neg F\lor\neg L$

Por la primera Ley de Morgan, demostrada arriba:

$$\neg(F\land L) \equiv \neg F\lor\neg L$$

La declaración de la Srta. Hart es, formalmente, **la negación exacta** de la declaración del Coronel Whitmore — no una versión distinta con otro énfasis, sino su contradicción lógica precisa. Esto descarta de inmediato la posibilidad de que ambos testimonios sean, en el fondo, compatibles y solo estén expresados con palabras diferentes: uno de los dos está equivocado o mintiendo. Holmes anota el hallazgo en su libreta y continúa el interrogatorio.

---

# 📘 Ejercicios resueltos — Variantes del Condicional

**3. Dada la siguiente tabla de valores para $p\rightarrow q$, $q\rightarrow p$, $\neg q\rightarrow\neg p$ y $\neg p\rightarrow\neg q$, determine cuáles expresiones son lógicamente equivalentes.**

**Paso 1 — Construir la tabla completa.**

| $p$ | $q$ | $\neg p$ | $\neg q$ | $p\rightarrow q$ | $q\rightarrow p$ | $\neg q\rightarrow\neg p$ | $\neg p\rightarrow\neg q$ |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| 0 | 0 | 1 | 1 | 1 | 1 | 1 | 1 |
| 0 | 1 | 1 | 0 | 1 | 0 | 1 | 0 |
| 1 | 0 | 0 | 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 0 | 0 | 1 | 1 | 1 | 1 |

**Paso 2 — Comparar columnas.** La columna de $p\rightarrow q$ es $(1,1,0,1)$, idéntica a la de $\neg q\rightarrow\neg p$. La columna de $q\rightarrow p$ es $(1,0,1,1)$, idéntica a la de $\neg p\rightarrow\neg q$.

**Paso 3 — Concluir.**

$$p\rightarrow q \;\equiv\; \neg q\rightarrow\neg p \qquad\qquad q\rightarrow p \;\equiv\; \neg p\rightarrow\neg q$$

> [!WARNING]
> **Error conceptual frecuente**: al resolver este tipo de ejercicio es común concluir apresuradamente que $p\rightarrow q \equiv q\rightarrow p$ (comparando el original con el recíproco) — pero la tabla muestra claramente que sus columnas, $(1,1,0,1)$ y $(1,0,1,1)$, **no coinciden**. Concluir eso sería caer precisamente en la falacia de afirmación del consecuente señalada en la Parte II. La equivalencia correcta es siempre entre el original y **su contrarrecíproco**, nunca entre el original y su recíproco.

**4. Dado el enunciado "Si llueve, entonces el patio está mojado", complete la tabla de sus variantes.**

**Paso 1 — Definir las proposiciones simples.** $p$: llueve. $q$: el patio está mojado.

**Paso 2 — Construir cada variante y evaluar su equivalencia respecto al original.**

| Caso | Expresión lógica | Expresión en lenguaje natural | ¿Equivalente al original? |
|---|:---:|---|:---:|
| Original | $p\rightarrow q$ | Si llueve, entonces el patio está mojado. | — |
| Recíproco | $q\rightarrow p$ | Si el patio está mojado, entonces llueve. | No |
| Contrario (inverso) | $\neg p\rightarrow\neg q$ | Si no llueve, entonces el patio no está mojado. | No |
| Contrarrecíproco | $\neg q\rightarrow\neg p$ | Si el patio no está mojado, entonces no llueve. | **Sí** |

**Paso 3 — Interpretar.** El recíproco y el contrario fallan por la misma razón: el patio podría estar mojado por otra causa (riego, una manguera) sin que haya llovido. Solo el contrarrecíproco preserva con certeza la misma información que el enunciado original.

---

# 🕵️ Expediente del Broche de Zafiro — Fase 2: Las Coartadas

Holmes formula una regla general para verificar coartadas. Sea $S$: "el invitado permaneció en el salón durante todo el intervalo", y $E$: "el invitado entró al estudio".

$$S \rightarrow \neg E$$

("Si permaneció en el salón todo el tiempo, entonces no pudo entrar al estudio.") Por la Parte II, esta afirmación es equivalente a su contrarrecíproco:

$$E \rightarrow \neg S$$

("Si entró al estudio, entonces no permaneció en el salón todo el tiempo.") Esto le da a Holmes una herramienta de doble uso: confirmar coartadas ($S$ verdadero descarta $E$) o, de manera igualmente válida, usar evidencia de haber entrado al estudio para descartar la coartada.

Lady Constance tiene tres testigos independientes que confirman que nunca salió del salón — $S$ es verdadero para ella, así que por el condicional original queda descartada de inmediato.

El Coronel Whitmore, en cambio, solo tiene un testigo de su propia permanencia en el salón: la Srta. Hart, la misma persona cuya declaración ya está en entredicho por la Fase 1. Watson sugiere razonar así: *"si Whitmore no entró al estudio, entonces permaneció en el salón"* — pero Holmes lo corrige de inmediato: esa es la forma del **recíproco** ($\neg E\rightarrow S$), no del contrarrecíproco, y no hay garantía de que sea cierta. No haber entrado al estudio no prueba haber estado en el salón; Whitmore pudo estar en cualquier otra habitación de la casa. Su coartada, a diferencia de la de Lady Constance, sigue sin confirmarse de forma concluyente.

---

# 📘 Ejercicios resueltos — Condiciones de Necesidad y Suficiencia

**5. Clasifique cada enunciado como condición necesaria, suficiente, o ambas para la conclusión indicada.**

**(a) "Si un cuadrilátero es un cuadrado, entonces es un rectángulo."**

**Paso 1 — Identificar antecedente y consecuente.** $p$: es un cuadrado. $q$: es un rectángulo.

**Paso 2 — Evaluar suficiencia.** ¿Basta con ser cuadrado para garantizar ser rectángulo? Sí — todo cuadrado cumple la definición de rectángulo (cuatro ángulos rectos). → **Suficiente**.

**Paso 3 — Evaluar necesidad.** ¿Sin ser cuadrado es imposible ser rectángulo? No — existen rectángulos no cuadrados (lados desiguales). → **No necesaria**.

**Resultado**: $p$ es suficiente, pero no necesaria, para $q$.

**(b) "Si un número es divisible por 2, entonces es divisible por 6."**

**Paso 1 — Identificar.** $p$: divisible por 2. $q$: divisible por 6.

**Paso 2 — Evaluar suficiencia.** ¿Basta con ser divisible por 2 para garantizar divisible por 6? No — contraejemplo inmediato: 4 es divisible por 2 pero no por 6. → **No suficiente**.

**Paso 3 — Evaluar necesidad.** ¿Sin ser divisible por 2 es imposible ser divisible por 6? Sí — todo múltiplo de 6 es par, ya que $6=2\times 3$. → **Necesaria**.

**Resultado**: aquí la intuición inicial engaña. La forma "si $p$, entonces $q$" sugiere que $p$ debería ser la condición suficiente — pero al verificar cada pregunta por separado (Parte III), resulta que la relación real va en sentido contrario: $p$ es necesaria, no suficiente. Esto ocurre porque el enunciado, tomado literalmente como $p\rightarrow q$, es matemáticamente falso en general; lo único cierto es la relación inversa ($q\rightarrow p$). Note que los Pasos 2 y 3 son, precisamente, la prueba del contraejemplo de la Parte III aplicada dos veces: un contraejemplo (el 4) cierra la suficiencia; la imposibilidad de encontrar uno cierra la necesidad.

**(c) "Un número es divisible por 3 si la suma de sus dígitos es un múltiplo de 3."**

**Paso 1 — Identificar la dirección correcta.** La forma "$q$ si $p$" se traduce como $p\rightarrow q$ (Parte IV). Aquí $p$: la suma de dígitos es múltiplo de 3. $q$: el número es divisible por 3.

**Paso 2 — Evaluar suficiencia.** ¿Basta con que la suma de dígitos sea múltiplo de 3 para garantizar divisibilidad por 3? Sí — es exactamente el criterio de divisibilidad por 3. → **Suficiente**.

**Paso 3 — Evaluar necesidad.** ¿Sin que la suma sea múltiplo de 3 es imposible que el número sea divisible por 3? Sí — el mismo criterio aplica en ambas direcciones. → **Necesaria**.

**Resultado**: $p$ es necesaria y suficiente para $q$ — en realidad describen el mismo hecho matemático desde dos ángulos ($p\leftrightarrow q$), aunque el enunciado use "si" (que gramaticalmente solo afirma una dirección).

**(d) "Si quieres ser su esposo, tienes que decirle."**

**Paso 1 — Identificar.** $p$: quieres ser su esposo. $q$: se lo dices.

**Paso 2 — Evaluar necesidad.** ¿Sin decirle es imposible llegar a ser su esposo? Sí — es un requisito ineludible. → **Necesaria**.

**Paso 3 — Evaluar suficiencia.** ¿Basta con decirle para garantizar convertirte en su esposo? No — ella podría no aceptar. → **No suficiente**.

**Resultado**: $q$ es necesaria, pero no suficiente.

**(e) "Si haces la fila, serás atendido."**

**Paso 1 — Identificar.** $p$: haces la fila. $q$: eres atendido.

**Paso 2 — Evaluar suficiencia.** ¿Basta con hacer la fila para garantizar ser atendido? Sí, según el enunciado. → **Suficiente**.

**Paso 3 — Evaluar necesidad.** ¿Sin hacer la fila es imposible ser atendido? No necesariamente — el enunciado no descarta otras vías (atención prioritaria, cita previa). → **No necesaria**.

**Resultado**: $p$ es suficiente, pero no necesaria.

**(f) "Para ser atendido, solo tienes que hacer la fila."**

**Paso 1 — Identificar la doble señal.** "Para $q$, [...]" introduce una condición necesaria; "solo tienes que $p$" cierra la puerta a cualquier otra vía, señalando también suficiencia.

**Paso 2 — Evaluar ambas.** ¿Basta con hacer la fila? Sí → **Suficiente**. ¿Es la única manera (nada más se requiere ni se acepta)? Sí, por el "solo" → **Necesaria**.

**Resultado**: a diferencia del inciso (e), aquí "solo" convierte la condición en necesaria y suficiente a la vez.

> [!NOTE]
> **Contraste (d) vs. (f)**: compare los incisos (d) y (f). Ambos usan una estructura de "requisito", pero (d) solo confirma necesidad (declararse no garantiza el matrimonio), mientras que (f) confirma ambas (la palabra "solo" elimina cualquier otra alternativa). La palabra que marca la diferencia — "solo"— es la señal lingüística más importante de esta parte.

---

# 🕵️ Expediente del Broche de Zafiro — Fase 3: Lo que las Pruebas Prueban (y lo que no)

Holmes resume el estado del caso con el lenguaje de necesidad y suficiencia. Dado que la cerradura del estudio no fue forzada, tener acceso a una llave ($L$) es **necesaria** para haber robado el broche ($R$): sin llave, entrar era imposible. Pero $L$ **no es suficiente**: tener una llave no prueba haberla usado.

De igual manera, haberse ausentado del salón ($F$) es **necesaria** para $R$ —había que salir para llegar al estudio— pero tampoco **suficiente**: cualquiera pudo ausentarse por una razón inocente.

*"Ninguna de las dos pruebas, por separado, basta para acusar a nadie"*, concluye Holmes ante Watson. *"Lo que necesito no es una prueba más, sino una forma de combinar las que ya tengo."*

---

# 📘 Ejercicios resueltos — Traducción de Lenguaje Natural a Formal

**6. Dada la proposición "Si gano la lotería, entonces seré feliz", determine las proposiciones simples y obtenga el recíproco, el contrarrecíproco y el contrario.**

**Paso 1 — Determinar las proposiciones simples.** $p$: gano la lotería. $q$: seré feliz.

**Paso 2 — Construir cada variante aplicando las definiciones de la Parte II.**

- Recíproco ($q\rightarrow p$): "Si soy feliz, entonces gané la lotería."
- Contrarrecíproco ($\neg q\rightarrow\neg p$): "Si no soy feliz, entonces no gané la lotería."
- Contrario ($\neg p\rightarrow\neg q$): "Si no gano la lotería, entonces no seré feliz."

**Paso 3 — Interpretar.** Note que el recíproco y el contrario suenan más "razonables" en el lenguaje cotidiano que en el ejemplo del patio mojado, pero eso no los vuelve lógicamente equivalentes al original — la felicidad podría tener muchas otras causas, igual que el patio podía mojarse sin lluvia.

**7. Traduzca: "El sistema activa el modo de emergencia si detecta una fuga y la presión cae por debajo del umbral, a menos que el operador lo haya desactivado manualmente."**

**Paso 1 — Determinar las proposiciones simples.**
- $f$: se detecta una fuga.
- $u$: la presión cae por debajo del umbral.
- $m$: el operador desactivó el modo manualmente.
- $a$: se activa el modo de emergencia.

**Paso 2 — Identificar la estructura.** El núcleo "detecta fuga y presión bajo umbral, entonces activa emergencia" es $(f\land u)\rightarrow a$. La cláusula "a menos que $m$" (Parte IV, disyunción/condicional con "a menos que") modifica esa condición: la activación solo aplica si el operador **no** desactivó el sistema.

**Paso 3 — Formalizar.**

$$(f\land u\land\neg m)\rightarrow a$$

*Nota sobre el alcance de la receta de la Parte IV*: la receta mecánica de dos pasos se aplica de forma más directa a un "a menos que" entre dos proposiciones simples (como en el ejemplo de "Saldremos a caminar"). Aquí "a menos que $m$" no niega el sistema completo, sino que restringe cuándo aplica la regla base $(f\land u)\rightarrow a$ — por eso el Paso 2 lo trató como un conjunto adicional en el antecedente, $\neg m$, en vez de aplicar la receta de forma literal. Ante un enunciado anidado como este, razonar directamente el significado (como se hizo arriba) es más seguro que forzar la receta mecánica.

---

# 🕵️ Expediente del Broche de Zafiro — Cierre parcial

Con las herramientas de esta sesión, Holmes logra tres avances concretos:

1. **Confirmar formalmente**, con la primera Ley de Morgan, que las declaraciones del Coronel Whitmore y de la Srta. Hart son negaciones exactas la una de la otra — no hay lectura posible que las concilie.
2. **Descartar a Lady Constance** usando el contrarrecíproco de la regla de coartadas, y **señalar la fragilidad** de la coartada del Coronel Whitmore, cuyo único testigo es, precisamente, la persona en disputa.
3. **Establecer con precisión** que ni tener acceso a una llave ni haberse ausentado del salón son, por separado, prueba suficiente de culpabilidad — apenas necesarias.

El caso queda acotado a dos sospechosos —el Sr. Finch y el Coronel Whitmore— pero combinar todas las condiciones parciales recogidas hasta ahora en una única expresión simplificada, que señale sin ambigüedad quién mintió y por qué, requiere las leyes del álgebra de proposiciones adelantadas en la Parte V. *"Tengo las piezas"*, dice Holmes, guardando su libreta, *"pero todavía no la ecuación que las una."* Esa ecuación —y el nombre del culpable— se construirán en la próxima sesión.

---

> [!TIP]
> **Problema guiado**
>
> Clasifique la condición: *"Un triángulo es equilátero si tiene sus tres ángulos iguales."*
>
> **Paso 1 — Identificar la forma.** La estructura "$q$ si $p$" se traduce como $p\rightarrow q$ (Parte IV). Aquí $p$: tiene sus tres ángulos iguales. $q$: es equilátero.
>
> **Paso 2 — Evaluar suficiencia.** ¿Basta con que los tres ángulos sean iguales (60° cada uno) para garantizar que el triángulo sea equilátero? Sí — en todo triángulo, los lados opuestos a ángulos iguales son iguales entre sí, así que los tres ángulos iguales fuerzan los tres lados iguales. → **Suficiente**.
>
> **Paso 3 — Evalúe usted la necesidad.** ¿Sin que los tres ángulos sean iguales, es imposible que el triángulo sea equilátero? Complete el razonamiento antes de revelar la respuesta.
>
> <details><summary>Ver respuesta</summary>
> Sí — un triángulo equilátero (tres lados iguales) tiene, por el teorema recíproco, sus tres ángulos iguales (60° cada uno) sin excepción. Por lo tanto, sin ángulos iguales es imposible ser equilátero → <strong>Necesaria</strong>. Conclusión: $p$ es necesaria y suficiente para $q$ — como en el caso de la divisibilidad por 3 (Ejercicio 5c), el enunciado usa "si" (una sola dirección gramatical) para describir, en realidad, un hecho matemático que va en ambas direcciones.
> </details>

---

# Parte VI — Ejercicios propuestos

**P1.** Demuestre mediante tabla de verdad que $\neg(p\leftrightarrow q) \equiv p\oplus q$.

**P2.** Utilizando las Leyes de Morgan y la ley de doble negación, simplifique $\neg(\neg p\land q)$.

**P3.** Dado el enunciado "Si un triángulo es equilátero, entonces es isósceles", escriba el recíproco, el contrarrecíproco y el contrario, e indique cuál es lógicamente equivalente al original.

**P4.** Escriba el contrarrecíproco de $(p\land q)\rightarrow r$.

**P5.** Clasifique la condición: "Para aprobar el curso, es necesario obtener al menos 3.0 en cada corte."

**P6.** Clasifique la condición: "Si llueve, las calles se mojan."

**P7.** Clasifique la condición: "Basta con que un número sea múltiplo de 4 para que sea par."

**P8.** Traduzca a lógica proposicional, definiendo las proposiciones simples: "El sistema envía la alerta si la temperatura supera los 90°C, a menos que el modo de mantenimiento esté activo."

**P9.** Traduzca a lenguaje natural: $\neg a \rightarrow (b\land c)$, donde $a$: el archivo existe, $b$: se crea uno nuevo, $c$: se registra el evento.

**P10.** Dada la proposición "Puedes matricular la asignatura solo si aprobaste el prerrequisito", determine las proposiciones simples y la expresión lógica asociada.

---

## Resultados de aprendizaje

Al finalizar este documento, usted debería ser capaz de:

- Demostrar la equivalencia lógica entre dos proposiciones, incluyendo las Leyes de De Morgan, mediante tabla de verdad.
- Construir el recíproco, el contrarrecíproco y el contrario de un condicional, e identificar correctamente cuál es equivalente al original.
- Distinguir con precisión entre condiciones necesarias y suficientes en enunciados de lenguaje cotidiano y matemático.
- Traducir enunciados compuestos de lenguaje natural a lógica formal (y viceversa), usando las tablas de conectores como referencia.
- Reconocer que la verificación de las leyes del álgebra de proposiciones no requiere herramientas nuevas — es el mismo protocolo de tablas de verdad ya dominado.
- Aplicar la prueba del contraejemplo para decidir necesidad/suficiencia cuando la intuición no sea suficiente, y la receta mecánica de "a menos que" para traducir ese conector sin derivar la equivalencia desde cero cada vez.

## Ficha de bolsillo

**Equivalencia**: $p\equiv q$ si $p\leftrightarrow q$ es tautología. Herramienta clave: $p\rightarrow q\equiv\neg p\lor q$.

**Morgan**: $\neg(p\land q)\equiv\neg p\lor\neg q$ · $\neg(p\lor q)\equiv\neg p\land\neg q$ (siempre invierte el conector).

**Variantes del condicional**: Original $p\to q$ ≡ Contrarrecíproco $\neg q\to\neg p$. Recíproco $q\to p$ ≡ Contrario $\neg p\to\neg q$. **Nunca** original ≡ recíproco.

**Necesidad/Suficiencia**: $p$ suficiente para $q$ ⟺ $p\to q$ verdadero. $p$ necesaria para $q$ ⟺ $q\to p$ verdadero. Ambas ⟺ $p\leftrightarrow q$. Cuidado con "solo si" (introduce el consecuente) y con la palabra "solo" (cierra la puerta a otras alternativas).

**Prueba del contraejemplo**: busque $p$V/$q$F para refutar suficiencia; busque $q$V/$p$F para refutar necesidad. Si no encuentra ninguno, la condición se sostiene.

**Receta "a menos que"**: lo que sigue a "a menos que" → consecuente. El resto de la oración, negado → antecedente. (Aplica mejor a enunciados de dos términos simples; para enunciados anidados, razone el significado directamente.)

## Referencias y material para profundizar

### Notas del curso

- **Sitio de notas de clase de Matemáticas Discretas 1**: [discretas1-udea.github.io/discretas1-udea-20261](https://discretas1-udea.github.io/discretas1-udea-20261/). Sitio oficial del curso, actualmente **en construcción**: no todas las sesiones están publicadas todavía.

### Libros de texto del curso

- **Rosen, K. H.** *Discrete Mathematics and Its Applications* (8ª ed.). McGraw-Hill. Capítulo 1: "The Foundations: Logic and Proofs".
- **Liben-Nowell, D.** *Connecting Discrete Mathematics and Computer Science*. Cambridge University Press.

### Material web de universidades

- **MIT OpenCourseWare — 6.042J, Mathematics for Computer Science**: [ocw.mit.edu/courses/6-042j-mathematics-for-computer-science-fall-2010](https://ocw.mit.edu/courses/6-042j-mathematics-for-computer-science-fall-2010/). En inglés.
- **Stanford CS103 — Mathematical Foundations of Computing, Lección 3: Propositional Logic**: [web.stanford.edu/class/archive/cs/cs103/cs103.1234/lectures/03](https://web.stanford.edu/class/archive/cs/cs103/cs103.1234/lectures/03/). En inglés.

### Fuentes de las técnicas complementarias (Parte III y Parte IV)

La prueba del contraejemplo y la receta de "a menos que" no provienen de las diapositivas del curso, sino de literatura especializada en razonamiento condicional revisada específicamente para esta sesión:

- **Impetus LSAT** — "How To Diagram 'Unless' and 'None' On The LSAT": [impetuslsat.com/post/unless-and-none-on-the-lsat](https://www.impetuslsat.com/post/unless-and-none-on-the-lsat). Fuente del algoritmo mecánico de dos pasos para "a menos que" (IV.2).
- **PowerScore LSAT Blog** — "How to Avoid 2 Common Mistakes in Conditional Reasoning": [blog.powerscore.com/lsat/how-to-avoid-the-two-most-common-mistakes-in-lsat-conditional-reasoning](https://blog.powerscore.com/lsat/how-to-avoid-the-two-most-common-mistakes-in-lsat-conditional-reasoning/). Fuente del principio de que una condición necesaria, por sí sola, no permite ninguna inferencia válida sin pasar por el contrarrecíproco — la base conceptual de la advertencia sobre la falacia de afirmación del consecuente (Parte II).

*Evaluada durante la investigación previa, pero no incorporada al documento* (se descartó por riesgo de sobrecarga cognitiva — introduce un canal visual nuevo que compite, en vez de reforzar, la notación de flechas ya establecida):

- **SciELO Venezuela** — "Las reglas de Irving Copi y Carl Cohen son una condición necesaria y suficiente de la validez en los silogismos categóricos de forma estándar": [ve.scielo.org/scielo.php?script=sci_arttext&pid=S0798-43242005000100006](https://ve.scielo.org/scielo.php?script=sci_arttext&pid=S0798-43242005000100006). Fundamenta el uso de diagramas de Venn (conjuntos anidados) para visualizar necesidad y suficiencia, técnica evaluada en la discusión previa a esta sección.

> [!NOTE]
> Si el acceso a internet es limitado, no es necesario consultar estas fuentes para completar el curso — el contenido de este documento y de las clases es suficiente.

---

## Solucionario — Ejercicios propuestos

<details>
<summary><b>Presione aquí para ver las respuestas</b></summary>

**P1.** Sí son equivalentes. Columna $\neg(p\leftrightarrow q)$: $(0,1,1,0)$; columna $p\oplus q$: $(0,1,1,0)$ — coinciden en las cuatro filas.

**P2.** $\neg(\neg p\land q) \equiv \neg(\neg p)\lor\neg q \equiv p\lor\neg q$.

**P3.** Recíproco: "Si es isósceles, entonces es equilátero" (falso en general). Contrarrecíproco: "Si no es isósceles, entonces no es equilátero" (equivalente al original). Contrario: "Si no es equilátero, entonces no es isósceles" (falso en general, equivale al recíproco). El contrarrecíproco es el equivalente.

**P4.** $\neg r\rightarrow\neg(p\land q)$, que por Morgan también puede escribirse $\neg r\rightarrow(\neg p\lor\neg q)$.

**P5.** Necesaria (no se puede concluir suficiencia con la información dada — podría haber otros requisitos).

**P6.** Suficiente, no necesaria (las calles podrían mojarse por otras causas).

**P7.** Suficiente, no necesaria (hay números pares que no son múltiplos de 4, por ejemplo 6).

**P8.** $t$: la temperatura supera 90°C. $m$: el modo de mantenimiento está activo. $a$: se envía la alerta. Expresión: $(t\land\neg m)\rightarrow a$.

**P9.** "Si el archivo no existe, entonces se crea uno nuevo y se registra el evento."

**P10.** $M$: puedes matricular la asignatura. $P$: aprobaste el prerrequisito. Expresión: $M\rightarrow P$.

</details>