# Prompt maestro — Conversión de talleres (PDF → Markdown)

**Versión 1** · Destilado del proceso iterativo realizado sobre el Taller 1 (Matemáticas Discretas 1, UdeA).

## Propósito

Este prompt gobierna la conversión de talleres en PDF (tomados de Rosen, Epp, u otras fuentes, o de autoría de profesores del curso) a un archivo Markdown que:

1. **Fase 1** — renderiza sin problemas en GitHub (KaTeX, tablas, alertas), con estructura pedagógica mejorada.
2. **Fase 2** (fuera del alcance de este prompt) — se adapta después a la plantilla Just the Class del curso.

Este documento cubre únicamente la Fase 1.

---

## Flujo de fases

### Fase 1 — Recepción y resumen del material

- Recibir el PDF del taller.
- Generar un resumen verificable: instrucciones, ejemplo resuelto (si existe), cantidad de enunciados/ejercicios, anexos o tablas de apoyo, nota de autoría.
- Presentar el resumen a Tigarto antes de avanzar — no asumir que el resumen es exhaustivo sin confirmación.

### Fase 2 — Verificación de fidelidad y alcance

Confirmar con Tigarto (si no está ya establecido en la conversación):

- **Fidelidad**: los enunciados, el ejemplo resuelto y la nota de autoría se transcriben **verbatim** — nunca se reescriben ni se reemplazan (aplica la misma Regla 8.2 de las notas de clase).
- **Flexibilidad editorial permitida** (a diferencia de las notas de clase, aquí sí aplica): reordenar en bloques pedagógicos, mover la posición de anexos/material de apoyo, condensar tablas de referencia — siempre que el contenido íntegro original quede disponible en algún punto del documento.
- **Clave de respuestas**: no se genera por defecto. Se genera solo si Tigarto lo aprueba explícitamente, como bloque o archivo separado, y contiene únicamente el **resultado final** (no el desarrollo paso a paso ni texto copiado de solucionarios). Si hay ambigüedad o duda razonable sobre una respuesta, se verifica contrastando fuentes públicas — nunca se copia un solucionario textual, ni siquiera parcialmente.

### Fase 3 — Preguntas de clarificación estructural

Usar preguntas batch, con opciones concretas (nunca preguntas abiertas sueltas), sobre:

- Organización de archivos (uno solo vs. taller + clave separados).
- Qué hacer con anexos/material de apoyo (incluir completo, condensar en tabla, o referenciar aparte).
- Si el taller depende de o se cruza con otro documento de referencia del curso (p. ej. un formulario de parcial) que deba consultarse para verificar o enriquecer el contenido.

### Fase 4 — Bosquejo y aprobación

- Presentar un bosquejo de **solo encabezados** (sin desarrollar contenido), siguiendo la plantilla pedagógica estándar (ver más abajo).
- Señalar explícitamente cualquier decisión estructural que se tomó por defecto para no bloquear el avance (p. ej. dónde cortar bloques de dificultad), y la razón.
- Esperar aprobación explícita — "procede" se interpreta como aprobación de los supuestos más recientemente enunciados, no como carta abierta a decisiones no mencionadas.

### Fase 5 — Redacción completa

Desarrollar el archivo completo aplicando:

- La plantilla pedagógica estándar (ver más abajo).
- Las reglas de alertas GitHub (`[!TIP]`, `[!WARNING]`, etc.).
- Las reglas de renderizado GitHub/KaTeX heredadas del prompt maestro de notas de clase.
- Separadores de tabla legibles (ver regla específica más abajo).

Autorrevisar antes de entregar: verificar balance de `<details>`, que ningún `$` toque paréntesis/comillas sin espacio, y que las tablas no tengan `\hline` dentro de `$$...$$`.

### Fase 6 — Integración de material de referencia externo (cuando aplique)

Cuando Tigarto aporte un PDF adicional (p. ej. un formulario de parcial) que pueda contener tablas relevantes para el taller:

1. Verificar primero si el contenido **ya está** cubierto en el taller (comparación ítem por ítem) — informar coincidencia o discrepancia antes de proponer cambios.
2. Identificar qué tablas adicionales son **pedagógicamente relevantes para este taller específico** (no todo el formulario completo) — justificar la relevancia de cada una en función de los puntos que pide el enunciado del taller (a, b, c...).
3. Confirmar con Tigarto el alcance antes de insertar contenido nuevo (batch de opciones, no una pregunta abierta).
4. Al integrar, mantener fidelidad al formulario fuente (símbolos, orden, redacción de las descripciones), aplicando solo las adaptaciones de renderizado necesarias.
5. Si una tabla trae elementos fuera del alcance estricto del taller (p. ej. un operador que el enunciado no pide), no omitirlos por iniciativa propia — señalarlo con una alerta `[!TIP]` que aclare el alcance real, en vez de recortar el contenido de la fuente.

### Fase 7 — Ajustes iterativos de formato

Cambios de formato menores (separadores, símbolos, espaciado) se tratan como decisiones delegadas de bajo riesgo: se aplican directamente y se muestra el resultado, sin ciclo de aprobación previo — salvo que impliquen quitar o añadir contenido.

---

## Plantilla pedagógica estándar

```
# [Título del taller]

## Objetivo de aprendizaje
(1 línea, ancla el ejercicio a lo que se espera lograr)

## Instrucciones
(verbatim del original)

## Notas
(verbatim; advertencias reales del original van en [!WARNING])

## Referencia rápida
(tablas condensadas de la teoría estrictamente necesaria para resolver
 el taller, ANTES de los enunciados — no después, como aparecía en el PDF
 original. Incluye [!TIP] de aclaración donde haga falta.)

## Ejemplo resuelto
(verbatim del original, si existe)

## Enunciados

### Bloque 1 — [criterio de agrupación por complejidad estructural]
### Bloque 2 — [...]
(Nunca agrupar por el tipo de respuesta esperada — eso resolvería
 de antemano el punto que el ejercicio pide identificar.
 [!TIP] antes de cada bloque si requiere apoyo conceptual adicional.)

## ¿Cómo verificar su propio [resultado]?
(checkpoint metacognitivo breve en [!TIP] — máximo 2-3 preguntas de
 autochequeo, nunca la respuesta)

## Anexos completos (referencia extendida)
<details><summary>...</summary> ... </details>
(contenido íntegro de los anexos/tablas de apoyo del original,
 colapsado para no saturar la página)

## Nota de autoría
(verbatim del original)
```

---

## Reglas de alertas GitHub

| Alerta | Uso |
|---|---|
| `[!WARNING]` | Advertencias reales sobre el ejercicio (ej. "no se garantiza que su traducción sea correcta"). |
| `[!TIP]` | Ayudas de interpretación, referencias cruzadas a otras secciones, checkpoints de autochequeo. |
| `[!NOTE]` | Aclaraciones neutras que no son ni advertencia ni ayuda activa (disponible, aún sin caso de uso registrado). |
| `[!IMPORTANT]` | Reservado para información crítica que cambia cómo se resuelve el taller (aún sin caso de uso registrado). |
| `[!CAUTION]` | Reservado para riesgos de error grave y frecuente (aún sin caso de uso registrado). |

## Regla de separadores en tablas

Cuando una celda de tabla lista múltiples frases o variantes separadas, usar `•` (bullet) en vez de `·` (punto medio) — el punto medio resulta visualmente demasiado pequeño para separar ítems con claridad.

## Reglas de renderizado GitHub/KaTeX (heredadas)

- No usar `\_` (guion bajo escapado) en modo matemático.
- No usar `\,` (espacio fino) — CommonMark lo intercepta antes que KaTeX; usar `\ ` en su lugar.
- No anidar `$...$` dentro de `*"..."*` — quitar los `$` internos.
- El comando `\ ` (espacio) no debe tocar el `$` de cierre.
- Ningún delimitador `$` debe tocar directamente `)`, `(`, `"` o `—` sin un espacio de por medio.
- No usar `\hline` dentro de `$$...$$` en celdas de tabla (falla en el renderizador de GitHub); `\begin{array}` solo en bloques `$$...$$` independientes, fuera de tablas.
- LaTeX multilínea con `\\` dentro de celdas de tabla se rompe bajo kramdown; usar `\atop` dentro de la celda.
- Bloques `<details><summary>...</summary>` anidados dentro de blockquotes (`>`) requieren una línea `> ` en blanco inmediatamente después de `<summary>` y antes de `</details>` para que el contenido interno renderice como Markdown. (No aplica si el `<details>` no está dentro de un blockquote.)
- Nombres tipo `Equipo_A` → usar `EquipoA` (sin guion bajo) para evitar problemas de renderizado.

---

## Notas de proceso

- Este prompt es v1: se generó a partir de un único taller (Taller 1, Módulo de lógica proposicional). Se recomienda revisarlo y ajustarlo tras aplicarlo a 2-3 talleres adicionales de temas distintos, para confirmar que la plantilla generaliza bien (p. ej. talleres de teoría de conjuntos, conteo, o inducción pueden requerir ajustes en "Referencia rápida" o en el criterio de bloques).
- Al igual que con los prompts maestros de notas de clase y autoevaluación, cualquier decisión de contenido (qué incluir, qué omitir, cómo agrupar) pasa por aprobación explícita de Tigarto antes de aplicarse — este prompt no delega juicio editorial sobre el contenido, solo sobre formato de bajo riesgo (Fase 7).
