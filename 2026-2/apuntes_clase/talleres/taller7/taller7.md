# Taller 7 – Matemáticas Discretas

## Objetivo de aprendizaje

Al finalizar este taller, usted podrá determinar las propiedades de una relación (reflexiva, simétrica, antisimétrica, transitiva), representarla mediante conjuntos de pares ordenados, matrices y grafos dirigidos, y realizar operaciones entre relaciones.

## Referencia rápida

### Propiedades de las relaciones

| Nombre | Descripción formal | Descripción informal |
|---|---|---|
| Reflexiva | $\forall x \in A,\ (x,x) \in R$ | Todo elemento se relaciona consigo mismo |
| No reflexiva | $\exists x \in A,\ (x,x) \notin R$ | Hay al menos un elemento que no se relaciona consigo mismo |
| Antirreflexiva | $\forall x \in A,\ (x,x) \notin R$ | Ningún elemento se relaciona consigo mismo |
| Simétrica | $\forall x,y \in A,\ (x,y) \in R \Rightarrow (y,x) \in R$ | Si un elemento se relaciona con otro, también al revés |
| No simétrica | $\exists x,y \in A,\ (x,y) \in R \land (y,x) \notin R$ | Hay al menos un par que no cumple la simetría |
| Antisimétrica | $\forall x,y \in A,\ (x,y) \in R \land (y,x) \in R \Rightarrow x = y$ | Si dos elementos se relacionan en ambos sentidos, deben ser iguales |
| Asimétrica | $\forall x,y \in A,\ (x,y) \in R \Rightarrow (y,x) \notin R$ | Si un elemento se relaciona con otro, no ocurre al revés |
| Transitiva | $\forall x,y,z \in A,\ (x,y) \in R \land (y,z) \in R \Rightarrow (x,z) \in R$ | Si el primero se relaciona con el segundo, y este con un tercero, el primero se relaciona con el tercero |
| No transitiva | $\exists x,y,z \in A,\ (x,y) \in R \land (y,z) \in R \land (x,z) \notin R$ | Hay casos donde se rompe la transitividad |
| Antitransitiva | $\forall x,y,z \in A,\ (x,y) \in R \land (y,z) \in R \Rightarrow (x,z) \notin R$ | Nunca se forma una cadena transitiva |

> [!NOTE]
> Los ejercicios 15 y 16 usan el término "irreflexiva", mientras que el formulario y los ejercicios 4-5 usan "antirreflexiva". Son sinónimos — se transcribió cada ejercicio con el término que usa el PDF original, sin unificar la terminología.

### Relaciones — definiciones importantes

| Nombre | Definición |
|---|---|
| Producto cartesiano | $A \times B = \{(a,b) \mid a \in A \land b \in B\}$ |
| Relación | $R = \{(x,y) \mid (x \in A) \land (y \in B) \land P(x,y)\}$ |
| Número total de relaciones de $A$ en $B$ | $\lvert \mathcal{P}(A \times B) \rvert = 2^{\lvert A \times B \rvert} = 2^{\lvert A \rvert \cdot \lvert B \rvert}$ |

> [!TIP]
> Las operaciones del Bloque B ($\cup$, $\cap$, $-$, $\oplus$) son las mismas operaciones de conjuntos del Taller 6 — aquí se aplican a relaciones, que no son más que conjuntos de pares ordenados.

## Enunciados

### Bloque A — Identificación de relaciones y sus propiedades (1-7)

**1.** Liste los pares ordenados en la relación $R$ de $A = \{0, 1, 2, 3, 4\}$ a $B = \{0, 1, 2, 3\}$, donde $(a,b) \in R$ si y solo si:

- a. $a = b$
- b. $a + b = 4$
- c. $a > b$
- d. $a \mid b$

**2.** Para cada una de estas relaciones en el conjunto $\{1, 2, 3, 4\}$, determine si es reflexiva, simétrica, antisimétrica y si es transitiva:

- a. $\{(2,2), (2,3), (2,4), (3,2), (3,3), (3,4)\}$
- b. $\{(1,1), (1,2), (2,1), (2,2), (3,3), (4,4)\}$
- c. $\{(2,4), (4,2)\}$
- d. $\{(1,2), (2,3), (3,4)\}$
- e. $\{(1,1), (2,2), (3,3), (4,4)\}$
- f. $\{(1,3), (1,4), (2,3), (2,4), (3,1), (3,4)\}$

**3.** Determine si la relación $R$ en el conjunto de todas las personas es reflexiva, simétrica, antisimétrica y/o transitiva, donde $(a,b) \in R$ si y solo si:

- a. $a$ es más alto que $b$.
- b. $a$ y $b$ nacieron el mismo día.
- c. $a$ tiene el mismo nombre que $b$.
- d. $a$ y $b$ tienen un abuelo en común.

**4.** Una relación $R$ sobre el conjunto $A$ es antirreflexiva si para cada $a \in A$, $(a,a) \notin R$. Es decir, $R$ es antirreflexiva si ningún elemento de $A$ está relacionado consigo mismo. Teniendo en cuenta esto, determine cuáles relaciones del ejercicio 2 son antirreflexivas.

**5.** Una relación $R$ sobre el conjunto $A$ es antirreflexiva si para cada $a \in A$, $(a,a) \notin R$. Es decir, $R$ es antirreflexiva si ningún elemento de $A$ está relacionado consigo mismo. Teniendo en cuenta esto, determine cuáles relaciones del ejercicio 3 son antirreflexivas.

**6.** Una relación $R$ es llamada asimétrica si $(a,b) \in R$ implica que $(b,a) \notin R$. Con esto en mente, determine cuáles relaciones del ejercicio 2 son antisimétricas.

**7.** Una relación $R$ es llamada asimétrica si $(a,b) \in R$ implica que $(b,a) \notin R$. Teniendo en cuenta esto, determine cuáles relaciones del ejercicio 3 son antisimétricas.

> [!NOTE]
> Los ejercicios 6 y 7 definen "asimétrica" pero luego piden identificar cuáles relaciones son "antisimétricas" — son propiedades distintas (ver tabla de Referencia rápida). Se transcribe tal como aparece en el PDF original.

### Bloque B — Operaciones entre relaciones (8-10)

**8.** Sean $R_1 = \{(1,2), (2,3), (3,4)\}$ y $R_2 = \{(1,1), (1,2), (2,1), (2,2), (2,3), (3,1), (3,2), (3,3), (3,4)\}$ relaciones de $\{1,2,3\}$ a $\{1,2,3,4\}$. Encuentre:

- a. $R_1 \cup R_2$
- b. $R_1 \cap R_2$
- c. $R_1 - R_2$
- d. $R_2 - R_1$

**9.** Sea $A$ el conjunto de estudiantes de tu escuela y $B$ el conjunto de libros en la biblioteca de la escuela. Sean $R_1$ y $R_2$ las relaciones que consisten en todos los pares ordenados $(a,b)$, donde el estudiante $a$ debe leer el libro $b$ en un curso, y donde el estudiante $a$ ha leído el libro $b$, respectivamente. Describa los pares ordenados en cada una de estas relaciones.

- a. $R_1 \cup R_2$
- b. $R_1 \cap R_2$
- c. $R_1 \oplus R_2$
- d. $R_1 - R_2$
- e. $R_2 - R_1$

**10.** Sean $R_1$ y $R_2$ las relaciones "congruente módulo 3" y "congruente módulo 4", respectivamente, en el conjunto de los números enteros. Es decir, $R_1 = \{(a,b) \mid a \equiv b \% 3\}$ y $R_2 = \{(a,b) \mid a \equiv b \% 4\}$. Hallar:

- a. $R_1 \cup R_2$
- b. $R_1 \cap R_2$
- c. $R_1 - R_2$
- d. $R_2 - R_1$
- e. $R_1 \oplus R_2$

### Bloque C — Representación matricial de relaciones (11-18)

**11.** Represente cada una de estas relaciones en $\{1,2,3\}$ con una matriz (con los elementos de este conjunto listados en orden creciente).

- a. $\{(1,1), (1,2), (1,3)\}$
- b. $\{(1,2), (2,1), (2,2), (3,3)\}$
- c. $\{(1,1), (1,2), (1,3), (2,2), (2,3), (3,3)\}$
- d. $\{(1,3), (3,1)\}$

**12.** Represente cada una de estas relaciones en $\{1,2,3,4\}$ con una matriz (con los elementos de este conjunto listados en orden creciente).

- a. $\{(1,2), (1,3), (1,4), (2,3), (2,4), (3,4)\}$
- b. $\{(1,1), (1,4), (2,2), (3,3), (4,1)\}$
- c. $\{(1,2), (1,3), (1,4), (2,1), (2,3), (2,4), (3,1), (3,2), (3,4), (4,1), (4,2), (4,3)\}$
- d. $\{(2,4), (3,1), (3,2), (3,4)\}$

**13.** Determine los pares ordenados en las relaciones en $\{1,2,3\}$ correspondientes a estas matrices (donde las filas y columnas corresponden a los enteros listados en orden creciente):

a.
$$\begin{bmatrix} 1 & 0 & 1 \\ 0 & 1 & 0 \\ 1 & 0 & 1 \end{bmatrix}$$

b.
$$\begin{bmatrix} 0 & 1 & 0 \\ 0 & 1 & 0 \\ 0 & 1 & 0 \end{bmatrix}$$

c.
$$\begin{bmatrix} 1 & 1 & 1 \\ 1 & 0 & 1 \\ 1 & 1 & 1 \end{bmatrix}$$

**14.** Determine los pares ordenados en las relaciones en $\{1,2,3,4\}$ correspondientes a estas matrices (donde las filas y columnas corresponden a los enteros listados en orden creciente):

a.
$$\begin{bmatrix} 1 & 1 & 0 & 1 \\ 1 & 0 & 1 & 0 \\ 0 & 1 & 1 & 1 \\ 1 & 0 & 1 & 1 \end{bmatrix}$$

b.
$$\begin{bmatrix} 1 & 1 & 1 & 0 \\ 0 & 1 & 0 & 0 \\ 0 & 0 & 1 & 1 \\ 1 & 0 & 0 & 1 \end{bmatrix}$$

c.
$$\begin{bmatrix} 0 & 1 & 0 & 1 \\ 1 & 0 & 1 & 0 \\ 0 & 1 & 0 & 1 \\ 1 & 0 & 1 & 0 \end{bmatrix}$$

> [!NOTE]
> El PDF original imprime estas tres matrices partidas visualmente por el ancho de la página (como si fueran de 8 filas × 2 columnas). Se reconstruyeron aquí como matrices 4×4, verificando la posición exacta de cada número en el documento fuente antes de transcribir.

**15.** Determine si las relaciones representadas por las matrices del ejercicio 13 son reflexivas, irreflexivas, simétricas, antisimétricas y/o transitivas.

**16.** Determine si las relaciones representadas por las matrices del ejercicio 14 son reflexivas, irreflexivas, simétricas, antisimétricas y/o transitivas.

**17.** ¿Cuántas entradas distintas de cero tiene la matriz que representa la relación $R$ en $A = \{1, 2, 3, \ldots, 100\}$ que consta de los primeros 100 enteros positivos si $R$ es:

- a. $\{(a,b) \mid a > b\}$
- b. $\{(a,b) \mid a \ne b\}$
- c. $\{(a,b) \mid a = b + 1\}$
- d. $\{(a,b) \mid a = 1\}$
- e. $\{(a,b) \mid ab = 1\}$

**18.** Sean $R_1$ y $R_2$ relaciones en un conjunto $A$ representadas por las matrices:

$$M_{R_1} = \begin{bmatrix} 0 & 1 & 0 \\ 1 & 1 & 1 \\ 1 & 0 & 0 \end{bmatrix} \qquad M_{R_2} = \begin{bmatrix} 0 & 1 & 0 \\ 0 & 1 & 1 \\ 1 & 1 & 1 \end{bmatrix}$$

- a. $R_1 \cup R_2$
- b. $R_1 \cap R_2$
- c. $R_1 \oplus R_2$

### Bloque D — Representación mediante grafos dirigidos (19-23)

**19.** Dibuje los grafos dirigidos que representan cada una de las relaciones del ejercicio 11.

**20.** Dibuje los grafos dirigidos que representan cada una de las relaciones del ejercicio 12.

**21.** Dibuje el grafo dirigido que representa la relación: $\{(a,a), (a,b), (b,c), (c,b), (c,d), (d,a), (d,b)\}$

**22.** En los siguientes ejercicios, muestre los pares ordenados en las relaciones representadas por los grafos dirigidos:

a. ![Grafo dirigido 22a](images/taller7-ejercicio22-a.png)

b. ![Grafo dirigido 22b](images/taller7-ejercicio22-b.png)

c. ![Grafo dirigido 22c](images/taller7-ejercicio22-c.png)

d. ![Grafo dirigido 22d](images/taller7-ejercicio22-d.png)

e. ![Grafo dirigido 22e](images/taller7-ejercicio22-e.png)

f. ![Grafo dirigido 22f](images/taller7-ejercicio22-f.png)

**23.** Determine si las relaciones representadas por los grafos dirigidos que se muestran en el ejercicio 22 son reflexivas, irreflexivas, simétricas, antisimétricas y/o transitivas.

## ¿Cómo verificar sus propias respuestas?

> [!TIP]
> Antes de dar por terminado un ejercicio, revise:
> 1. En una matriz, ¿la diagonal principal es toda 1 (reflexiva) o toda 0 (irreflexiva)? Una relación puede no ser ninguna de las dos si la diagonal está mezclada.
> 2. ¿La matriz es simétrica respecto a la diagonal (equivale a $M = M^T$)? Si sí, la relación es simétrica.
> 3. En un grafo dirigido, ¿todo nodo tiene un lazo (self-loop)? Eso indica reflexividad. ¿Cada flecha tiene su par en dirección opuesta? Eso indica simetría.
> 4. Para transitividad, ¿verificó *todos* los caminos de longitud 2 (x→y→z) y confirmó que existe la arista directa x→z en cada caso, no solo en algunos?

