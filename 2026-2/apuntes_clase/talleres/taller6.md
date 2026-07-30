# Taller 6 – Matemáticas Discretas

## Objetivo de aprendizaje

Al finalizar este taller, usted podrá describir conjuntos por extensión y por comprensión, determinar relaciones de subconjunto e igualdad, calcular cardinalidad y conjunto potencia, construir productos cartesianos, realizar operaciones entre conjuntos (unión, intersección, diferencia, complemento, diferencia simétrica) y representarlas mediante diagramas de Venn.

## Referencia rápida

### Notación de conjuntos

| Notación | Nombre | Significado |
|---|---|---|
| $a \in A$ | Pertenencia | $a$ es un elemento del conjunto $A$ |
| $a \notin A$ | No pertenencia | $a$ no es un elemento del conjunto $A$ |
| $\{1, 2, 3\}$ | Notación por extensión | Se listan explícitamente los elementos |
| $\{x \mid P(x)\}$ | Notación por comprensión | Conjunto de todos los $x$ que cumplen la propiedad $P(x)$ |
| $\emptyset$ | Conjunto vacío | Conjunto sin elementos |

### Relaciones entre conjuntos (definición formal)

| Relación | Notación | Definición formal |
|---|---|---|
| Igualdad | $A = B$ | $A = B \Leftrightarrow \forall x\,(x \in A \leftrightarrow x \in B)$ |
| Desigualdad | $A \ne B$ | $A \ne B \Leftrightarrow \exists x\,(x \in A \leftrightarrow x \notin B)$ |
| Subconjunto | $A \subseteq B$ | $A \subseteq B \Leftrightarrow \forall x\,(x \in A \to x \in B)$ |
| No subconjunto | $A \nsubseteq B$ | $A \nsubseteq B \Leftrightarrow \exists x\,(x \in A \land x \notin B)$ |
| Subconjunto propio | $A \subset B$ | $A \subset B \Leftrightarrow \forall x\,(x \in A \to x \in B) \land \exists x\,(x \in A \land x \notin B)$ |

> [!TIP]
> Estas mismas relaciones también se pueden expresar en términos de subconjuntos: $A = B \Leftrightarrow (A \subseteq B) \land (B \subseteq A)$, y $A \subset B \Leftrightarrow (A \subseteq B) \land (A \ne B)$. Es la forma más práctica de demostrar igualdad entre dos conjuntos: probando la doble contenencia.

### Cardinalidad y conjunto potencia

| Notación | Nombre | Significado |
|---|---|---|
| $\lvert A \rvert$ | Cardinalidad | Número de elementos de $A$ |
| $\mathcal{P}(A)$ | Conjunto potencia | Conjunto de todos los subconjuntos de $A$; $\lvert \mathcal{P}(A) \rvert = 2^{\lvert A \rvert}$ |

### Producto cartesiano

| Notación | Nombre | Significado |
|---|---|---|
| $A \times B$ | Producto cartesiano | $\{(a,b) \mid a \in A \land b \in B\}$ |
| $A^n$ | Potencia cartesiana | Producto cartesiano de $A$ consigo mismo $n$ veces: $A \times A \times \cdots \times A$ |
| $\lvert A \times B \rvert$ | Cardinalidad del producto cartesiano | $\lvert A \times B \rvert = \lvert A \rvert \cdot \lvert B \rvert$ |

### Operaciones entre conjuntos

| Operación | Símbolo | Notación algebraica alterna | Definición |
|---|---|---|---|
| Unión | $A \cup B$ | $A + B$ | $\{x \mid x \in A \lor x \in B\}$ |
| Intersección | $A \cap B$ | $A \cdot B$ | $\{x \mid x \in A \land x \in B\}$ |
| Diferencia | $A - B$ | — | $\{x \mid x \in A \land x \notin B\}$ |
| Complemento | $\overline{A}$ | $A'$ | $\{x \mid x \notin A\}$, respecto a un universo $U$; también $A' = U - A$ |
| Diferencia simétrica | $A \oplus B$ | — | $(A - B) \cup (B - A)$ |

> [!TIP]
> La notación algebraica ($A+B$, $A \cdot B$, $A'$) es la que verá en la tabla de identidades a continuación — es la misma operación, solo otra forma de escribirla.

> [!TIP]
> Los diagramas de Venn no tienen una "fórmula" — son representaciones gráficas. Para dibujarlos a mano (Bloque F), empiece por sombrear cada operación por separado (p. ej. $A \cap B$, luego $A \cap C$) y combine las regiones al final.

### Identidades básicas con conjuntos

| Nombre | Equivalencia |
|---|---|
| Idempotencia | $A \cdot A = A$ ; $A + A = A$ |
| Identidad | $A \cdot U = A$ ; $A + \emptyset = A$ |
| Dominación | $A \cdot \emptyset = \emptyset$ ; $A + U = U$ |
| Conmutativa | $A \cdot B = B \cdot A$ ; $A + B = B + A$ |
| Asociativa | $A \cdot (B \cdot C) = (A \cdot B) \cdot C$ ; $A + (B + C) = (A + B) + C$ |
| Distributiva | $A \cdot (B + C) = A \cdot B + A \cdot C$ ; $A + (B \cdot C) = (A + B) \cdot (A + C)$ |
| Complemento | $A \cdot A' = \emptyset$ ; $A + A' = U$ |
| Doble negación | $A'' = A$ |
| Absorción | $A \cdot (A + B) = A$ ; $A + A \cdot B = A$ |
| De Morgan | $(A \cdot B)' = A' + B'$ ; $(A + B)' = A' \cdot B'$ |

> [!TIP]
> Estas identidades tienen la misma estructura que las equivalencias lógicas de los talleres de lógica proposicional ($\land \leftrightarrow \cdot$, $\lor \leftrightarrow +$, $\neg \leftrightarrow {}'$) — si ya domina esas, estas se aprenden por analogía.

### Identidades básicas con cardinalidad

- $\lvert \emptyset \rvert = 0$
- Si $A \cdot B = \emptyset$ (conjuntos disjuntos), entonces $\lvert A + B \rvert = \lvert A \rvert + \lvert B \rvert$
- $\lvert A + B \rvert = \lvert A \rvert + \lvert B \rvert - \lvert A \cdot B \rvert$
- $\lvert A - B \rvert = \lvert A \rvert - \lvert A \cdot B \rvert$
- $\lvert A \cdot B \rvert \le \lvert A \rvert$
- $\lvert A \rvert \le \lvert A + B \rvert$
- $\lvert A' \rvert = \lvert U \rvert - \lvert A \rvert$
- $a \le \lvert A \rvert \le b \leftrightarrow \lvert U \rvert - a \le \lvert A' \rvert \le \lvert U \rvert - b$
- $\max(\lvert A \rvert, \lvert B \rvert) \le \lvert A + B \rvert \le \min(\lvert A \rvert + \lvert B \rvert, \lvert U \rvert)$
- $\max(0, \lvert A \rvert + \lvert B \rvert - \lvert U \rvert) \le \lvert A \cdot B \rvert \le \min(\lvert A \rvert, \lvert B \rvert)$

> [!TIP]
> La tercera identidad ($\lvert A + B \rvert = \lvert A \rvert + \lvert B \rvert - \lvert A \cdot B \rvert$) es el principio de inclusión-exclusión para dos conjuntos — es la herramienta clave para el ejercicio 24.

> [!NOTE]
> La última cota decía en el PDF fuente "$\mathrm{Min}(|A| + |B|)$" (mínimo de un solo argumento, no tiene sentido matemático). Se transcribió aquí como $\min(\lvert A \rvert, \lvert B \rvert)$, que es la lectura estándar de esta cota. Revísela contra el formulario original antes de publicar.

## Enunciados

### Bloque A — Notación de conjuntos (1-2)

**1.** Liste los miembros de estos conjuntos:

- a. $\{x \mid x \text{ es un número real tal que } x^2 = 1\}$
- b. $\{x \mid x \text{ es un entero positivo menor que } 12\}$
- c. $\{x \mid x \text{ es el cuadrado de un entero y } x < 100\}$
- d. $\{x \mid x \text{ es entero tal que } x^2 = 2\}$

**2.** Use la notación por comprensión para dar una descripción de cada uno de los siguientes conjuntos:

- a. $\{0, 3, 6, 9, 12\}$
- b. $\{-3, -2, -1, 0, 1, 2, 3\}$
- c. $\{m, n, o, p\}$

### Bloque B — Subconjuntos e igualdad de conjuntos (3-4)

**3.** Para cada uno de estos pares de conjuntos, determine si el primero es un subconjunto del segundo, el segundo es un subconjunto del primero, o ninguno es un subconjunto del otro.

- a. El conjunto de vuelos de aerolíneas de Nueva York a Nueva Delhi, el conjunto de vuelos de aerolíneas sin escalas de Nueva York a Nueva Delhi.
- b. El conjunto de personas que hablan inglés, el conjunto de personas que hablan chino.
- c. El conjunto de ardillas voladoras, el conjunto de criaturas vivas que pueden volar.

**4.** Determine si cada uno de estos pares de conjuntos son iguales.

- a. $\{1, 3, 3, 3, 5, 5, 5, 5, 5\}$, $\{5, 3, 1\}$
- b. $\{\{1\}\}$, $\{1, \{1\}\}$
- c. $\emptyset$, $\{\emptyset\}$

### Bloque C — Cardinalidad, conjunto potencia y diagramas de Venn básicos (5-8)

**5.** Utilice un diagrama de Venn para mostrar las relaciones $A \subset B$ y $A \subset C$.

**6.** ¿Cuál es la cardinalidad de cada uno de estos conjuntos?

- a. $\{a\}$
- b. $\{\{a\}\}$
- c. $\{a, \{a\}\}$
- d. $\{a, \{a\}, \{a, \{a\}\}\}$
- e. $\emptyset$
- f. $\{\emptyset\}$
- g. $\{\emptyset, \{\emptyset\}\}$
- h. $\{\emptyset, \{\emptyset\}, \{\emptyset, \{\emptyset\}\}\}$

**7.** ¿Cuántos elementos tiene cada uno de estos conjuntos donde $a$ y $b$ son elementos distintos?

- a. $\mathcal{P}(\{a, b, \{a, b\}\})$
- b. $\mathcal{P}(\{\emptyset, a, \{a\}, \{\{a\}\}\})$
- c. $\mathcal{P}(\mathcal{P}(\emptyset))$

**8.** Determine si cada uno de estos conjuntos es el conjunto potencia de un conjunto, donde $a$ y $b$ son elementos distintos.

- a. $\emptyset$
- b. $\{\emptyset, \{a\}\}$
- c. $\{\emptyset, \{a\}, \{\emptyset, \{a\}\}\}$
- d. $\{\emptyset, \{a\}, \{b\}, \{a, b\}\}$

### Bloque D — Producto cartesiano (9-12)

**9.** Sea $A = \{a, b, c, d\}$ y $B = \{y, z\}$. Encuentre:

- a. $A \times B$
- b. $B \times A$

**10.** Sea $A = \{a, b, c\}$, $B = \{x, y\}$ y $C = \{0, 1\}$. Encuentre:

- a. $A \times B \times C$
- b. $C \times B \times A$
- c. $C \times A \times B$
- d. $B \times B \times B$

**11.** Encuentre $A^2$ si:

- a. $A = \{0, 1, 3\}$
- b. $A = \{1, 2, a, b\}$

**12.** Encuentre $A^3$ si:

- a. $A = \{a\}$
- b. $A = \{0, a\}$

### Bloque E — Operaciones entre conjuntos (13-17)

**13.** Sea $A$ el conjunto de estudiantes que viven a menos de una milla de la escuela y sea $B$ el conjunto de estudiantes que van caminando a clases. Describa a los estudiantes en cada uno de estos conjuntos:

- a. $A \cap B$
- b. $A \cup B$
- c. $A - B$
- d. $B - A$

**14.** Sea $A = \{1, 2, 3, 4, 5\}$ y $B = \{0, 3, 6\}$. Obtenga:

- a. $A \cup B$
- b. $A \cap B$
- c. $A - B$
- d. $B - A$

**15.** Sea $A = \{a, b, c, d, e\}$ y $B = \{a, b, c, d, e, f, g, h\}$. Obtenga:

- a. $A \cup B$
- b. $A \cap B$
- c. $A - B$
- d. $B - A$

**16.** Sea $A$ y $B$ tales que $A - B = \{1, 5, 7, 8\}$, $B - A = \{2, 10\}$ y $A \cap B = \{3, 6, 9\}$.

> [!NOTE]
> El enunciado original no especifica explícitamente qué se pide calcular a partir de estos datos (posible truncamiento en el PDF fuente). Se transcribe tal como aparece.

**17.** Sea $A = \{0, 2, 4, 6, 8, 10\}$, $B = \{0, 1, 2, 3, 4, 5, 6\}$ y $C = \{4, 5, 6, 7, 8, 9, 10\}$. Encuentre:

- a. $A \cap B \cap C$
- b. $A \cup B \cup C$
- c. $(A \cup B) \cap C$
- d. $(A \cap B) \cup C$

### Bloque F — Diagramas de Venn combinados (18-20)

**18.** Dibuje los diagramas de Venn para cada una de las siguientes combinaciones para los conjuntos $A$, $B$ y $C$:

- a. $A \cap (B \cup C)$
- b. $\overline{A} \cap \overline{B} \cap \overline{C}$
- c. $(A - B) \cup (A - C) \cup (B - C)$

**19.** Dibuje los diagramas de Venn para cada una de las siguientes combinaciones para los conjuntos $A$, $B$ y $C$:

- a. $A \cap (B - C)$
- b. $(A \cap B) \cup (A \cap C)$
- c. $(A \cap \overline{B}) \cup (A \cap \overline{C})$

**20.** Dibuje los diagramas de Venn para cada una de las siguientes combinaciones para los conjuntos $A$, $B$, $C$ y $D$:

- a. $(A \cap B) \cup (C \cap D)$
- b. $\overline{A} \cup \overline{B} \cup \overline{C} \cup \overline{D}$
- c. $A - (B \cap C \cap D)$

### Bloque G — Propiedades, diferencia simétrica y aplicaciones (21-24)

**21.** ¿Qué puede usted decir sobre los conjuntos $A$ y $B$ si se conoce que:

- a. $A \cup B = A$
- b. $A \cap B = A$
- c. $A - B = A$
- d. $A \cap B = B \cap A$
- e. $A - B = B - A$

**22.** Encuentre la diferencia simétrica de $\{1, 3, 5\}$ y $\{1, 2, 3\}$.

**23.** La similitud de Jaccard $J(A,B)$ de los conjuntos finitos $A$ y $B$ es $J(A,B) = \dfrac{|A \cap B|}{|A \cup B|}$, con $J(\emptyset, \emptyset) = 1$. La distancia de Jaccard $d_J(A,B)$ entre $A$ y $B$ es igual a $d_J(A,B) = 1 - J(A,B)$. Encuentre $J(A,B)$ y $d_J(A,B)$ para los siguientes pares de conjuntos:

- a. $A = \{1, 3, 5\}$, $B = \{2, 4, 6\}$
- b. $A = \{1, 2, 3, 4\}$, $B = \{3, 4, 5, 6\}$
- c. $A = \{1, 2, 3, 4, 5, 6\}$, $B = \{1, 2, 3, 4, 5, 6\}$
- d. $A = \{1\}$, $B = \{1, 2, 3, 4, 5, 6\}$

**24.** En una batalla muy reñida, por lo menos el 70 % de los combatientes perdieron un ojo; por lo menos el 75 % una oreja; por lo menos el 80 % un brazo y por lo menos el 85 % una pierna. ¿Cuál es el mínimo de combatientes que perdieron los 4 miembros?

## ¿Cómo verificar sus propias respuestas?

> [!TIP]
> Antes de dar por terminado un ejercicio, revise:
> 1. Al listar los elementos de un conjunto, ¿eliminó los duplicados? (Un conjunto no repite elementos, aunque la notación por comprensión los genere repetidos — ver ejercicio 4a).
> 2. Al calcular un conjunto potencia, ¿el número de elementos que obtuvo es $2^n$, donde $n$ es la cardinalidad del conjunto original? (Incluyendo siempre $\emptyset$ y el conjunto mismo).
> 3. En un producto cartesiano $A \times B \times C$, ¿respetó el orden? $A \times B \times C$ no es lo mismo que $C \times B \times A$ — los elementos son tuplas ordenadas.
> 4. En un diagrama de Venn con una operación combinada, ¿sombreó cada sub-operación por separado antes de combinar las regiones?

