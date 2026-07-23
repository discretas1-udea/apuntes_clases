![Built with AI](https://img.shields.io/badge/Built%20with-AI-blue.svg)

# 📝 Autoevaluación — De Proposiciones a Predicados

*Práctica de la Clase 07 · Matemáticas Discretas 1 · Universidad de Antioquia*
*[Volver a las notas de clase](clase7.md)*

---

Esta autoevaluación es para practicar **a mano**, como cuando estudia de un libro. Cada ítem incluye un espacio para escribir su intento y declarar su nivel de confianza *antes* de ver la respuesta. La respuesta que se revela es **solo el resultado final** — el desarrollo completo lo debe construir usted.

> [!TIP]
> **Cómo aprovechar esta práctica.** Resuelva cada ítem completo antes de desplegar la respuesta. Si su resultado coincide, verifique igual que su *razonamiento* fue correcto — sobre todo el emparejamiento cuantificador–conectivo, que es el error más común de este tema. Si no coincide, no mire la respuesta de inmediato: vuelva a intentarlo.

---

## 🔥 Calentamiento

Reconocimiento rápido de conceptos. Un concepto por ítem.

**Ítem 1.** El técnico afirma una sola proposición: $p:$ *"Todos los servidores del clúster responden correctamente"*. Con base **únicamente** en $p$, ¿se puede deducir que *"el servidor srv3 responde correctamente"*? Explique en una frase por qué sí o por qué no.

> ✍️ *Antes de ver la respuesta: escriba su explicación.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>No se puede deducir. $p$ es una única proposición atómica — una "caja cerrada" — y la lógica proposicional no ve su contenido interno; no "sabe" que srv3 es uno de los servidores de los que habla $p$. No hay ninguna relación lógica formal entre $p$ y una afirmación sobre srv3 en particular.</details>

---

**Ítem 2.** Sea el universo los procesos activos del sistema, $U = \{proc1, proc2, \dots, proc6\}$, y el predicado $activo(x)$. Clasifique cada elemento: (i) el conjunto $U$; (ii) el símbolo $x$ en $activo(x)$; (iii) $proc3$.

> ✍️ *Antes de ver la respuesta: clasifique (i), (ii) y (iii).*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>(i) Universo / dominio del discurso. (ii) Variable (representa a cualquier objeto del dominio). (iii) Constante (nombra a un objeto específico y fijo del universo).</details>

---

**Ítem 3.** Clasifique la aridad (unitario, binario o ternario) de cada predicado: (a) $primo(x)$; (b) $conectado(x, y)$; (c) $envio(x, y, z)$.

> ✍️ *Antes de ver la respuesta: clasifique los tres.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>(a) Unitario — propiedad de un objeto. (b) Binario — relación entre dos objetos. (c) Ternario — relación entre tres objetos.</details>

---

**Ítem 4.** En el enunciado *"Existe al menos un sensor sin batería"*, ¿qué cuantificador corresponde? Escriba cómo se lee el símbolo.

> ✍️ *Antes de ver la respuesta: identifique el cuantificador y su lectura.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Cuantificador existencial, $\exists x$. Se lee "existe al menos un $x$ tal que…".</details>

---

## Serie 1 — Repeticiones básicas

Un paso de método por ítem.

**Ítem 5.** Sea el predicado $Q(x):\ x$ *es primo*, con universo los enteros positivos. Clasifique cada expresión como **función proposicional** o **proposición** (y en este último caso, indique V o F): (a) $Q(x)$; (b) $Q(7)$; (c) $Q(9)$; (d) $\exists x\, Q(x)$.

> ✍️ *Antes de ver la respuesta: clasifique las cuatro.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>(a) Función proposicional (variable libre). (b) Proposición verdadera (7 es primo). (c) Proposición falsa (9 = 3×3). (d) Proposición verdadera (existen enteros positivos primos).</details>

---

**Ítem 6.** Sea el universo $U = \{1, 2, \dots, 10\}$ y el predicado $primo(x)$. Determine por extensión el conjunto de verdad $\{\,x \in U \mid primo(x)\,\}$.

> ✍️ *Antes de ver la respuesta: liste los elementos.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\{2, 3, 5, 7\}$.</details>

---

**Ítem 7.** Traduzca a lógica de predicados: *"Todo estudiante matriculado tiene un usuario activo."* Defina primero su diccionario de predicados.

> ✍️ *Antes de ver la respuesta: defina predicados y traduzca.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Con $matriculado(x)$: "$x$ está matriculado" y $activo(x)$: "$x$ tiene usuario activo": $\forall x\,\bigl(matriculado(x) \rightarrow activo(x)\bigr)$ — forma A.</details>

---

**Ítem 8.** Traduzca a lógica de predicados: *"Algún proceso está bloqueado."*

> ✍️ *Antes de ver la respuesta: defina predicados y traduzca.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Con $proceso(x)$ y $bloqueado(x)$: $\exists x\,\bigl(proceso(x) \land bloqueado(x)\bigr)$ — forma I.</details>

---

**Ítem 9.** (a) Sea $P(x):\ x$ *es un servidor* y $R(x):\ x$ *está en producción*. Escriba la expresión compuesta para *"$x$ es un servidor y está en producción"*, y evalúela para la constante $srvA$. (b) Clasifique en una tabla de verificación de tipos los siguientes símbolos, indicando sobre qué operan y qué producen: $\neg$, $par(x)$, $doble(x)$.

> ✍️ *Antes de ver la respuesta: resuelva (a) y (b).*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>(a) $P(x) \land R(x)$ (función proposicional); instanciada: $P(srvA) \land R(srvA)$, ya es una proposición (V o F). (b) $\neg$: conectivo, opera sobre proposiciones, produce una proposición. $par(x)$: predicado, opera sobre objetos, produce una proposición (V/F). $doble(x)$: función, opera sobre objetos, produce un objeto.</details>

---

## Serie 2 — Aplicación combinada

Ya no basta una sola idea: hay que combinar herramientas de varias secciones.

**Ítem 10.** Traduzca a lógica de predicados: *"Ningún archivo corrupto se puede abrir."*

> ✍️ *Antes de ver la respuesta: defina predicados y traduzca.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Con $corrupto(x)$ y $abrible(x)$: $\forall x\,\bigl(corrupto(x) \rightarrow \neg abrible(x)\bigr)$ — forma E.</details>

---

**Ítem 11.** Dada la fórmula $\exists x\,\bigl(becado(x) \land destacado(x)\bigr)$, identifique su forma aristotélica y justifique por qué el emparejamiento cuantificador–conectivo es el correcto.

> ✍️ *Antes de ver la respuesta: identifique la forma y justifique.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Forma I (particular afirmativa). El emparejamiento correcto es $\exists$ con $\land$: exige que exista un objeto que cumpla **ambas** propiedades a la vez. Con $\rightarrow$ en su lugar, la fórmula se volvería verdadera de forma trivial apenas existiera un solo objeto que no fuera becado.</details>

---

**Ítem 12.** Un estudiante tradujo *"Algún sensor está dañado"* como $\exists x\,\bigl(sensor(x) \rightarrow danado(x)\bigr)$. Explique por qué es incorrecta y escriba la traducción correcta.

> ✍️ *Antes de ver la respuesta: explique el error y corrija.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Es incorrecta porque empareja $\exists$ con $\rightarrow$: la fórmula se vuelve verdadera de forma trivial en cuanto exista un solo objeto del universo que **no** sea sensor (antecedente falso ⟹ implicación verdadera), sin que ningún sensor esté realmente dañado. Correcta: $\exists x\,\bigl(sensor(x) \land danado(x)\bigr)$.</details>

---

**Ítem 13.** Niegue la proposición $\forall x\,\bigl(seguro(x) \land actualizado(x)\bigr)$, dejando el resultado como un existencial (sin el $\neg$ delante del cuantificador).

> ✍️ *Antes de ver la respuesta: escriba la negación.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\exists x\,\neg\bigl(seguro(x) \land actualizado(x)\bigr)$, aplicando la ley de negación de cuantificadores $\neg\,\forall x\,P(x) \equiv \exists x\,\neg P(x)$.</details>

---

**Ítem 14.** La afirmación *"Todos manejan bien bajo presión"*, con predicado $manejaPresion(x)$, ¿es verdadera o falsa? Proponga **un universo donde sea verdadera** y **un universo donde sea falsa**.

> ✍️ *Antes de ver la respuesta: proponga los dos universos.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Depende del universo elegido — no tiene un único valor de verdad. Por ejemplo: verdadera si $U = $ "el equipo de bomberos de una estación" (entrenados para eso); falsa si $U = $ "todos los seres humanos" (muchos no manejan bien la presión). La misma fórmula $\forall x\, manejaPresion(x)$ cambia de valor según el universo.</details>

---

## 🦸 Reto Final — La misión de los Vengadores

Un caso aplicado. La historia es solo el envoltorio: se resuelve con las herramientas formales de la clase.

El universo son los miembros disponibles del equipo, $U = \{ironman, capitan, thor, viuda, hulk, ojo\}$, con los predicados:

| Predicado | Significado |
|:---|:---|
| $tienePoderes(x)$ | "$x$ tiene poderes sobrehumanos (no solo tecnología)" |
| $esHumano(x)$ | "$x$ es completamente humano" |
| $disponible(x)$ | "$x$ está disponible para la misión" |

Y la siguiente tabla de hechos conocidos:

| Vengador | tienePoderes | esHumano | disponible |
|:---|:---:|:---:|:---:|
| $thor$ | V | F | V |
| $hulk$ | V | F | F |
| $ironman$ | F | V | V |
| $capitan$ | F | V | V |
| $viuda$ | F | V | V |
| $ojo$ | F | V | F |

**Ítem 15.** Traduzca las siguientes tres afirmaciones e identifique la forma aristotélica de cada una:

- (a) *"Todo Vengador disponible tiene poderes sobrehumanos."*
- (b) *"Ningún Vengador completamente humano tiene poderes sobrehumanos."*
- (c) *"Algún Vengador disponible tiene poderes sobrehumanos."*

> ✍️ *Antes de ver la respuesta: traduzca las tres y clasifique su forma.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>(a) $\forall x\,\bigl(disponible(x) \rightarrow tienePoderes(x)\bigr)$ — forma A. (b) $\forall x\,\bigl(esHumano(x) \rightarrow \neg tienePoderes(x)\bigr)$ — forma E. (c) $\exists x\,\bigl(disponible(x) \land tienePoderes(x)\bigr)$ — forma I.</details>

---

**Ítem 16.** Usando la tabla de hechos: (a) evalúe $tienePoderes(hulk) \land disponible(hulk)$. (b) Determine el conjunto de verdad de $tienePoderes(x)$ sobre $U$. (c) Niegue la afirmación (a) del Ítem 15 y, con la tabla de hechos, determine si esa negación es verdadera o falsa.

> ✍️ *Antes de ver la respuesta: resuelva (a), (b) y (c).*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>(a) F (V ∧ F = F, porque hulk no está disponible). (b) $\{thor, hulk\}$. (c) $\exists x\,\bigl(disponible(x) \land \neg tienePoderes(x)\bigr)$; es **verdadera**, porque $ironman$ cumple $disponible(ironman)=V$ y $tienePoderes(ironman)=F$. (Esto confirma que la afirmación original del Ítem 15(a) es falsa.)</details>

---

## ✅ Cierre — Autodiagnóstico

Marque, con honestidad, cómo le fue en cada bloque. Use tanto si acertó como el nivel de confianza que declaró antes de ver cada respuesta — la combinación revela dónde estudiar.

| Bloque | Lo resolví sin dificultad | Dudé pero llegué | Necesito repasar | Tema de la Clase 07 a repasar |
|:---|:---:|:---:|:---:|:---|
| Calentamiento | ☐ | ☐ | ☐ | Universo, objeto, variable, constante, cuantificadores (Partes I–III.1) |
| Serie 1 | ☐ | ☐ | ☐ | Función proposicional vs. proposición, conjunto de verdad, traducción básica, verificación de tipos (Partes II, IV) |
| Serie 2 | ☐ | ☐ | ☐ | Emparejamiento cuantificador–conectivo, negación de cuantificadores, dependencia del universo (Partes III.2, V.2) |
| Reto Final | ☐ | ☐ | ☐ | Modelar un caso completo: traducir, evaluar y negar sobre un mismo universo |

> [!TIP]
> **Señal de alerta útil.** Si en algún ítem declaró confianza **Alta** pero la respuesta no coincidió, ese es el punto más importante para repasar — sobre todo si fue en el emparejamiento $\forall$–$\rightarrow$ / $\exists$–$\land$, que es el error más frecuente de este tema.

## 📌 Hoja de fórmulas y conceptos clave

| Concepto | Qué es | Ejemplo |
|:---|:---|:---|
| Universo / Dominio | Conjunto de todos los objetos sobre los que se razona | $\{proc1, \dots, proc6\}$ |
| Constante | Símbolo que nombra un objeto específico | $ironman,\ thor$ |
| Variable | Símbolo que representa cualquier objeto del dominio | $x,\ y,\ z$ |
| Predicado | Propiedad o relación; produce V o F | $activo(x),\ tecnico(x,y)$ |
| Función proposicional | Expresión con variables libres; aún no es proposición | $P(x) \land Q(x)$ |
| Conjunto de verdad | Subconjunto del dominio donde el predicado es verdadero | $\{x \in D \mid primo(x)\}$ |

**Verificación de tipos:** los **conectivos** operan sobre proposiciones y producen una proposición; los **predicados** operan sobre objetos y producen una proposición; las **funciones** operan sobre objetos y producen un objeto.

**Las cuatro formas aristotélicas:**

| Forma | Enunciado | Traducción |
|:---:|:---|:---:|
| **A** | Todo $S$ es $P$ | $\forall x\,(S(x) \rightarrow P(x))$ |
| **E** | Ningún $S$ es $P$ | $\forall x\,(S(x) \rightarrow \neg P(x))$ |
| **I** | Algún $S$ es $P$ | $\exists x\,(S(x) \land P(x))$ |
| **O** | Algún $S$ no es $P$ | $\exists x\,(S(x) \land \neg P(x))$ |

**Emparejamiento correcto:** $\forall$ va con $\rightarrow$; $\exists$ va con $\land$. Escribir $\exists x\,(S(x)\rightarrow P(x))$ es casi siempre un error.

**Negación de cuantificadores:** $\neg\,\forall x\, P(x) \equiv \exists x\, \neg P(x)$ y $\neg\,\exists x\, P(x) \equiv \forall x\, \neg P(x)$.

---

*[Volver a las notas de clase](clase7.md)*
