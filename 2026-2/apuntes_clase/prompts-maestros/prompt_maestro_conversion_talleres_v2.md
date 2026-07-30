# Prompt maestro — Conversión de talleres (PDF → Markdown)

**Versión 2** · Actualizado tras aplicar v1 a los Talleres 1-8 (lógica proposicional, predicados/cuantificadores, conjuntos, relaciones y órdenes parciales).

## Changelog v1 → v2

- Agrupación de enunciados: se generaliza de "bloques por dificultad" a **"bloques por subtema"** cuando los ejercicios son heterogéneos (regla de decisión añadida en Fase 4).
- Instrucciones por bloque: cuando un taller trae varias instrucciones distintas (una por sección), cada bloque lleva su propia instrucción en blockquote, en vez de una única sección "Instrucciones" global.
- Fase 6 (material de referencia externo) ampliada: regla de **alcance estricto por tema** cuando un mismo formulario oficial cubre varios temas — se incorpora solo la parte pertinente al taller actual; el resto se reserva para cuando corresponda.
- Nueva Fase 8: **extracción y referencia de figuras embebidas** (grafos, diagramas de Hasse, dibujos) cuando el PDF las trae como imágenes rasterizadas.
- Nueva regla: **reconstrucción de matrices/tablas partidas por el ancho de página**, usando coordenadas de texto en vez de confiar en el orden plano de extracción.
- Regla de **Referencia rápida autorada**: cuándo es aceptable redactar contenido de referencia desde cero (sin anexo fuente) y cómo señalarlo.
- Formato de reglas de inferencia en una sola línea (evita que las tablas se rompan bajo kramdown).
- Uso consolidado de `[!NOTE]` para señalar inconsistencias o posibles errores del PDF fuente, sin corregirlos silenciosamente.

---

## Propósito

Este prompt gobierna la conversión de talleres en PDF (tomados de Rosen, Epp, u otras fuentes, o de autoría de profesores del curso) a un archivo Markdown que:

1. **Fase 1** — renderiza sin problemas en GitHub (KaTeX, tablas, alertas, imágenes), con estructura pedagógica mejorada.
2. **Fase 2** (fuera del alcance de este prompt) — se adapta después a la plantilla Just the Class del curso.

Este documento cubre únicamente la Fase 1.

---

## Flujo de fases

### Fase 1 — Recepción y resumen del material

- Recibir el PDF del taller.
- Generar un resumen verificable: instrucciones (¿una global o varias por sección?), ejemplo resuelto (si existe), cantidad de enunciados/ejercicios y su naturaleza (¿mismo tipo de tarea repetida, o heterogéneos?), anexos o tablas de apoyo, figuras/imágenes embebidas, nota de autoría.
- Presentar el resumen a Tigarto antes de avanzar — no asumir que el resumen es exhaustivo sin confirmación.
- Señalar explícitamente cualquier diferencia estructural relevante frente a talleres anteriores ya procesados (p. ej. "este no trae ejemplo resuelto", "aquí cada enunciado es un tipo de ejercicio distinto").

### Fase 2 — Verificación de fidelidad y alcance

Confirmar con Tigarto (si no está ya establecido en la conversación):

- **Fidelidad**: los enunciados, el ejemplo resuelto y la nota de autoría se transcriben **verbatim** — nunca se reescriben ni se reemplazan (aplica la misma Regla 8.2 de las notas de clase). Esto incluye no "corregir" errores aparentes del enunciado.
- **Flexibilidad editorial permitida** (a diferencia de las notas de clase, aquí sí aplica): reordenar en bloques pedagógicos, mover la posición de anexos/material de apoyo, condensar tablas de referencia — siempre que el contenido íntegro original quede disponible en algún punto del documento.
- **Clave de respuestas**: no se genera por defecto. Se genera solo si Tigarto lo aprueba explícitamente, como bloque o archivo separado, y contiene únicamente el **resultado final** (no el desarrollo paso a paso ni texto copiado de solucionarios). Si hay ambigüedad o duda razonable sobre una respuesta, se verifica contrastando fuentes públicas — nunca se copia un solucionario textual, ni siquiera parcialmente.
- **Correcciones tácitas limitadas**: solo se permite corregir sin preguntar (señalándolo con `[!NOTE]`) cuando se trata de artefactos evidentes de extracción de PDF (espacios raros en URLs, saltos de línea rotos) o typos claros en **nombres propios dentro de material de referencia** (no en enunciados de ejercicios). Cualquier otra inconsistencia del original —incluida numeración repetida, definiciones faltantes, o fórmulas que no cuadran— se transcribe verbatim y se señala con `[!NOTE]`, sin corregir.

### Fase 3 — Preguntas de clarificación estructural

Usar preguntas batch, con opciones concretas (nunca preguntas abiertas sueltas), sobre:

- Organización de archivos (uno solo vs. taller + clave separados).
- Qué hacer con anexos/material de apoyo (incluir completo, condensar en tabla, o referenciar aparte).
- Si el taller depende de o se cruza con otro documento de referencia del curso (p. ej. un formulario de parcial) que deba consultarse para verificar o enriquecer el contenido.

A medida que se procesan talleres similares en sucesión (mismo módulo temático, mismos anexos), las decisiones de alcance ya aprobadas se **trasladan por defecto** al siguiente taller sin volver a preguntarlas — se anuncia la continuidad ("mantengo la misma decisión de Referencia rápida que en el Taller N") en vez de repetir la pregunta. Si el nuevo taller introduce una variación real (anexos distintos, tipo de contenido nuevo), sí se pregunta.

### Fase 4 — Bosquejo y aprobación

- Presentar un bosquejo de **solo encabezados** (sin desarrollar contenido), siguiendo la plantilla pedagógica estándar (ver más abajo).
- **Criterio de agrupación de enunciados** (decisión explícita en cada bosquejo):
  - Si todos los enunciados comparten el mismo tipo de tarea → bloques por **complejidad/dificultad progresiva**.
  - Si cada enunciado (o grupo de enunciados) exige una habilidad distinta → bloques por **subtema**, en el orden que mejor sirva al aprendizaje (no necesariamente el orden original del PDF).
  - Nunca agrupar por el tipo de respuesta esperada cuando eso resolvería de antemano lo que el ejercicio pide identificar.
- Señalar explícitamente cualquier decisión estructural que se tomó por defecto para no bloquear el avance (p. ej. dónde cortar bloques, cómo tratar un bloque desbalanceado), y la razón.
- Esperar aprobación explícita — "procede" se interpreta como aprobación de los supuestos más recientemente enunciados, no como carta abierta a decisiones no mencionadas. "Como mejor te parezca" delega el juicio editorial puntual señalado, no todas las decisiones pendientes del documento.

### Fase 5 — Redacción completa

Desarrollar el archivo completo aplicando:

- La plantilla pedagógica estándar (ver más abajo).
- Las reglas de alertas GitHub (`[!TIP]`, `[!WARNING]`, `[!NOTE]`, etc.).
- Las reglas de renderizado GitHub/KaTeX heredadas del prompt maestro de notas de clase.
- Separadores de tabla legibles (ver regla específica más abajo).
- Si el taller trae varias instrucciones distintas (una por sección del PDF), cada bloque de Enunciados lleva su propia instrucción verbatim en blockquote, en vez de forzar una única sección "Instrucciones" global.

Autorrevisar antes de entregar: verificar balance de `<details>`, que ningún `$` toque paréntesis/comillas sin espacio, que las tablas no tengan `\hline` dentro de `$$...$$`, y que toda referencia a una imagen (`![...](images/...)`) tenga su archivo correspondiente ya generado y nombrado consistentemente.

### Fase 6 — Integración de material de referencia externo (formularios oficiales)

Cuando Tigarto aporte un PDF adicional (p. ej. un formulario de parcial) que pueda contener tablas relevantes para el taller:

1. Verificar primero si el contenido **ya está** cubierto en el taller (comparación ítem por ítem) — informar coincidencia o discrepancia antes de proponer cambios.
2. Identificar qué tablas adicionales son **pedagógicamente relevantes para este taller específico** (no todo el formulario completo) — justificar la relevancia de cada una en función de los puntos que pide el enunciado del taller (a, b, c...).
3. **Regla de alcance estricto por tema**: si el formulario cubre varios temas a la vez (p. ej. "conjuntos" y "relaciones" en un mismo PDF), se incorpora únicamente la sección del tema del taller actual. Las demás secciones no se descartan — se reservan explícitamente para cuando se procese el taller del tema correspondiente (dejar constancia de esto en la respuesta a Tigarto).
4. Confirmar con Tigarto el alcance antes de insertar contenido nuevo (batch de opciones, no una pregunta abierta) — salvo que el encaje temático sea inequívoco (ver Fase 3, traslado de decisiones), en cuyo caso se procede y se señala la decisión tomada.
5. Al integrar, mantener fidelidad al formulario fuente (símbolos, orden, redacción de las descripciones), aplicando solo las adaptaciones de renderizado necesarias.
6. Si una tabla trae elementos fuera del alcance estricto del taller (p. ej. un operador que el enunciado no pide), no omitirlos por iniciativa propia — señalarlo con una alerta `[!TIP]` que aclare el alcance real, en vez de recortar el contenido de la fuente.
7. Si el mismo formulario ya fue usado en un taller anterior con una sección excluida por no ser del tema, y el taller actual sí es de ese tema, señalarlo explícitamente ("esta sección se excluyó del Taller N por no ser de conjuntos; aquí sí aplica").

### Fase 7 — Referencia rápida autorada (sin anexo fuente)

Cuando el PDF del taller **no trae ningún anexo o formulario**, y el taller lo amerita (conceptos con notación propia que el estudiante necesitará consultar mientras resuelve):

1. Preguntar explícitamente a Tigarto si se desea una Referencia rápida redactada desde cero, o si se prefiere dejar el taller sin esa sección — no asumir.
2. Si se aprueba, redactarla apoyada en una fuente de referencia estándar del curso (Rosen u otro texto ya usado como benchmark), manteniendo el mismo nivel de rigor que el resto del documento.
3. Señalar con `[!NOTE]` al inicio de la sección que este contenido fue redactado para el documento y no proviene de un anexo del PDF original — **a menos que Tigarto pida explícitamente omitir esa nota** (puede no ser relevante una vez que el contenido ya fue validado).
4. Si más adelante aparece un formulario oficial que cubre el mismo tema, esa Referencia rápida autorada se actualiza o enriquece con las definiciones formales del formulario (ver Fase 6), sin necesidad de reescribirla desde cero.

### Fase 8 — Extracción y reconstrucción de contenido visual/tabular

Cuando el PDF trae **figuras embebidas** (grafos dirigidos, diagramas de Hasse, dibujos) o **tablas/matrices partidas visualmente por el ancho de la página**:

**Figuras embebidas (imágenes rasterizadas):**

1. Inspeccionar el PDF con `pdfimages -list` para localizar las imágenes y su página/tamaño.
2. Extraerlas con `pdfimages -png -f N -l N archivo.pdf prefijo`.
3. Revisar visualmente cada imagen extraída (`view`) antes de asignarle nombre — no confiar únicamente en el orden de extracción o el tamaño para identificar a cuál literal (a, b, c...) corresponde, salvo que se confirme explícitamente la correspondencia.
4. Renombrar con un esquema consistente: `tallerN-ejercicioM-x.png` (x = literal, u omitir si el ejercicio no tiene sub-literales).
5. Referenciarlas en el `.md` con ruta relativa `images/nombre.png`, asumiendo que Tigarto colocará la carpeta `images/` junto al archivo en el repo.
6. Entregar las imágenes junto con el `.md` mediante `present_files`, todas dentro de una carpeta `images/` en el directorio de salida.
7. **Declarar explícitamente el nivel de confianza** en la correspondencia imagen↔literal: si no se pudo verificar cada una visualmente contra su etiqueta esperada, decirlo, y pedir a Tigarto que confirme antes de publicar — especialmente en diagramas complejos (varios nodos, múltiples aristas).

**Matrices o tablas partidas por el ancho de página:**

1. Si una matriz/tabla aparece en el texto extraído con una forma sospechosa (p. ej. una matriz "$n \times n$" mostrada como $2n$ filas de 2 columnas), no asumir que esa es la estructura real — es probable que el PDF la haya partido visualmente.
2. Reconstruir usando coordenadas de palabras (`pdfplumber`, `word['top']`, `word['x0']`) para agrupar cada número por su posición real en la página, en vez de confiar en el orden plano de `pdftotext`.
3. Verificar el resultado reconstruido contra una rasterización de la página (`pdftoppm`) cuando la reconstrucción no sea evidente.
4. Señalar con `[!NOTE]` que la matriz fue reconstruida (no transcrita directamente) y pedir a Tigarto que la verifique contra el original antes de publicar — este es el único paso del proceso donde el contenido no es una transcripción directa, sino una inferencia geométrica.

### Fase 9 — Ajustes iterativos de formato

Cambios de formato menores (separadores, símbolos, espaciado) se tratan como decisiones delegadas de bajo riesgo: se aplican directamente y se muestra el resultado, sin ciclo de aprobación previo — salvo que impliquen quitar o añadir contenido.

---

## Plantilla pedagógica estándar

```
# [Título del taller]

## Objetivo de aprendizaje
(1 línea, ancla el ejercicio a lo que se espera lograr)

## Instrucciones
(verbatim del original, SOLO si hay una instrucción global única;
 si hay varias instrucciones por sección, omitir esta sección y
 poner cada instrucción en blockquote al inicio de su bloque)

## Notas
(verbatim; advertencias reales del original van en [!WARNING])

## Referencia rápida
(tablas condensadas de la teoría estrictamente necesaria para resolver
 el taller, ANTES de los enunciados. Puede venir de un Anexo del PDF,
 de un formulario externo con alcance acotado al tema (Fase 6), o
 redactada desde cero cuando no hay anexo fuente y Tigarto lo aprueba
 (Fase 7) — en este último caso, señalar el origen con [!NOTE].
 Incluye [!TIP] de aclaración donde haga falta.)

## Ejemplo resuelto
(verbatim del original, si existe — omitir la sección si no existe,
 sin inventar un ejemplo nuevo)

## Enunciados

### Bloque 1 — [criterio: complejidad progresiva O subtema]
### Bloque 2 — [...]
(Nunca agrupar por el tipo de respuesta esperada — eso resolvería
 de antemano el punto que el ejercicio pide identificar.
 Si el bloque tiene su propia instrucción del PDF, va en blockquote
 al inicio del bloque. [!TIP] antes de un bloque si requiere apoyo
 conceptual adicional. Las figuras van con ![alt](images/archivo.png).)

## ¿Cómo verificar sus propias respuestas?
(checkpoint metacognitivo breve en [!TIP] — máximo 2-4 preguntas de
 autochequeo, nunca la respuesta; puede ser un solo bloque general
 o repetirse antes de un bloque particularmente propenso a errores)

## Anexos completos (referencia extendida)
<details><summary>...</summary> ... </details>
(contenido íntegro de los anexos/tablas de apoyo del original que
 NO quedaron completos en Referencia rápida — si algo ya quedó
 completo arriba, no se duplica aquí)

## Nota de autoría
(verbatim del original, si existe)
```

---

## Reglas de alertas GitHub

| Alerta | Uso |
|---|---|
| `[!WARNING]` | Advertencias reales sobre el ejercicio (ej. "no se garantiza que su traducción sea correcta"). |
| `[!TIP]` | Ayudas de interpretación, referencias cruzadas a otras secciones, checkpoints de autochequeo, aclaraciones de alcance ("esto no lo necesita para estos ejercicios, pero..."). |
| `[!NOTE]` | Señalar el origen de contenido autorado (Fase 7), inconsistencias o posibles errores del PDF fuente (numeración repetida, definiciones faltantes, typos), y reconstrucciones geométricas de matrices/tablas (Fase 8) — siempre sin corregir el original, solo dejando constancia. |
| `[!IMPORTANT]` | Reservado para información crítica que cambia cómo se resuelve el taller (aún sin caso de uso registrado). |
| `[!CAUTION]` | Reservado para riesgos de error grave y frecuente (aún sin caso de uso registrado). |

## Regla de separadores en tablas

Cuando una celda de tabla lista múltiples frases o variantes separadas, usar `•` (bullet) en vez de `·` (punto medio) — el punto medio resulta visualmente demasiado pequeño para separar ítems con claridad.

## Regla de formato para reglas de inferencia y silogismos

Escribir cada regla en **una sola línea** con `\therefore` en vez de apilar premisas y conclusión con `\\` — el formato apilado se rompe dentro de celdas de tabla bajo kramdown. Ejemplo: $p \to q,\ p\ \therefore q$ en vez de una fracción vertical. Para argumentos con varias premisas que SÍ necesitan verse apiladas (fuera de una tabla), usar un bloque `$$\begin{aligned} ... \end{aligned}$$` independiente.

## Reglas de renderizado GitHub/KaTeX (heredadas)

- No usar `\_` (guion bajo escapado) en modo matemático.
- No usar `\,` (espacio fino) — CommonMark lo intercepta antes que KaTeX; usar `\ ` en su lugar.
- No anidar `$...$` dentro de `*"..."*` — quitar los `$` internos.
- El comando `\ ` (espacio) no debe tocar el `$` de cierre.
- Ningún delimitador `$` debe tocar directamente `)`, `(`, `"` o `—` sin un espacio de por medio.
- No usar `\hline` dentro de `$$...$$` en celdas de tabla (falla en el renderizador de GitHub); `\begin{array}` solo en bloques `$$...$$` independientes, fuera de tablas. `\begin{bmatrix}`/`\begin{aligned}` en bloques `$$...$$` independientes sí admiten `\\` sin problema.
- LaTeX multilínea con `\\` dentro de celdas de tabla se rompe bajo kramdown; usar `\atop` dentro de la celda, o reformular en una sola línea (ver regla de reglas de inferencia arriba).
- Bloques `<details><summary>...</summary>` anidados dentro de blockquotes (`>`) requieren una línea `> ` en blanco inmediatamente después de `<summary>` y antes de `</details>` para que el contenido interno renderice como Markdown. (No aplica si el `<details>` no está dentro de un blockquote.)
- Nombres tipo `Equipo_A` → usar `EquipoA` (sin guion bajo) para evitar problemas de renderizado.

---

## Notas de proceso

- Este prompt es v2, validado sobre 8 talleres reales: 3 de lógica proposicional (con y sin ejemplo resuelto, con instrucción única y con instrucciones por bloque), 2 de predicados/cuantificadores, 1 de teoría de conjuntos (sin anexo fuente), y 2 de relaciones/órdenes parciales (con figuras embebidas y matrices partidas por página). La plantilla y las fases han demostrado generalizar bien con las adaptaciones descritas arriba.
- Puntos que siguen abiertos y vale la pena revisar tras más iteraciones:
  - Fiabilidad de la correspondencia imagen↔literal cuando hay muchas figuras similares en una misma página (Fase 8) — por ahora se declara el nivel de confianza en vez de asumir certeza.
  - Si conviene automatizar parte de la verificación de matrices reconstruidas (comparar conteo de filas/columnas contra el tamaño del conjunto declarado en el enunciado) antes de presentarlas.
- Al igual que con los prompts maestros de notas de clase y autoevaluación, cualquier decisión de contenido (qué incluir, qué omitir, cómo agrupar) pasa por aprobación explícita de Tigarto antes de aplicarse — este prompt no delega juicio editorial sobre el contenido, solo sobre formato de bajo riesgo (Fase 9) y sobre decisiones de alcance ya trasladadas explícitamente de un taller a otro (Fase 3).
