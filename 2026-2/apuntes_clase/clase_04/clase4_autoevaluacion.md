![Built with AI](https://img.shields.io/badge/Built%20with-AI-blue.svg)

# 🕵️ Autoevaluación — El Caso del Broche de Zafiro: La Ecuación de Holmes
### Leyes del Álgebra de Proposiciones y Demostraciones por Cadena de Equivalencias

*Matemáticas Discretas 1 · Universidad de Antioquia · Ingeniería de Sistemas*

*Bloque de autoevaluación correspondiente a las notas de clase: [El Caso del Broche de Zafiro — La Ecuación de Holmes](clase5.md). Resuélvalo después de haber estudiado ese documento completo.*

> [!IMPORTANT]
> **Cómo usar este documento**: resuelva cada ítem completamente a mano, en papel, antes de revelar la respuesta. Escriba su resultado final en el espacio provisto y declare su nivel de confianza — solo entonces revele la respuesta para comparar, como haría con el apéndice de respuestas de un libro de texto. Ningún ítem muestra el desarrollo paso a paso; ese desarrollo debe ser suyo.

---

## Calentamiento

**Ítem 1**
En sus propias palabras: ¿por qué el enfoque axiomático evita construir una tabla de verdad completa cuando el número de variables crece? Mencione el problema concreto que motiva esta sesión (Parte I.1 de `clase5.md`).

> ✍️ *Antes de ver la respuesta: escriba aquí su explicación, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

Porque el número de filas de una tabla de verdad crece como $2^n$: con 4 variables ya son 16 filas, con 6 variables, 64. El enfoque axiomático permite transformar una expresión aplicando leyes ya demostradas, sin construir esa tabla, sin importar cuántas variables tenga.

</details>

---

**Ítem 2**
Simplifique: $a\land a\land b$

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

$a\land b$

</details>

---

**Ítem 3**
Simplifique: $\neg(\neg(c\lor d))$

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

$c\lor d$

</details>

---

**Ítem 4**
Simplifique: $(e\lor f)\lor V$

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

$V$

</details>

---

**Ítem 5**
Simplifique: $(m\land n)\land V$

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

$m\land n$

</details>

---

## Serie 1 — Repeticiones básicas

**Ítem 6**
Aplique Implicación para eliminar la flecha en: $x\rightarrow y$

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

$\neg x\lor y$

</details>

---

**Ítem 7**
Escriba el contrarrecíproco de $u\rightarrow\neg v$ y simplifíquelo si es posible.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

$v\rightarrow\neg u$

</details>

---

**Ítem 8**
Aplique Equivalencia para reescribir: $g\leftrightarrow h$

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

$(g\rightarrow h)\land(h\rightarrow g)$

</details>

---

**Ítem 9**
Simplifique: $k\land(k\lor p)$

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

$k$

</details>

---

## Serie 2 — Aplicación combinada

**Ítem 10**
Simplifique: $\neg(a\rightarrow b)\lor b$

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

$a\lor b$

</details>

---

**Ítem 11**
Simplifique: $\neg(e\lor f)\lor e$

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

$e\lor\neg f$

</details>

---

**Ítem 12**
Demuestre, usando el formato Afirmación–Razón (Parte III), que $(g\land\neg h)\rightarrow h \;\equiv\; g\rightarrow h$

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

Se confirma la equivalencia: $(g\land\neg h)\rightarrow h \equiv g\rightarrow h$

</details>

---

**Ítem 13**
Determine, usando el enfoque axiomático, si $(i\land j)\rightarrow i$ es una tautología, una contradicción o una contingencia.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

Tautología ($\equiv V$)

</details>

---

**Ítem 14**
Demuestre, usando el formato Afirmación–Razón (Parte III), que $\bigl[(k\rightarrow l)\land(l\rightarrow m)\bigr]\rightarrow(k\rightarrow m)$ es una tautología.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

Tautología ($\equiv V$)

</details>

---

## Serie 3 — Entrenamiento cruzado

> [!NOTE]
> Esta serie mezcla el álgebra de proposiciones de esta sesión con tres clases anteriores: **clase4.md** (Contrarrecíproco, Necesidad/Suficiencia), **clase3.md** (tablas de verdad y clasificación) y **clase2.md** (traducción de lenguaje natural a lógica formal).

**Ítem 15** *(clase4.md, Partes II y III + clase5.md, Parte II)*
Sea $p$: "el sensor detecta movimiento" y $q$: "se activa la luz exterior". Se sabe que $p$ es condición suficiente para $q$ (clase4.md, Parte III).

(a) Escriba la expresión condicional correspondiente.
(b) Obtenga su contrarrecíproco (clase4.md, Parte II).
(c) Simplifique $\neg(p\rightarrow q)$ aplicando las leyes de esta sesión (clase5.md, Parte II).

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

(a) $p\rightarrow q$ &nbsp;&nbsp; (b) $\neg q\rightarrow\neg p$ &nbsp;&nbsp; (c) $p\land\neg q$

</details>

---

**Ítem 16** *(clase3.md, 1.5 y Protocolo de 6 pasos + clase5.md, Parte II)*
Simplifique $\neg r\lor(r\land s)$ aplicando las leyes del álgebra de proposiciones; clasifique el resultado (tautología, contradicción o contingencia). Luego construya la tabla de verdad completa de la expresión original (Protocolo de 6 pasos, clase3.md) para confirmar su clasificación.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

Simplificación: $\neg r\lor s$. Clasificación: **contingencia**.

</details>

---

**Ítem 17** *(clase2.md, Parte I + clase5.md, Parte II)*
Traduzca a lógica proposicional, definiendo las proposiciones simples: "El robot no avanza si la batería está baja o el sensor de obstáculos detecta algo." Luego simplifique la expresión obtenida aplicando las leyes de esta sesión.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

Traducción: $(w\lor x)\rightarrow\neg t$, con $t$: el robot avanza, $w$: la batería está baja, $x$: el sensor detecta algo. Simplificación: $(\neg w\land\neg x)\lor\neg t$.

</details>

---

## Reto Final — La Isla de los Caballeros y los Bribones

> [!NOTE]
> En una isla remota viven dos tipos de habitantes: los **caballeros**, que siempre dicen la verdad, y los **bribones**, que siempre mienten. No hay ninguna relación con el Broche de Zafiro — este es un escenario completamente aparte, de lógica recreativa clásica. Cada declaración se resuelve **únicamente con las 13 leyes** del álgebra de proposiciones — nunca con tabla de verdad por fuerza bruta. Truco formal: si $x$ es la proposición "X es caballero" y $S$ es lo que X declaró, entonces la restricción siempre es $x\leftrightarrow S$ (lo que X dice es verdad exactamente cuando X es caballero).

**Ítem 18**
En un cruce de caminos se encuentran dos habitantes, A y B. A declara: *"B es un bribón, o yo soy un bribón."*

Formalice la declaración de A, plantee la restricción $a\leftrightarrow S$ y simplifíquela por completo aplicando las 13 leyes hasta obtener una conclusión sobre quién es caballero y quién es bribón.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

La restricción se simplifica a $a\land\neg b$: **A es caballero y B es bribón.**

</details>

---

**Ítem 19**
Más adelante, un tercer habitante, C, se acerca y declara: *"Yo soy un bribón."*

Formalice la declaración de C, plantee la restricción $c\leftrightarrow S$ y simplifíquela por completo aplicando las 13 leyes. ¿Qué revela el resultado?

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details>
<summary>Ver respuesta final</summary>

La restricción se simplifica a $F$: **contradicción**. Ningún habitante, caballero o bribón, podría hacer esta declaración — la situación es lógicamente imposible.

</details>

---

## Cierre — Autodiagnóstico

Antes de revisar el solucionario completo, complete esta tabla contando cuántos ítems de cada serie declaró con cada nivel de confianza (según lo que marcó en cada 🎯).

| Serie | Ítems con confianza Alta | Ítems con confianza Media | Ítems con confianza Baja |
|---|:---:|:---:|:---:|
| Calentamiento (1–5) | | | |
| Serie 1 (6–9) | | | |
| Serie 2 (10–14) | | | |
| Serie 3 (15–17) | | | |
| Reto Final (18–19) | | | |

Responda por escrito, antes de mirar el solucionario:

1. ¿En qué serie concentró más ítems de confianza Baja? ¿Qué ley o concepto concreto necesita repasar?
2. Al revisar el solucionario, ¿algún ítem que marcó con confianza Alta resultó incorrecto? Eso indica un error de base, no de distracción — priorícelo en su repaso.
3. ¿Le costó más aplicar las leyes de forma aislada (Calentamiento, Serie 1) o encadenarlas en una demostración completa (Serie 2, Reto Final)?

---

## Hoja de fórmulas y conceptos clave

*Ficha de bolsillo de `clase5.md`, completada con la notación de las clases que entraron en la Serie 3.*

**Regla de oro**: si hay una flecha ($\rightarrow,\leftrightarrow$), conviértala primero (Implicación / Equivalencia) — ninguna otra ley opera sobre ella directamente.

**Las 13 leyes** (todas de doble vía — sirven para expandir o para factorizar):

Conmutatividad · Asociatividad · Distributividad · Idempotencia · Doble negación · De Morgan · Identidad · Dominación · Absorción · Complemento · Implicación ($p\to q\equiv\neg p\lor q$) · Contrarrecíproco ($p\to q\equiv\neg q\to\neg p$) · Equivalencia ($p\leftrightarrow q\equiv(p\to q)\land(q\to p)$).

**Distributividad vs. Absorción**: Distributividad *expande* (dos variables distintas dentro y fuera del paréntesis); Absorción *reduce a una variable* (la misma variable dentro y fuera).

**Formato oficial de demostración**: tabla Afirmación–Razón, cada fila justificada por una ley concreta sobre un operador concreto, referenciando el paso anterior.

**Negación de un condicional**: $\neg(p\rightarrow q)\equiv p\land\neg q$ — nunca es otro condicional.

**De la Serie 3 — recordatorios de clases anteriores:**

- **Necesidad/Suficiencia** (clase4.md): $p$ suficiente para $q$ ⟺ $p\to q$ verdadero. $p$ necesaria para $q$ ⟺ $q\to p$ verdadero.
- **Protocolo de 6 pasos para tablas de verdad** (clase3.md): identificar variables → calcular filas ($2^n$) → construir columnas de variables → agregar columnas auxiliares → evaluar respetando jerarquía → validar.
- **Clasificación** (clase3.md): columna final toda $V$ → Tautología. Toda $F$ → Contradicción. Mezcla de $V$ y $F$ → Contingencia.
- **Proceso de traducción, 3 pasos** (clase2.md): identificar conectores → definir variables → ensamblar fórmula.

---

## Solucionario completo

<details>
<summary><b>Presione aquí para ver todas las respuestas — Calentamiento</b></summary>

**Ítem 1.** El número de filas crece como $2^n$; el enfoque axiomático no depende de eso.

**Ítem 2.** $a\land b$ (Idempotencia).

**Ítem 3.** $c\lor d$ (Doble negación).

**Ítem 4.** $V$ (Dominación).

**Ítem 5.** $m\land n$ (Identidad).

</details>

<details>
<summary><b>Presione aquí para ver todas las respuestas — Serie 1</b></summary>

**Ítem 6.** $\neg x\lor y$ (Implicación).

**Ítem 7.** $v\rightarrow\neg u$ (Contrarrecíproco).

**Ítem 8.** $(g\rightarrow h)\land(h\rightarrow g)$ (Equivalencia).

**Ítem 9.** $k$ (Absorción).

</details>

<details>
<summary><b>Presione aquí para ver todas las respuestas — Serie 2</b></summary>

**Ítem 10.** $a\lor b$ (Implicación/De Morgan sobre la negación del condicional, luego Distributividad, Complemento e Identidad).

**Ítem 11.** $e\lor\neg f$ (De Morgan, Distributividad, Complemento, Identidad).

**Ítem 12.** Equivalencia confirmada: $(g\land\neg h)\rightarrow h \equiv g\rightarrow h$ (Implicación, De Morgan, Doble negación, Asociatividad, Idempotencia, Implicación inversa).

**Ítem 13.** Tautología ($\equiv V$) (Implicación, De Morgan, Conmutatividad/Asociatividad, Complemento, Dominación).

**Ítem 14.** Tautología ($\equiv V$) — Silogismo Hipotético (Implicación, De Morgan, reagrupación).

</details>

<details>
<summary><b>Presione aquí para ver todas las respuestas — Serie 3</b></summary>

**Ítem 15.** (a) $p\rightarrow q$. (b) $\neg q\rightarrow\neg p$. (c) $p\land\neg q$.

**Ítem 16.** Simplificación: $\neg r\lor s$. Clasificación: contingencia (confirmado con tabla de verdad de 4 filas).

**Ítem 17.** $(w\lor x)\rightarrow\neg t \;\equiv\; (\neg w\land\neg x)\lor\neg t$.

</details>

<details>
<summary><b>Presione aquí para ver todas las respuestas — Reto Final</b></summary>

**Ítem 18.** $a\land\neg b$: A es caballero, B es bribón.

**Ítem 19.** $F$: contradicción. Ningún habitante podría hacer esa declaración.

</details>
