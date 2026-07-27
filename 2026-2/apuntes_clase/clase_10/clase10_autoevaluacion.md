![Built with AI](https://img.shields.io/badge/Built%20with-AI-blue.svg)

# 🐛 Autoevaluación — Clase 10
### Formas Aristotélicas y Reglas de Inferencia Cuantificacionales
*Matemáticas Discretas 1 · Universidad de Antioquia · Ingeniería de Sistemas*

⬅️ Basado en [Clase 10 — Expediente Depuración: Probar Casos no es Demostrar Siempre](clase10.md)

---

Este bloque es práctica nueva: ningún ítem repite los Ejemplos 1-3, los Ejercicios 4-9 ni los Ejercicios propuestos P1-P12 de `clase10.md` — todos usan escenarios distintos, aunque varios ejerciten exactamente los mismos patrones de razonamiento.

Cada ítem sigue el mismo formato: intente resolverlo a mano por completo, escriba aquí solo su resultado final, declare qué tan seguro está, y solo entonces revele la respuesta.

> [!NOTE]
> Este documento sigue el patrón de respuesta dentro de cada ítem (intento + confianza + respuesta final), el mismo usado en `clase6_autoevaluacion.md` — no incluye un Solucionario consolidado aparte al final. El desarrollo completo, paso a paso, de los ítems de Serie 2 en adelante está disponible para el profesor en `verificacion_clase10_autoevaluacion.md`.

---

## Calentamiento

*Un solo paso — reconocer la forma o aplicar una regla una única vez.*

**Ítem 1**
Clasifique según su forma aristotélica y formalice: *"Todo servidor de respaldo enciende automáticamente ante una falla."* Use $servidorRespaldo(x)$, $enciendeAutomatico(x)$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Forma <b>A</b>. $\forall x\ \bigl(servidorRespaldo(x)\rightarrow enciendeAutomatico(x)\bigr)$</details>

**Ítem 2**
Clasifique según su forma aristotélica y formalice: *"Algún dispositivo IoT del laboratorio está fuera de línea."* Use $dispositivoIoT(x)$, $fueraDeLinea(x)$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Forma <b>I</b>. $\exists x\ \bigl(dispositivoIoT(x)\land fueraDeLinea(x)\bigr)$</details>

**Ítem 3**
Dada la premisa $\forall x\ \bigl(app(x)\rightarrow requierePermiso(x)\bigr)$, aplique Instanciación universal para el objeto concreto $\text{Calendario}$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$app(\text{Calendario})\rightarrow requierePermiso(\text{Calendario})$</details>

**Ítem 4**
Dado el hecho concreto $seguro(\text{Nodo7})$, aplique Generalización existencial.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\exists x\ seguro(x)$</details>

---

## Serie 1 — Repeticiones básicas

*Aplicación directa de una sola regla o forma, con un paso adicional de justificación cuando corresponde.*

**Ítem 5**
Clasifique según su forma aristotélica y formalice: *"Ningún archivo sin respaldo puede eliminarse de forma segura."* Use $archivo(x)$, $tieneRespaldo(x)$, $eliminableSeguro(x)$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Forma <b>E</b>, sobre el sujeto compuesto "archivo sin respaldo". $\forall x\ \Bigl(\bigl(archivo(x)\land\neg tieneRespaldo(x)\bigr)\rightarrow\neg eliminableSeguro(x)\Bigr)$</details>

**Ítem 6**
Clasifique según su forma aristotélica y formalice: *"Algún proceso en segundo plano no libera memoria correctamente."* Use $proceso(x)$, $liberaMemoria(x)$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Forma <b>O</b>. $\exists x\ \bigl(proceso(x)\land\neg liberaMemoria(x)\bigr)$</details>

**Ítem 7**
El siguiente argumento, ¿es válido? Justifique.
$$\begin{aligned}&1.\ \ rindeBien(\text{EquipoA}) &&\text{Premisa}\\ &2.\ \ \forall x\ \ rindeBien(x) &&\text{"Generalización universal" en 1}\end{aligned}$$

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Inválido. $\text{EquipoA}$ es un objeto específico nombrado en la premisa, no arbitrario; Generalización universal exige que el objeto no dependa de ninguna suposición particular previa.</details>

**Ítem 8**
En una demostración ya tiene, en un paso anterior, $\exists x\ error(x)$ instanciado como $error(bugA)$. Ahora aparece la premisa $\exists x\ \bigl(error(x)\land x\neq bugA\bigr)$. Al aplicar Instanciación existencial sobre esta nueva premisa, ¿puede el testigo llamarse también $bugA$? Si no, ¿cómo debería llamarse?

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>No. $bugA$ ya fue fijado como testigo en el paso anterior; el testigo de esta nueva existencial debe ser un nombre genuinamente nuevo, por ejemplo $bugB$.</details>

**Ítem 9**
Dadas las premisas *"Todo endpoint documentado pasa la revisión de API"* y *"El endpoint `/checkout` no pasa la revisión de API"*, demuestre en Afirmación-Razón que *"el endpoint `/checkout` no está documentado"*.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\neg documentado(\text{/checkout})$ — el endpoint <code>/checkout</code> no está documentado.</details>

---

## Serie 2 — Aplicación combinada

*Cadenas de 2 o más pasos que combinan varias de las reglas de la Parte V con reglas proposicionales.*

**Ítem 10**
Dadas las premisas *"Alguien en el equipo de soporte domina Kubernetes"* y *"Todo el que domina Kubernetes puede resolver incidentes de nivel 3"*, demuestre que *"alguien en el equipo de soporte puede resolver incidentes de nivel 3"*.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\exists x\ \bigl(soporte(x)\land resuelveNivel3(x)\bigr)$</details>

**Ítem 11**
Dadas las premisas: (a) *"Todo paquete de red llega, se pierde o se retransmite"*; (b) *"el paquete $p_7$ no se pierde"*; (c) *"el paquete $p_7$ no se retransmite"*. Deduzca *"el paquete $p_7$ llega"*.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$llega(p_7)$</details>

**Ítem 12**
El siguiente argumento es **inválido**. Identifique cuál paso viola una restricción de la Parte V y explique por qué:
$$\begin{aligned}&1.\ \ \exists x\ sospechoso(x) &&\text{Premisa}\\ &2.\ \ sospechoso(testigo1) &&\text{Instanciación existencial en 1}\\ &3.\ \ \forall x\ sospechoso(x) &&\text{"Generalización universal" en 2}\end{aligned}$$

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>El paso 3 es inválido. $testigo1$ es exactamente el objeto que Instanciación existencial introdujo en el paso 2 — el testigo garantizado por la existencial, no un objeto arbitrario. Generalización universal exige arbitrariedad genuina, no un testigo ya fijado por otra regla.</details>

**Ítem 13**
Dadas las premisas: (a) *"Todo servidor está activo o en mantenimiento"*; (b) *"Todo servidor sin certificado no está activo"*; (c) *"Existe un servidor sin mantenimiento o con alerta"*. Deduzca $\exists x\ \bigl(certificado(x)\lor alerta(x)\bigr)$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\exists x\ \bigl(certificado(x)\lor alerta(x)\bigr)$ — se deduce por una cadena de resolución; vea la razón completa, si la necesita, con su profesor.</details>

**Ítem 14**
Explique, en sus propias palabras: cuando una premisa existencial y una premisa universal comparten la misma variable, ¿por qué hay que instanciar primero la existencial (Instanciación existencial) y no al revés?

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Porque el testigo que Instanciación existencial introduce debe fijarse primero como una constante concreta; solo después de tener ese testigo fijo tiene sentido instanciar las premisas universales exactamente en ese mismo objeto, para poder combinarlas con reglas proposicionales. Si se instanciara primero la universal con un objeto genérico distinto del testigo existencial, las dos premisas hablarían de objetos distintos y no podrían combinarse.</details>

---

## Serie 3 — Entrenamiento cruzado

*Mezcla explícita con Parte II de `clase10.md` (equivalencias y reglas de inferencia proposicionales, originadas en Clase 5-6) y Parte III (equivalencias cuantificacionales, originadas en Clase 9) — el propio documento de Clase 10 ya las trae como repaso; aquí se ejercitan.*

**Ítem 15**
Simplifique, aplicando Leyes de Morgan y Doble negación: $\neg(\neg p\land q)$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$p\lor\neg q$</details>

**Ítem 16**
Dadas las premisas $p\lor q$, $\neg p$, $q\rightarrow r$, deduzca $r$ (indique qué regla de inferencia proposicional usa en cada paso).

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$r$</details>

**Ítem 17**
Reescriba, aplicando primero De Morgan cuántico y luego Leyes de Morgan: $\neg\exists x\ \bigl(seguro(x)\land estable(x)\bigr)$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\forall x\ \bigl(\neg seguro(x)\lor\neg estable(x)\bigr)$</details>

**Ítem 18**
Dadas las premisas: (a) $\neg\exists x\ \neg disponible(x)$; (b) $\forall x\ \bigl(disponible(x)\rightarrow puedeAtender(x)\bigr)$. Demuestre $puedeAtender(\text{Marco})$. (Ayuda: el primer paso no es de la Parte V, sino de la Parte III.)

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$puedeAtender(\text{Marco})$</details>

---

## Reto Final — El Enigma del Bosque Blorpiter

*Caso aplicado, en formato de puzzle lógico al estilo de los que escribía Lewis Carroll (autor de* Alicia en el país de las maravillas*, y también de varios libros de silogismos con premisas disparatadas). El universo narrativo es nuevo — no continúa el hilo de Ana, Beto, Carla y Diego. La historia es solo el envoltorio del enunciado: se resuelve enteramente con las herramientas formales de hoy, sin pistas escondidas en el texto.*

**Ítem 19**

En el Bosque Blorpiter viven toda clase de criaturas imaginarias. Se sabe que:

- Todos los grifomorsos que maúllan de noche son luminiscentes.
- Ningún ser luminiscente teme a la niebla.
- Existe un grifomorso en el Bosque Blorpiter que maúlla de noche.

Use $grifomorso(x)$, $maullaDeNoche(x)$, $luminiscente(x)$, $temeNiebla(x)$, $enBosque(x)$. Demuestre, en Afirmación-Razón completa, que existe un ser en el Bosque Blorpiter que no teme a la niebla.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\exists x\ \bigl(enBosque(x)\land\neg temeNiebla(x)\bigr)$ — existe un ser en el Bosque Blorpiter que no teme a la niebla.</details>

---

## Cierre — Autodiagnóstico

Antes de continuar con el curso, complete esta tabla con honestidad — le sirve a usted, no al profesor.

| Bloque | Ítems totales | Con confianza Alta | Con confianza Media | Con confianza Baja | ¿Repasar antes de seguir? |
|:---|:---:|:---:|:---:|:---:|:---:|
| Calentamiento | 4 | | | | |
| Serie 1 | 5 | | | | |
| Serie 2 | 5 | | | | |
| Serie 3 | 4 | | | | |
| Reto Final | 1 | | | | |

> [!TIP]
> Si en alguna fila 2 o más ítems quedaron en confianza **Baja**, vuelva a esa parte de `clase10.md` antes de seguir a la próxima clase — no antes de haber intentado resolver de nuevo el ítem con el que tuvo dificultad. Un acierto con confianza Baja también es una señal de alerta: significa que llegó a la respuesta correcta sin estar seguro del procedimiento, y vale la pena repasar igual.

---

## Hoja de fórmulas y conceptos clave

*Referencia ultra-compacta. Extiende la Ficha de bolsillo de `clase10.md` con lo que la Serie 3 agregó.*

**De Clase 10 (Parte I y V):**

| Concepto | Forma | Restricción |
|:---|:---|:---|
| Formas aristotélicas | A: $\forall(S\rightarrow P)$ · E: $\forall(S\rightarrow\neg P)$ · I: $\exists(S\land P)$ · O: $\exists(S\land\neg P)$ | $\forall$ con $\rightarrow$, $\exists$ con $\land$ — nunca al revés |
| Instanciación universal (UI) | $\forall x\ P(x)\ \therefore P(c)$ | Ninguna |
| Generalización universal (UG) | $P(c)\ \therefore \forall x\ P(x)$ | $c$ debe ser genuinamente arbitrario |
| Instanciación existencial (EI) | $\exists x\ P(x)\ \therefore P(c)$ | $c$ debe ser un nombre nuevo |
| Generalización existencial (EG) | $P(c)\ \therefore \exists x\ P(x)$ | Ninguna |
| Orden típico | EI primero → UI en el mismo testigo → UG o EG al cerrar | — |

**De Clase 5-6 (repasado en Serie 3):**

| Nombre | Equivalencia / Regla |
|:---|:---|
| Leyes de Morgan | $\neg(P\land Q)\equiv\neg P\lor\neg Q$ &nbsp;&nbsp; $\neg(P\lor Q)\equiv\neg P\land\neg Q$ |
| Doble negación | $\neg(\neg P)\equiv P$ |
| Implicación | $P\rightarrow Q\equiv\neg P\lor Q$ |
| Contrarrecíproco | $P\rightarrow Q\equiv\neg Q\rightarrow\neg P$ |
| Silogismo disyuntivo | $p\lor q,\ \neg p\ \therefore q$ |
| Resolución | $\neg p\lor r,\ p\lor q\ \therefore q\lor r$ |
| Modus Ponens / Modus Tollens | $p\rightarrow q, p\ \therefore q$ &nbsp;&nbsp; $p\rightarrow q,\neg q\ \therefore \neg p$ |

**De Clase 9 (repasado en Serie 3):**

| Nombre | Equivalencia |
|:---|:---|
| De Morgan cuántico | $\neg\forall x\ P(x)\equiv\exists x\ \neg P(x)$ &nbsp;&nbsp; $\neg\exists x\ P(x)\equiv\forall x\ \neg P(x)$ |

## Referencias

- **[Clase 10](clase10.md)**: notas de clase completas — formas aristotélicas y reglas de inferencia con cuantificadores.
- **[Clase 6](clase6.md)**: reglas de inferencia proposicionales, formato Afirmación-Razón.
- **[Clase 9](clase9.md)**: equivalencias cuantificacionales, con derivación completa.
