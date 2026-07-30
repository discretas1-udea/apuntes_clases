# Taller 8 – Matemáticas Discretas

## Objetivo de aprendizaje

Al finalizar este taller, usted podrá determinar si una relación es un orden parcial (a partir de conjuntos, matrices, grafos dirigidos o lenguaje natural), construir e interpretar diagramas de Hasse, y encontrar los elementos distinguidos de un conjunto parcialmente ordenado (maximales, minimales, cotas superiores e inferiores).

## Referencia rápida

> [!NOTE]
> Este taller no trae anexo de fórmulas en el PDF original. La siguiente Referencia rápida fue redactada para este documento (apoyada en la notación estándar de Rosen), no transcrita de una fuente.

### Orden parcial (POSET)

| Concepto | Definición |
|---|---|
| Orden parcial | Una relación $R$ sobre un conjunto $S$ es un orden parcial si es **reflexiva**, **antisimétrica** y **transitiva** |
| POSET | Un conjunto $S$ junto con un orden parcial $R$ se denota $(S, R)$ y se llama conjunto parcialmente ordenado |
| Comparables | $a$ y $b$ son comparables si $aRb$ o $bRa$ |
| Incomparables | $a$ y $b$ son incomparables si ni $aRb$ ni $bRa$ se cumplen |
| Orden total | Un POSET donde **todo** par de elementos es comparable |

> [!TIP]
> Para descartar rápidamente que una relación sea orden parcial, basta con encontrar **una sola** falla en reflexividad, antisimetría o transitividad — no hace falta revisar las tres propiedades si ya encontró una que falla.

### Diagrama de Hasse — reglas de construcción

Un diagrama de Hasse simplifica el grafo dirigido de un orden parcial eliminando información redundante:

1. Elimine los lazos (self-loops) — la reflexividad se da por sentada.
2. Elimine las aristas que se deducen por transitividad (si $a \to b$ y $b \to c$, no dibuje $a \to c$ directamente).
3. Elimine las flechas — se asume que toda arista apunta hacia arriba.
4. Organice los elementos por niveles, de menor (abajo) a mayor (arriba).

### Elementos distinguidos de un POSET

| Concepto | Definición |
|---|---|
| Elemento maximal | $a$ es maximal si no existe ningún $b \ne a$ tal que $aRb$ (nada está "por encima" de $a$) |
| Elemento minimal | $a$ es minimal si no existe ningún $b \ne a$ tal que $bRa$ (nada está "por debajo" de $a$) |
| Elemento mayor (máximo) | $a$ es el mayor si $bRa$ para todo $b \in S$ — es único si existe |
| Elemento menor (mínimo) | $a$ es el menor si $aRb$ para todo $b \in S$ — es único si existe |
| Cota superior de $A \subseteq S$ | $u \in S$ tal que $aRu$ para todo $a \in A$ |
| Cota inferior de $A \subseteq S$ | $l \in S$ tal que $lRa$ para todo $a \in A$ |
| Mínima cota superior (supremo) | La menor de todas las cotas superiores de $A$ |
| Máxima cota inferior (ínfimo) | La mayor de todas las cotas inferiores de $A$ |

> [!TIP]
> Un POSET puede tener **varios** elementos maximales y minimales a la vez (a diferencia del elemento mayor/menor, que si existe es único). No confunda "maximal" con "mayor" — todo elemento mayor es maximal, pero no todo maximal es el mayor.

## Enunciados

### Bloque A — Identificación de órdenes parciales (1-7)

**1.** ¿Cuáles de estas relaciones en $\{0,1,2,3\}$ son relaciones de orden parcial? Determine las propiedades de una relación de orden parcial que las otras no tienen.

- a. $\{(0,0), (1,1), (2,2), (3,3)\}$
- b. $\{(0,0), (1,1), (2,0), (2,2), (2,3), (3,2), (3,3)\}$
- c. $\{(0,0), (1,1), (1,2), (2,2), (3,3)\}$
- d. $\{(0,0), (1,1), (1,2), (1,3), (2,2), (2,3), (3,3)\}$
- e. $\{(0,0), (0,1), (0,2), (1,0), (1,1), (1,2), (2,0), (2,2), (3,3)\}$

**2.** ¿Cuáles de estas relaciones en $\{0,1,2,3\}$ son relaciones de orden parcial? Determine las propiedades de una relación de orden parcial que las otras no tienen.

- a. $\{(0,0), (2,2), (3,3)\}$
- b. $\{(0,0), (1,1), (2,0), (2,2), (2,3), (3,3)\}$
- c. $\{(0,0), (1,1), (1,2), (2,2), (3,1), (3,3)\}$
- d. $\{(0,0), (1,1), (1,2), (1,3), (2,0), (2,2), (2,3), (3,0), (3,3)\}$
- e. $\{(0,0), (0,1), (0,2), (0,3), (1,0), (1,1), (1,2), (1,3), (2,0), (2,2), (3,3)\}$

**3.** ¿Cuáles de las siguientes relaciones $(S, R)$ son relaciones de orden parcial (POSET) si $S$ es el conjunto de todas las personas en el mundo y $(a,b) \in R$, donde $a$ y $b$ son personas?

- a. $a$ es más alto que $b$.
- b. $a$ no es más alto que $b$.
- c. $a = b$ o $a$ es un ancestro de $b$.
- d. $a$ y $b$ tienen un amigo en común.

**4.** Determine si las relaciones representadas por estas matrices binarias son órdenes parciales.

a.
$$\begin{bmatrix} 1 & 1 & 1 \\ 1 & 1 & 0 \\ 1 & 0 & 1 \end{bmatrix}$$

b.
$$\begin{bmatrix} 1 & 1 & 1 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{bmatrix}$$

c.
$$\begin{bmatrix} 1 & 1 & 1 & 0 \\ 0 & 1 & 1 & 0 \\ 0 & 0 & 1 & 1 \\ 1 & 1 & 0 & 1 \end{bmatrix}$$

> [!NOTE]
> La matriz 4c aparece en el PDF original partida visualmente por el ancho de página (como si fuera de 8 filas × 2 columnas). Se reconstruyó como matriz 4×4 verificando la posición exacta de cada número en el documento fuente, igual que en el Taller 7.

**5.** Determine si las relaciones representadas por estas matrices binarias son órdenes parciales.

a.
$$\begin{bmatrix} 1 & 0 & 1 \\ 1 & 1 & 0 \\ 0 & 0 & 1 \end{bmatrix}$$

b.
$$\begin{bmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 1 & 0 & 1 \end{bmatrix}$$

c.
$$\begin{bmatrix} 1 & 0 & 1 & 0 \\ 0 & 1 & 1 & 0 \\ 0 & 0 & 1 & 1 \\ 1 & 1 & 0 & 1 \end{bmatrix}$$

**6.** Para los siguientes ejercicios, determine si la relación con el grafo dirigido que se muestra es un orden parcial.

a. ![Grafo dirigido ejercicio 6a](images/taller8-ejercicio6-a.png)

b. ![Grafo dirigido ejercicio 6b](images/taller8-ejercicio6-b.png)

c. ![Grafo dirigido ejercicio 6c](images/taller8-ejercicio6-c.png)

d. ![Grafo dirigido ejercicio 6d](images/taller8-ejercicio6-d.png)

**7.** ¿Cuáles de estos pares de elementos son comparables en la relación de orden parcial (POSET) $(\mathbb{Z}^+, \mid)$?

- a. $5, 15$
- b. $6, 9$
- c. $8, 16$
- d. $7, 7$

### Bloque B — Construcción de diagramas de Hasse (8-9)

**8.** Dibuje el diagrama de Hasse para la divisibilidad en el conjunto.

- a. $\{1, 2, 3, 4, 5, 6\}$
- b. $\{3, 5, 7, 11, 13, 16, 17\}$
- c. $\{2, 3, 5, 10, 11, 15, 25\}$
- d. $\{1, 3, 9, 27, 81, 243\}$

**9.** Dibuje el diagrama de Hasse para la divisibilidad en el conjunto.

- a. $\{1, 2, 3, 4, 5, 6, 7, 8\}$
- b. $\{1, 2, 3, 5, 7, 11, 13\}$
- c. $\{1, 2, 3, 6, 12, 24, 36, 48\}$
- d. $\{1, 2, 4, 8, 16, 32, 64\}$

### Bloque C — Lectura de diagramas de Hasse (10)

**10.** En los siguientes ejercicios, liste todos los pares ordenados asociados al diagrama de Hasse adjunto.

a. ![Diagrama de Hasse 10a](images/taller8-ejercicio10-a.png)

b. ![Diagrama de Hasse 10b](images/taller8-ejercicio10-b.png)

c. ![Diagrama de Hasse 10c](images/taller8-ejercicio10-c.png)

### Bloque D — Elementos distinguidos de un POSET (11-13)

**11.** De acuerdo al diagrama de Hasse mostrado a continuación:

![Diagrama de Hasse ejercicio 11](images/taller8-ejercicio11.png)

Responda las siguientes preguntas:

- a. Hallar los maximales.
- b. Hallar los minimales.
- c. ¿Existe un elemento mayor?
- d. ¿Existe un elemento menor?
- e. Hallar todas las cotas superiores de $\{a, b, c\}$.
- f. Hallar la menor de las cotas superiores de $\{a, b, c\}$, si existe.
- g. Hallar todas las cotas inferiores de $\{f, g, h\}$.
- h. Hallar la mayor de las cotas inferiores de $\{f, g, h\}$, si existe.

**12.** Responda estas preguntas para la relación de orden parcial $(\{3, 5, 9, 15, 24, 45\}, \mid)$.

- a. Encuentre los elementos maximales.
- b. Encuentre los elementos minimales.
- c. ¿Hay un elemento máximo?
- d. ¿Hay un elemento mínimo?
- e. Encuentre todas las cotas superiores de $\{3, 5\}$.
- f. Encuentre la mínima cota superior de $\{3, 5\}$, si existe.
- g. Encuentre todas las cotas inferiores de $\{15, 45\}$.
- h. Encuentre la máxima cota inferior de $\{15, 45\}$, si existe.

**13.** Responda estas preguntas para la relación de orden parcial $(\{\{1\}, \{2\}, \{4\}, \{1,2\}, \{1,4\}, \{2,4\}, \{3,4\}, \{1,3,4\}, \{2,3,4\}\}, \subseteq)$.

- a. Encuentre los elementos maximales.
- b. Encuentre los elementos minimales.
- c. ¿Existe un elemento mayor?
- d. ¿Existe un elemento menor?
- e. Encuentre todas las cotas superiores de $\{\{2\}, \{4\}\}$.
- f. Encuentre la mínima cota superior de $\{\{2\}, \{4\}\}$, si existe.
- g. Encuentre todas las cotas inferiores de $\{\{1,3,4\}, \{2,3,4\}\}$.
- h. Encuentre la máxima cota inferior de $\{\{1,3,4\}, \{2,3,4\}\}$, si existe.

## ¿Cómo verificar sus propias respuestas?

> [!TIP]
> Antes de dar por terminado un ejercicio, revise:
> 1. ¿Verificó las tres propiedades (reflexiva, antisimétrica, transitiva) por separado, en vez de asumir que si una se cumple las demás también?
> 2. Al construir un diagrama de Hasse, ¿eliminó correctamente los lazos y las aristas transitivas antes de dibujar? Un diagrama de Hasse con una arista transitiva de más ya no es un diagrama de Hasse válido.
> 3. Al buscar cotas superiores/inferiores, ¿revisó **todo** el conjunto, no solo los elementos "cercanos" en el diagrama?
> 4. ¿Confundió "maximal" (puede haber varios) con "mayor" (único, si existe)? Revise la tabla de Referencia rápida si tiene dudas.

