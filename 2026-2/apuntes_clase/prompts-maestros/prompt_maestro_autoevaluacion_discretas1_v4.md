# Prompt maestro — Autoevaluación (Matemáticas Discretas 1)
### Universidad de Antioquia · Ingeniería de Sistemas

*Pegar este prompt cuando quieras generar el bloque de autoevaluación de una clase ya terminada. Es la adaptación al curso del [Prompt maestro genérico de autoevaluación] — hereda sus principios pedagógicos (Sección 2 de aquel documento: práctica de recuperación, series progresivas, entrenamiento cruzado, retroalimentación inmediata, dificultad deseable, cierre metacognitivo) y los especializa con las reglas propias de Matemáticas Discretas 1. Genera un archivo **aparte** del de la clase — nunca edites `claseN.md` directamente desde este prompt.*

*Este prompt se ejecuta solo cuando yo lo pida explícitamente, como paso posterior a tener ya terminada y aprobada la clase (`claseN.md`). No se activa automáticamente al generar una clase nueva.*

---

## 1. Quién soy y qué necesito

Soy profesor de Matemáticas Discretas 1 (Ude@, UdeA). Ya tengo un documento de notas de clase terminado y aprobado (`claseN.md`, construido con el prompt maestro de notas de clase). Quiero que a partir de ese documento generes un bloque de autoevaluación en un **archivo nuevo y separado**: `claseN_autoevaluacion.md`.

Insumos que te voy a pasar:

1. **El documento de la clase a evaluar** (`claseN.md`) — obligatorio, es la fuente de verdad de qué se puede preguntar.
2. **Documentos de clases anteriores** — solo si vamos a incluir la serie de entrenamiento cruzado (ver Fase 2). Si no te los paso y el tema lo amerita, pregúntame antes de asumir contenido previo.
3. **Parciales anteriores del curso** — solo si decidimos que el Reto Final debe aproximarse al nivel real de examen (ver punto 3 de la Fase 2). No asumas el formato de un parcial sin haber visto al menos uno real.

---

## 2. Fase 1 — Recepción y resumen

Cuando te pase `claseN.md`:

1. Resume qué conceptos, definiciones, fórmulas y procedimientos cubre, en el mismo orden en que aparecen en el documento.
2. Identifica explícitamente qué ejercicios ya están resueltos dentro del documento ("Ejercicios resueltos") y cuáles quedaron como "Ejercicios propuestos" con solo la respuesta final — el bloque de autoevaluación **no debe repetir ninguno de los dos**; debe ser práctica genuinamente nueva.
3. Identifica si el documento usa un hilo narrativo (por ejemplo, el caso Discovery One) y en qué estado quedó — esto es relevante solo si el Reto Final se decide en formato "caso aplicado" (ver Fase 2, punto 3).
4. Si detectas que el documento no alcanza a cubrir suficiente contenido propio para armar 5-6 series con ítems genuinamente distintos entre sí (por ejemplo, una clase muy corta), dilo explícitamente y propón un bloque más reducido en vez de rellenar con ítems triviales o redundantes.

---

## 3. Fase 2 — Preguntas de clarificación

Antes de proponer el bosquejo, resuelve conmigo:

1. **Formato de los ítems**: dado que este curso es predominantemente de procedimiento (evaluar expresiones, construir tablas, traducir enunciados, demostrar equivalencias), el formato por defecto es respuesta corta o desarrollo — no preguntes por opción múltiple salvo que el tema puntual se preste bien a eso (por ejemplo, clasificar una proposición entre 3 categorías).
2. **Entrenamiento cruzado (Serie 3)**: revisa el `README.md`/cronograma del curso para identificar qué temas de sesiones anteriores tiene sentido mezclar con el tema de `claseN.md`. Propóneme 2-3 candidatos concretos (no genéricos) y pregúntame si tienes que pedirte esos documentos anteriores o si puedes asumir su contenido a partir de lo que ya sabes del curso. Si decido omitir la Serie 3 por completo, propónme si prefiero sustituirla por una "Serie 3 — Integración" (2+ conceptos de la propia `claseN.md` combinados en un mismo ítem) o eliminarla del todo — no asumas ninguna de las dos por defecto.
3. **Reto Final — decisión caso por caso**: pregúntame siempre, para cada bloque, si el Reto Final debe ser:
   - **(a) Nivel parcial real**: en este caso, pídeme el PDF de un parcial anterior del mismo tema o de un tema comparable en dificultad, y calibra el nivel de exigencia contra ese documento real — no inventes el formato de un parcial de este curso.
   - **(b) Caso aplicado estilo "Expediente"**: reutilizando el hilo narrativo del documento si existe, siguiendo la misma separación teoría/narrativa de la sección 8.1 del prompt de notas (el ítem se resuelve con herramientas puramente formales; la narrativa es solo el envoltorio del enunciado, no parte de la explicación). El vehículo narrativo no tiene que ser el hilo de `claseN.md` — puedo pedir uno distinto (por ejemplo, un universo de personajes ajeno al curso); en ese caso, mantenlo igual de riguroso en la Verificación de Dimensión A y en el punto 8 de las verificaciones del curso (ver Sección 5).
   - No asumas una de las dos por defecto — siempre pregunta, incluso si en una sesión anterior usamos una de las dos opciones.
4. **Tamaño del bloque**: por defecto, sigue las cantidades sugeridas en la Sección 7 del prompt genérico (Calentamiento 3-5, Serie 1 4-6, Serie 2 4-6, Serie 3 3-5, Reto Final 1-3). Pregúntame solo si el contenido de `claseN.md` es inusualmente extenso o corto y esas cantidades no encajan.

No avances a generar contenido sin resolver estos puntos.

---

## 4. Fase 3 — Bosquejo antes de generar

Preséntame:

- Qué cubre cada serie (conceptos concretos, no solo "Serie 2: aplicación").
- Qué 2-3 temas anteriores entran en la Serie 3, y su fuente (documento del que salieron) — o, si la Serie 3 se omitió o se convirtió en "Integración", dilo explícitamente aquí.
- Qué formato tendrá el Reto Final, según lo decidido en la Fase 2, punto 3.

Espera mi aprobación antes de escribir el contenido final de cada ítem.

---

## 5. Fase 4 — Autorrevisión antes de entregar

Aplica esta rúbrica de dos dimensiones antes de entregar cualquier bloque de autoevaluación, más las verificaciones propias del curso que siguen después:

### Dimensión A — Fidelidad temática
- **Trazabilidad**: cada ítem debe poder señalarse a una sección exacta de `claseN.md` (por ejemplo, "Ítem 3 → 2.4 Condicional"). Si no puedes señalar el origen, el ítem no se incluye.
- **Cobertura**: antes de generar, lista todas las subsecciones teóricas de `claseN.md` y confirma que cada una tiene al menos un ítem en alguna serie — no concentres todo en 2-3 temas.
- **No-invención**: prohibido introducir terminología, notación o casos que no aparezcan en `claseN.md`.

### Dimensión B — Indagación auditable
- Cada ítem de las Series (no de los "Ejercicios resueltos" de la clase, que ya están resueltos) debe seguir el formato de intento-antes-de-revelar de la Sección 6.1 — verifica que ningún ítem del bloque muestre la respuesta sin ese paso intermedio.
- Confirma que el "Cierre — Autodiagnóstico" (Sección 6, punto 7) esté diseñado para poder alimentarse de los niveles de confianza declarados ítem por ítem, no solo de un conteo genérico de aciertos.

Verificaciones propias del curso, adicionales a lo anterior:

1. **Terminología y notación** exactamente iguales a las de `claseN.md` — mismos nombres de operadores, mismas convenciones (por ejemplo, notación binaria 1/0 en tablas de verdad si esa clase la usa).
2. **Búsqueda de texto literal del patrón `\_`** en todo el archivo nuevo, igual que en el prompt de notas — reporta cuántas coincidencias encontraste (idealmente cero).
3. **Alertas de GitHub** (`[!TIP]`, `[!WARNING]`, `[!NOTE]`, `[!IMPORTANT]`) en vez de emojis manuales, con el mismo mapeo de uso del prompt de notas.
4. **Registro formal (usted)** en todo el documento.
5. Si el Reto Final es nivel parcial real: confirma explícitamente que el nivel de dificultad se calibró contra el parcial que te pasé, y dime en qué se parece o se diferencia.
6. Si el Reto Final es caso aplicado: confirma que no se coló narrativa dentro de ningún ítem de las series anteriores (Calentamiento a Serie 3 deben ser neutros, sin personajes).
7. **Bloque de verificación para el profesor**: para todos los ítems de Serie 2 en adelante (cualquier ítem que encadene 3 o más leyes — típicamente Serie 2, Serie 3 y Reto Final), entrega además, en un bloque **aparte** y claramente separado del archivo `claseN_autoevaluacion.md` — nunca visible ni accesible para el estudiante —, el desarrollo completo en formato Afirmación–Razón de cada uno de esos ítems. Si `claseN.md` todavía no enseña inferencia formal con el tema en cuestión (por ejemplo, una clase introductoria), adapta el formato a una justificación paso a paso equivalente en vez de forzar una tabla Afirmación–Razón que el curso no ha enseñado — dilo explícitamente en el bloque. El objetivo es que yo pueda verificar la cadena de razonamiento con una revisión rápida (5-6 líneas por ítem) en vez de tener que resolver cada uno desde cero o confiar a ciegas en la respuesta final. Este bloque no reemplaza mi propia revisión — la hace viable con poco tiempo.
8. **Consistencia universo–predicado (o dominio–propiedad):** si el conjunto de trabajo del caso (el universo del Reto Final u otro ítem con dominio explícito) se describe con un calificativo que coincide con una de las propiedades evaluadas en la tabla de hechos del caso (sea un predicado, una etiqueta, o un atributo booleano), verifica que esa descripción no convierta la propiedad en un criterio de pertenencia al conjunto. La pertenencia al conjunto de trabajo se define solo por la categoría general; qué cumple cada elemento respecto a cada propiedad lo decide la tabla, no el enunciado del conjunto.
9. **Fronteras de alcance explícitas:** si la solución completa de un ítem (según un libro de texto o un revisor externo) requeriría una ley, técnica o concepto que no está en `claseN.md`, tanto el enunciado como la respuesta deben decirlo explícitamente — y decir correctamente si ese contenido es de una clase **ya vista pero excluida a propósito**, o de una clase **aún no vista**. No asumas por defecto que es contenido pasado; confírmalo conmigo si no es evidente.

---

## 6. Estructura del archivo `claseN_autoevaluacion.md`

### 6.1 Formato obligatorio de cada ítem (Series 1 a 3 y Reto Final)

Cada ítem, sin excepción, sigue esta estructura de cuatro partes — el objetivo es que "revelar la respuesta" nunca sea el primer clic posible, sino el segundo:

```
**Ítem N**
[enunciado]

> ✍️ *Antes de ver la respuesta: resuelva el procedimiento completo a mano y escriba aquí su resultado final, aunque no esté seguro.*
>
> _______________________

> 🎯 *Nivel de confianza antes de revelar*: Alto / Medio / Bajo

<details><summary>Ver respuesta final</summary>[solo el resultado final — sin desarrollo paso a paso, como el apéndice de respuestas de un libro]</details>
```

No omitas el bloque de intento y confianza "para no alargar el documento" — es el mecanismo central de esta rúbrica, no un adorno. El `<details>` de este bloque **nunca** desarrolla el procedimiento (eso ya vive en los "Ejercicios resueltos" de `claseN.md`) — aquí el estudiante debe resolver a mano y solo verificar contra la respuesta final, como el apéndice de un libro de texto. Si el bloque de autoevaluación se va a usar también fuera de markdown (por ejemplo, un formulario), esta misma estructura de tres campos (intento, confianza, respuesta) debe conservarse para que los datos sean comparables.

Con esto en cuenta, el archivo completo se estructura así:

1. **Encabezado**: título con el tema de `claseN.md`, y una línea con enlace de vuelta al documento de la clase.
2. **Calentamiento**
3. **Serie 1 — Repeticiones básicas**
4. **Serie 2 — Aplicación combinada**
5. **Serie 3 — Entrenamiento cruzado** (con nota explícita de qué clases anteriores mezcla; u "Integración"/omitida, según lo decidido en la Fase 2, punto 2)
6. **Reto Final** (con nota explícita de si es nivel parcial o caso aplicado, y por qué)
7. **Cierre — Autodiagnóstico**: tabla o lista para que el estudiante marque qué series resolvió sin dificultad.
8. **Hoja de fórmulas y conceptos clave**: tabla ultra-compacta de referencia rápida (reglas de oro, tablas de verdad resumidas, jerarquía) para quien ya domina el tema y solo necesita consultar sin volver a `claseN.md`. Si `claseN.md` ya tiene una "Ficha de bolsillo", reutilízala y complétala con lo que la autoevaluación agregó (por ejemplo, notación de Python si la Serie 3 cruzó con Lógica y Representación I) — no la dupliques desde cero.
9. **Solucionario completo**, en bloques colapsables por serie, al final del documento — no intercalado ítem por ítem, para que el estudiante pueda intentar la serie completa antes de revisar. Si en la práctica se sigue el patrón de respuesta dentro de cada ítem (Sección 6.1) en vez de un solucionario consolidado al final, porque así quedó aprobado como plantilla en una entrega anterior, es una variación válida — dilo explícitamente al entregar en vez de asumir silenciosamente cuál de las dos se usa.

---

## 7. Checklist final antes de entregar

- [ ] ¿El archivo es independiente de `claseN.md` y se llama `claseN_autoevaluacion.md`?
- [ ] ¿Se preguntó (no se asumió) el formato del Reto Final para este bloque específico?
- [ ] Si el Reto Final es nivel parcial: ¿se pidió y se usó un parcial real como calibración?
- [ ] Si el Reto Final es caso aplicado: ¿la narrativa quedó fuera de las series de Calentamiento a Serie 3?
- [ ] ¿La Serie 3 mezcla temas de sesiones anteriores reales, verificadas contra el cronograma o los documentos que pasé, no inventadas? (O, si se omitió/convirtió en Integración, ¿quedó explícito por qué?)
- [ ] ¿Ningún ítem repite un ejercicio ya resuelto o ya propuesto en `claseN.md`?
- [ ] ¿Se hizo la búsqueda de texto del patrón `\_` y se confirmaron cero coincidencias?
- [ ] ¿Terminología y notación coinciden exactamente con `claseN.md`?
- [ ] ¿Se presentó el bosquejo (Fase 3) y se esperó aprobación antes de escribir los ítems?
- [ ] ¿El documento cierra con el autodiagnóstico y el solucionario colapsable o el patrón de respuesta por ítem aprobado, sin mezclar ambos criterios?
- [ ] ¿Cada ítem de las series es trazable a una subsección exacta de `claseN.md`?
- [ ] ¿Todas las subsecciones teóricas de `claseN.md` están cubiertas por al menos un ítem?
- [ ] ¿Todos los ítems siguen el formato de intento + confianza + respuesta (Sección 6.1), sin excepción?
- [ ] ¿El Cierre — Autodiagnóstico está diseñado para agregar los niveles de confianza declarados, no solo un conteo de aciertos?
- [ ] ¿La Hoja de fórmulas y conceptos clave reutiliza la Ficha de bolsillo de `claseN.md` en vez de duplicarla desde cero?
- [ ] ¿Se entregó, aparte del archivo del estudiante, el bloque de verificación con el desarrollo completo (Afirmación–Razón o su equivalente paso a paso) de los ítems de Serie 2 en adelante?
- [ ] ¿El universo o dominio de cualquier caso con tabla de hechos es consistente con los predicados/propiedades evaluados, sin usar una propiedad como criterio de pertenencia (punto 8, Sección 5)?
- [ ] ¿Todo ítem cuya solución completa excede el alcance de `claseN.md` deja explícita esa frontera, indicando correctamente si es contenido anterior u futuro (punto 9, Sección 5)?
- [ ] Si `claseN_autoevaluacion.md` se modifica **después** de entregado, ¿se actualizó en el mismo paso el bloque de verificación asociado (`verificacion_claseN_autoevaluacion.md`)?

---

## 8. Fase 5 — Triage de observaciones externas

Se activa cuando yo traigo observaciones de una auditoría externa (otra IA, un colega, un revisor) sobre un archivo ya entregado (`claseN_autoevaluacion.md` o su verificación asociada). No apliques ninguna corrección directamente — primero clasifica cada observación:

1. **¿Ya está resuelta?** Verifica contra la versión actual del archivo antes de asumir que la observación sigue vigente — puede estar auditando una versión anterior a ediciones ya aplicadas en esta misma conversación.
2. **¿Viola la regla de no-invención (Dimensión A, Sección 5)?** Si la corrección propuesta introduce terminología, notación, técnicas o casos que no están en `claseN.md`, no se aplica al archivo del estudiante — repórtalo como posible insumo para una futura revisión de `claseN.md`, no lo mezcles en la autoevaluación.
3. **¿Contradice una decisión mía explícita ya tomada en esta conversación?** Si es así, no la apliques — señala el conflicto y explica por qué, en vez de revertir silenciosamente una decisión aprobada.
4. **Si ninguna de las anteriores aplica**, es una corrección legítima: propónmela con el texto exacto del cambio antes de tocar el archivo, igual que cualquier otra edición.

Para cada observación, preséntame una tabla breve (columna de diagnóstico + acción) antes de editar — no apliques cambios en bloque sin ese resumen. Si una observación queda en una zona gris (por ejemplo, señala una ambigüedad real aunque la corrección propuesta no sea la correcta), muéstrame el texto exacto de tu propuesta alternativa antes de aplicarla, no solo la idea.

---

*Fin del prompt. Se activa únicamente cuando yo lo pida explícitamente después de tener una clase ya terminada, pasándote el archivo `claseN.md` correspondiente.*
