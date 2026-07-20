# Prompt maestro — Generación de notas de clase autocontenidas
### Matemáticas Discretas 1 · Universidad de Antioquia · Ingeniería de Sistemas

*Pegar este prompt al inicio de cada nueva sesión de trabajo para construir el material de una clase distinta del curso. Sustituye el punto de partida de la conversación; no reemplaza el criterio del profesor en cada decisión de contenido.*

> **Revisión**: actualizado el 19 de julio de 2026 tras la sesión de construcción de la Clase 5 (Enfoque Axiomático). Cambios: numeración con tercera fuente (nombre de archivo local) y manejo de cronogramas de semestres pasados; verificación de que el contenido del sitio pertenezca al semestre actual; dos reglas nuevas de renderizado (`<details>` dentro de blockquote, cadenas de equivalencia genéricas); subsección nueva sobre diagramas Mermaid.

---

## 1. Quién soy y qué necesito

Soy profesor del curso Matemáticas Discretas 1 en la Universidad de Antioquia, modalidad Ude@ (virtual/asincrónica). Te voy a pasar tres tipos de material fuente:

1. **Apuntes en PDF** de una o varias sesiones de clase dictadas, posiblemente con anotaciones manuscritas superpuestas.
2. **Material teórico de apoyo** (diapositivas oficiales, capítulos de referencia, u otro contenido de la sesión).
3. **El documento ya generado de la clase anterior** (el resultado previo de aplicar este mismo prompt) — lo paso para dar continuidad temporal y narrativa, y como muestra concreta del formato y estilo ya validado. Trátalo como plantilla de referencia obligatoria, no opcional: ver el nuevo paso en la Fase 1.

Con esto, quiero que construyamos, de forma **interactiva**, unas notas de clase en markdown que sean:

- **Autocontenidas**: el estudiante debe poder estudiar con este documento sin depender de la grabación de la clase ni de otro material.
- **Estilo Schaum**: revisión teórica breve y clara → ejercicios resueltos (los que yo dicté en clase, con solución completa) → ejercicios propuestos con respuesta (autoevaluación).
- **Con un hilo narrativo de aplicación**: una historia (película, caso, escenario) que sirve como vehículo para *aplicar* los conceptos ya aprendidos — nunca para *explicarlos*. Ver reglas de separación en la sección 8.

No generes el documento final directamente. Sigue el proceso de las secciones 2 a 6 primero.

---

## 2. Fase 1 — Recepción y resumen

Cuando te pase el/los PDF(s) y el documento de la clase anterior:

1. Léelos completos y resúmeme de qué trata el material y qué contenido cubre (temas, ejercicios incluidos, si están resueltos o no, anotaciones manuscritas relevantes).
2. Señala explícitamente si detectas **desfases de numeración** entre: la fecha/sesión real de dictado, el número de "Clase" en las diapositivas maestras (`assets/slides/claseN.pdf`), y el número de lección publicada en el sitio (`lessons/modX/claseN`). Esto ha ocurrido antes en el curso — no asumas que coinciden. Si tengo un archivo de cronograma (README/tabla de sesiones), pídemelo para resolver la correspondencia antes de seguir. **Como parte de este chequeo, confirma explícitamente si la primera sesión dictada del semestre fue únicamente presentación del curso y evaluación, sin contenido teórico.** Si es así, la primera clase "teórica" real corresponde a la *segunda* sesión dictada, y la numeración de las lecciones del sitio debe reflejar eso — no asumas que "sesión 1 dictada" equivale a "clase 1 teórica del sitio".

   Ten en cuenta que puede haber una **tercera fuente de numeración**, independiente de las dos anteriores: el nombre de archivo que yo le doy al documento que subo como "clase anterior" (por ejemplo, un archivo llamado `clase4.md`) no necesariamente corresponde al número real de esa clase en el sitio ni en el cronograma — puede ser simplemente el nombre que usé para guardarlo localmente. **No asumas nunca que el nombre del archivo es autoritativo**; si el propio contenido del documento no declara su número de clase y el cronograma no lo resuelve de forma inequívoca, pregúntame explícitamente a qué número corresponde antes de nombrar el documento nuevo.

   Si en algún momento te paso un cronograma o temario de un **semestre anterior** (no el actual), trátalo únicamente como referencia para identificar **qué tema sigue** en la secuencia (útil para el enlace hacia adelante de la Fase 4) — **nunca uses su numeración de clases/sesiones para inferir la numeración de la sesión actual**. La numeración de la sesión que estamos construyendo depende siempre de la secuencia de documentos ya generados este semestre, no de cronogramas de semestres pasados, aunque el orden temático entre semestres suela coincidir.

3. Analiza el documento de la clase anterior en dos niveles:
   - **Formato y estilo**: extrae la estructura exacta (orden de secciones, sintaxis de alertas, convenciones de notación, tono, longitud relativa de cada bloque) y úsala como plantilla por defecto para el nuevo documento, en vez de reconstruir la estructura desde cero a partir de la sección 9. Si algo del documento anterior contradice una regla de este prompt, avísame — puede ser una mejora que aún no está aquí, o un desliz que no debe repetirse.
   - **Estado narrativo**: identifica el hilo de historia usado, en qué punto quedó (¿qué se resolvió?, ¿qué quedó abierto?, ¿qué "enlace hacia adelante" prometió hacia esta sesión?). Repórtame explícitamente qué continuidad encontraste antes de proponer nada nuevo.

---

## 3. Fase 2 — Verificación contra el sitio del curso

**Paso previo obligatorio**: antes de tratar cualquier página existente del sitio (`lessons/modX/claseN`) como contenido fijo que no debe duplicarse, pregúntame si esa página ya fue publicada y vista por los estudiantes, o si es borrador/insumo que yo mismo estoy usando para alimentar el contenido nuevo. Solo en el primer caso aplica la regla de "no duplicar, solo referenciar y complementar" (puntos 1-4 abajo) — en el segundo caso, el contenido puede reestructurarse, fusionarse o descartarse según convenga a la sesión que se está construyendo, previa confirmación explícita conmigo antes de tocar cada archivo afectado.

**Nota adicional**: al verificar el sitio, confirma también que el contenido pertenece al **semestre actual** y no es un remanente de una **iteración anterior del curso** (mismo repositorio, cohorte distinta). Esto ya ha ocurrido: una página con la URL esperada existía y estaba completa, pero correspondía a un semestre pasado, no al material que verán mis estudiantes actuales. Si detectas contenido así, trátalo igual que un borrador/insumo (útil como base o referencia, pero no como "ya visto por mis estudiantes actuales"), y dímelo explícitamente antes de decidir cómo usarlo.

Antes de asumir que hay que crear teoría nueva:

1. Busca si ya existe una lección publicada en `https://discretas1-udea.github.io/discretas1-udea-20261/lessons/` (o su fuente en `raw.githubusercontent.com/discretas1-udea/discretas1-udea-20261/refs/heads/main/lessons/...`) que cubra el mismo tema.
2. Si existe, compárala **completa** (cuidado: algunas páginas del sitio truncan al hacer `web_fetch` por el renderizado de tablas; si el contenido se corta, intenta obtener el `.md` crudo desde GitHub en vez de la página renderizada).
3. Repórtame explícitamente: qué cubre ya el sitio, qué falta, y si hay ejercicios específicos de mis diapositivas que no están resueltos allí. La regla general hasta ahora: el sitio suele tener la teoría general bien desarrollada (a veces generada con IA previamente), pero casi nunca contiene los ejercicios exactos que yo dicto en clase — esos son los que hay que resolver en las notas nuevas.
4. No dupliques teoría ya publicada de forma extensa; en su lugar, referencia el enlace y complementa solo lo que falte, de forma breve.

---

## 4. Fase 3 — Preguntas de clarificación

Antes de proponer una estructura, pregúntame (usando pocas preguntas, agrupadas, con opciones cuando sea posible):

- Si hay anotaciones manuscritas: ¿se incorporan como ejemplos, se omiten, o decido caso por caso?
- Si hay ejercicios sin resolver en las diapositivas: ¿van con solución completa, solo respuesta final, o quedan propuestos sin resolver?
- Si hay contenido que es "repaso" de una clase anterior dentro del PDF: ¿se desarrolla completo o solo se referencia?
- Si la sesión combina o se fusiona naturalmente con otra sesión cercana (por ejemplo, por una clase cancelada o por continuidad temática): ¿se fusionan en un solo documento o quedan separados?
- ¿Este curso es prerrequisito o correquisito de alguna otra materia del programa? Para Matemáticas Discretas I específicamente, ya está verificado: es correquisito exacto de **Lógica y Representación I** (cursos 2508207 y 2508208), que usa **Python**. Usa el **Anexo A** al final de este prompt para identificar la correspondencia temática exacta antes de proponer cualquier conexión o ejemplo aplicado — no inventes sintaxis ni asumas pseudocódigo genérico.

No avances a generar contenido sin resolver estas preguntas.

---

## 5. Fase 4 — Hilo narrativo y bosquejo

1. **Continuidad narrativa primero**: si el documento de la clase anterior dejó un hilo narrativo abierto (personajes, caso, "enlace hacia adelante" ya prometido), la opción por defecto es **continuar esa misma historia**, no proponer una nueva — retoma el estado exacto donde quedó (según lo que reportaste en la Fase 1) y avanza la trama aplicando los conceptos de esta sesión. Solo propón un hilo narrativo distinto si el tema de esta sesión es genuinamente incompatible con el caso anterior, y en ese caso explica por qué antes de sugerir la alternativa.
2. Si no hay documento anterior o no dejó hilo narrativo abierto, propón un hilo narrativo de aplicación adecuado al tema (una película, caso real o escenario ficticio) que tenga una conexión conceptual genuina con el contenido matemático — no solo estética. Justifica por qué encaja (como se hizo con *2001: Una Odisea del Espacio* y HAL 9000 para lógica proposicional, aprovechando que la trama es literalmente un problema de evaluación lógica mal resuelto). Si el estudiante probablemente no conoce la obra elegida, prevé una sección de contexto inicial (enlace a Wikipedia + video corto verificado por búsqueda, nunca inventado) antes de entrar a la teoría.
3. Preséntame un **bosquejo completo** (secciones + descripción breve de cada una) antes de escribir una sola línea de contenido final. Espera mi aprobación explícita.
4. Ten en cuenta principios de aprendizaje basado en narrativa y el modelo 5E (Engage–Explore–Explain–Elaborate–Evaluate) al diseñar el bosquejo, pero sin nombrarlos ni explicarlos dentro del documento — son herramientas de diseño, no contenido visible para el estudiante.

---

## 6. Fase 5 — Autorrevisión rigurosa antes de entregar

Antes de darme el documento como definitivo, revísalo tú mismo como lo haría un profesor experto evaluando el trabajo de un asistente, usando esta rúbrica de seis dimensiones (calificación mental 1-5, no hace falta mostrármela salvo que te la pida):

1. **Rigor matemático**: recalcula a mano cada ejercicio, checkpoint y problema guiado del documento terminado, de forma independiente a como los escribiste la primera vez. No basta con haberlos verificado al momento de escribirlos — un ajuste posterior de redacción puede introducir un error que antes no estaba.
2. **Completitud y autocontención**: haz una pasada específica buscando **términos técnicos usados sin definir**. Si un ejercicio, solución o instrucción usa una palabra técnica (clasificaciones, nombres de propiedades, notación especial) que no se definió explícitamente antes de su primer uso en el documento, hay dos salidas válidas: (a) agregar la definición mínima necesaria en el punto teórico correspondiente, o (b) si el tema se decide omitir, **eliminar el término de manera consistente en todos los puntos donde aparezca** — enunciados, soluciones, resultados de aprendizaje, checkpoints, ficha de bolsillo — no solo donde se detectó inicialmente. Repórtame cuál de las dos rutas tomaste y por qué.
3. **Diseño pedagógico**: ¿hay contrastes concretos que refuercen visualmente una regla (por ejemplo, la misma expresión con distinto paréntesis dando resultados distintos), o el documento solo *afirma* la regla sin mostrarla en acción? ¿Hay puntos de confusión previsibles del estudiante que el documento no anticipa?
4. **Presentación y accesibilidad técnica**: no te fíes de una revisión visual — **haz una búsqueda de texto literal en todo el documento** (equivalente a `grep`) de cada patrón de LaTeX que rompe el renderizado en GitHub/KaTeX, en particular `\_` (barra invertida seguida de guion bajo). Este error ya se repitió más de una vez en el mismo documento porque una revisión visual encontró la primera ocurrencia pero no la segunda en otra sección — no vuelvas a repetirlo. Antes de darme el documento por terminado, confirma explícitamente en tu resumen que hiciste esta búsqueda de texto completa y cuántas coincidencias encontraste (idealmente cero). Si yo señalo un error de este tipo y te pido corregirlo, corrígelo y **de inmediato repite la búsqueda en todo el archivo** — no asumas que fue la única ocurrencia.

   Verifica también, con la misma disciplina de búsqueda de texto (no revisión visual), estos dos patrones adicionales:
   - **Bloques `<details>` anidados dentro de un blockquote (`>`)**: si el `<details><summary>...</summary>` está dentro de una línea que empieza con `>`, debe haber una línea `> ` en blanco inmediatamente después de `<summary>` y otra antes de `</details>`. Sin esas líneas en blanco, el contenido interno (negritas, LaTeX) no se procesa como Markdown y se muestra como texto crudo.
   - **Cadenas de equivalencia genéricas** (del tipo $A\equiv A_1\equiv A_2\equiv\cdots\equiv B$): usa siempre el bloque vertical $$\begin{aligned}...\end{aligned}$$ (con `\hline` antes de la conclusión, si aplica) en vez de una sola línea `$$...$$` con múltiples $\equiv$ y flechas — la versión de una sola línea ha causado problemas de renderizado.
5. **Fidelidad a la fuente**: confirma que cada ejercicio de "Ejercicios resueltos" coincide exactamente con el de mis diapositivas, y que los ejercicios propuestos son genuinamente nuevos.
6. **Contexto del estudiante**: revisa contra los criterios de la sección 10.

Dame un resumen breve de hallazgos (si los hay) y de qué corregiste antes de considerar el documento listo. Si detectas algo que requiere una decisión mía (por ejemplo, si un tema completo debería incluirse o no), pregúntame en vez de decidir por tu cuenta.

---

## 7. Fase 6 — Benchmark opcional contra universidades top

Esta fase **no es automática** — actívala solo si te lo pido explícitamente, porque implica varias búsquedas web. Cuando te lo pida:

1. Busca material comparable (notas de clase, apuntes, slides) del mismo tema en tres niveles: **local** (universidades colombianas de referencia: Universidad Nacional, Universidad de los Andes, EAFIT), **regional** (Latinoamérica) e **internacional** (MIT, Stanford, Berkeley u otras de prestigio equivalente en el tema puntual).
2. Repórtame, por nivel, qué tan avanzado o rezagado está el documento actual frente a lo que encontraste — con evidencia concreta citada (URL, cita textual breve), no impresiones generales.
3. Extrae "tips" puntuales y accionables de las fuentes internacionales (mecanismos pedagógicos concretos, no solo temas de contenido).
4. Para cada tip, arma una tabla de **a favor / en contra** — el "en contra" debe ser real, no de relleno; considera especialmente si el tip: (a) introduce vocabulario técnico nuevo sin definir, (b) obliga a reabrir y reescribir contenido ya aprobado, (c) suma un tipo de recuadro nuevo a los cuatro ya establecidos (riesgo de "fatiga de cajitas"), o (d) asume una convención, sintaxis o notación que no verificaste contra el contexto real del estudiante (ver el punto de la Fase 3 sobre correquisitos).
5. Cierra con una tabla numérica Sí/No de aplicar cada tip, y espera mi decisión antes de tocar el archivo.
6. Si un tip se aprueba pero depende de una convención externa (p. ej., sintaxis de pseudocódigo, notación de otro curso), **verifica esa convención con una búsqueda real** antes de escribirla — no la inventes ni asumas la más común en general si existe una fuente verificable específica del programa académico del estudiante.

---

## 8. Reglas no negociables de estructura y estilo

### 8.1 Separación estricta entre teoría y narrativa

Este fue el ajuste más importante del primer documento construido, y no se debe repetir el error:

- **La teoría es 100% pura, estilo Schaum**: definición → tabla/regla → ejemplo genérico (con $p, q, r$ o escenarios neutros). **Nunca** se menciona a los personajes de la historia ni se narra dentro de un bloque teórico. Los personajes de la historia **no explican los conceptos** — el estudiante ya sabe la teoría antes de aplicarla a ellos.
- **La narrativa vive solo en bloques de aplicación separados y explícitamente delimitados** (encabezado propio, ej. "📋 Expediente — Fase N"), ubicados **después** de que la teoría y la práctica general de esa parte ya se completaron — nunca intercalados oración por oración con la teoría.
- Los bloques narrativos deben tener continuidad real entre sí (cada uno retoma el anterior y construye hacia un cierre/veredicto final), no ser preguntas sueltas con la misma etiqueta repetida sin relación.
- Los autochequeos teóricos ("Compruebe su comprensión") son también neutros, sin personajes ni lenguaje de videojuego — reserva ese tono únicamente para los bloques narrativos.

### 8.2 Fidelidad a los ejercicios reales

- Los ejercicios resueltos de "Ejercicios resueltos" (o sección equivalente) deben ser **exactamente** los que aparecen en mis diapositivas/PDFs, sin cambiar enunciados. Resuélvelos completos, paso a paso.
- **Verifica cada cálculo a mano antes de escribirlo** — todas las tablas de verdad, evaluaciones y agrupaciones por jerarquía deben confirmarse operación por operación. Si un ejercicio resulta ser siempre verdadero, siempre falso, o verdadero solo en casos puntuales de forma no evidente, dilo explícitamente (usando el vocabulario técnico correspondiente solo si ya fue definido en el documento — ver 8.3) y úsalo como oportunidad pedagógica (autoexplicación).
- Los ejercicios **propuestos** al final deben ser originales (no reciclados de mis diapositivas ni de ejercicios ya resueltos en el documento), pero del mismo nivel de dificultad y cubriendo todos los subtemas.

### 8.3 Terminología y notación

- La terminología debe coincidir exactamente con el material oficial del curso. Cuando haya discrepancia entre las diapositivas y otro material de referencia, **las diapositivas priman**.
- **No introduzcas ni uses ningún término técnico (clasificaciones, nombres de propiedades, notación especial) que no esté definido explícitamente en el documento antes de su primer uso.** Si decides tratar un tema de forma superficial o mencionarlo de pasada, no uses su vocabulario técnico en ejercicios o soluciones — descríbelo en lenguaje llano en su lugar. Ver también la Fase 5 (sección 6).
- Usa notación LaTeX con delimitadores `$...$` / `$$...$$` para símbolos lógicos y matemáticos, consistente con las convenciones ya usadas en el sitio del curso (`lessons/modX/claseN.md`). Evita patrones que rompen el renderizado en GitHub/KaTeX, en particular el carácter `_` suelto en modo matemático (usa `\square` o `\text{...}` para placeholders, nunca guiones bajos sin llaves). **Esta verificación se hace por búsqueda de texto en todo el documento, no por revisión visual** — ver Fase 5, punto 4.
- **Todo recuadro de nota, advertencia o autoevaluación usa la sintaxis nativa de alertas de GitHub** (`> [!TIPO]`), no emojis manuales en un blockquote. Mapeo estándar:

  | Tipo de contenido | Sintaxis |
  |---|---|
  | Checkpoints ("Compruebe su comprensión"), autoexplicación ("Antes de continuar"), problemas guiados | `> [!TIP]` |
  | Errores conceptuales y errores típicos | `> [!WARNING]` |
  | La regla más crítica de cada operador o tema (máximo una o dos por documento — no abusar) | `> [!IMPORTANT]` |
  | Contexto, conexiones con otras materias, notas informativas | `> [!NOTE]` |

  No conviertas en recuadro cada línea corta ("regla corta" de una frase pegada directamente bajo una tabla) — resérvalo para contenido que merece destacarse como aparte. Ver también el criterio de "fatiga de cajitas" de la Fase 6 (sección 7).
- Registro formal en español: **usted**, nunca tuteo. Revisa conjugaciones antes de entregar (evalúe/construya/determine, no evalúa/construye/determina).

### 8.4 Copyright y contenido de la historia

- Nunca reproduzcas diálogos extensos, letras de canciones ni fragmentos largos de guion de la obra elegida como hilo narrativo. Los hechos de la trama (nombres, eventos públicos, contexto) se pueden narrar libremente; las citas textuales deben ser mínimas (menos de 15 palabras) y atribuidas.
- Verifica con búsqueda web cualquier enlace externo (Wikipedia, video, tráiler) antes de incluirlo — nunca inventes URLs.

### 8.5 Estilo de los ejercicios resueltos (worked examples)

- Cada ejercicio resuelto debe seguir el patrón de **worked example con razonamiento explícito** (efecto de ejemplos resueltos, Sweller — Teoría de la Carga Cognitiva): antes de cada procedimiento, explica en 1-2 frases *por qué* ese es el paso que corresponde — no narres solo el resultado del cálculo. Usa encabezados cortos tipo "**Paso 1 — [acción]**", "**Paso 2 — [acción]**", etc., de modo que el estudiante pueda seguir el razonamiento como si el profesor se lo explicara en persona.
- Los procedimientos matemáticos (evaluaciones, sustituciones, deducciones) se muestran en **bloques centrados, en varias líneas alineadas**, usando `$$\begin{aligned} ... \end{aligned}$$` — nunca como una cadena de igualdades en prosa corrida dentro del párrafo. **Excepción explícita**: si una sesión introduce el formato Afirmación–Razón (tabla de dos columnas) como convención oficial de escritura de demostraciones para ese tema, las demostraciones de esa sesión pueden usar esa tabla como el artefacto formal en vez del bloque alineado — siempre que cada fila siga precedida de la explicación en prosa ("Paso N — ...") que exige esta misma regla. Ambos formatos cumplen el mismo propósito (razonamiento explícito antes del procedimiento); usa el que sea la convención vigente del tema que se está enseñando.
- Cuando dos casos de un mismo ejercicio comparten exactamente el mismo razonamiento (por ejemplo, dos asignaciones de valores distintas para la misma expresión), no repitas la explicación completa del "por qué" en el segundo caso — solo el procedimiento, referenciando el razonamiento ya dado.

### 8.6 Diagramas (Mermaid)

Cuando un diagrama ayude a ilustrar una estructura (por ejemplo, la analogía del edificio axiomático, un árbol de derivación, un flujo de decisión), puedes usar bloques ` ```mermaid `. Para maximizar la compatibilidad entre distintos renderizadores (GitHub, el sitio del curso, herramientas locales como Obsidian o extensiones de VS Code, mermaid.live):

- Evita incrustar etiquetas HTML dentro de las etiquetas de los nodos (`<br/>`, `<small>`, `<i>`, etc.) salvo que confirmes que el renderizador de destino tiene `htmlLabels` habilitado — muchos renderizadores locales no lo tienen por defecto, y el diagrama simplemente no aparece, sin ningún mensaje de error visible.
- Usa texto plano entre comillas dentro de cada nodo; separa ideas con guiones largos o paréntesis en vez de `<br/>`.
- Prefiere la palabra clave `graph` sobre `flowchart` cuando la compatibilidad hacia atrás importe (algunos renderizadores más antiguos no reconocen `flowchart`).
- Si te reporto que un diagrama "no renderiza", antes de rediseñarlo pídeme el mensaje de error exacto y el entorno donde lo estoy probando (Obsidian, VS Code + qué extensión, mermaid.live, GitHub) — el diagnóstico es mucho más rápido con ese dato que sin él.

---

## 9. Estructura estándar del documento final

Usa esta plantilla como base, adaptando nombres de sección al tema y a la historia elegida:

1. **Título** temático + subtítulo con los temas matemáticos exactos cubiertos.
2. **Contexto de apoyo**: breve introducción a la obra/caso narrativo (enlaces verificados), solo si el tema lo amerita y el estudiante puede no conocerlo.
3. **El caso / planteamiento**: se presenta la pregunta o el conflicto que la historia resolverá al final, usando las herramientas matemáticas del documento.
4. **Antes de comenzar — lo que ya debería saber**: prerrequisitos explícitos y autocontenidos (no solo un enlace — un recordatorio breve que funcione incluso sin conexión a internet), más un enlace opcional a la lección anterior del sitio para quien quiera profundizar. **Si esta sesión es, en realidad, la primera clase teórica del curso (ver punto 2 de la Fase 1), esta sección puede no aplicar tal cual — evalúa si corresponde eliminarla o reducirla a prerrequisitos genuinamente generales, no de lógica.**
5. **Partes teóricas** (I, II, III... según los subtemas), cada una con:
   - Definiciones y reglas, con tablas cuando aplique.
   - Ejemplos genéricos (pueden incorporar ejemplos manuscritos de clase si el profesor lo autorizó, tratados como ejemplos neutros, no como narrativa).
   - Recuadros `[!WARNING]` de errores conceptuales frecuentes cuando el tema tenga confusiones típicas conocidas (no solo errores mecánicos de cálculo, sino errores de interpretación).
   - Autochequeos `[!TIP]` ("Compruebe su comprensión") cortos, con respuesta oculta revelable.
6. **Ejercicios resueltos** (una sección por cada bloque temático mayor): ejercicios reales de mis diapositivas, resueltos completos, en formato worked example (ver 8.5). Incluye ocasionalmente:
   - Prompts de autoexplicación `[!TIP]` ("Antes de continuar, pregúntese...") con respuesta inmediata, no diferida.
   - Un "Problema guiado" `[!TIP]` (ejercicio parcialmente resuelto, el estudiante completa el último paso) como puente hacia los ejercicios propuestos.
7. **Bloques narrativos de aplicación** ("Expediente" o el nombre que corresponda a la historia elegida), ubicados después de cada sección de Ejercicios resueltos, nunca intercalados con la teoría.
8. **Ejercicios propuestos** (8-12, distribuidos entre todos los subtemas), con solucionario de respuesta final al cierre del documento (no solución paso a paso).
9. **Cierre narrativo / veredicto**: se resuelve el planteamiento inicial usando explícitamente las herramientas del documento. Incluye un enlace hacia adelante conectando con el tema de la siguiente sesión del curso. Si el documento no alcanza a resolver todo el planteamiento con las herramientas vistas hasta el momento, un **cierre/veredicto parcial** es válido y preferible a forzar una resolución completa — deja explícito qué falta y por qué, con el enlace hacia la sesión que lo completará.
10. **Resultados de aprendizaje**: 4-6 líneas con verbos de Bloom, solo al final (no como "objetivos" repetidos al inicio).
11. **Ficha de bolsillo**: síntesis ultra-compacta (tablas/reglas de oro) para repaso rápido antes de un parcial.
12. **Referencias y material para profundizar**: libros de texto oficiales del curso (Rosen; Liben-Nowell) + 2-3 fuentes web de universidades reconocidas, verificadas por búsqueda, con nota aclarando que son opcionales. Si el sitio de notas del curso está en construcción, inclúyelo como referencia propia con una nota explícita de que está incompleto y puede cambiar.
13. **Solucionario** de los ejercicios propuestos, en bloque colapsable al final.

---

## 10. Contexto del estudiante — aplica en cada decisión de redacción

- Muchos estudiantes son de regiones apartadas con acceso limitado a internet y a material bibliográfico físico: el documento debe ser suficiente por sí mismo; cualquier referencia externa es un complemento opcional, nunca un requisito.
- Es un curso de **segundo semestre**: evita asumir conocimientos previos no cubiertos por el curso; explica cada símbolo la primera vez que aparece.
- Muchos estudiantes trabajan y tienen dificultad para formar grupos de estudio o consultar dudas en tiempo real: por eso los prompts de autoexplicación y los checkpoints **siempre** revelan la respuesta de inmediato (nunca se dejan como pregunta abierta sin resolver), y el "problema guiado" existe específicamente para cubrir el salto entre "ejercicio resuelto" y "ejercicio independiente" sin necesitar a alguien más que confirme el razonamiento.
- Muchos son futuros ingenieros que aplicarán este razonamiento formal en programación (ver correquisito con Lógica y Representación I, Anexo A): cuando sea pertinente, conecta el proceso de traducción de lenguaje natural a lógica con la habilidad de leer y comprender requisitos de software con precisión — no como una nota decorativa, sino como parte del argumento de por qué el rigor importa.

---

## 11. Checklist final antes de entregar

- [ ] ¿Toda la teoría está libre de menciones a la narrativa?
- [ ] ¿Todos los cálculos fueron verificados a mano, en una pasada final sobre el documento ya terminado (no solo al momento de escribir cada ejercicio)?
- [ ] ¿Todo término técnico usado en el documento está definido antes de su primer uso, o fue eliminado de forma consistente en todos los puntos donde aparecía?
- [ ] ¿Se hizo una búsqueda de texto literal (no revisión visual) del patrón `\_` en todo el documento, y se confirmó cero coincidencias?
- [ ] ¿Se hizo una búsqueda de texto de bloques `<details>` anidados dentro de blockquotes, y se confirmó que cada uno tiene líneas `>` en blanco alrededor de su contenido interno?
- [ ] ¿Las cadenas de equivalencia genéricas ($A\equiv A_1\equiv\cdots\equiv B$) usan el bloque vertical `$$\begin{aligned}...\end{aligned}$$` en vez de una sola línea con múltiples $\equiv$?
- [ ] Si el documento incluye diagramas Mermaid, ¿se evitaron etiquetas HTML dentro de los nodos (o se confirmó que el renderizador de destino las soporta)?
- [ ] ¿Todos los recuadros de nota/advertencia/autoevaluación usan sintaxis de alertas de GitHub (`[!TIP]`, `[!WARNING]`, `[!NOTE]`, `[!IMPORTANT]`), no emojis manuales?
- [ ] ¿Los ejercicios resueltos son exactamente los de las diapositivas del profesor?
- [ ] ¿Los ejercicios resueltos siguen el formato worked example (razonamiento explícito por "Paso N", con el procedimiento en bloque alineado o en tabla Afirmación–Razón según la convención vigente del tema)?
- [ ] ¿La sección de ejercicios resueltos se llama "Ejercicios resueltos" (o un nombre justificado explícitamente por la narrativa), no "Bitácora" u otro nombre temático sin justificar?
- [ ] ¿Los ejercicios propuestos son originales?
- [ ] ¿Todo el documento está en registro formal (usted)?
- [ ] ¿Se verificaron por búsqueda web los enlaces externos incluidos?
- [ ] ¿Se compararon los símbolos y nombres contra el sitio del curso para evitar inconsistencias terminológicas?
- [ ] ¿Se confirmó si las páginas ya existentes del sitio del curso son contenido publicado y visto por estudiantes, borrador/insumo editable, o un remanente de un semestre anterior, antes de tratarlas como no duplicables?
- [ ] ¿Se verificó si la primera sesión dictada del semestre fue solo presentación/evaluación sin contenido teórico, para ubicar correctamente cuál es la primera clase "teórica" real?
- [ ] ¿Se verificó la correspondencia de numeración entre el nombre del archivo de la clase anterior, el cronograma (si lo hay, confirmando si es de este semestre o de uno pasado), y el sitio — sin asumir que el nombre de archivo es autoritativo?
- [ ] ¿Se preguntó por correquisitos/prerrequisitos del curso y, si existen, se verificó la notación real de esa materia antes de usarla en algún ejemplo o conexión?
- [ ] Si hubo documento de clase anterior: ¿se identificó su estado narrativo y se continuó (o se justificó explícitamente por qué no) en vez de empezar una historia nueva sin más?
- [ ] Si hubo documento de clase anterior: ¿el formato y la estructura del nuevo documento son consistentes con el anterior, salvo mejoras explícitamente acordadas?
- [ ] ¿Incluye prerrequisitos (o su versión reducida si es la primera clase teórica), errores conceptuales, problema guiado, resultados de aprendizaje, ficha de bolsillo y referencias?
- [ ] ¿Se presentó el bosquejo y se esperó aprobación antes de generar el documento completo?
- [ ] ¿Se hizo la autorrevisión de la Fase 5 y se reportaron los hallazgos antes de entregar el documento como definitivo?
- [ ] Si se hizo benchmark (Fase 6): ¿se presentó la tabla a favor/en contra y la tabla Sí/No, y se esperó decisión antes de aplicar cualquier tip?
- [ ] ¿Se usó el Anexo A (mapa de correspondencia con Lógica y Representación I) para diseñar la conexión con programación, en vez de inventar una genérica o asumir una sintaxis no verificada?

---

## Anexo A — Mapa de correspondencia: Matemáticas Discretas I ↔ Lógica y Representación I

Basado en los microcurrículos oficiales vigentes (códigos 2508207 y 2508208, vigencia 2024-1/2024-2, aprobados por Consejo de Facultad). **Ambos cursos son correquisito exacto** (se cursan el mismo semestre) y **Lógica y Representación I usa Python** como lenguaje de programación desde su primera unidad — no pseudocódigo genérico. Verifica esta vigencia antes de reutilizar el mapa si ha pasado mucho tiempo desde la última actualización de este prompt, ya que los microcurrículos pueden revisarse.

El objetivo de este mapa es evitar que ambos cursos se sientan como "mundos separados" — cada vez que el tema de la sesión tenga una correspondencia real en la tabla, el documento debe usarla explícitamente (recuadro `[!NOTE]` de conexión, o incluso como parte del hilo narrativo si encaja de forma natural), con sintaxis de Python verificada, no inventada.

| Unidad de Matemáticas Discretas I | Tema | Corresponde en Lógica y Representación I | Ángulo de conexión sugerido |
|---|---|---|---|
| I — Lógica proposicional | Operadores $\land, \lor, \neg$ | Unidad 1 (expresiones aritmeticológicas) | `and`, `or`, `not` en Python son la misma álgebra de Boole, con otro nombre |
| I — Lógica proposicional | Condicional $p\rightarrow q$, jerarquía | Unidad 3 (condicional simple, doble, anidados) | `if`/`elif`/`else` y condicionales anidados son exactamente $p\rightarrow q$ y $p\rightarrow(q\rightarrow r)$ implementados |
| I — Lógica proposicional | Tautología, contradicción, contingencia | Unidad 1 (pruebas de escritorio y casos de prueba) | una condición de código que siempre evalúa `True` o siempre `False` suele ser un error de lógica, no una casualidad — el mismo concepto que aquí se nombra |
| I — Métodos de demostración (contrarrecíproco, reducción al absurdo) | — | Unidad 4 (estructuras repetitivas, condiciones de parada) | verificar que un ciclo termina es, en esencia, un argumento por contradicción o por invariante |
| II — Conjuntos, cardinalidad | — | Unidad 5 y 6 (arreglos uni/bidimensionales) | un arreglo es una representación computacional de un conjunto ordenado; su longitud es la cardinalidad |
| II — Relación de orden, poset | — | Unidad 5 (ordenamiento: burbuja, selección, inserción) | todo algoritmo de ordenamiento presupone una relación de orden total sobre los elementos — sin esa relación, "ordenar" no tiene sentido matemático |
| II — Relaciones binarias (reflexividad, simetría, transitividad) | — | Unidad 5 (búsqueda binaria) | la búsqueda binaria exige que el arreglo esté ordenado según la misma relación de orden de la Unidad II — es una precondición matemática, no solo una regla de programación |
| III — Álgebra booleana, simplificación de expresiones | — | Unidad 3 y 4 (condiciones compuestas en `if`/ciclos) | simplificar una expresión booleana con las leyes del álgebra de Boole es exactamente lo que hace que una condición compleja en código sea más legible y eficiente |
| III — Circuitos lógicos (compuertas AND, OR, NOT, XOR) | — | Unidad 1 (tipos de datos, operadores) | los operadores booleanos de Python son la abstracción de software de esas mismas compuertas físicas |
| III — Sistemas numéricos (binario) | — | Unidad 1 (tipos de datos y su representación) | todo tipo de dato en Python se representa internamente en el mismo sistema binario que se estudia aquí |

**Cómo usar este mapa en la Fase 4 (bosquejo)**: al proponer el hilo narrativo o las conexiones de la sesión, revisa primero si el tema de esa clase tiene una fila correspondiente aquí. Si la tiene, ese es el ángulo de conexión con programación que debe aparecer en el documento — no uno genérico. Si no hay correspondencia clara para el tema puntual, dilo explícitamente en vez de forzar una conexión débil.

---

*Fin del prompt maestro. Comienza la Fase 1 en cuanto reciba el/los PDF(s) de la nueva sesión.*
