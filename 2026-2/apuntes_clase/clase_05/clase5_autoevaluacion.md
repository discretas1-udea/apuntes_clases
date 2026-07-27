---
layout: default
title: Autoevaluación Clase 06 - Validez de Argumentos
parent: Lógica Proposicional
nav_order: 61
math: mathjax
---

![Built with AI](https://img.shields.io/badge/Built%20with-AI-blue.svg)

# 📝 Autoevaluación — Validez de Argumentos e Inferencia

*Práctica de la Clase 06 · Matemáticas Discretas 1 · Universidad de Antioquia*
*[Volver a las notas de clase](clase6.md)*

---

Esta autoevaluación es para practicar **a mano**, como cuando estudia de un libro. Cada ítem incluye un espacio para escribir su intento y declarar su nivel de confianza *antes* de ver la respuesta. La respuesta que se revela es **solo el resultado final** — el desarrollo completo lo debe construir usted; esa construcción es justamente lo que se evalúa en un parcial.

> [!TIP]
> **Cómo aprovechar esta práctica.** Resuelva cada ítem completo antes de desplegar la respuesta. Si su resultado coincide, verifique igual que su *procedimiento* fue correcto (una respuesta correcta por un camino equivocado no sirve en el parcial). Si no coincide, no mire el desarrollo de inmediato: vuelva a intentarlo.

---

## 🔥 Calentamiento

Reconocimiento rápido de conceptos. Un concepto por ítem.

**Ítem 1.** Clasifique cada enunciado como una afirmación sobre **verdad** (de una proposición) o sobre **validez** (de un argumento):

- (i) *"Medellín es la capital de Colombia."*
- (ii) *"De las premisas se sigue necesariamente la conclusión."*
- (iii) *"El argumento tiene la forma del Modus Ponens."*

> ✍️ *Antes de ver la respuesta: escriba aquí su clasificación de (i), (ii) y (iii).*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>(i) Verdad — (ii) Validez — (iii) Validez.</details>

---

**Ítem 2.** En el siguiente argumento, identifique cuáles enunciados son premisas y cuál es la conclusión:

> *"Dado que el proceso no terminó, y considerando que si un proceso no termina el sistema queda bloqueado, se sigue que el sistema quedó bloqueado."*

> ✍️ *Antes de ver la respuesta: marque premisas y conclusión.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Premisas: "el proceso no terminó" y "si un proceso no termina, el sistema queda bloqueado". Conclusión (marcada por *se sigue que*): "el sistema quedó bloqueado".</details>

---

**Ítem 3.** Nombre la regla de inferencia que corresponde a cada esquema:

- (i) $\ p\rightarrow q,\ \ \neg q\ \vdash\ \neg p$
- (ii) $\ p\land q\ \vdash\ p$
- (iii) $\ p\lor q,\ \ \neg p\ \vdash\ q$

> ✍️ *Antes de ver la respuesta: escriba el nombre de cada regla.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>(i) Modus Tollens — (ii) Simplificación — (iii) Silogismo disyuntivo (Eliminación).</details>

---

**Ítem 4.** Escriba el argumento $\ p\rightarrow q,\ \ p\ \vdash\ q\ $ en sus otras dos notaciones (estándar vertical y condicional).

> ✍️ *Antes de ver la respuesta: escriba las dos notaciones.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Estándar: las dos premisas $p\rightarrow q$ y $p$ una sobre otra, línea, y $\therefore\ q$. Condicional: $\bigl[(p\rightarrow q)\land p\bigr]\rightarrow q$.</details>

---

## Serie 1 — Repeticiones básicas

Un paso de método por ítem.

**Ítem 5.** Determine, con una tabla de verdad, si es válido: $\ p\rightarrow q,\ \ p\ \vdash\ q$.

> ✍️ *Antes de ver la respuesta: construya la tabla e identifique los renglones críticos.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Válido (es Modus Ponens). El único renglón crítico es $p=1,q=1$, y allí la conclusión es verdadera.</details>

---

**Ítem 6.** Determine, con una tabla de verdad, si el siguiente argumento es válido o es una falacia. Si es falacia, indique el renglón crítico que lo prueba: $\ p\rightarrow q,\ \ \neg p\ \vdash\ \neg q$.

> ✍️ *Antes de ver la respuesta: construya la tabla.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>No válido — falacia de <em>negar el antecedente</em>. Renglón crítico que lo prueba: $p=0,\ q=1$ (premisas $p\rightarrow q=1$ y $\neg p=1$ verdaderas, pero conclusión $\neg q=0$ falsa).</details>

---

**Ítem 7.** Derive la conclusión: $\ p\rightarrow q,\ \ p\ \vdash\ q$. (Escriba la tabla Afirmación–Razón.)

> ✍️ *Antes de ver la respuesta: escriba la derivación.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$q$, por Modus Ponens sobre las dos premisas.</details>

---

**Ítem 8.** Derive: $\ p\rightarrow q,\ \ \neg q\ \vdash\ \neg p$.

> ✍️ *Antes de ver la respuesta: escriba la derivación.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\neg p$, por Modus Tollens sobre las dos premisas.</details>

---

**Ítem 9.** Derive: $\ p\lor q,\ \ \neg p\ \vdash\ q$.

> ✍️ *Antes de ver la respuesta: escriba la derivación.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$q$, por Silogismo disyuntivo (Eliminación) sobre las dos premisas.</details>

---

## Serie 2 — Aplicación combinada

Cadenas de varios pasos. Aquí ya no basta una sola regla: hay que encadenar.

**Ítem 10.** Demuestre que es válido: $\ p\rightarrow q,\ \ q\rightarrow r,\ \ r\rightarrow s,\ \ p\ \vdash\ s$.

> ✍️ *Antes de ver la respuesta: escriba la derivación completa.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Válido. Se obtiene $s$ encadenando tres Modus Ponens (o dos Silogismos hipotéticos y un Modus Ponens final).</details>

---

**Ítem 11.** Demuestre que es válido: $\ p\lor q,\ \ p\rightarrow r,\ \ q\rightarrow s,\ \ \neg r\ \vdash\ s$.

> ✍️ *Antes de ver la respuesta: escriba la derivación completa.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Válido. Conclusión $s$: de $p\rightarrow r$ y $\neg r$ sale $\neg p$ (Modus Tollens); con $p\lor q$ sale $q$ (Eliminación); con $q\rightarrow s$ sale $s$ (Modus Ponens).</details>

---

**Ítem 12.** Demuestre que es válido, usando una **ley de equivalencia de la Clase 5** en algún paso: $\ \neg(p\lor q),\ \ r\rightarrow p\ \vdash\ \neg r$.

> ✍️ *Antes de ver la respuesta: escriba la derivación completa.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Válido. De $\neg(p\lor q)$, por De Morgan, sale $\neg p\land\neg q$; por Simplificación, $\neg p$; con $r\rightarrow p$ y $\neg p$, por Modus Tollens, se concluye $\neg r$.</details>

---

**Ítem 13.** Demuestre que es válido: $\ (p\land q)\rightarrow r,\ \ \neg r,\ \ p\ \vdash\ \neg q$.

> ✍️ *Antes de ver la respuesta: escriba la derivación completa.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Válido. De $(p\land q)\rightarrow r$ y $\neg r$, por Modus Tollens, sale $\neg(p\land q)$; por De Morgan, $\neg p\lor\neg q$; con $p$ (es decir $\neg(\neg p)$), por Eliminación, se concluye $\neg q$.</details>

---

**Ítem 14.** Traduzca a lenguaje formal y demuestre la validez:

> *"Si el backup se ejecutó, los datos están a salvo. Los datos no están a salvo. O el backup se ejecutó o se activó el modo de solo lectura. Si se activó el modo de solo lectura, se notificó al administrador. Por lo tanto, se notificó al administrador."*

> ✍️ *Antes de ver la respuesta: defina proposiciones, formalice y demuestre.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Con $b$: el backup se ejecutó; $d$: los datos están a salvo; $m$: se activó el modo solo lectura; $n$: se notificó al administrador. Formal: $b\rightarrow d,\ \neg d,\ b\lor m,\ m\rightarrow n\ \vdash\ n$. Válido: de $b\rightarrow d$ y $\neg d$ sale $\neg b$ (Modus Tollens); con $b\lor m$ sale $m$ (Eliminación); con $m\rightarrow n$ sale $n$ (Modus Ponens).</details>

---

## Serie 3 — Entrenamiento cruzado

Estos ítems conectan la Clase 06 con temas anteriores del curso.

**Ítem 15.** *(Puente con Clase 03 — traducción y forma simbólica.)* Traduzca el siguiente argumento a forma simbólica estándar (defina las proposiciones), y demuestre su validez:

> *"Si el usuario inicia sesión, se crea un token. Si se crea un token, se registra en la auditoría. El usuario inició sesión. Por lo tanto, se registra en la auditoría."*

> ✍️ *Antes de ver la respuesta: formalice y demuestre.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Con $s$: inicia sesión; $t$: se crea token; $a$: se registra en auditoría. Formal: $s\rightarrow t,\ t\rightarrow a,\ s\ \vdash\ a$. Válido: $t$ por Modus Ponens (de $s\rightarrow t$ y $s$), luego $a$ por Modus Ponens (de $t\rightarrow a$ y $t$). También sirve Silogismo hipotético para obtener $s\rightarrow a$ y luego Modus Ponens.</details>

---

**Ítem 16.** *(Puente con Clase 05 — leyes de equivalencia dentro de una derivación.)* La premisa $\neg p\lor q$ no es directamente un condicional. Use la ley que la convierte en uno y demuestre: $\ \neg p\lor q,\ \ p\ \vdash\ q$.

> ✍️ *Antes de ver la respuesta: escriba la derivación completa.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Válido. Por la ley de Implicación, $\neg p\lor q\equiv p\rightarrow q$. Con $p\rightarrow q$ y $p$, por Modus Ponens, se concluye $q$.</details>

---

**Ítem 17.** *(Puente con Clase 03 — tautología y el criterio de validez.)* Se afirma que "un argumento es válido si y solo si su forma condicional es una tautología". Para el argumento $\ p\rightarrow q,\ \ p\ \vdash\ q$, escriba su forma condicional y clasifíquela como tautología, contradicción o contingencia. ¿Qué dice esto sobre la validez del argumento?

> ✍️ *Antes de ver la respuesta: escriba la condicional y clasifíquela.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>La forma condicional es $\bigl[(p\rightarrow q)\land p\bigr]\rightarrow q$, que es una <strong>tautología</strong> (verdadera en las cuatro filas). Como la condicional es tautología, el argumento es válido — es precisamente el criterio de la Clase 06.</details>

---

## 🐛 Reto Final — Depuración en producción

Dos casos aplicados de cacería de errores. La historia es solo el envoltorio: cada uno se resuelve con las herramientas formales de la clase. Formalice, demuestre y responda.

**Ítem 18.** Un equipo investiga por qué una página no carga. Confirman en los *logs*:

- *"Si el CDN respondió, la página cargó."*
- *"La página no cargó."*
- *"O respondió el CDN o se sirvió desde el origen."*
- *"Si se sirvió desde el origen, se registró una petición al servidor central."*
- *"Si se registró una petición al servidor central, aumentó la latencia."*

¿Qué se puede concluir con certeza sobre la latencia? Formalice y demuestre.

> ✍️ *Antes de ver la respuesta: defina proposiciones, formalice y demuestre.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Con $c$: el CDN respondió; $g$: la página cargó; $o$: se sirvió desde el origen; $s$: se registró petición al servidor central; $l$: aumentó la latencia. Formal: $c\rightarrow g,\ \neg g,\ c\lor o,\ o\rightarrow s,\ s\rightarrow l\ \vdash\ l$. Conclusión: <strong>aumentó la latencia</strong> ($l$). Cadena: $\neg c$ (Modus Tollens de $c\rightarrow g,\ \neg g$); $o$ (Eliminación de $c\lor o,\ \neg c$); $s$ (Modus Ponens de $o\rightarrow s,\ o$); $l$ (Modus Ponens de $s\rightarrow l,\ s$).</details>

---

**Ítem 19.** Otro incidente. Se sabe:

- *"El despliegue se completó."*
- *"Si el despliegue se completó, la versión nueva quedó activa."*
- *"O se limpió la caché o falló el healthcheck."*
- *"Si falló el healthcheck, la versión nueva no quedó activa."*

¿Se puede concluir que se limpió la caché? Formalice y demuestre.

> ✍️ *Antes de ver la respuesta: defina proposiciones, formalice y demuestre.*
>
> _______________________

> 🎯 *Nivel de confianza*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Con $d$: el despliegue se completó; $v$: la versión nueva quedó activa; $c$: se limpió la caché; $h$: falló el healthcheck. Formal: $d,\ d\rightarrow v,\ c\lor h,\ h\rightarrow\neg v\ \vdash\ c$. Sí: <strong>se limpió la caché</strong> ($c$). Cadena: $v$ (Modus Ponens de $d,\ d\rightarrow v$); $\neg h$ (Modus Tollens de $h\rightarrow\neg v$ y $v$, ya que $v=\neg(\neg v)$); $c$ (Eliminación de $c\lor h,\ \neg h$).</details>

---

## ✅ Cierre — Autodiagnóstico

Marque, con honestidad, cómo le fue en cada bloque. Use tanto si acertó como el nivel de confianza que declaró antes de ver cada respuesta — la combinación revela dónde estudiar.

| Bloque | Lo resolví sin dificultad | Dudé pero llegué | Necesito repasar | Tema de la Clase 06 a repasar |
|:---|:---:|:---:|:---:|:---|
| Calentamiento | ☐ | ☐ | ☐ | Verdad vs. validez, notaciones, nombres de reglas (Parte I, III.3) |
| Serie 1 | ☐ | ☐ | ☐ | Tablas de verdad y reglas de un paso (Parte II, III.3) |
| Serie 2 | ☐ | ☐ | ☐ | Encadenar reglas; derivaciones largas (Ejercicios resueltos) |
| Serie 3 | ☐ | ☐ | ☐ | Traducción, leyes de Clase 5 en derivaciones, criterio tautología↔validez |
| Reto Final | ☐ | ☐ | ☐ | Formalizar un caso y demostrar de punta a punta |

> [!TIP]
> **Señal de alerta útil.** Si en algún ítem declaró confianza **Alta** pero la respuesta no coincidió, ese es el punto más importante para repasar: no es que no sepa el tema, es que cree saberlo y no es así — el tipo de error que más cuesta en un parcial.

## 📌 Hoja de fórmulas y conceptos clave

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

**Dos falacias (NO son reglas)**: afirmar el consecuente ($p\rightarrow q,\ q\not\vdash p$) y negar el antecedente ($p\rightarrow q,\ \neg p\not\vdash\neg q$).

**Leyes de Clase 5 útiles en derivaciones**: Implicación ($p\rightarrow q\equiv\neg p\lor q$), De Morgan, Doble negación, Contrarrecíproco — se usan como pasos intermedios para dejar las premisas en una forma sobre la que sí opera una regla de inferencia.

---

*[Volver a las notas de clase](clase6.md)*
