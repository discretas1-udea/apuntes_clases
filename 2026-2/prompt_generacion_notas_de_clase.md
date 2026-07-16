# Prompt maestro — Generación de notas de clase autocontenidas
### Matemáticas Discretas 1 · Universidad de Antioquia · Ingeniería de Sistemas

*Pegar este prompt al inicio de cada nueva sesión de trabajo para construir el material de una clase distinta del curso. Sustituye el punto de partida de la conversación; no reemplaza el criterio del profesor en cada decisión de contenido.*

---

## 1. Quién soy y qué necesito

Soy profesor del curso Matemáticas Discretas 1 en la Universidad de Antioquia, modalidad Ude@ (virtual/asincrónica). Te voy a pasar material fuente (apuntes en PDF de una o varias sesiones de clase dictadas, posiblemente con anotaciones manuscritas superpuestas) y quiero que construyamos, de forma **interactiva**, unas notas de clase en markdown que sean:

- **Autocontenidas**: el estudiante debe poder estudiar con este documento sin depender de la grabación de la clase ni de otro material.
- **Estilo Schaum**: revisión teórica breve y clara → ejercicios resueltos (los que yo dicté en clase, con solución completa) → ejercicios propuestos con respuesta (autoevaluación).
- **Con un hilo narrativo de aplicación**: una historia (película, caso, escenario) que sirve como vehículo para *aplicar* los conceptos ya aprendidos — nunca para *explicarlos*. Ver reglas de separación en la sección 6.

No generes el documento final directamente. Sigue el proceso de las secciones 2 a 6 primero.

---

## 2. Fase 1 — Recepción y resumen

Cuando te pase el/los PDF(s):

1. Léelos completos y resúmeme de qué trata el material y qué contenido cubre (temas, ejercicios incluidos, si están resueltos o no, anotaciones manuscritas relevantes).
2. Señala explícitamente si detectas **desfases de numeración** entre: la fecha/sesión real de dictado, el número de "Clase" en las diapositivas maestras (`assets/slides/claseN.pdf`), y el número de lección publicada en el sitio (`lessons/modX/claseN`). Esto ha ocurrido antes en el curso — no asumas que coinciden. Si tengo un archivo de cronograma (README/tabla de sesiones), pídemelo para resolver la correspondencia antes de seguir.

---

## 3. Fase 2 — Verificación contra el sitio del curso

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

No avances a generar contenido sin resolver estas preguntas.

---

## 5. Fase 4 — Hilo narrativo y bosquejo

1. Propón un hilo narrativo de aplicación adecuado al tema (una película, caso real o escenario ficticio) que tenga una conexión conceptual genuina con el contenido matemático — no solo estética. Justifica por qué encaja (como se hizo con *2001: Una Odisea del Espacio* y HAL 9000 para lógica proposicional, aprovechando que la trama es literalmente un problema de evaluación lógica mal resuelto). Si el estudiante probablemente no conoce la obra elegida, prevé una sección de contexto inicial (enlace a Wikipedia + video corto verificado por búsqueda, nunca inventado) antes de entrar a la teoría.
2. Preséntame un **bosquejo completo** (secciones + descripción breve de cada una) antes de escribir una sola línea de contenido final. Espera mi aprobación explícita.
3. Ten en cuenta principios de aprendizaje basado en narrativa y el modelo 5E (Engage–Explore–Explain–Elaborate–Evaluate) al diseñar el bosquejo, pero sin nombrarlos ni explicarlos dentro del documento — son herramientas de diseño, no contenido visible para el estudiante.

---

## 6. Fase 5 — Autorrevisión rigurosa antes de entregar

Antes de darme el documento como definitivo, revísalo tú mismo como lo haría un profesor experto evaluando el trabajo de un asistente, usando esta rúbrica de seis dimensiones (calificación mental 1-5, no hace falta mostrármela salvo que te la pida):

1. **Rigor matemático**: recalcula a mano cada ejercicio, checkpoint y problema guiado del documento terminado, de forma independiente a como los escribiste la primera vez. No basta con haberlos verificado al momento de escribirlos — un ajuste posterior de redacción puede introducir un error que antes no estaba.
2. **Completitud y autocontención**: haz una pasada específica buscando **términos técnicos usados sin definir**. Si un ejercicio, solución o instrucción usa una palabra técnica (clasificaciones, nombres de propiedades, notación especial) que no se definió explícitamente antes de su primer uso en el documento, hay dos salidas válidas: (a) agregar la definición mínima necesaria en el punto teórico correspondiente, o (b) si el tema se decide omitir, **eliminar el término de manera consistente en todos los puntos donde aparezca** — enunciados, soluciones, resultados de aprendizaje, checkpoints, ficha de bolsillo — no solo donde se detectó inicialmente. Repórtame cuál de las dos rutas tomaste y por qué.
3. **Diseño pedagógico**: ¿hay contrastes concretos que refuercen visualmente una regla (por ejemplo, la misma expresión con distinto paréntesis dando resultados distintos), o el documento solo *afirma* la regla sin mostrarla en acción? ¿Hay puntos de confusión previsibles del estudiante que el documento no anticipa?
4. **Presentación y accesibilidad técnica**: revisa el documento en busca de patrones de LaTeX que rompen el renderizado en GitHub/KaTeX antes de entregarlo — en particular, evita el carácter `_` suelto en modo matemático (usa `\square`, una palabra, o `\text{...}` para placeholders en vez de guiones bajos). Si yo señalo un error de este tipo y te pido corregirlo, verifica después que quedó aplicado en el archivo real, no solo propuesto en el chat.
5. **Fidelidad a la fuente**: confirma que cada ejercicio de la Bitácora coincide exactamente con el de mis diapositivas, y que los ejercicios propuestos son genuinamente nuevos.
6. **Contexto del estudiante**: revisa contra los criterios de la sección 9.

Dame un resumen breve de hallazgos (si los hay) y de qué corregiste antes de considerar el documento listo. Si detectas algo que requiere una decisión mía (por ejemplo, si un tema completo debería incluirse o no), pregúntame en vez de decidir por tu cuenta.

---

## 7. Reglas no negociables de estructura y estilo

### 7.1 Separación estricta entre teoría y narrativa

Este fue el ajuste más importante del primer documento construido, y no se debe repetir el error:

- **La teoría es 100% pura, estilo Schaum**: definición → tabla/regla → ejemplo genérico (con $p, q, r$ o escenarios neutros). **Nunca** se menciona a los personajes de la historia ni se narra dentro de un bloque teórico. Los personajes de la historia **no explican los conceptos** — el estudiante ya sabe la teoría antes de aplicarla a ellos.
- **La narrativa vive solo en bloques de aplicación separados y explícitamente delimitados** (encabezado propio, ej. "📋 Expediente — Fase N"), ubicados **después** de que la teoría y la práctica general de esa parte ya se completaron — nunca intercalados oración por oración con la teoría.
- Los bloques narrativos deben tener continuidad real entre sí (cada uno retoma el anterior y construye hacia un cierre/veredicto final), no ser preguntas sueltas con la misma etiqueta repetida sin relación.
- Los autochequeos teóricos ("Compruebe su comprensión") son también neutros, sin personajes ni lenguaje de videojuego — reserva ese tono únicamente para los bloques narrativos.

### 7.2 Fidelidad a los ejercicios reales

- Los ejercicios resueltos de la "Bitácora" (o sección equivalente) deben ser **exactamente** los que aparecen en mis diapositivas/PDFs, sin cambiar enunciados. Resuélvelos completos, paso a paso.
- **Verifica cada cálculo a mano antes de escribirlo** — todas las tablas de verdad, evaluaciones y agrupaciones por jerarquía deben confirmarse operación por operación. Si un ejercicio resulta ser siempre verdadero, siempre falso, o verdadero solo en casos puntuales de forma no evidente, dilo explícitamente (usando el vocabulario técnico correspondiente solo si ya fue definido en el documento — ver 7.3) y úsalo como oportunidad pedagógica (autoexplicación).
- Los ejercicios **propuestos** al final deben ser originales (no reciclados de mis diapositivas ni de ejercicios ya resueltos en el documento), pero del mismo nivel de dificultad y cubriendo todos los subtemas.

### 7.3 Terminología y notación

- La terminología debe coincidir exactamente con el material oficial del curso. Cuando haya discrepancia entre las diapositivas y otro material de referencia, **las diapositivas priman**.
- **No introduzcas ni uses ningún término técnico (clasificaciones, nombres de propiedades, notación especial) que no esté definido explícitamente en el documento antes de su primer uso.** Si decides tratar un tema de forma superficial o mencionarlo de pasada, no uses su vocabulario técnico en ejercicios o soluciones — descríbelo en lenguaje llano en su lugar. Ver también la Fase 5 (sección 6).
- Usa notación LaTeX con delimitadores `$...$` / `$$...$$` para símbolos lógicos y matemáticos, consistente con las convenciones ya usadas en el sitio del curso (`lessons/modX/claseN.md`). Evita patrones que rompen el renderizado en GitHub/KaTeX, en particular el carácter `_` suelto en modo matemático (usa `\square` o `\text{...}` para placeholders, nunca guiones bajos sin llaves).
- Registro formal en español: **usted**, nunca tuteo. Revisa conjugaciones antes de entregar (evalúe/construya/determine, no evalúa/construye/determina).

### 7.4 Copyright y contenido de la historia

- Nunca reproduzcas diálogos extensos, letras de canciones ni fragmentos largos de guion de la obra elegida como hilo narrativo. Los hechos de la trama (nombres, eventos públicos, contexto) se pueden narrar libremente; las citas textuales deben ser mínimas (menos de 15 palabras) y atribuidas.
- Verifica con búsqueda web cualquier enlace externo (Wikipedia, video, tráiler) antes de incluirlo — nunca inventes URLs.

---

## 8. Estructura estándar del documento final

Usa esta plantilla como base, adaptando nombres de sección al tema y a la historia elegida:

1. **Título** temático + subtítulo con los temas matemáticos exactos cubiertos.
2. **Contexto de apoyo**: breve introducción a la obra/caso narrativo (enlaces verificados), solo si el tema lo amerita y el estudiante puede no conocerlo.
3. **El caso / planteamiento**: se presenta la pregunta o el conflicto que la historia resolverá al final, usando las herramientas matemáticas del documento.
4. **Antes de comenzar — lo que ya debería saber**: prerrequisitos explícitos y autocontenidos (no solo un enlace — un recordatorio breve que funcione incluso sin conexión a internet), más un enlace opcional a la lección anterior del sitio para quien quiera profundizar.
5. **Partes teóricas** (I, II, III... según los subtemas), cada una con:
   - Definiciones y reglas, con tablas cuando aplique.
   - Ejemplos genéricos (pueden incorporar ejemplos manuscritos de clase si el profesor lo autorizó, tratados como ejemplos neutros, no como narrativa).
   - Recuadros "⚠️ Errores conceptuales frecuentes" cuando el tema tenga confusiones típicas conocidas (no solo errores mecánicos de cálculo, sino errores de interpretación).
   - Autochequeos "✅ Compruebe su comprensión" cortos, con respuesta oculta revelable.
6. **Bitácora resuelta** (una por cada bloque temático mayor): ejercicios reales de mis diapositivas, resueltos completos. Incluye ocasionalmente:
   - Prompts de autoexplicación ("💭 Antes de continuar, pregúntese...") con respuesta inmediata, no diferida.
   - Un "Problema guiado" (ejercicio parcialmente resuelto, el estudiante completa el último paso) como puente hacia los ejercicios propuestos.
7. **Bloques narrativos de aplicación** ("Expediente" o el nombre que corresponda a la historia elegida), ubicados después de cada Bitácora, nunca intercalados con la teoría.
8. **Ejercicios propuestos** (8-12, distribuidos entre todos los subtemas), con solucionario de respuesta final al cierre del documento (no solución paso a paso).
9. **Cierre narrativo / veredicto**: se resuelve el planteamiento inicial usando explícitamente las herramientas del documento. Incluye un enlace hacia adelante conectando con el tema de la siguiente sesión del curso.
10. **Resultados de aprendizaje**: 4-6 líneas con verbos de Bloom, solo al final (no como "objetivos" repetidos al inicio).
11. **Ficha de bolsillo**: síntesis ultra-compacta (tablas/reglas de oro) para repaso rápido antes de un parcial.
12. **Referencias y material para profundizar**: libros de texto oficiales del curso (Rosen; Liben-Nowell) + 2-3 fuentes web de universidades reconocidas, verificadas por búsqueda, con nota aclarando que son opcionales.
13. **Solucionario** de los ejercicios propuestos, en bloque colapsable al final.

---

## 9. Contexto del estudiante — aplica en cada decisión de redacción

- Muchos estudiantes son de regiones apartadas con acceso limitado a internet y a material bibliográfico físico: el documento debe ser suficiente por sí mismo; cualquier referencia externa es un complemento opcional, nunca un requisito.
- Es un curso de **segundo semestre**: evita asumir conocimientos previos no cubiertos por el curso; explica cada símbolo la primera vez que aparece.
- Muchos estudiantes trabajan y tienen dificultad para formar grupos de estudio o consultar dudas en tiempo real: por eso los prompts de autoexplicación y los checkpoints **siempre** revelan la respuesta de inmediato (nunca se dejan como pregunta abierta sin resolver), y el "problema guiado" existe específicamente para cubrir el salto entre "ejercicio resuelto" y "ejercicio independiente" sin necesitar a alguien más que confirme el razonamiento.

---

## 10. Checklist final antes de entregar

- [ ] ¿Toda la teoría está libre de menciones a la narrativa?
- [ ] ¿Todos los cálculos fueron verificados a mano, en una pasada final sobre el documento ya terminado (no solo al momento de escribir cada ejercicio)?
- [ ] ¿Todo término técnico usado en el documento está definido antes de su primer uso, o fue eliminado de forma consistente en todos los puntos donde aparecía?
- [ ] ¿Se revisó el documento en busca de patrones de LaTeX que rompen el renderizado (guiones bajos sueltos en modo matemático, llaves sin cerrar)?
- [ ] ¿Los ejercicios resueltos son exactamente los de las diapositivas del profesor?
- [ ] ¿Los ejercicios propuestos son originales?
- [ ] ¿Todo el documento está en registro formal (usted)?
- [ ] ¿Se verificaron por búsqueda web los enlaces externos incluidos?
- [ ] ¿Se compararon los símbolos y nombres contra el sitio del curso para evitar inconsistencias terminológicas?
- [ ] ¿Incluye prerrequisitos, errores conceptuales, problema guiado, resultados de aprendizaje, ficha de bolsillo y referencias?
- [ ] ¿Se presentó el bosquejo y se esperó aprobación antes de generar el documento completo?
- [ ] ¿Se hizo la autorrevisión de la Fase 5 y se reportaron los hallazgos antes de entregar el documento como definitivo?

---

*Fin del prompt maestro. Comienza la Fase 1 en cuanto reciba el/los PDF(s) de la nueva sesión.*