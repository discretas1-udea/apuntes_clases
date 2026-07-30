# Taller 1 – Matemáticas Discretas

## Objetivo de aprendizaje

Al finalizar este taller, usted podrá clasificar oraciones declarativas y traducirlas a una fórmula bien formada (fbf) usando los conectores $\neg\ \land\ \lor\ \to\ \leftrightarrow$.

## Instrucciones

En los ejercicios que encontrará a continuación observará oraciones declarativas. Se le pide:

a. Especificar el tipo de oración declarativa: simple, negativa, disyuntiva, conjuntiva, condicional o bicondicional.

b. Identificar sus oraciones simples componentes.

c. Traducirlo a una fbf que usted crea le corresponda. Observe los conectores u operadores lógicos: $\neg\ \land\ \lor\ \to\ \leftrightarrow$

### Sugerencias para resolver el ejercicio planteado

- Lea cuidadosamente cada oración.
- Identifique oraciones declarativas simples.
- Represente cada oración declarativa simple.
- Agrúpelos y enlácelos de manera que el resultado corresponda al sentido que, usted cree, tiene la oración originalmente suministrada (eso puede resultar en forma declarativa compuesta).

### Notas

- A una secuencia aceptada de signos se la denomina fórmula bien formada (fbf); también se la conoce como forma declarativa.

> [!WARNING]
> No se garantiza que una fbf que usted construya corresponda a la proposición que pretende representar. La traducción depende de la interpretación que usted haga del enunciado.

## Referencia rápida: tipos de enunciado

Sean $P$ y $Q$ dos enunciados declarativos cualquiera (simples o compuestos). Use esta tabla como apoyo para el punto (a) de cada ejercicio.

| Tipo | Se reconoce por frases como... |
|---|---|
| Conjuntivo | $P$ y $Q$ • $P$, pero $Q$ • $P$ aunque $Q$ • $P$ sin embargo $Q$ |
| Disyuntivo | $P$ o $Q$ • $P$, a menos que $Q$ • Al menos una entre $P$ y $Q$ |
| Condicional | Si $P$ entonces $Q$ • $P$ sólo si $Q$ • $Q$ siempre que $P$ • $P$ implica que $Q$ |
| Bicondicional | $P$ si, y solo si, $Q$ • $P$ es equivalente a $Q$ |

> [!TIP]
> ¿Duda con "a menos que"? Interprételo como: si una proposición no es verdadera, la otra sí lo es (o lo será). Es decir, si $Q$ fuera falsa, le correspondería a $P$ ser cierta.

> [!TIP]
> El listado completo de frases (incluyendo variantes en inglés y español para los pasajes argumentativos) está disponible en la sección **Anexos completos**, al final de este documento.

### Proposiciones simples y compuestas

Antes de identificar los conectores, recuerde la distinción entre los dos tipos de proposición — es la base del punto (b) de cada ejercicio.

| Tipo | Descripción | Ejemplo |
|---|---|---|
| Simples (atómicas) | No se pueden dividir en partes más pequeñas con valor de verdad. | Hoy es lunes. |
| Compuestas (moleculares) | Formadas al unir dos o más proposiciones simples mediante conectores lógicos. | Hoy es lunes y hace sol. |

### Operadores lógicos

| Operador | Símbolo | Nombre | Descripción |
|---|---|---|---|
| Negación | $\neg p$ | No (NOT) | Niega el valor de verdad de una proposición. Si $p$ es verdadera, $\neg p$ es falsa. |
| Conjunción | $p \land q$ | Y (AND) | Es verdadera solo si ambas proposiciones lo son. |
| Disyunción | $p \lor q$ | O (OR) | Es verdadera si al menos una de las proposiciones lo es. |
| Disyunción exclusiva | $p \oplus q$ | O exclusiva (XOR) | Es verdadera si una, y solo una, de las proposiciones es verdadera. |
| Condicional | $p \to q$ | Si … entonces … (Implica) | Solo es falsa cuando $p$ es verdadera y $q$ es falsa. |
| Bicondicional | $p \leftrightarrow q$ | … si y solo si … (Equivale) | Es verdadera cuando ambas proposiciones tienen el mismo valor de verdad. |

> [!TIP]
> Este taller solo pide los conectores $\neg\ \land\ \lor\ \to\ \leftrightarrow$; la disyunción exclusiva ($\oplus$) se incluye aquí por completitud del formulario del curso, pero no la necesitará para estos 14 enunciados.

### Precedencia y asociatividad

Cuando un enunciado tiene varios conectores (por ejemplo, los enunciados 6 y 9), use esta tabla para decidir cómo agrupar con paréntesis.

| Prioridad | Símbolo | Asociatividad | Ejemplo con paréntesis |
|---|---|---|---|
| 1 (más alta) | $\neg$ | No aplica (unitario) | $\neg p \land q \Longrightarrow ((\neg p) \land q)$ |
| 2 | $\land$ | Izquierda | $p \land q \land r \Longrightarrow ((p \land q) \land r)$ |
| 3 | $\lor$ | Izquierda | $p \lor q \lor r \Longrightarrow ((p \lor q) \lor r)$ |
| 4 | $\oplus$ | Izquierda | $p \oplus q \oplus r \Longrightarrow ((p \oplus q) \oplus r)$ |
| 5 | $\to$ | Derecha | $p \to q \to r \Longrightarrow (p \to (q \to r))$ |
| 6 (más baja) | $\leftrightarrow$ | Derecha | $p \leftrightarrow q \leftrightarrow r \Longrightarrow (p \leftrightarrow (q \leftrightarrow r))$ |

> [!TIP]
> La negación siempre aplica a la proposición o expresión inmediatamente después de ella. Cuando la expresión tiene paréntesis anidados, evalúela de adentro hacia afuera. Use paréntesis para evitar ambigüedad, aunque la tabla de precedencia le diga cuál es el orden por defecto.

## Ejemplo resuelto

> María prepara un pastel, pero no prepara jugo si compra gaseosa.

Este es una oración conjuntiva, compuesta por dos oraciones: una simple (María prepara un pastel), y otra condicional (no prepara jugo si compra gaseosa).

Las formas declarativas simples, a emplear, son los símbolos $p$, $q$ y $r$; observe una posible asignación de ellos a las oraciones declarativas:

- $p$: María prepara un pastel.
- $q$: María prepara jugo.
- $r$: Se compra gaseosa.

De esta manera, la oración conjuntiva original se traduciría mediante la siguiente forma declarativa:

$$p \land (r \to \neg q)$$

## Enunciados

### Bloque 1 — Enunciados 1 a 11

1. La lectura es mi pasión.
2. La investigación no tendrá problemas.
3. Me he equivocado, pero no volverá a pasar.
4. El jefe pretende que acepte sus condiciones, de lo contrario, me despedirá.
5. Si no te esfuerzas no será fácil alcanzar tus objetivos.
6. Acepto la propuesta de trabajo, solo si el salario es alto y el horario no es extenso.
7. No voy a fútbol cuando mi equipo no está jugando bien.
8. Me voy para piscina, en caso de que el calor esté fuerte.
9. Yo te ayudo si, y sólo si muestras verdadero compromiso.
10. Es necesario que prepares tus inquietudes en caso que pidas asesoría.
11. Ponte en los zapatos del otro para que comprendas lo que defiende.

### Bloque 2 — Enunciados 12 a 14

> [!TIP]
> Estos tres enunciados incluyen frases de tipo argumentativo/epistémico ("se dice que...", "han coincidido en afirmar que..."). Si tiene dudas sobre cómo tratar ese tipo de frase, consulte los **Anexos 2 y 3** (indicadores de pasajes argumentativos) en la sección de Anexos completos.

12. Se dice que: la caída de un meteorito en la tierra acabaría con el 95% de los seres vivos.
13. Varias investigaciones científicas han coincidido en afirmar que: no ha habido mejora evidente en el desempeño académico de los estudiantes con el desarrollo tecnológico.
14. La elaboración de una fbf para una proposición en el cálculo proposicional, no asegura que se tradujo apropiadamente.

## ¿Cómo verificar su propia fbf?

> [!TIP]
> Antes de dar por terminado un ejercicio, revise:
> 1. ¿El número de variables proposicionales que definió coincide con las oraciones simples que identificó en el punto (b)?
> 2. ¿Su fbf refleja el conector que domina la oración completa (el que la "envuelve"), y no solo un conector interno?

## Anexos completos (referencia extendida)

<details>
<summary>Ver Anexo 1 completo — tipos de enunciados declarativos</summary>

Sean $P$ y $Q$ dos enunciados declarativos cualquiera (simples o compuestos).

| Tipo | Enunciados |
|---|---|
| Conjuntivo | $P$ y $Q$ • $P$, pero $Q$ • $P$ aún $Q$ • $P$ también $Q$ • $P$ todavía $Q$ • $P$, aunque $Q$ • $P$ sin embargo $Q$ • $P$ además $Q$ • $P$ no obstante $Q$ |
| Disyuntivo | $P$ o $Q$ • $P$, a menos que $Q$ • Al menos una entre $P$ y $Q$ |

> [!TIP]
> "A menos que": si una proposición no es verdadera, la otra es, o será, verdadera. Si $Q$ fuera falsa, le correspondería a $P$ ser cierta.

Sobre el enunciado declarativo condicional: en este caso $P$ representa al antecedente y $Q$ el consecuente.

| Tipo | Enunciados |
|---|---|
| Condicionales (Hipotéticos) | Si $P$ entonces $Q$ • Si $P$, $Q$ • $Q$ si $P$ • $P$ sólo si $Q$ • Para $P$, es necesario $Q$ • Es suficiente $P$ para $Q$ • $Q$ en caso de que $P$ • $Q$ siempre que $P$ • Como $P$, $Q$ • $Q$ cuando $P$ • $P$ implica que $Q$ • Cuando $P$, $Q$ |
| Bicondicionales | $P$ si, y solo si, $Q$ • $P$ es suficiente y necesario para $Q$ • $P$ es equivalente a $Q$ • $P$ y $Q$ son equivalentes |

</details>

<details>
<summary>Ver Anexo 2 — indicadores de pasajes argumentativos deductivos</summary>

En los pasajes argumentativos, $P$ representaría a la(s) premisa(s), $Q$ simboliza a la conclusión.

**Indicadores de conclusión**

| Español | Inglés |
|---|---|
| … por lo tanto $Q$ | thus |
| … de ahí que $Q$ | hence |
| … así $Q$ / … así que $Q$ | so |
| … por consiguiente $Q$ | therefore |
| … en consecuencia $Q$ / … consecuentemente $Q$ | consequently |
| … prueba que $Q$ | prove that |
| … como resultado $Q$ | as a result |
| … por esta razón $Q$ / … por estas razones $Q$ | for this reason / for these reasons |
| … de este modo $Q$ | in this way |
| … se sigue que $Q$ | it follows that |
| … se concluye que $Q$ | it is concluded that |
| … lo que muestra que $Q$ | which shows that |
| … lo que quiere decir que $Q$ | — |
| … lo que conlleva a $Q$ | which leads to |
| … lo que implica que $Q$ | which implies that |
| … lo que permite inferir que $Q$ | which allows us to infer that |
| … lo que lleva a la conclusión de que $Q$ | — |
| … podemos inferir que $Q$ | we can infer that |

**Premisas**

| Español | Inglés |
|---|---|
| … puesto que $P$ / … ya que $P$ | since |
| … porque $P$ | because |
| … como $P$ | — |
| … se sigue de $P$ | follows from |
| … como lo muestra $P$ | as it shows |
| … dado que $P$ | given that |
| … como lo indica $P$ | as indicated |
| … la razón es que $P$ | the reason is that |
| … por la razón de que $P$ | for the reason that |
| … puede inferirse de $P$ | can be inferred from |
| … puede derivarse de $P$ | can be derived from |
| … puede deducirse de $P$ | can be deduced from |
| … en vista del hecho de que $P$ | in view of the fact that |

</details>

<details>
<summary>Ver Anexo 3 — indicadores de pasajes argumentativos inductivos</summary>

| Español | Inglés |
|---|---|
| … debe ser el caso que $Q$ | it must be the case that |
| … probablemente $Q$ | probably |
| … por lo tanto, … probablemente $Q$ | therefore, ... probably |
| … debería(n) $Q$ | should |
| … es probable que $Q$ | it is likely that |
| … debe haber sido que $Q$ | there must have been |
| … se puede decir con virtual certeza $Q$ | it can be said with virtual certainty |
| … puede haber tenido $Q$ | may have had |
| … tendría $Q$ | would have |
| … haría $Q$ | would |

</details>

## Nota de autoría

> Este material fue preparado en su totalidad por el profesor Carlos Mario Sierra (carlos.sierra@udea.edu.co).
