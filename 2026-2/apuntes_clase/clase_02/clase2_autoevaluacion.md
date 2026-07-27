![Built with AI](https://img.shields.io/badge/Built%20with-AI-blue.svg)

# Autoevaluación — Tablas de Verdad
### Matemáticas Discretas 1 · Módulo 1: Lógica Proposicional

*Complemento de práctica de: [El Incidente del Discovery One — El Veredicto (Tablas de Verdad)](https://discretas1-udea.github.io/discretas1-udea-20261/lessons/mod1/clase3/)*

*Universidad de Antioquia · Ingeniería de Sistemas*

---

## Calentamiento

**Ítem 1**

¿Cuántas filas requiere la tabla de verdad de una expresión con 5 variables distintas?

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>32 filas ($2^5$).</details>

**Ítem 2**

En una tabla de verdad de 4 variables (16 filas), siguiendo el patrón sistemático de distribución de valores, ¿cada cuántas filas alterna la **tercera** variable?

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Cada 2 filas ($2^{4-3}=2^1=2$).</details>

**Ítem 3**

Dada la fila $p=F,\ q=V,\ r=F$ de una tabla de verdad de tres variables, escríbala usando la convención binaria de ingeniería empleada en este curso.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>0, 1, 0.</details>

**Ítem 4**

Según la definición de tabla de verdad, ¿qué representa específicamente la **columna final** de la tabla?

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>El valor de verdad resultante de la expresión completa, para cada una de las combinaciones posibles de valores de sus variables.</details>

---

## Serie 1 — Repeticiones básicas

*Construcción de tablas de verdad completas (Protocolo de 6 pasos), 1-2 variables.*

**Ítem 5**

Construya la tabla de verdad de $p \rightarrow \neg q$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Columna resultado (para $p,q = VV, VF, FV, FF$): 0, 1, 1, 1.</details>

**Ítem 6**

Construya la tabla de verdad de $p \lor (\neg p \land q)$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Columna resultado: 1, 1, 1, 0.</details>

**Ítem 7**

Construya la tabla de verdad de $\neg(p \leftrightarrow q)$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Columna resultado: 0, 1, 1, 0.</details>

**Ítem 8**

Construya la tabla de verdad de $(p \oplus q) \land p$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Columna resultado: 0, 1, 0, 0.</details>

**Ítem 9**

Construya la tabla de verdad de $\neg p \lor (p \land q)$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Columna resultado: 1, 0, 1, 1.</details>

---

## Serie 2 — Aplicación combinada

*Tablas de 3 variables, clasificación de proposiciones y detección de errores típicos.*

**Ítem 10**

Construya la tabla de verdad de $(P \lor Q) \rightarrow R$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Columna resultado (para $P,Q,R = VVV, VVF, VFV, VFF, FVV, FVF, FFV, FFF$): 1, 0, 1, 0, 1, 0, 1, 1.</details>

**Ítem 11**

Construya la tabla de verdad de $\neg(P \land Q) \lor R$.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Columna resultado: 1, 0, 1, 1, 1, 1, 1, 1.</details>

**Ítem 12**

Clasifique $(p\rightarrow q) \lor (q\rightarrow p)$ como tautología, contradicción o contingencia, y justifique con base en su tabla de verdad.

- [ ] Tautología
- [ ] Contradicción
- [ ] Contingencia

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Tautología. La columna final es 1 en las 4 filas, porque siempre al menos uno de los dos condicionales es verdadero, sin importar $p$ y $q$.</details>

**Ítem 13**

Clasifique $(p\land q)\rightarrow r$ como tautología, contradicción o contingencia, y justifique con base en su tabla de verdad.

- [ ] Tautología
- [ ] Contradicción
- [ ] Contingencia

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Contingencia. La columna final combina 1 y 0: es 0 únicamente cuando $p=V, q=V, r=F$, y 1 en las otras siete filas.</details>

**Ítem 14**

Un estudiante afirma que la tabla de verdad de $\neg(p\land q)$ es idéntica a la de $\neg p \land q$, y por eso construyó una sola tabla para representar ambas expresiones. Construya ambas tablas y determine si el estudiante está en lo correcto.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>No está en lo correcto. $\neg(p\land q)$ produce la columna 0,1,1,1, mientras que $\neg p\land q$ produce la columna 0,0,1,0 — son distintas. Es exactamente el error de alcance de la negación advertido en la sección de errores típicos.</details>

> [!TIP]
> **Antes de resolver el siguiente ítem**: en los Ejercicios resueltos de la clase se mostró que una subexpresión que **siempre** es falsa (como $Q\land\neg Q$) puede garantizar el resultado final de una expresión más grande, sin necesidad de conocer el valor de las demás variables. El siguiente ítem le pide aplicar ese mismo razonamiento, **sin construir la tabla completa**.

**Ítem 15**

Sin construir la tabla completa, explique por qué $q \land (t \land \neg t)$ tiene que ser una contradicción, sin importar el valor de $q$.

> ✍️ *Antes de ver la respuesta: escriba aquí su explicación, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>$t\land\neg t$ es siempre falso (es la misma estructura que $P\land\neg P$). Una conjunción con un valor siempre falso es siempre falsa, sin importar qué valor tome $q$ — por eso toda la expresión es una contradicción.</details>

---

## Serie 3 — Entrenamiento cruzado

*Mezcla con [Clase 2 — Proposición, Lenguaje Formal, Axiomas de Verdad y Jerarquía de Operadores](https://discretas1-udea.github.io/discretas1-udea-20261/lessons/mod1/clase2/), secciones 1.1-1.2 (traducción de lenguaje natural a fórmula). Cada ítem retoma ese proceso de traducción y lo extiende con la herramienta nueva de esta sesión: en vez de evaluar un solo caso, se construye la tabla de verdad completa.*

**Ítem 16**

"El motor se apaga si la temperatura supera el límite y el sistema no está en mantenimiento." Formalice la condición ($t$: la temperatura supera el límite; $m$: el sistema está en mantenimiento) y construya la tabla de verdad completa.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Fórmula: $t\land\neg m$. Columna resultado (para $t,m = VV, VF, FV, FF$): 0, 1, 0, 0.</details>

**Ítem 17**

"No es cierto que el escudo esté desactivado o la energía esté baja." Formalice la condición ($d$: el escudo está desactivado; $e$: la energía está baja) y construya la tabla de verdad completa.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Fórmula: $\neg(d\lor e)$. Columna resultado: 0, 0, 0, 1.</details>

**Ítem 18**

"El acceso se concede si y solo si el usuario está autorizado y no hay alerta activa." Formalice la condición ($g$: se concede el acceso; $u$: el usuario está autorizado; $a$: hay alerta activa) y construya la tabla de verdad completa.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>Fórmula: $g \leftrightarrow (u\land\neg a)$. Columna resultado (para $g,u,a = VVV, VVF, VFV, VFF, FVV, FVF, FFV, FFF$): 0, 1, 0, 0, 1, 0, 1, 1.</details>

---

## Reto Final — Expediente Stark: Protocolo de Despliegue

*Caso aplicado — la narrativa (J.A.R.V.I.S.) es un envoltorio nuevo del enunciado; la resolución es puramente formal, con las mismas herramientas del resto del bloque.*

**Ítem 19**

J.A.R.V.I.S. debe decidir si activa el protocolo de despliegue automático de la armadura Mark. El protocolo se activa si **se detecta una amenaza confirmada y no hay anulación manual del piloto**, o si **el nivel de energía del reactor arc cae por debajo del mínimo crítico**.

Variables: $a$ = se detecta una amenaza confirmada; $m$ = hay anulación manual del piloto; $e$ = la energía cae por debajo del mínimo crítico.

Resuelva, en orden:

1. **Formalice** la condición de activación del protocolo.
2. **Construya la tabla de verdad completa** y clasifique el resultado (tautología, contradicción o contingencia).
3. Un compañero de equipo asegura que esta condición es una **tautología**, porque "siempre hay alguna forma de que se cumpla: o hay amenaza sin anulación, o se acaba la energía, así que en algún momento siempre se activa". Usando una **fila específica** de la tabla que usted construyó en el paso 2, muestre por qué esa afirmación es incorrecta.

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano (los tres pasos) y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>

**1.** Fórmula: $(a\land\neg m)\lor e$

**2.** Columna resultado (para $a,m,e = VVV, VVF, VFV, VFF, FVV, FVF, FFV, FFF$): 1, 0, 1, 1, 1, 0, 1, 0. Clasificación: **Contingencia** (combina 1 y 0).

**3.** Contraejemplo: fila $a=F, m=F, e=F$ → resultado 0. Sin amenaza y con energía normal, el protocolo no se activa sin importar $m$ — eso refuta que sea tautología.

</details>

---

## Cierre — Autodiagnóstico

Para cada serie, cuente cuántos ítems resolvió con cada nivel de confianza declarado y cuántos coincidieron con la respuesta final revelada.

| Serie | Ítems totales | Confianza Alta (cant.) | Confianza Media (cant.) | Confianza Baja (cant.) | Aciertos totales |
|---|:---:|:---:|:---:|:---:|:---:|
| Calentamiento | 4 | | | | |
| Serie 1 | 5 | | | | |
| Serie 2 | 6 | | | | |
| Serie 3 | 3 | | | | |
| Reto Final | 1 | | | | |

> [!IMPORTANT]
> El dato más importante de esta tabla no es el conteo de aciertos, sino el cruce entre confianza declarada y resultado real. Preste especial atención a:
> - **Confianza Alta + respuesta incorrecta**: es la señal más importante de esta autoevaluación — indica un vacío conceptual que usted no percibía como tal. Repase esa subsección antes de seguir.
> - **Confianza Baja + respuesta correcta**: indica que domina el contenido más de lo que cree; con práctica, debería ganar seguridad ahí.
> - Si varios ítems de Confianza Alta + incorrecto se concentraron en una sola serie, priorice repasar esa serie específica antes del parcial.

---

## Hoja de fórmulas y conceptos clave

**Protocolo de 6 pasos**: identificar variables → calcular filas ($2^n$) → construir columnas de variables → agregar columnas auxiliares → evaluar respetando jerarquía → validar.

**Convención binaria**: $1 = V$, $0 = F$ (igual que `True`/`False` en Python).

**Errores típicos**: filas $\neq 2^n$; patrón de alternancia mal distribuido; confundir $\neg(p\land q)$ con $\neg p\land q$; confundir $\lor$ con $\oplus$.

**Clasificación**: columna final toda $V$ → Tautología. Toda $F$ → Contradicción. Mezcla de $V$ y $F$ → Contingencia.

**Complemento — de Clase 2 (para la Serie 3):**

| Operador | Símbolo | Regla de oro |
|---|:---:|---|
| Negación | $\neg p$ | Invierte el valor. |
| Conjunción | $p\land q$ | Basta una falsedad para que todo sea $F$. |
| Disyunción | $p\lor q$ | Basta una verdad para que todo sea $V$. |
| Disyunción exclusiva | $p\oplus q$ | Valores diferentes dan $V$. |
| Condicional | $p\rightarrow q$ | Solo es $F$ cuando $V\rightarrow F$. |
| Bicondicional | $p\leftrightarrow q$ | $V$ cuando ambos coinciden. |

**Jerarquía** (de mayor a menor prioridad): $\neg \;>\; \land \;>\; \lor \;>\; \oplus \;>\; \rightarrow \;>\; \leftrightarrow$

**Proceso de traducción, 3 pasos**: identificar conectores → definir variables → ensamblar fórmula.

---

## Solucionario completo

<details>
<summary><b>Ver solucionario — Calentamiento</b></summary>

**Ítem 1.** $n=5 \Rightarrow N=2^5=32$ filas.

**Ítem 2.** La variable en la posición $i$ (de $n$) alterna cada $2^{n-i}$ filas. Para la tercera variable de 4: $2^{4-3}=2^1=2$ filas.

**Ítem 3.** $p=F \to 0$, $q=V\to 1$, $r=F\to 0$. Fila: 0, 1, 0.

**Ítem 4.** La columna final registra, fila por fila, el valor de verdad que resulta de evaluar la expresión completa para esa combinación específica de valores de las variables.

</details>

<details>
<summary><b>Ver solucionario — Serie 1</b></summary>

**Ítem 5.** $p\rightarrow\neg q$:

$$
\begin{aligned}
&p=V,q=V:\ \neg q=F,\ V\rightarrow F=\mathbf{0}\\
&p=V,q=F:\ \neg q=V,\ V\rightarrow V=\mathbf{1}\\
&p=F,q=V:\ \neg q=F,\ F\rightarrow F=\mathbf{1}\\
&p=F,q=F:\ \neg q=V,\ F\rightarrow V=\mathbf{1}
\end{aligned}
$$

**Ítem 6.** $p\lor(\neg p\land q)$:

$$
\begin{aligned}
&VV:\ \neg p=F,\ \neg p\land q=F,\ p\lor F=\mathbf{1}\\
&VF:\ \neg p=F,\ \neg p\land q=F,\ p\lor F=\mathbf{1}\\
&FV:\ \neg p=V,\ \neg p\land q=V,\ p\lor V=\mathbf{1}\\
&FF:\ \neg p=V,\ \neg p\land q=F,\ p\lor F=\mathbf{0}
\end{aligned}
$$

**Ítem 7.** $\neg(p\leftrightarrow q)$: $p\leftrightarrow q = V,F,F,V$ (para VV,VF,FV,FF); al negar: $\mathbf{0,1,1,0}$.

**Ítem 8.** $(p\oplus q)\land p$:

$$
\begin{aligned}
&VV:\ p\oplus q=F,\ F\land V=\mathbf{0}\\
&VF:\ p\oplus q=V,\ V\land V=\mathbf{1}\\
&FV:\ p\oplus q=V,\ V\land F=\mathbf{0}\\
&FF:\ p\oplus q=F,\ F\land F=\mathbf{0}
\end{aligned}
$$

**Ítem 9.** $\neg p\lor(p\land q)$:

$$
\begin{aligned}
&VV:\ \neg p=F,\ p\land q=V,\ F\lor V=\mathbf{1}\\
&VF:\ \neg p=F,\ p\land q=F,\ F\lor F=\mathbf{0}\\
&FV:\ \neg p=V,\ p\land q=F,\ V\lor F=\mathbf{1}\\
&FF:\ \neg p=V,\ p\land q=F,\ V\lor F=\mathbf{1}
\end{aligned}
$$

</details>

<details>
<summary><b>Ver solucionario — Serie 2</b></summary>

**Ítem 10.** $(P\lor Q)\rightarrow R$, evaluado en las 8 filas ($P,Q,R$ de VVV a FFF): $P\lor Q$ es 1 en todas menos las dos últimas filas ($P=Q=F$); el condicional resulta: $\mathbf{1,0,1,0,1,0,1,1}$.

**Ítem 11.** $\neg(P\land Q)\lor R$: $P\land Q$ solo es 1 en las dos primeras filas; su negación es 0 ahí y 1 en el resto; al unir con $\lor R$: $\mathbf{1,0,1,1,1,1,1,1}$.

**Ítem 12.** $(p\rightarrow q)\lor(q\rightarrow p)$:

$$
\begin{aligned}
&VV:\ (V\rightarrow V)\lor(V\rightarrow V)=1\lor1=\mathbf{1}\\
&VF:\ (V\rightarrow F)\lor(F\rightarrow V)=0\lor1=\mathbf{1}\\
&FV:\ (F\rightarrow V)\lor(V\rightarrow F)=1\lor0=\mathbf{1}\\
&FF:\ (F\rightarrow F)\lor(F\rightarrow F)=1\lor1=\mathbf{1}
\end{aligned}
$$

Columna final: 1,1,1,1 → **Tautología**.

**Ítem 13.** $(p\land q)\rightarrow r$, en las 8 filas: solo es falso cuando $p\land q=V$ y $r=F$ (fila $VVF$); en el resto es verdadero: $\mathbf{1,0,1,1,1,1,1,1}$ → **Contingencia**.

**Ítem 14.** $\neg(p\land q)$: $p\land q=V,F,F,F \Rightarrow \neg(p\land q)=0,1,1,1$. $\neg p\land q$: $\neg p=F,F,V,V$; $\neg p\land q = F\land V, F\land F, V\land V, V\land F = 0,0,1,0$. Las columnas (0,1,1,1) y (0,0,1,0) son distintas — el estudiante está equivocado.

**Ítem 15.** $t\land\neg t$ es la misma estructura que $P\land\neg P$ (Ejercicio resuelto 1 de la clase), que ya se demostró siempre falsa. Una conjunción $q\land F$ es siempre $F$, sin importar el valor de $q$, porque basta una falsedad para que toda la conjunción sea falsa (regla de oro de $\land$). Por eso $q\land(t\land\neg t)$ es contradicción para cualquier $q$.

</details>

<details>
<summary><b>Ver solucionario — Serie 3</b></summary>

**Ítem 16.** Traducción: "se apaga" depende de "temperatura supera el límite" ($t$) y "no está en mantenimiento" ($\neg m$), unidos por "y" → $t\land\neg m$.

$$
\begin{aligned}
&VV:\ \neg m=F,\ t\land\neg m=\mathbf{0}\\
&VF:\ \neg m=V,\ t\land\neg m=\mathbf{1}\\
&FV:\ \neg m=F,\ t\land\neg m=\mathbf{0}\\
&FF:\ \neg m=V,\ t\land\neg m=\mathbf{0}
\end{aligned}
$$

**Ítem 17.** "No es cierto que... o..." → negación aplicada a toda la disyunción: $\neg(d\lor e)$.

$$
\begin{aligned}
&VV:\ d\lor e=1,\ \neg=\mathbf{0}\\
&VF:\ d\lor e=1,\ \neg=\mathbf{0}\\
&FV:\ d\lor e=1,\ \neg=\mathbf{0}\\
&FF:\ d\lor e=0,\ \neg=\mathbf{1}
\end{aligned}
$$

**Ítem 18.** "Se concede si y solo si..." → bicondicional entre $g$ y la conjunción $(u\land\neg a)$: $g\leftrightarrow(u\land\neg a)$.

$$
\begin{aligned}
&VVV:\ \neg a=F,\ u\land\neg a=F,\ g\leftrightarrow F=V\leftrightarrow F=\mathbf{0}\\
&VVF:\ \neg a=V,\ u\land\neg a=V,\ g\leftrightarrow V=V\leftrightarrow V=\mathbf{1}\\
&VFV:\ \neg a=F,\ u\land\neg a=F,\ V\leftrightarrow F=\mathbf{0}\\
&VFF:\ \neg a=V,\ u\land\neg a=F,\ V\leftrightarrow F=\mathbf{0}\\
&FVV:\ \neg a=F,\ u\land\neg a=F,\ F\leftrightarrow F=\mathbf{1}\\
&FVF:\ \neg a=V,\ u\land\neg a=V,\ F\leftrightarrow V=\mathbf{0}\\
&FFV:\ \neg a=F,\ u\land\neg a=F,\ F\leftrightarrow F=\mathbf{1}\\
&FFF:\ \neg a=V,\ u\land\neg a=F,\ F\leftrightarrow F=\mathbf{1}
\end{aligned}
$$

</details>

<details>
<summary><b>Ver solucionario — Reto Final</b></summary>

**Paso 1 — Formalizar.** "Se activa si $a$ y no $m$, o si $e$" → $(a\land\neg m)\lor e$.

**Paso 2 — Tabla completa.**

| $a$ | $m$ | $e$ | $\neg m$ | $a\land\neg m$ | $(a\land\neg m)\lor e$ |
|:---:|:---:|:---:|:---:|:---:|:---:|
| V | V | V | F | F | **1** |
| V | V | F | F | F | **0** |
| V | F | V | V | V | **1** |
| V | F | F | V | V | **1** |
| F | V | V | F | F | **1** |
| F | V | F | F | F | **0** |
| F | F | V | F | F | **1** |
| F | F | F | F | F | **0** |

La columna final combina 1 y 0 (cinco unos, tres ceros) → **Contingencia**.

**Paso 3 — Refutar la tautología.** La fila $a=F, m=F, e=F$ da resultado **0**: sin amenaza confirmada y con energía por encima del mínimo crítico, el protocolo no se activa, sin importar el valor de $m$. Esa fila por sí sola refuta la afirmación de que la expresión es siempre verdadera. (Las filas $a=V,m=V,e=F$ y $a=F,m=V,e=F$ también sirven como contraejemplo válido.)

</details>
