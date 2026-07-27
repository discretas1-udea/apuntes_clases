# Autoevaluación — Clase 8: Unicidad, Dependencia del Dominio y Negación Cuantificacional

*Matemáticas Discretas 1 · Módulo 2: Lógica Cuantificacional (Lógica de Predicados)*
*Universidad de Antioquia · Ingeniería de Sistemas*

**[Volver a Clase 8](clase8.md)**

---

## Cómo usar este documento

Cada ítem sigue el mismo patrón: primero resuelva el procedimiento completo a mano y escriba su resultado, luego declare qué tan seguro está, y solo después revele la respuesta final (sin desarrollo, como el apéndice de un libro de texto). No se salte el paso de intento — es la parte que realmente entrena.

> [!NOTE]
> Este bloque **no repite** ningún ejercicio ya resuelto o propuesto en `clase8.md` (Ejercicios 1-15, el Problema guiado, el Expediente Gallinero, ni P1-P10). Todos los ítems son práctica nueva sobre los mismos conceptos.

---

## Calentamiento

**Ítem 1**
Dada la afirmación "Hay exactamente un servidor caído en la red", ¿cuál cuantificador es el adecuado para formalizarla: $\exists$, $\forall$, o $\exists!$? Justifique en una frase.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\exists!$ — la afirmación exige existencia **y** unicidad, no solo "al menos uno".</details>

**Ítem 2**
Sin resolver todavía ningún ejemplo concreto, enuncie los dos pasos mecánicos que debe aplicar para negar $\forall x\ Q(x)$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>(1) Cambiar el cuantificador ($\forall\to\exists$); (2) negar la proposición interna ($Q\to\neg Q$), simplificando dobles negaciones si aparecen.</details>

**Ítem 3**
Según la tabla de combinaciones posibles de la Parte II, ¿es posible que $\forall x\ P(x)$ sea verdadera y $\exists x\ P(x)$ sea falsa, en un dominio no vacío? Responda solo V (posible) o F (nunca posible).

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>F — nunca es posible en un dominio no vacío, porque $\forall x\ P(x)\Rightarrow\exists x\ P(x)$.</details>

**Ítem 4**
En un dominio finito, ¿el cuantificador $\forall$ se comporta como una conjunción gigante o como una disyunción gigante? ¿Y el $\exists$?

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\forall$ se comporta como una conjunción ($\land$) gigante; $\exists$ se comporta como una disyunción ($\lor$) gigante.</details>

---

## Serie 1 — Repeticiones básicas

**Ítem 5**
Sea el dominio $D=\{10,11,12,\dots,20\}$ y $R(x)$: "x es múltiplo de 9". ¿Es verdadera $\exists!\ x\ R(x)$? Justifique verificando existencia y unicidad.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Verdadera. Testigo único: $x=18$ (el único múltiplo de 9 en el rango).</details>

**Ítem 6**
Proponga un contraejemplo que demuestre que $\forall x\in\mathbb{R},\ 2x\geq x+1$ es falsa.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$x_0=0$ (o cualquier $x<1$): $2(0)=0$ y $0+1=1$; $0\geq 1$ es falso.</details>

**Ítem 7**
Sea el dominio $U=\{S1,S2,S3,S4\}$ (cuatro servidores) y el predicado $disponible(x)$: "x está disponible". Escriba $\forall x\ disponible(x)$ y $\exists x\ disponible(x)$ como conjunción y disyunción, respectivamente, sin usar cuantificadores.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\forall x\ disponible(x) \equiv disponible(S1)\land disponible(S2)\land disponible(S3)\land disponible(S4)$. $\exists x\ disponible(x) \equiv disponible(S1)\lor disponible(S2)\lor disponible(S3)\lor disponible(S4)$.</details>

**Ítem 8**
Niegue $\forall x\ \bigl(H(x) \rightarrow \neg K(x)\bigr)$, simplificando hasta que el $\neg$ quede pegado directamente al predicado.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\exists x\ \bigl(H(x) \land K(x)\bigr)$.</details>

**Ítem 9**
En el laboratorio de robótica ampliado (el mismo dominio de `clase8.md`), enuncie la negación de "Todo dispositivo del laboratorio tiene batería", usando el predicado $bateria(x)$, y tradúzcala de vuelta a lenguaje natural.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\neg\bigl(\forall x\ bateria(x)\bigr) \equiv \exists x\ \neg bateria(x)$ — "existe al menos un dispositivo del laboratorio que no tiene batería".</details>

---

## Serie 2 — Aplicación combinada

**Ítem 10**
Sea el dominio $U=\{E1,E2,E3,E4,E5\}$ (cinco estudiantes) y el predicado $perfecto(x)$: "x obtuvo la nota máxima en el examen". La tabla de resultados muestra: $E1$: no, $E2$: sí, $E3$: no, $E4$: no, $E5$: no. Determine si $\exists!\ x\ perfecto(x)$ es verdadera, verificando explícitamente existencia y unicidad.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Verdadera. Existencia: $E2$ cumple. Unicidad: ningún otro estudiante cumple. Testigo: $E2$.</details>

**Ítem 11**
Niegue el enunciado "Algún estudiante que tomó Lógica y Representación I reprobó el examen de admisión a prácticas", mostrando la traducción, la aplicación de las leyes de De Morgan cuantificacionales, y el reconocimiento final como una implicación universal.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Traducción: $\exists x(R(x)\land F(x))$. Negación: $\forall x(R(x)\rightarrow\neg F(x))$ — "todo estudiante que tomó Lógica y Representación I no reprobó el examen de admisión a prácticas".</details>

**Ítem 12**
Sea $P(x)$: "$x^2 \leq 9$". Determine el valor de verdad de $\forall x\ P(x)$ en el dominio $\{-3,-2,-1,0,1,2,3\}$ y en el dominio $\mathbb{Z}$. Explique el cambio.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>En $\{-3,\dots,3\}$: verdadera (los siete elementos cumplen). En $\mathbb{Z}$: falsa (contraejemplo $x=4$: $16\leq 9$ es falso). El predicado no cambió — el dominio infinito reintroduce elementos que el dominio finito había excluido.</details>

**Ítem 13**
Sea el dominio $\{1,2,\dots,15\}$ y $Q(x)$: "x es múltiplo de 4". Determine si $\exists!\ x\ Q(x)$ es verdadera o falsa. Si es falsa, exhiba explícitamente dos testigos distintos que rompan la unicidad.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Falsa. Hay tres testigos (4, 8, 12); basta exhibir dos, por ejemplo $4$ y $8$, para romper la unicidad.</details>

**Ítem 14**
Sea el dominio $U=\{a,b\}$ y $R(x)$: "x cumple la política de seguridad". Escriba $\forall x\ R(x)$ como conjunción, niegue esa conjunción aplicando De Morgan proposicional (Clase 6), y verifique que el resultado coincide con $\exists x\ \neg R(x)$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\forall x\ R(x)\equiv R(a)\land R(b)$. Negación: $\neg R(a)\lor\neg R(b)$. Esto coincide exactamente con $\exists x\ \neg R(x)$ aplicado al predicado $\neg R$.</details>

---

## Serie 3 — Integración

> [!NOTE]
> Esta serie **no mezcla temas de sesiones anteriores** (no hay entrenamiento cruzado): por decisión explícita, se convirtió en una serie de **Integración** que combina 3 o más conceptos de la propia `clase8.md` en un mismo ítem.

**Ítem 15**
Sea el dominio $U=\{L1,L2,L3\}$ (tres enlaces de red) y el predicado $activo(x)$: "el enlace x está activo". (a) Traduzca "todos los enlaces están activos" a cuantificadores. (b) Exprésela como conjunción sin cuantificadores. (c) Niegue la fórmula original aplicando De Morgan cuantificacional, y verifique que su resultado equivale a negar la conjunción del punto (b) con De Morgan proposicional.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>(a) $\forall x\ activo(x)$. (b) $activo(L1)\land activo(L2)\land activo(L3)$. (c) $\exists x\ \neg activo(x)$, que coincide con $\neg activo(L1)\lor\neg activo(L2)\lor\neg activo(L3)$ obtenido al negar (b).</details>

**Ítem 16**
Sea el dominio $\{5,6,7,8,9\}$ y $P(x)$: "x es mayor que 5". Determine el valor de verdad de $\forall x\ P(x)$ y $\exists x\ P(x)$. ¿Su resultado es consistente con que nunca puede darse $\forall$ verdadera y $\exists$ falsa? Adicionalmente, determine si $\exists!\ x\ P(x)$ es verdadera o falsa.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\forall x\ P(x)$ es falsa (5 no es mayor que 5). $\exists x\ P(x)$ es verdadera (6,7,8,9 lo cumplen). La combinación (F,V) sí es posible, es consistente. $\exists!\ x\ P(x)$ es falsa: hay cuatro testigos, falla la unicidad.</details>

**Ítem 17**
Traduzca "Todo sensor de temperatura defectuoso genera una alerta falsa", identificando la forma aristotélica correspondiente. Luego niegue la fórmula obtenida, y traduzca la negación de vuelta a lenguaje natural.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Forma A: $\forall x\ (D(x)\rightarrow F(x))$. Negación: $\exists x\ (D(x)\land\neg F(x))$ — "existe un sensor de temperatura defectuoso que no genera una alerta falsa".</details>

**Ítem 18**
Sea $P(x)$: "$x^2 \leq 4$". (a) Encuentre un contraejemplo en $\mathbb{R}$ que refute $\forall x\in\mathbb{R}\ P(x)$. (b) Proponga un dominio finito de al menos cuatro elementos donde $\forall x\ P(x)$ sea verdadera, y escríbala como conjunción sin cuantificadores.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>(a) $x_0=3$: $9\leq 4$ es falso (sirve cualquier $|x|>2$). (b) Dominio $\{-2,-1,0,1,2\}$: $P(-2)\land P(-1)\land P(0)\land P(1)\land P(2)$, los cinco términos son verdaderos.</details>

**Ítem 19 — Depuración**
Considere el enunciado "Hay un único administrador con acceso root al servidor". Se proponen tres formalizaciones; solo una es correcta. Para cada una, explique por qué es correcta o cuál es el error exacto que contiene.

(A) $\exists x\ \bigl(admin(x)\land root(x)\bigr)$

(B) $\exists x\Bigl(admin(x)\land root(x)\land\forall y\bigl((admin(y)\land root(y))\rightarrow y=x\bigr)\Bigr)$

(C) $\forall x\ \bigl(admin(x)\rightarrow root(x)\bigr)$

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>(A) Incorrecta — solo garantiza existencia, no unicidad; es exactamente el error de la Parte I (confundir $\exists$ con $\exists!$). (B) Correcta — es la expansión de $\exists!\ x\ (admin(x)\land root(x))$ según la Parte I.2. (C) Incorrecta — es una forma A (todo administrador tiene root), una afirmación distinta: no dice nada sobre unicidad ni exige que exista alguno.</details>

**Ítem 20 — Construcción de dominios**
Proponga dos dominios distintos, cada uno con al menos 3 elementos, y un predicado $V(x)$ de su elección, tales que: en el primer dominio se cumplan simultáneamente $\forall x\ V(x)$ y $\exists x\ V(x)$ (ambas verdaderas); en el segundo dominio $\exists x\ V(x)$ sea verdadera pero $\forall x\ V(x)$ sea falsa. Justifique cada dominio con la tabla de combinaciones de la Parte II.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Respuesta de referencia (otras propuestas válidas también son correctas, si cumplen las condiciones pedidas): Dominio 1 $=\{2,4,6\}$, $V(x)$: "x es par" — los tres son pares, así que $\forall$ y $\exists$ son ambas V. Dominio 2 $=\{2,3,5\}$, mismo $V(x)$ — solo el 2 es par: $\exists$ es V (testigo 2), pero $\forall$ es F (falla en 3 y 5).</details>

**Ítem 21 — Integración con Ingeniería de Software**
Un sistema de reservas de salas exige que, para cada franja horaria, $\exists!\ x\ reservada(x)$ (dominio: las salas del edificio). Explique qué garantiza esta política. Luego explique qué consecuencia operacional concreta tendría relajarla a $\exists x\ reservada(x)$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$\exists!$ garantiza que exactamente una sala queda reservada por franja: ni cero (siempre hay un lugar asignado) ni más de una (sin conflicto simultáneo). Relajar a $\exists x\ reservada(x)$ permitiría que dos o más salas quedaran reservadas a la vez para la misma franja sin garantizar cuál es la vigente — dos equipos podrían terminar disputándose la sala física el día del evento.</details>

---

## 🐺 Reto Final — El Pastorcito Mentiroso

*Este bloque aplica — no explica — los conceptos ya vistos. La narrativa es solo el envoltorio del enunciado; se resuelve exclusivamente con herramientas formales de `clase8.md`. No se exige anidar cuantificadores (tema pendiente para la próxima clase).*

El pastorcito gritó "¡Lobo!" dos veces sin que fuera cierto, y los cinco aldeanos del pueblo — $U=\{A1,A2,A3,A4,A5\}$ — corrieron ambas veces a ayudar. A la tercera, el lobo apareció de verdad. Esta vez, la tabla de quién acudió fue distinta:

| Aldeano | ¿Acudió a la alarma real? |
|:---:|:---:|
| A1 | No |
| A2 | No |
| A3 | No |
| A4 | Sí |
| A5 | No |

**Ítem 22**
*(Unicidad)* Sea $acudio(x)$: "x acudió a la alarma real". Con la tabla anterior, determine si $\exists!\ x\ acudio(x)$ es verdadera, verificando existencia y unicidad.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Verdadera. Existencia: A4 acudió. Unicidad: ningún otro aldeano acudió. Testigo: A4.</details>

**Ítem 23**
*(Dependencia del dominio)* El pueblo se divide en dos barrios: Barrio Alto $=\{A1,A4\}$ y Barrio Bajo $=\{A2,A3,A5\}$. Usando la misma tabla del Ítem 22, evalúe $\exists x\ acudio(x)$ tomando como universo solo el Barrio Alto, y luego solo el Barrio Bajo. ¿Cambia el valor de verdad de la misma fórmula según el barrio? Explique por qué, apoyándose en la Parte II.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Barrio Alto: verdadera (testigo A4). Barrio Bajo: falsa (ninguno de A2, A3, A5 acudió). El predicado y sus valores por aldeano no cambiaron — lo que cambió fue el universo sobre el que se cuantifica, exactamente la lección de la Parte II.</details>

**Ítem 24**
*(Construcción — modificación mínima)* El jefe del pueblo quiere que, en la próxima alarma, deje de cumplirse $\exists!\ x\ acudio(x)$. Retomando la tabla del Ítem 22, modifique el valor de un **solo** aldeano para lograrlo. Indique cuál aldeano cambia, a qué valor, y explique en una frase por qué ese cambio mínimo basta.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Basta cambiar cualquier otro aldeano (por ejemplo, $A1$) de "No" a "Sí". Con ese cambio, tanto $A1$ como $A4$ cumplen $acudio(x)$: aparece un segundo testigo, la existencia se sigue cumpliendo, pero la unicidad se rompe — $\exists!\ x\ acudio(x)$ pasa de V a F.</details>

> [!NOTE]
> **Moraleja.** Solo un aldeano de cinco le creyó a tiempo la última vez — una soledad que el propio $\exists!$ deja ver con precisión. Y si alguien pregunta "¿acudió alguien?", la respuesta correcta depende por completo de a qué barrio se le pregunte: la credibilidad perdida no se reparte de manera uniforme.

---

## Cierre — Autodiagnóstico

No cuente solo aciertos ni solo confianza: para cada ítem, compare su respuesta escrita con la revelada y clasifíquela en una sola casilla de la matriz. La última columna es la más importante — un ítem incorrecto en el que usted declaró confianza Alta señala un concepto que cree dominar pero no domina; repáselo primero.

| Bloque | Ítems | Correcto + Confianza Alta | Correcto + Confianza Media/Baja | Incorrecto + Confianza Media/Baja | Incorrecto + Confianza Alta (¡atención!) | Repasar |
|:---|:---:|:---:|:---:|:---:|:---:|:---|
| Calentamiento | 4 | ___ | ___ | ___ | ___ | Partes I-IV (repaso general) |
| Serie 1 | 5 | ___ | ___ | ___ | ___ | Partes I.2, II.2, III.1, IV.1 |
| Serie 2 | 5 | ___ | ___ | ___ | ___ | Partes I, II.1, III.1, IV.1 |
| Serie 3 — Integración | 7 | ___ | ___ | ___ | ___ | Partes I, II, III, IV combinadas |
| Reto Final | 3 | ___ | ___ | ___ | ___ | Parte I (unicidad), Parte II (dominio) |

---

## Hoja de fórmulas y conceptos clave

| Concepto | Símbolo / fórmula | Lectura |
|:---|:---|:---|
| Unicidad | $\exists!\ x\ P(x) \equiv \exists x\bigl(P(x)\land\forall y(P(y)\rightarrow y=x)\bigr)$ | "Existe exactamente un x que cumple P" |
| Método del contraejemplo | Encontrar $x_0$ tal que $P(x_0)$ es falso | Refuta $\forall x\ P(x)$ con un solo caso |
| $\forall$ como $\land$ (dominio finito) | $\forall x\ P(x) \equiv P(x_1)\land\cdots\land P(x_n)$ | Todos a la vez |
| $\exists$ como $\lor$ (dominio finito) | $\exists x\ P(x) \equiv P(x_1)\lor\cdots\lor P(x_n)$ | Al menos uno |
| Negación de cuantificadores | $\neg\forall x\ P(x)\equiv\exists x\ \neg P(x)$ ; $\neg\exists x\ P(x)\equiv\forall x\ \neg P(x)$ | Cambia el cuantificador, niega el interior |
| Combinación imposible | $\forall x\ P(x)=V$ y $\exists x\ P(x)=F$ **nunca ocurre** (dominio no vacío) | $\forall x\ P(x)\Rightarrow\exists x\ P(x)$ |

> [!NOTE]
> Este documento sigue el patrón de respuesta-dentro-de-cada-ítem (intento + confianza + respuesta final) en vez de un solucionario consolidado al final, siguiendo la variación ya aprobada como plantilla en `clase7_autoevaluacion.md`.
