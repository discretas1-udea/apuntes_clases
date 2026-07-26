# Verificación — Autoevaluación Clase 10 (uso exclusivo del profesor)

*Este archivo no se comparte con los estudiantes. Contiene el desarrollo completo, en formato Afirmación-Razón (o su equivalente paso a paso), de los ítems de Serie 2 en adelante de `clase10_autoevaluacion.md`. Los ítems de Calentamiento y Serie 1 no requieren este nivel de detalle — su verificación es directa a partir de la respuesta final ya mostrada en el archivo del estudiante.*

---

## Serie 2

### Ítem 10 — Soporte y Kubernetes

Premisas: $\exists x\ \bigl(soporte(x)\land dominaK8s(x)\bigr)$ ; $\forall x\ \bigl(dominaK8s(x)\rightarrow resuelveNivel3(x)\bigr)$.

| # | Afirmación | Razón |
|:---:|:---|:---|
| 1 | $\exists x\ \bigl(soporte(x)\land dominaK8s(x)\bigr)$ | Premisa a |
| 2 | $soporte(a)\land dominaK8s(a)$ | Instanciación existencial en 1 |
| 3 | $soporte(a)$ | Simplificación en 2 |
| 4 | $dominaK8s(a)$ | Simplificación en 2 |
| 5 | $\forall x\ \bigl(dominaK8s(x)\rightarrow resuelveNivel3(x)\bigr)$ | Premisa b |
| 6 | $dominaK8s(a)\rightarrow resuelveNivel3(a)$ | Instanciación universal en 5 |
| 7 | $resuelveNivel3(a)$ | Modus Ponens 4, 6 |
| 8 | $soporte(a)\land resuelveNivel3(a)$ | Conjunción 3, 7 |
| 9 | $\exists x\ \bigl(soporte(x)\land resuelveNivel3(x)\bigr)$ | Generalización existencial en 8 |

### Ítem 11 — Paquete $p_7$

Premisas: $\forall x\ \bigl(llega(x)\lor pierde(x)\lor retransmite(x)\bigr)$ ; $\neg pierde(p_7)$ ; $\neg retransmite(p_7)$.

| # | Afirmación | Razón |
|:---:|:---|:---|
| 1 | $\forall x\ \bigl(llega(x)\lor pierde(x)\lor retransmite(x)\bigr)$ | Premisa a |
| 2 | $llega(p_7)\lor pierde(p_7)\lor retransmite(p_7)$ | Instanciación universal en 1 |
| 3 | $\neg pierde(p_7)$ | Premisa b |
| 4 | $\neg retransmite(p_7)$ | Premisa c |
| 5 | $\bigl(llega(p_7)\lor pierde(p_7)\bigr)\lor retransmite(p_7)$ | Asociatividad en 2 |
| 6 | $llega(p_7)\lor pierde(p_7)$ | Silogismo disyuntivo 5, 4 |
| 7 | $llega(p_7)$ | Silogismo disyuntivo 6, 3 |

### Ítem 12 — Error: testigo1 generalizado con UG

Diagnóstico para el estudiante: el paso 3 (`∴ ∀x sospechoso(x)` justificado como "Generalización universal en 2") es inválido. $testigo1$ no es un objeto arbitrario — es el testigo que la propia Instanciación existencial del paso 2 introdujo para satisfacer $\exists x\ sospechoso(x)$. Es un error distinto al de Beto (Parte V.2, instancias elegidas de una muestra) y al del Ítem 7 (objeto ya nombrado en una premisa): aquí el objeto no viene de una muestra ni de una premisa previa, sino que es la propia regla EI la que lo produjo — y por construcción, ese testigo solo se sabe que cumple $sospechoso$, no que sea "cualquiera". Aplicar UG sobre él generalizaría indebidamente una propiedad que solo se garantizó para ese caso particular.

### Ítem 13 — Servidores: activo, mantenimiento, certificado, alerta

Premisas: (a) $\forall x\ \bigl(activo(x)\lor mantenimiento(x)\bigr)$ ; (b) $\forall x\ \bigl(\neg certificado(x)\rightarrow\neg activo(x)\bigr)$ ; (c) $\exists x\ \bigl(\neg mantenimiento(x)\lor alerta(x)\bigr)$.

| # | Afirmación | Razón |
|:---:|:---|:---|
| 1 | $\exists x\ \bigl(\neg mantenimiento(x)\lor alerta(x)\bigr)$ | Premisa c |
| 2 | $\neg mantenimiento(a)\lor alerta(a)$ | Instanciación existencial en 1 |
| 3 | $\forall x\ \bigl(activo(x)\lor mantenimiento(x)\bigr)$ | Premisa a |
| 4 | $activo(a)\lor mantenimiento(a)$ | Instanciación universal en 3 |
| 5 | $mantenimiento(a)\lor activo(a)$ | Conmutatividad en 4 |
| 6 | $activo(a)\lor alerta(a)$ | Resolución 5, 2 |
| 7 | $\forall x\ \bigl(\neg certificado(x)\rightarrow\neg activo(x)\bigr)$ | Premisa b |
| 8 | $\neg certificado(a)\rightarrow\neg activo(a)$ | Instanciación universal en 7 |
| 9 | $activo(a)\rightarrow certificado(a)$ | Contrarrecíproco en 8 |
| 10 | $\neg activo(a)\lor certificado(a)$ | Implicación en 9 |
| 11 | $alerta(a)\lor certificado(a)$ | Resolución 6, 10 |
| 12 | $certificado(a)\lor alerta(a)$ | Conmutatividad en 11 |
| 13 | $\exists x\ \bigl(certificado(x)\lor alerta(x)\bigr)$ | Generalización existencial en 12 |

> [!NOTE]
> Versión más corta que el Ejercicio 9 de `clase10.md` (sin el paso de Adición final) — apropiada para Serie 2, dejando la cadena de resolución completa de cuatro predicados como techo ya alcanzado en la propia clase.

### Ítem 14 — Conceptual: por qué EI antes que UI

Respuesta modelo (para calibrar la corrección del estudiante, no como único fraseo aceptable): el testigo de una existencial debe fijarse primero como una constante concreta (EI); solo después de tener ese testigo fijo tiene sentido instanciar las premisas universales exactamente en ese mismo objeto (UI), lo que permite combinarlas con reglas proposicionales sobre un único objeto compartido. Instanciar primero la universal produciría un objeto genérico sin conexión garantizada con el testigo existencial, y las premisas no podrían combinarse.

---

## Serie 3

### Ítem 15 — $\neg(\neg p\land q)$

$$\neg(\neg p\land q)\ \underset{\text{Leyes de Morgan}}{\equiv}\ \neg(\neg p)\lor\neg q\ \underset{\text{Doble negación}}{\equiv}\ p\lor\neg q$$

### Ítem 16 — $p\lor q,\ \neg p,\ q\rightarrow r\ \therefore r$

| # | Afirmación | Razón |
|:---:|:---|:---|
| 1 | $p\lor q$ | Premisa |
| 2 | $\neg p$ | Premisa |
| 3 | $q$ | Silogismo disyuntivo 1, 2 |
| 4 | $q\rightarrow r$ | Premisa |
| 5 | $r$ | Modus Ponens 3, 4 |

### Ítem 17 — $\neg\exists x\ (seguro(x)\land estable(x))$

$$\neg\exists x\ \bigl(seguro(x)\land estable(x)\bigr)\ \underset{\text{De Morgan cuántico}}{\equiv}\ \forall x\ \neg\bigl(seguro(x)\land estable(x)\bigr)\ \underset{\text{Leyes de Morgan}}{\equiv}\ \forall x\ \bigl(\neg seguro(x)\lor\neg estable(x)\bigr)$$

### Ítem 18 — Integración: disponibilidad y atención (Marco)

Premisas: (a) $\neg\exists x\ \neg disponible(x)$ ; (b) $\forall x\ \bigl(disponible(x)\rightarrow puedeAtender(x)\bigr)$.

| # | Afirmación | Razón |
|:---:|:---|:---|
| 1 | $\neg\exists x\ \neg disponible(x)$ | Premisa a |
| 2 | $\forall x\ \neg\neg disponible(x)$ | De Morgan cuántico en 1 |
| 3 | $\forall x\ disponible(x)$ | Doble negación en 2 |
| 4 | $disponible(\text{Marco})$ | Instanciación universal en 3 |
| 5 | $\forall x\ \bigl(disponible(x)\rightarrow puedeAtender(x)\bigr)$ | Premisa b |
| 6 | $disponible(\text{Marco})\rightarrow puedeAtender(\text{Marco})$ | Instanciación universal en 5 |
| 7 | $puedeAtender(\text{Marco})$ | Modus Ponens 4, 6 |

> [!NOTE]
> Este es el ítem de "integración real" pedido en la Fase 3: el primer paso viene de Parte III (De Morgan cuántico), el segundo de Parte II (Doble negación), y el resto de Parte V (UI × 2, MP) — exactamente la combinación que la Serie 3 debía ejercitar, no solo repasar las dos partes por separado.

---

## Reto Final — El Enigma del Bosque Blorpiter

Predicados: $grifomorso(x)$, $maullaDeNoche(x)$, $luminiscente(x)$, $temeNiebla(x)$, $enBosque(x)$. Dominio: todos los seres imaginarios del mundo de la historia.

Premisas:
- (a) $\forall x\ \Bigl(\bigl(grifomorso(x)\land maullaDeNoche(x)\bigr)\rightarrow luminiscente(x)\Bigr)$
- (b) $\forall x\ \bigl(luminiscente(x)\rightarrow\neg temeNiebla(x)\bigr)$
- (c) $\exists x\ \bigl(grifomorso(x)\land maullaDeNoche(x)\land enBosque(x)\bigr)$

Conclusión: $\exists x\ \bigl(enBosque(x)\land\neg temeNiebla(x)\bigr)$

| # | Afirmación | Razón |
|:---:|:---|:---|
| 1 | $\exists x\ \bigl(grifomorso(x)\land maullaDeNoche(x)\land enBosque(x)\bigr)$ | Premisa c |
| 2 | $grifomorso(a)\land maullaDeNoche(a)\land enBosque(a)$ | Instanciación existencial en 1 |
| 3 | $grifomorso(a)\land maullaDeNoche(a)$ | Simplificación en 2 |
| 4 | $enBosque(a)$ | Simplificación en 2 |
| 5 | $\forall x\ \Bigl(\bigl(grifomorso(x)\land maullaDeNoche(x)\bigr)\rightarrow luminiscente(x)\Bigr)$ | Premisa a |
| 6 | $\bigl(grifomorso(a)\land maullaDeNoche(a)\bigr)\rightarrow luminiscente(a)$ | Instanciación universal en 5 |
| 7 | $luminiscente(a)$ | Modus Ponens 3, 6 |
| 8 | $\forall x\ \bigl(luminiscente(x)\rightarrow\neg temeNiebla(x)\bigr)$ | Premisa b |
| 9 | $luminiscente(a)\rightarrow\neg temeNiebla(a)$ | Instanciación universal en 8 |
| 10 | $\neg temeNiebla(a)$ | Modus Ponens 7, 9 |
| 11 | $enBosque(a)\land\neg temeNiebla(a)$ | Conjunción 4, 10 |
| 12 | $\exists x\ \bigl(enBosque(x)\land\neg temeNiebla(x)\bigr)$ | Generalización existencial en 11 |

> [!NOTE]
> Consistencia universo-predicado verificada: el dominio de trabajo es "todos los seres imaginarios del mundo de la historia" (abierto); $enBosque(x)$ y $grifomorso(x)$ son predicados sobre ese dominio, no criterios de pertenencia al dominio mismo — no hay conflación entre el conjunto de trabajo y las propiedades evaluadas.

---

## Nota sobre el patrón de solucionario usado

Este bloque siguió el patrón de respuesta dentro de cada ítem (Sección 6.1 del prompt maestro) en vez de un Solucionario consolidado al final del archivo del estudiante — mismo patrón que `clase6_autoevaluacion.md`. Este archivo de verificación es, por tanto, el único lugar donde vive el desarrollo completo paso a paso.
