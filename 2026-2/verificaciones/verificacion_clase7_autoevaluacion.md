# Verificación — Autoevaluación Clase 07 (uso exclusivo del profesor)

*No incluir en el archivo del estudiante. Cubre Serie 2 en adelante, per checklist del prompt maestro de autoevaluación.*

**Nota de adaptación:** el formato Afirmación–Razón del prompt maestro está diseñado para cadenas de inferencia proposicional (Clase 06). La Clase 07 no enseña todavía inferencia con cuantificadores — solo traducción, negación y evaluación —, así que aquí el desarrollo se presenta como justificación paso a paso en vez de tabla Afirmación–Razón numerada. Esto permite la misma revisión rápida sin inventar un formalismo que el curso aún no cubre.

---

### Ítem 10

*"Ningún archivo corrupto se puede abrir."*

1. Estructura: forma E ("Ningún $S$ es $P$").
2. Diccionario: $corrupto(x)$, $abrible(x)$.
3. Plantilla E: $\forall x\,(S(x) \rightarrow \neg P(x))$.
4. Resultado: $\forall x\,\bigl(corrupto(x) \rightarrow \neg abrible(x)\bigr)$.

### Ítem 11

$\exists x\,\bigl(becado(x) \land destacado(x)\bigr)$

1. Cuantificador $\exists$ + conectivo $\land$ → coincide con la plantilla de la forma I.
2. Verificación de la regla de oro: $\exists$ con $\rightarrow$ produciría verdad trivial (basta un objeto no becado); $\exists$ con $\land$ exige que ambas propiedades se cumplan en el mismo objeto — es lo que pide "algún $S$ es $P$".
3. Conclusión: forma I, emparejamiento correcto.

### Ítem 12

$\exists x\,\bigl(sensor(x) \rightarrow danado(x)\bigr)$ — traducción del estudiante.

1. Detectar el patrón: $\exists$ con $\rightarrow$ → señal de alerta (Parte III.2 / V.2).
2. Contraejemplo de por qué falla: si existe **un solo** objeto del universo que no sea sensor, el antecedente $sensor(x)$ es falso para ese objeto, la implicación es verdadera, y toda la fórmula existencial ya es verdadera — sin que ningún sensor esté dañado.
3. Corrección: reemplazar $\rightarrow$ por $\land$ → $\exists x\,\bigl(sensor(x) \land danado(x)\bigr)$ (forma I).

### Ítem 13

$\forall x\,\bigl(seguro(x) \land actualizado(x)\bigr)$ → negar.

1. Aplicar la ley de negación de cuantificadores: $\neg\,\forall x\,P(x) \equiv \exists x\,\neg P(x)$, con $P(x) = seguro(x)\land actualizado(x)$.
2. Resultado: $\exists x\,\neg\bigl(seguro(x) \land actualizado(x)\bigr)$.
3. Nota: el curso **no** pide distribuir la negación sobre $\land$ (eso sería De Morgan, Clase 05) — se decidió excluir el entrenamiento cruzado en esta autoevaluación, así que la respuesta se detiene aquí deliberadamente.

### Ítem 14

Respuesta abierta — cualquier par de universos donde $manejaPresion(x)$ cambie de valor de verdad es válido. Verificar que el estudiante:
- Proponga un universo "restringido" plausible donde sea verdadera (ej. un grupo entrenado para ello).
- Proponga un universo "amplio" donde sea falsa (ej. toda la población general).
- Articule que el cambio se debe **al universo**, no a la fórmula.

---

### Ítem 15 — Reto Final (traducción)

Tabla de hechos del enunciado (para referencia rápida al calificar el Ítem 16):

| | thor | hulk | ironman | capitan | viuda | ojo |
|:---|:---:|:---:|:---:|:---:|:---:|:---:|
| tienePoderes | V | V | F | F | F | F |
| esHumano | F | F | V | V | V | V |
| disponible | V | F | V | V | V | F |

**(a)** "Todo Vengador disponible tiene poderes sobrehumanos" → forma A → $\forall x\,(disponible(x)\rightarrow tienePoderes(x))$.

**(b)** "Ningún Vengador completamente humano tiene poderes sobrehumanos" → forma E → $\forall x\,(esHumano(x)\rightarrow \neg tienePoderes(x))$.

**(c)** "Algún Vengador disponible tiene poderes sobrehumanos" → forma I → $\exists x\,(disponible(x)\land tienePoderes(x))$.

### Ítem 16 — Reto Final (evaluación y negación)

**(a)** $tienePoderes(hulk)=V$, $disponible(hulk)=F$ → $V\land F = F$.

**(b)** Recorrer la columna tienePoderes de la tabla: verdadero solo en $thor$ y $hulk$ → conjunto de verdad $=\{thor, hulk\}$.

**(c)** Negación de 15(a): $\exists x\,(disponible(x)\land\neg tienePoderes(x))$.
 Evaluación con la tabla: se busca un objeto con $disponible=V$ y $tienePoderes=F$. Hay **tres** testigos válidos: $ironman$, $capitan$ y $viuda$ (todos con disponible=V, tienePoderes=F). Con al menos uno ya alcanza para la negación → **verdadera**.
 Consecuencia lógica: como la negación de 15(a) es verdadera, 15(a) misma es **falsa** — el estudiante puede mencionar esto como verificación cruzada, aunque no se pide explícitamente.

---

## Checklist de verificación aplicado a este bloque

- [x] Cobertura: los 9 bloques temáticos de `clase7.md` (I–V.2) tienen al menos un ítem trazable.
- [x] Ningún ítem repite los "Ejercicios resueltos" ni los "Ejercicios propuestos" de `clase7.md`.
- [x] Terminología idéntica a `clase7.md` (formas A/E/I/O, "conjunto de verdad", "función proposicional").
- [x] Cero escapes `\_` y cero guiones bajos crudos en modo matemático (verificado con búsqueda de texto).
- [x] Registro formal (usted) en todo el documento del estudiante.
- [x] Reto Final: caso aplicado (Avengers, por decisión explícita del profesor) — narrativa ausente en Calentamiento a Serie 2.
- [x] Serie 3 (entrenamiento cruzado) omitida por decisión explícita — estructura Calentamiento → Serie 1 → Serie 2 → Reto Final.
