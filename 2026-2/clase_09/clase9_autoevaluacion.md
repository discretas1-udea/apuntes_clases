# Autoevaluación — Clase 9: Cuantificadores Anidados, Alcance y Equivalencias

*Matemáticas Discretas 1 · Módulo 2: Lógica Cuantificacional (Lógica de Predicados)*
*Universidad de Antioquia · Ingeniería de Sistemas*

**[Volver a Clase 9](clase9.md)**

---

## Cómo usar este documento

Cada ítem sigue el mismo patrón: primero resuelva el procedimiento completo a mano y escriba su resultado, luego declare qué tan seguro está, y solo después revele la respuesta final (sin desarrollo, como el apéndice de un libro de texto). No se salte el paso de intento — es la parte que realmente entrena.

> [!NOTE]
> Este bloque **no repite** ningún ejercicio ya resuelto o propuesto en `clase9.md` (Ejercicios 1-13, las Preguntas 1-3 del Expediente Gallinero, ni P1-P10). Todos los ítems son práctica nueva sobre los mismos conceptos, con dominios y predicados distintos a los ya usados.

---

## Calentamiento

**Ítem 1**
En la fórmula $\exists x\ \bigl(P(x) \land R(x,y)\bigr)$, clasifique cada ocurrencia de $x$ y de $y$ como libre o ligada.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Las dos ocurrencias de $x$ (en $P(x)$ y en $R(x,y)$) son ligadas — ambas están dentro del alcance de $\exists x$. La ocurrencia de $y$ en $R(x,y)$ es libre — ningún cuantificador la introduce.</details>

**Ítem 2**
Sin resolver ningún ejemplo numérico: enuncie la condición exacta que deben cumplir dos fórmulas cuantificadas $S$ y $T$ para poder afirmar $S\equiv T$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Deben tener el mismo valor de verdad para cualquier predicado que se sustituya en ellas y para cualquier dominio del discurso que se elija — no basta con que coincidan en un solo ejemplo.</details>

**Ítem 3**
Aplique la regla de negación de cuantificadores (repaso de Clase 8) a $\neg\ \exists x\ tieneVirus(x)$, sin evaluar ningún dominio concreto.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\forall x\ \neg tieneVirus(x)$.</details>

---

## Serie 1 — Repeticiones básicas

**Ítem 4**
Considere estas dos fórmulas sobre el mismo dominio de estudiantes, con $inscrito(x)$ y $activo(x)$:

(a) $\forall x\ inscrito(x)\rightarrow activo(x)$ (sin paréntesis)

(b) $\forall x\ \bigl(inscrito(x) \rightarrow activo(x)\bigr)$ (con paréntesis)

Indique el alcance de $\forall x$ en cada una, y diga cuál de las dos deja una ocurrencia libre de $x$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>(a) El alcance de $\forall x$ es solo $inscrito(x)$ — la $x$ dentro de $activo(x)$ queda libre; la fórmula no es una proposición cerrada. (b) El alcance es todo el paréntesis; ambas ocurrencias de $x$ son ligadas.</details>

**Ítem 5**
Sea $U=\{D1,D2,D3\}$ (tres dispositivos IoT) y $sincroniza(x,y)$: "el dispositivo x sincroniza sus datos con el dispositivo y". Según los registros: $D1$ sincroniza con $D2$; $D2$ sincroniza con $D3$; $D3$ sincroniza con $D1$. Evalúe $\forall x\ \exists y\ sincroniza(x,y)$ y $\exists y\ \forall x\ sincroniza(x,y)$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\forall x\ \exists y\ sincroniza(x,y)$ es **verdadera** (cada dispositivo sincroniza con alguno, testigo distinto por dispositivo). $\exists y\ \forall x\ sincroniza(x,y)$ es **falsa** (ningún dispositivo recibe sincronización de los tres a la vez).</details>

**Ítem 6**
Al traducir "cada empleado tiene un supervisor" (con $supervisa(y,x)$: "y supervisa a x"), alguien escribió $\exists y\ \forall x\ supervisa(y,x)$. Identifique cuál de los dos errores frecuentes de la Parte II.2 se cometió, y corrija la traducción.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Error frecuente 2 — invertir el orden sin darse cuenta: la traducción dada dice "hay un supervisor común a todos los empleados", una afirmación mucho más fuerte. Corrección: $\forall x\ \exists y\ supervisa(y,x)$ — cada empleado con el suyo, no necesariamente el mismo.</details>

**Ítem 7**
Sea el dominio $\{-1,2,3\}$, $P(x)$: "x es positivo", $Q(x)$: "x es entero". Verifique, evaluando ambos lados por separado, si $\forall x\ (P(x)\land Q(x)) \equiv \forall x\ P(x) \land \forall x\ Q(x)$ se cumple en este caso.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Izquierda: en $x=-1$, $P(-1)\land Q(-1) = F\land V = F$, así que $\forall x(P(x)\land Q(x))$ es **falsa**. Derecha: $\forall x\ P(x)$ es falsa (falla en $-1$), $\forall x\ Q(x)$ es verdadera; $F\land V=$ **falsa**. Ambos lados coinciden en falso — la equivalencia se cumple también en este caso.</details>

**Ítem 8**
Proponga usted mismo(a) un contraejemplo (dominio y predicados propios, distintos a los usados en `clase9.md`) que muestre que $\forall x\ (P(x)\lor Q(x)) \not\equiv \forall x\ P(x) \lor \forall x\ Q(x)$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Respuesta de referencia (otras propuestas válidas también son correctas): dominio $\{6,7\}$, $P(x)$: "x es divisible entre 2", $Q(x)$: "x es divisible entre 7". $P(6)\lor Q(6)=V$, $P(7)\lor Q(7)=V$, así que $\forall x(P(x)\lor Q(x))$ es verdadera. Pero $\forall x\ P(x)$ es falsa (falla en 7) y $\forall x\ Q(x)$ es falsa (falla en 6), así que $\forall xP(x)\lor\forall xQ(x)$ es falsa. Verdadera $\neq$ falsa: no son equivalentes.</details>

---

## Serie 2 — Aplicación combinada

**Ítem 9**
Traduzca, usando el método de 5 pasos de la Parte III: "Todo cliente de la tienda ha comprado al menos un producto en oferta." Use $cliente(x)$, $producto(y)$, $oferta(y)$ y $comprado(x,y)$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\forall x\ \Bigl(cliente(x) \rightarrow \exists y\ \bigl(producto(y)\land oferta(y)\land comprado(x,y)\bigr)\Bigr)$.</details>

**Ítem 10**
Sea $U_{sensor}=\{S1,S2,S3\}$, $U_{servidor}=\{V1,V2\}$, y $reporta(x,y)$: "el sensor x reporta datos al servidor y". Según la tabla de configuración: $S1\to V1$, $S2\to V1$, $S3\to V2$. Evalúe $\forall x\ \exists y\ reporta(x,y)$ y $\exists y\ \forall x\ reporta(x,y)$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\forall x\ \exists y\ reporta(x,y)$ es **verdadera** (cada sensor reporta a alguno). $\exists y\ \forall x\ reporta(x,y)$ es **falsa** ($V1$ solo cubre $S1,S2$; $V2$ solo cubre $S3$; ningún servidor recibe de los tres).</details>

**Ítem 11**
Un letrero mal formalizado quedó como $\forall x\ entregoCarnet(x) \lor pagoMulta(x) \rightarrow puedeRetirar(x)$. (a) Identifique qué tipo de ambigüedad de la Parte V afecta a esta fórmula, apoyándose en la Parte I. (b) Reescríbala con paréntesis para que exprese "para todo estudiante, si entregó el carnet o pagó la multa, entonces puede retirar un libro".

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>(a) Ambigüedad de alcance: sin paréntesis, $\forall x$ solo gobierna $entregoCarnet(x)$ (Parte I.1); las ocurrencias de $x$ en $pagoMulta(x)$ y $puedeRetirar(x)$ quedarían libres. (b) $\forall x\ \Bigl(\bigl(entregoCarnet(x) \lor pagoMulta(x)\bigr) \rightarrow puedeRetirar(x)\Bigr)$.</details>

**Ítem 12**
Dominio: los estudiantes becados de este semestre (ya filtrado). Traduzca "todos son responsables y puntuales" como $\forall x\ (responsable(x)\land puntual(x))$, y luego aplique la Parte IV.3 para separarla en dos cuantificaciones independientes unidas por $\land$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\forall x\ (responsable(x)\land puntual(x)) \equiv \forall x\ responsable(x) \land \forall x\ puntual(x)$.</details>

**Ítem 13**
Dominio: los proyectos de un semillero de investigación, $colaboraCon(x,y)$: "x colabora con y". Traduzca, incluyendo una condición de distinción (como en la Parte II.3): "existe un proyecto cuyos colaboradores no colaboran entre sí". Luego explique bajo qué condición esta fórmula resultaría verdadera por vacuidad.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\exists x\ \forall y\ \forall z\ \bigl(colaboraCon(x,y)\land colaboraCon(x,z)\land y\neq z \rightarrow \neg colaboraCon(y,z)\bigr)$. Si el proyecto $x$ no tiene dos colaboradores distintos que cumplan a la vez $colaboraCon(x,y)$ y $colaboraCon(x,z)$, el antecedente nunca se satisface y la implicación es verdadera por vacuidad.</details>

---

## Serie 3 — Entrenamiento cruzado

*Mezcla con Clase 8 (unicidad anidada) y Clase 6 (De Morgan proposicional combinado con la negación cuantificacional).*

**Ítem 14**
Dominio de personas y de contactos. $primerContacto(x,y)$: "y es el contacto que primero le responde a x". Formalice "cada persona tiene un único contacto que le responde primero" usando $\exists!$ anidado dentro de $\forall x$ (Solución 1, Clase 8 + hoy), y luego escriba la versión expandida (Solución 2) sin usar el símbolo $\exists!$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Solución 1: $\forall x\ \exists!\ y\ primerContacto(x,y)$. Solución 2: $\forall x\ \exists y\ \Bigl(primerContacto(x,y) \land \forall z\ \bigl(z\neq y \rightarrow \neg primerContacto(x,z)\bigr)\Bigr)$.</details>

**Ítem 15**
Sea $U_{mesa}=\{Mesa1,Mesa2,Mesa3\}$ y $U_{mesero}=\{MeseroA,MeseroB\}$. La tabla de asignación es: $Mesa1\to MeseroA$, $Mesa2\to MeseroB$, $Mesa3\to MeseroA$ (cada mesa aparece con exactamente un mesero en la tabla). Evalúe $\forall x\ \exists!\ y\ atiende(y,x)$, verificando existencia y unicidad para cada una de las tres mesas.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>**Verdadera.** Cada mesa tiene existencia (aparece con un mesero asignado) y unicidad (aparece una sola vez en la tabla, con un solo mesero): $Mesa1$ con $MeseroA$ únicamente, $Mesa2$ con $MeseroB$ únicamente, $Mesa3$ con $MeseroA$ únicamente. Como se cumple para las tres mesas, $\forall x\ \exists!\ y\ atiende(y,x)$ es verdadera.</details>

**Ítem 16**
Niegue $\forall x\ \exists y\ \bigl(reporta(x,y)\land activo(y)\bigr)$ hasta que el $\neg$ quede pegado directamente a cada predicado atómico, aplicando la negación cuantificacional (Clase 8) dos veces y la ley de De Morgan (Clase 6) una vez.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\exists x\ \forall y\ \bigl(\neg reporta(x,y)\lor\neg activo(y)\bigr)$.</details>

**Ítem 17**
Niegue $\exists x\ \forall y\ \bigl(disponible(x,y)\lor enMantenimiento(x,y)\bigr)$ hasta que el $\neg$ quede pegado directamente a cada predicado atómico, aplicando la negación cuantificacional (Clase 8) dos veces y la ley de De Morgan (Clase 6) una vez.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\forall x\ \exists y\ \bigl(\neg disponible(x,y)\land\neg enMantenimiento(x,y)\bigr)$.</details>

---

## 🛵 Reto Final — La ruta del domiciliario

*Este bloque aplica — no explica — los conceptos ya vistos. La narrativa es solo el envoltorio del enunciado; se resuelve exclusivamente con herramientas formales de `clase9.md`. Es un hilo nuevo, distinto al Expediente Gallinero (que quedó completamente cerrado en esta clase).*

Un domiciliario reparte pedidos en un barrio. Universo de clientes $U_{cliente}=\{C1,C2,C3,C4\}$ y universo de repartidores $U_{repartidor}=\{R1,R2\}$. Predicado $asignado(y,x)$: "el repartidor y tiene asignada la entrega al cliente x".

**Ítem 18**
Formalice y contraste las dos afirmaciones siguientes (sin evaluar todavía ninguna tabla): "cada cliente tiene un repartidor asignado" y "hay un repartidor que cubre a todos los clientes". Explique en una frase la diferencia de significado entre ambas.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>"Cada cliente tiene un repartidor asignado": $\forall x\in U_{cliente}\ \exists y\in U_{repartidor}\ asignado(y,x)$ — el testigo puede depender del cliente. "Hay un repartidor que cubre a todos los clientes": $\exists y\in U_{repartidor}\ \forall x\in U_{cliente}\ asignado(y,x)$ — un mismo repartidor, común a todos. La primera exige un responsable por cliente (posiblemente distintos); la segunda exige uno solo que cubra a todos a la vez, una afirmación mucho más fuerte.</details>

**Ítem 19**
La bitácora de asignaciones del día es: $C1\to R1$, $C2\to R1$, $C3\to R2$, $C4\to R1$. Evalúe las dos fórmulas del Ítem 18 con esta tabla. Luego, tome la que resulte falsa y niéguela hasta dejar el $\neg$ pegado a $asignado$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\forall x\ \exists y\ asignado(y,x)$ es **verdadera** (los cuatro clientes tienen repartidor). $\exists y\ \forall x\ asignado(y,x)$ es **falsa** ($R1$ cubre a $C1,C2,C4$ pero no a $C3$; $R2$ solo cubre a $C3$). Negando la falsa: $\neg\exists y\ \forall x\ asignado(y,x) \equiv \forall y\ \exists x\ \neg asignado(y,x)$ — "para cada repartidor existe al menos un cliente que no tiene asignado ese repartidor".</details>

> [!NOTE]
> **Moraleja.** La diferencia entre "cada cliente resuelto" y "un solo repartidor que resuelve todo" no es un tecnicismo — es exactamente la diferencia entre un servicio que funciona (aunque repartido entre varios) y uno que dependería de una sola persona disponible siempre.

---

## Cierre — Autodiagnóstico

No cuente solo aciertos ni solo confianza: para cada ítem, compare su respuesta escrita con la revelada y clasifíquela en una sola casilla de la matriz. La última columna es la más importante — un ítem incorrecto en el que usted declaró confianza Alta señala un concepto que cree dominar pero no domina; repáselo primero.

| Bloque | Ítems | Correcto + Confianza Alta | Correcto + Confianza Media/Baja | Incorrecto + Confianza Media/Baja | Incorrecto + Confianza Alta (¡atención!) | Repasar |
|:---|:---:|:---:|:---:|:---:|:---:|:---|
| Calentamiento | 3 | ___ | ___ | ___ | ___ | Partes I.3, IV.1, IV.2 |
| Serie 1 | 5 | ___ | ___ | ___ | ___ | Partes I.1, I.2, II.1, II.2, IV.3, IV.4 |
| Serie 2 | 5 | ___ | ___ | ___ | ___ | Partes III, II.1, V, IV.3, II.3 |
| Serie 3 — Cruzada | 4 | ___ | ___ | ___ | ___ | Clase 8 (unicidad anidada), Clase 6 (De Morgan) + IV.2 |
| Reto Final | 2 | ___ | ___ | ___ | ___ | Parte II (orden de cuantificadores) |

---

## Hoja de fórmulas y conceptos clave

| Concepto | Símbolo / fórmula | Lectura |
|:---|:---|:---|
| Alcance | La subfórmula que sigue al cuantificador, delimitada por paréntesis (o el átomo inmediato si no hay) | "Hasta dónde llega" el cuantificador |
| Libre vs. ligada | Ligada: dentro del alcance de su cuantificador. Libre: fuera de cualquier alcance | Solo se sustituye lo libre |
| Orden importa (tipos mixtos) | $\forall x\exists y\ P(x,y) \not\equiv \exists y\forall x\ P(x,y)$ | "Cada uno el suyo" vs. "al menos uno, común a todos" |
| Orden no importa (mismo tipo) | $\forall x\forall y\ P \equiv \forall y\forall x\ P$ ; $\exists x\exists y\ P\equiv\exists y\exists x\ P$ | Se puede reordenar libremente |
| Distribución válida | $\forall x(P\land Q)\equiv\forall xP\land\forall xQ$ ; $\exists x(P\lor Q)\equiv\exists xP\lor\exists xQ$ | $\forall$ con $\land$, $\exists$ con $\lor$ |
| Distribución inválida | $\forall x(P\lor Q)\not\equiv\forall xP\lor\forall xQ$ ; $\exists x(P\land Q)\not\equiv\exists xP\land\exists xQ$ | Requiere contraejemplo, no demostración |
| Tres ambigüedades | Sintáctica / de alcance / semántica | Agrupación / orden de cuantificadores / interpretación del mundo |
| Unicidad anidada (Clase 8 + hoy) | $\forall x\ \exists!\ y\ P(x,y)$ | "Cada x tiene exactamente un y" |
| Negación anidada + De Morgan (Clase 6 + Clase 8) | $\neg\forall x\exists y(P\land Q)\equiv\exists x\forall y(\neg P\lor\neg Q)$ | Negar cada cuantificador, luego De Morgan proposicional sobre lo interno |

> [!NOTE]
> Este documento sigue el patrón de respuesta-dentro-de-cada-ítem (intento + confianza + respuesta final), la misma variación ya aprobada como plantilla desde `clase7_autoevaluacion.md`.
