# 🧭 Autoevaluación — El Caso del Broche de Zafiro
### Equivalencia Lógica, Leyes de De Morgan, Variantes del Condicional y Condiciones de Necesidad y Suficiencia

*Autoevaluación — Matemáticas Discretas 1 · Universidad de Antioquia · Ingeniería de Sistemas*
*Documento de la clase: [clase4_caso_broche_zafiro.md](clase4_caso_broche_zafiro.md)*

---

> [!NOTE]
> **Cómo usar este documento**: cada ítem tiene un espacio para que escriba su intento completo **antes** de revelar la respuesta, y una escala de confianza. No omita ese paso — es la parte que realmente entrena la memoria, no un adorno. Las respuestas reveladas muestran **solo el resultado final**, como el apéndice de un libro; si necesita repasar el procedimiento paso a paso, vuelva a los Ejercicios resueltos de la clase.

---

# Calentamiento

**Ítem C1**
Según la definición de equivalencia lógica (Parte I.1), ¿qué debe cumplir la proposición $p\leftrightarrow q$ para poder afirmar que $p$ y $q$ son equivalentes?

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Debe ser una tautología (verdadera para toda combinación de valores de $p$ y $q$).</details>

**Ítem C2**
Dado el condicional "Si el archivo está corrupto, entonces la descarga falla" ($c\rightarrow f$), escriba únicamente su **recíproco**.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$f\rightarrow c$ ("Si la descarga falla, entonces el archivo está corrupto").</details>

**Ítem C3**
Clasifique: *"Ser ciudadano es necesario para votar."*

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Necesaria, no suficiente (ser ciudadano no garantiza votar — también hace falta estar registrado, ser mayor de edad, etc.).</details>

**Ítem C4**
Identifique el conector lógico principal de: *"El backup se ejecuta a menos que el disco esté lleno."*

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Disyunción (el patrón "a menos que" se traduce como $\lor$, o de forma equivalente como condicional — Parte IV.1).</details>

**Ítem C5**
Según la tabla de referencia de la Parte V, ¿qué ley del álgebra de proposiciones afirma que $p\land(p\lor q)\equiv p$?

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Ley de Absorción.</details>

---

# Serie 1 — Repeticiones básicas

**Ítem S1.1**
Demuestre, con tabla de verdad, que $\neg(p\lor\neg q)\equiv\neg p\land q$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Son equivalentes. Ambas columnas dan $(0,0,1,0)$ para $(p,q)=(1,1),(1,0),(0,1),(0,0)$.</details>

**Ítem S1.2**
Dado "Si el motor arranca, entonces la batería está cargada" ($m\rightarrow b$), escriba el recíproco, el contrarrecíproco y el contrario, e indique cuál es lógicamente equivalente al original.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Recíproco: $b\rightarrow m$. Contrarrecíproco: $\neg b\rightarrow\neg m$. Contrario: $\neg m\rightarrow\neg b$. El equivalente al original es el <strong>contrarrecíproco</strong>.</details>

**Ítem S1.3**
Clasifique: *"Tener más de 10 años de experiencia es suficiente para ser promovido a director."*

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Suficiente, no necesaria (el enunciado no cierra la puerta a otras vías de promoción, por ejemplo desempeño excepcional).</details>

**Ítem S1.4**
Aplique la prueba del contraejemplo: $p$: "el número es múltiplo de 15", $q$: "el número es múltiplo de 3". ¿Es $p$ suficiente para $q$? ¿Es necesaria?

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Suficiente (todo múltiplo de 15 es múltiplo de 3, no existe contraejemplo). No necesaria (contraejemplo: 6 es múltiplo de 3 pero no de 15).</details>

**Ítem S1.5**
Aplique la receta de "a menos que": *"No podré terminar el proyecto a tiempo, a menos que trabaje el fin de semana."*

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Sea $p$: "termino el proyecto a tiempo", $s$: "trabajo el fin de semana". Resultado: $p\rightarrow s$ ("Si termino el proyecto a tiempo, entonces trabajé el fin de semana").</details>

---

# Serie 2 — Aplicación combinada

**Ítem S2.1**
"El préstamo se aprueba si el solicitante tiene historial crediticio limpio y garantía suficiente." Traduzca la proposición y clasifique si "tener historial limpio y garantía suficiente" es necesaria, suficiente o ambas para "el préstamo se aprueba".

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Traducción: $(h\land g)\rightarrow a$. Clasificación: suficiente, no necesaria (podría haber otras vías de aprobación no mencionadas).</details>

**Ítem S2.2**
"El estudiante puede presentar el examen final solo si aprobó los talleres." Traduzca la proposición y escriba su contrarrecíproco.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Traducción: $p\rightarrow q$ ($p$: presenta el examen final; $q$: aprobó los talleres). Contrarrecíproco: $\neg q\rightarrow\neg p$ ("Si no aprobó los talleres, entonces no puede presentar el examen final").</details>

**Ítem S2.3**
Demuestre, mediante cadena algebraica (no tabla), que $q\rightarrow p$ es equivalente a $\neg p\rightarrow\neg q$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$q\rightarrow p \equiv \neg q\lor p \equiv p\lor\neg q \equiv \neg(\neg p)\lor\neg q \equiv \neg p\rightarrow\neg q$ (definición, conmutativa, doble negación, definición inversa).</details>

**Ítem S2.4**
Dada la expresión $\neg t\rightarrow\neg r$ con $t$: "el termostato detecta temperatura alta" y $r$: "se activa el ventilador": (a) tradúzcala a lenguaje natural; (b) si esta expresión fuera una variante del condicional original $t\rightarrow r$, ¿de cuál variante se trata, y es equivalente al original?

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>(a) "Si el termostato no detecta temperatura alta, entonces el ventilador no se activa." (b) Es el <strong>contrario</strong> de $t\rightarrow r$ — <strong>no</strong> es equivalente al original (el contrario es equivalente al recíproco, no al original).</details>

**Ítem S2.5**
Traduzca: *"No es cierto que el pedido esté completo y haya sido pagado."* Luego aplique la Ley de Morgan correspondiente para reescribir la expresión sin la negación externa.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Traducción: $\neg(p\land g)$ ($p$: pedido completo; $g$: ha sido pagado). Por Morgan: $\neg p\lor\neg g$.</details>

---

# Serie 3 — Entrenamiento cruzado

> [!NOTE]
> Esta serie mezcla el contenido de esta clase con dos sesiones anteriores: **Clase 2** (*Proposición, Lenguaje Formal, Axiomas de Verdad y Jerarquía de Operadores*) y **Clase 3** (*Tablas de Verdad*).

**Ítem S3.1** *(Clase 3 + Clase 4)*
Usando el Protocolo de 6 pasos de la sesión de Tablas de Verdad, construya la tabla completa para verificar si $\neg(p\rightarrow q)$ es equivalente a $p\land\neg q$. Clasifique la columna del bicondicional entre ambas expresiones como tautología, contradicción o contingencia.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Son equivalentes ($\neg(p\rightarrow q)\equiv p\land\neg q$). La columna del bicondicional es siempre 1 → <strong>tautología</strong>, confirmando la equivalencia.</details>

**Ítem S3.2** *(Clase 2 + Clase 4)*
Si $(A\land B)\rightarrow\neg C$ es falsa, determine los valores de $A$, $B$ y $C$. Luego clasifique si $A\land B$ es condición necesaria o suficiente para $\neg C$ en esta regla.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Para que $(A\land B)\rightarrow\neg C$ sea falsa, se necesita $A\land B=V$ y $\neg C=F$: por lo tanto $A=V$, $B=V$, $C=V$. $A\land B$ es <strong>suficiente</strong> para $\neg C$ (por la estructura del condicional).</details>

**Ítem S3.3** *(Clase 2 + Clase 4)*
Aplique la "regla de oro" del condicional (Clase 2) para determinar si "Si $2+2=5$, entonces hoy es lunes" es verdadera o falsa. Luego escriba su contrarrecíproco y verifique que tiene el mismo valor de verdad.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Verdadera (antecedente falso, $2+2\neq5$, hace verdadero al condicional sin importar el consecuente). Contrarrecíproco: "Si hoy no es lunes, entonces $2+2\neq5$" — también verdadero, porque su consecuente ($2+2\neq5$) es siempre verdadero.</details>

**Ítem S3.4** *(Clase 3 + Clase 4)*
Traduzca: *"El sistema falla si y solo si no es cierto que el sistema no falla."* Luego construya su tabla de verdad y clasifíquela como tautología, contradicción o contingencia.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Traducción: $f\leftrightarrow\neg(\neg f)$, que equivale a $f\leftrightarrow f$. Es <strong>tautología</strong> (toda proposición es equivalente a sí misma, sin importar su valor).</details>

---

# Reto Final — Bletchley Park, 1941

> [!NOTE]
> **Contexto histórico (hechos verificados, no ficción)**: durante la Segunda Guerra Mundial, los analistas de Bletchley Park (Reino Unido) trabajaron para descifrar los mensajes cifrados por la máquina alemana Enigma. Alan Turing diseñó el *Bombe*, una máquina que descartaba configuraciones de rotores **por contradicción lógica**, no por fuerza bruta. Dos elementos reales de ese método son la base de este reto: (1) una propiedad mecánica del Enigma — nunca cifraba una letra en sí misma —, y (2) el uso de *cribs*, fragmentos de texto plano que los analistas sospechaban que aparecían en un mensaje (por ejemplo, partes meteorológicos con formato fijo). Este reto no atribuye diálogo ni palabras a ninguna persona real; formaliza, con las herramientas de esta clase, el tipo de razonamiento que documentan las fuentes históricas.

**Ítem RF1**
La propiedad histórica del Enigma —nunca cifra una letra en sí misma— puede formalizarse así: sea $V$: "la configuración de rotores es correcta", y $A$: "hay autocifrado (una letra coincide consigo misma) en alguna posición". La regla es $V\rightarrow\neg A$. Un analista prueba una configuración candidata y observa que **sí** hay autocifrado en una posición ($A$ es verdadero). Usando el contrarrecíproco de la regla, determine si la configuración puede ser correcta.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Contrarrecíproco de $V\rightarrow\neg A$: $A\rightarrow\neg V$. Como $A$ es verdadero, se concluye $\neg V$: la configuración <strong>no puede ser correcta</strong> — se descarta. (Así es, históricamente, como el Bombe eliminaba configuraciones.)</details>

**Ítem RF2**
Dos analistas revisan el mismo mensaje interceptado. Analista 1 propone: *"El mensaje comienza con un parte meteorológico y termina con la firma estándar"* ($m\land f$). Analista 2, con evidencia adicional, concluye: *"El mensaje no comienza con un parte meteorológico, o no termina con la firma estándar"* ($\neg m\lor\neg f$). Usando las Leyes de Morgan, determine si ambas conclusiones pueden ser ciertas al mismo tiempo.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>No pueden ser ciertas al mismo tiempo: por la primera Ley de Morgan, $\neg(m\land f)\equiv\neg m\lor\neg f$. La conclusión del Analista 2 es exactamente la negación de la del Analista 1 — son contradictorias, no complementarias. Se necesita evidencia adicional para determinar cuál es correcta.</details>

---

## Cierre — Autodiagnóstico

Antes de continuar con la próxima clase, complete esta tabla contando cuántos ítems marcó en cada nivel de confianza, por serie:

| Serie | Ítems en Alto | Ítems en Medio | Ítems en Bajo |
|---|:---:|:---:|:---:|
| Calentamiento (5) | ___ | ___ | ___ |
| Serie 1 (5) | ___ | ___ | ___ |
| Serie 2 (5) | ___ | ___ | ___ |
| Serie 3 (4) | ___ | ___ | ___ |
| Reto Final (2) | ___ | ___ | ___ |

> [!TIP]
> **Regla de repaso**: si alguna serie tiene 2 o más ítems marcados en "Bajo", repase esa subsección de `clase4_caso_broche_zafiro.md` (o, si es la Serie 3, la clase anterior correspondiente) antes de avanzar. Un ítem correcto con confianza "Bajo" es una alerta tan importante como un ítem incorrecto — indica que acertó sin estar seguro de por qué, lo cual no es sostenible en un parcial.

---

## Hoja de fórmulas y conceptos clave

*(Reutiliza y complementa la Ficha de bolsillo de `clase4_caso_broche_zafiro.md`; se agregan las referencias de Clase 2 y Clase 3 usadas en la Serie 3.)*

**Equivalencia**: $p\equiv q$ si $p\leftrightarrow q$ es tautología. Herramienta clave: $p\rightarrow q\equiv\neg p\lor q$.

**Morgan**: $\neg(p\land q)\equiv\neg p\lor\neg q$ · $\neg(p\lor q)\equiv\neg p\land\neg q$ (siempre invierte el conector).

**Variantes del condicional**: Original $p\to q$ ≡ Contrarrecíproco $\neg q\to\neg p$. Recíproco $q\to p$ ≡ Contrario $\neg p\to\neg q$. **Nunca** original ≡ recíproco.

**Necesidad/Suficiencia**: $p$ suficiente para $q$ ⟺ $p\to q$ verdadero. $p$ necesaria para $q$ ⟺ $q\to p$ verdadero. Ambas ⟺ $p\leftrightarrow q$. Prueba del contraejemplo: busque $p$V/$q$F para refutar suficiencia; $q$V/$p$F para refutar necesidad.

**Receta "a menos que"**: lo que sigue a "a menos que" → consecuente. El resto de la oración, negado → antecedente.

**— De Clase 2 —** Regla de oro del condicional: $p\to q$ solo es falso cuando $p=V$ y $q=F$. Jerarquía (mayor a menor prioridad): $\neg > \land > \lor > \oplus > \rightarrow > \leftrightarrow$ ($\land,\lor,\oplus$ asocian a la izquierda; $\rightarrow,\leftrightarrow$ a la derecha).

**— De Clase 3 —** Protocolo de 6 pasos: variables → filas ($2^n$) → columnas → columnas auxiliares → evaluar → validar. Clasificación: columna final toda $V$ → tautología; toda $F$ → contradicción; mezcla → contingencia.

---

## Solucionario completo

<details>
<summary><b>Calentamiento — Ver todas las respuestas</b></summary>

- **C1**: $p\leftrightarrow q$ debe ser una tautología.
- **C2**: $f\rightarrow c$.
- **C3**: Necesaria, no suficiente.
- **C4**: Disyunción.
- **C5**: Ley de Absorción.

</details>

<details>
<summary><b>Serie 1 — Ver todas las respuestas</b></summary>

- **S1.1**: Equivalentes — ambas columnas $(0,0,1,0)$.
- **S1.2**: Recíproco $b\to m$; Contrarrecíproco $\neg b\to\neg m$; Contrario $\neg m\to\neg b$; equivalente al original: el contrarrecíproco.
- **S1.3**: Suficiente, no necesaria.
- **S1.4**: Suficiente (sin contraejemplo); no necesaria (contraejemplo: 6).
- **S1.5**: $p\rightarrow s$.

</details>

<details>
<summary><b>Serie 2 — Ver todas las respuestas</b></summary>

- **S2.1**: $(h\land g)\rightarrow a$; suficiente, no necesaria.
- **S2.2**: $p\rightarrow q$; contrarrecíproco $\neg q\rightarrow\neg p$.
- **S2.3**: $q\to p \equiv \neg q\lor p \equiv p\lor\neg q \equiv \neg(\neg p)\lor\neg q \equiv \neg p\to\neg q$.
- **S2.4**: (a) "Si el termostato no detecta temperatura alta, entonces el ventilador no se activa." (b) Contrario; no equivalente al original.
- **S2.5**: $\neg(p\land g)$; por Morgan, $\neg p\lor\neg g$.

</details>

<details>
<summary><b>Serie 3 — Ver todas las respuestas</b></summary>

- **S3.1**: Equivalentes; columna del bicondicional es tautología.
- **S3.2**: $A=V$, $B=V$, $C=V$; $A\land B$ es suficiente para $\neg C$.
- **S3.3**: Ambas verdaderas (antecedente falso en la original; consecuente siempre verdadero en el contrarrecíproco).
- **S3.4**: $f\leftrightarrow\neg(\neg f)$; tautología.

</details>

<details>
<summary><b>Reto Final — Ver todas las respuestas</b></summary>

- **RF1**: Por el contrarrecíproco $A\rightarrow\neg V$, y $A$=verdadero, se concluye $\neg V$ — la configuración se descarta.
- **RF2**: No pueden ser ciertas ambas — son negación exacta la una de la otra (primera Ley de Morgan).

</details>
