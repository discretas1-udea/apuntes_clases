![Built with AI](https://img.shields.io/badge/Built%20with-AI-blue.svg)

# 🛰️ Autoevaluación — El Incidente del Discovery One
### Proposición, Lenguaje Formal, Axiomas de Verdad y Jerarquía de Operadores

*Bloque de autoevaluación independiente. Documento de clase: [`README.md`](./README.md)*

---

> [!IMPORTANT]
> Resuelva cada ítem **a mano, completo**, antes de escribir su resultado y revelar la respuesta. El `<details>` de cada ítem muestra únicamente la **respuesta final** — como el apéndice de un libro de texto — no el procedimiento paso a paso. Si necesita repasar el procedimiento completo, ese desarrollo ya está en los "Ejercicios resueltos" de `README.md`.

---

## Calentamiento

**C1.** Clasifique cada enunciado como proposición o no-proposición, y justifique en una línea: (a) "¿Cuánto es 2+2?" (b) "2+2=4".

> ✍️ *Su respuesta:*
> _______________________
>
> 🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>(a) No es proposición. (b) Sí es proposición, verdadera.</details>

**C2.** Clasifique como simple o compuesta: "El servidor está encendido pero la red está caída."

> ✍️ *Su respuesta:*
> _______________________
>
> 🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Compuesta.</details>

**C3.** Escriba el símbolo correspondiente a: negación, conjunción, disyunción exclusiva.

> ✍️ *Su respuesta:*
> _______________________
>
> 🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\neg$, $\land$, $\oplus$.</details>

**C4.** ¿Es "$x - 3 = 0$" una proposición? Justifique.

> ✍️ *Su respuesta:*
> _______________________
>
> 🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>No — es un enunciado abierto: contiene una variable ($x$) sin valor fijo, así que no se le puede asignar $V$ o $F$ sin más información.</details>

---

## Serie 1 — Repeticiones básicas

*Un operador a la vez, aplicando el axioma de verdad correspondiente.*

**S1-1.** Sea $p=F$. Evalúe $\neg p$.

> ✍️ *Su respuesta:* _______________________  🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$V$</details>

**S1-2.** Sean $p=F$, $q=F$. Evalúe $p \land q$.

> ✍️ *Su respuesta:* _______________________  🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$F$</details>

**S1-3.** Sean $p=F$, $q=V$. Evalúe $p \lor q$.

> ✍️ *Su respuesta:* _______________________  🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$V$</details>

**S1-4.** Sean $p=V$, $q=V$. Evalúe $p \oplus q$.

> ✍️ *Su respuesta:* _______________________  🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$F$</details>

**S1-5.** Sean $p=F$, $q=V$. Evalúe $p \rightarrow q$.

> ✍️ *Su respuesta:* _______________________  🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$V$</details>

**S1-6.** Sean $p=V$, $q=F$. Evalúe $p \leftrightarrow q$.

> ✍️ *Su respuesta:* _______________________  🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$F$</details>

---

## Serie 2 — Aplicación combinada

*Traducción y evaluación de expresiones compuestas respetando jerarquía.*

**S2-1 (Traducción).** "El estudiante repite el curso si reprueba el examen final o no entrega el trabajo." Defina variables y formalice.

> ✍️ *Su respuesta:* _______________________  🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$f$: reprueba el examen final. $e$: entrega el trabajo. $r$: repite el curso. Expresión: $(f \lor \neg e) \rightarrow r$</details>

**S2-2 (Traducción).** "No es cierto que el usuario esté autenticado y la sesión haya expirado." Defina variables y formalice.

> ✍️ *Su respuesta:* _______________________  🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$a$: el usuario está autenticado. $s$: la sesión ha expirado. Expresión: $\neg(a \land s)$</details>

**S2-3 (Evaluación).** Sean $p=V$, $q=V$, $r=F$. Evalúe $p \land q \rightarrow \neg r$.

> ✍️ *Su respuesta:* _______________________  🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$V$</details>

**S2-4 (Evaluación).** Sean $p=F$, $q=V$, $r=V$. Evalúe $\neg p \lor q \land r$.

> ✍️ *Su respuesta:* _______________________  🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$V$</details>

**S2-5 (Evaluación).** Sean $A=F$, $B=V$, $C=F$. Evalúe $A \rightarrow B \leftrightarrow C$.

> ✍️ *Su respuesta:* _______________________  🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$F$</details>

---

## Serie 3 — Entrenamiento cruzado (con Lógica y Representación I)

*Cada ítem cruza la fórmula lógica con su equivalente en Python — ver Anexo A del prompt de notas.*

**S3-1.** "El acceso se otorga si el usuario tiene una clave activa y no está bloqueado." (a) Formalice. (b) Escríbala como expresión booleana de Python.

> ✍️ *Su respuesta:* _______________________  🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>(a) $a$: tiene clave activa. $b$: está bloqueado. $a \land \neg b$. (b) <code>a and not b</code></details>

**S3-2.** Sean $p=V$, $q=F$, $r=V$. Evalúe $p \lor (q \land r)$. Luego indique qué devuelve en Python `p or (q and r)` con `p=True, q=False, r=True`.

> ✍️ *Su respuesta:* _______________________  🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$V$ en lógica; <code>True</code> en Python. Ambos coinciden.</details>

**S3-3.** La expresión $\neg(p \land q)$, evaluada con $p=V$, $q=F$: (a) ¿cuál es su valor? (b) Escríbala en Python y evalúela con `p=True, q=False`.

> ✍️ *Su respuesta:* _______________________  🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>(a) $V$. (b) <code>not (p and q)</code> → <code>True</code>.</details>

---

## Reto Final

*Continúa el caso Discovery One — un nuevo reporte, distinto al de la Fase 1 ya resuelta en `README.md`.*

Mientras se prepara el análisis exhaustivo de la próxima sesión (Tablas de Verdad), Poole encuentra en el registro de HAL una entrada nueva: *"Advertencia: $S \land \neg M \rightarrow R$ se evalúa como verdadera este ciclo."*

Los datos del ciclo actual son: el sensor de temperatura sí reporta un valor anómalo ($S=V$), el mantenimiento preventivo **no** se realizó en las últimas 48 horas ($M=F$), y la anomalía **no** persiste tras el reinicio del sensor ($R=F$).

**RF-1.** Evalúe $S \land \neg M \rightarrow R$ con estos datos. ¿La afirmación de HAL (que la expresión es verdadera) es correcta?

> ✍️ *Su respuesta:* _______________________  🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>La expresión evalúa a $F$. La afirmación de HAL es <b>incorrecta</b> — es una segunda discrepancia, del mismo tipo que la del caso AE-35.</details>

**RF-2.** Usando la regla de oro del condicional, explique en una línea por qué el patrón de este caso es análogo al del AE-35.

> ✍️ *Su respuesta:* _______________________  🎯 *Confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>En ambos casos HAL afirma que una expresión condicional es verdadera cuando, evaluada con los datos reales, el antecedente resulta verdadero y el consecuente falso — la única combinación que hace falso un condicional.</details>

---

## Cierre — Autodiagnóstico

Marque su desempeño por serie:

| Serie | Sin dificultad | Con dudas | No logré resolver |
|---|:---:|:---:|:---:|
| Calentamiento | ☐ | ☐ | ☐ |
| Serie 1 | ☐ | ☐ | ☐ |
| Serie 2 | ☐ | ☐ | ☐ |
| Serie 3 | ☐ | ☐ | ☐ |
| Reto Final | ☐ | ☐ | ☐ |

**Contraste confianza vs. acierto**: revise sus niveles de confianza declarados en cada ítem contra si acertó o no al revelar la respuesta. Si marcó **Alto** en un ítem que falló, o **Bajo** en uno que acertó, esa es la señal más útil de todo este documento — indica un punto donde su percepción de dominio no coincide con su desempeño real, y merece repaso antes que cualquier ítem que ya sabía que le costaba.

---

## Hoja de fórmulas y conceptos clave

| Operador | Símbolo | Regla de oro |
|---|:---:|---|
| Negación | $\neg p$ | Invierte el valor. |
| Conjunción | $p\land q$ | Basta una falsedad para que todo sea $F$. |
| Disyunción | $p\lor q$ | Basta una verdad para que todo sea $V$. |
| Disyunción exclusiva | $p\oplus q$ | Valores diferentes dan $V$. |
| Condicional | $p\rightarrow q$ | Solo es $F$ cuando $V\rightarrow F$. |
| Bicondicional | $p\leftrightarrow q$ | $V$ cuando ambos coinciden. |

**Jerarquía** (mayor a menor prioridad): $\neg \;>\; \land \;>\; \lor \;>\; \oplus \;>\; \rightarrow \;>\; \leftrightarrow$
($\land, \lor, \oplus$ asocian a la izquierda; $\rightarrow, \leftrightarrow$ asocian a la derecha)

**Proceso de traducción, 3 pasos**: identificar conectores → definir variables → ensamblar fórmula.

**Correspondencia con Python** (Lógica y Representación I):

| Lógica | Python |
|:---:|:---:|
| $\land$ | `and` |
| $\lor$ | `or` |
| $\neg$ | `not` |
| $p \rightarrow q$ | `if (not p) or q:` |

---

## Solucionario

<details>
<summary><b>Presione aquí para ver todas las respuestas finales, por serie</b></summary>

**Calentamiento**: C1: (a) No proposición; (b) Proposición, $V$. C2: Compuesta. C3: $\neg, \land, \oplus$. C4: No — enunciado abierto.

**Serie 1**: S1-1: $V$. S1-2: $F$. S1-3: $V$. S1-4: $F$. S1-5: $V$. S1-6: $F$.

**Serie 2**: S2-1: $(f \lor \neg e) \rightarrow r$. S2-2: $\neg(a \land s)$. S2-3: $V$. S2-4: $V$. S2-5: $F$.

**Serie 3**: S3-1: $a \land \neg b$ / `a and not b`. S3-2: $V$ / `True`. S3-3: $V$ / `True`.

**Reto Final**: RF-1: $F$, HAL está equivocado. RF-2: mismo patrón que AE-35 — antecedente verdadero, consecuente falso.

</details>
