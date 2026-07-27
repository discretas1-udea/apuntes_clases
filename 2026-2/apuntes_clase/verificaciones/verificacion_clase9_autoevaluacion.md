# Verificación (uso exclusivo del profesor) — `clase9_autoevaluacion.md`

*No compartir con estudiantes. Contiene el desarrollo completo de los ítems de Serie 2 en adelante, para permitir una revisión rápida (5-6 líneas por ítem) en vez de resolver cada uno desde cero.*

> [!IMPORTANT]
> `clase9.md` todavía no enseña un formato de inferencia formal (Afirmación-Razón) para lógica cuantificacional — ese formato se enseñó en Clase 6 para lógica proposicional. Aquí se usa, en su lugar, una justificación **paso a paso** equivalente, como lo permite el prompt maestro (Sección 5, punto 7).

> [!NOTE]
> **Alcance.** Este archivo cubre únicamente los Ítems 9 a 19 (Serie 2, Serie 3 — Entrenamiento cruzado, Reto Final), por diseño: los Ítems 1-8 (Calentamiento y Serie 1) son de concepto único y se verifican por inspección directa contra `clase9.md`, sin necesitar desarrollo adicional.

---

## Serie 2

**Ítem 9.** Traducción con método de 5 pasos (Parte III).
1. Dominio: personas (clientes) y productos.
2. Palabra clave "todo cliente" → $\forall x$; "al menos un producto" → $\exists y$.
3. Sujeto: $cliente(x)$; relación: $comprado(x,y)$, restringida a productos en oferta con $oferta(y)$.
4. Forma A en el exterior (implicación), forma I en el interior (conjunción) — mismo patrón de Clase 7 aplicado dos veces.
5. Conclusión: $\forall x\ \bigl(cliente(x) \rightarrow \exists y\ (producto(y)\land oferta(y)\land comprado(x,y))\bigr)$.

**Ítem 10.** $U_{sensor}=\{S1,S2,S3\}$, $U_{servidor}=\{V1,V2\}$, tabla $S1\to V1$, $S2\to V1$, $S3\to V2$.
1. $\forall x\exists y\ reporta(x,y)$: $S1$→testigo $V1$ ✓; $S2$→testigo $V1$ ✓; $S3$→testigo $V2$ ✓. Los tres sensores tienen testigo. **V.**
2. $\exists y\forall x\ reporta(x,y)$: probar $y=V1$ — falla en $S3$ ($S3$ no reporta a $V1$). Probar $y=V2$ — falla en $S1$ y $S2$. Ningún $y$ sirve para los tres. **F.**
3. Conclusión: mismo patrón que Ana/Beto/Carla (Parte II.1) — testigo dependiente de $x$ sí existe, testigo único para todos no.

**Ítem 11.** Letrero mal formalizado, $\forall x\ entregoCarnet(x) \lor pagoMulta(x) \rightarrow puedeRetirar(x)$.
1. Por precedencia (Parte I.1), $\forall x$ solo alcanza al átomo inmediato: $entregoCarnet(x)$.
2. La fórmula completa se lee como $\bigl((\forall x\ entregoCarnet(x)) \lor pagoMulta(x)\bigr) \rightarrow puedeRetirar(x)$.
3. En esa lectura, las ocurrencias de $x$ en $pagoMulta(x)$ y $puedeRetirar(x)$ quedan fuera de cualquier alcance — libres (Parte I.3) — exactamente el caso de la Advertencia de Parte I.1.
4. Clasificación (Parte V): es ambigüedad **de alcance** — no queda claro qué parte de la fórmula domina el cuantificador.
5. Corrección con paréntesis: $\forall x\ \Bigl(\bigl(entregoCarnet(x) \lor pagoMulta(x)\bigr) \rightarrow puedeRetirar(x)\Bigr)$.

**Ítem 12.** Cláusula **extendida** de IV.3 (Q sin la variable cuantificada) — deliberadamente distinta del Ítem 7, que ya cubre la cláusula básica ($\forall x(P\land Q(x))$ con ambos predicados dependientes de $x$).
1. $vigente$ es una proposición atómica sin ocurrencia de $x$ — no es $vigente(x)$, es una constante proposicional.
2. La cláusula extendida de IV.3 dice exactamente: $\forall x\ (P(x)\land Q) \equiv \forall x\ P(x)\land Q$ cuando $Q$ no contiene $x$.
3. Sustituyendo $P=responsable$, $Q=vigente$: $\forall x\ (responsable(x)\land vigente) \equiv \forall x\ responsable(x)\land vigente$.
4. Intuición de por qué es válido: $vigente$ no cambia según qué $x$ se elija, así que "sacarla" del alcance del cuantificador no pierde ni agrega información — el cuantificador nunca tenía nada que hacer sobre ella.

**Ítem 13.** Traducción con condición de distinción + nota de vacuidad (paralelo a Ejercicio 7).
1. Predicados: $colaboraCon(x,y)$, dominio de proyectos.
2. Estructura: $\exists x$ (existe un proyecto) $\forall y\forall z$ (para cualesquiera dos colaboradores) con antecedente $colaboraCon(x,y)\land colaboraCon(x,z)\land y\neq z$ y consecuente $\neg colaboraCon(y,z)$.
3. Fórmula: $\exists x\ \forall y\ \forall z\ \bigl(colaboraCon(x,y)\land colaboraCon(x,z)\land y\neq z \rightarrow \neg colaboraCon(y,z)\bigr)$.
4. Vacuidad: si $x$ no tiene dos colaboradores distintos que satisfagan el antecedente, la implicación nunca se pone a prueba — verdadera por vacuidad, igual que en el Ejercicio 7.

---

## Serie 3 — Entrenamiento cruzado

**Ítem 14.** Unicidad anidada (Clase 8 + hoy), paralelo a Ejercicio 9.
1. Solución 1 — con $\exists!$: $\forall x\ \exists!\ y\ primerContacto(x,y)$.
2. Solución 2 — expandiendo $\exists!$ (Clase 8, Parte I.2) dentro del alcance de $\forall x$ de hoy: se agrega $\forall z\ (z\neq y \rightarrow \neg primerContacto(x,z))$ dentro del alcance del $\exists y$.
3. Conclusión: $\forall x\ \exists y\ \Bigl(primerContacto(x,y) \land \forall z\ \bigl(z\neq y \rightarrow \neg primerContacto(x,z)\bigr)\Bigr)$.

**Ítem 15.** $U_{mesa}=\{Mesa1,Mesa2,Mesa3\}$, $U_{mesero}=\{MeseroA,MeseroB\}$, bitácora de turno con registros múltiples posibles (no una tabla funcional pre-filtrada) — rediseñado tras auditoría externa para que la unicidad pueda fallar genuinamente y no sea trivial por construcción.
1. Registros: $atiende(MeseroA,Mesa1)$, $atiende(MeseroA,Mesa2)$, $atiende(MeseroB,Mesa2)$, $atiende(MeseroA,Mesa3)$.
2. $Mesa1$: existencia — $MeseroA$. Unicidad — ningún otro registro menciona $Mesa1$. $\exists!$ se cumple.
3. $Mesa2$: existencia — $MeseroA$ (o $MeseroB$). Unicidad — **falla**: hay dos registros distintos, $MeseroA$ y $MeseroB$, ambos atendieron $Mesa2$. Formalmente, se refuta $\forall y\bigl(atiende(y,Mesa2)\rightarrow y=MeseroA\bigr)$ con el contraejemplo $y=MeseroB$. $\exists!$ **no** se cumple para $Mesa2$.
4. $Mesa3$: existencia — $MeseroA$. Unicidad — ningún otro registro menciona $Mesa3$. $\exists!$ se cumple.
5. Como $\exists!\ y\ atiende(y,x)$ falla al menos en $Mesa2$, el universal $\forall x\ \exists!\ y\ atiende(y,x)$ es **F** — basta un contraejemplo de $x$ para refutar un $\forall$ (el mismo principio del método del contraejemplo de Clase 8, aplicado aquí a una fórmula con $\exists!$ anidado).

**Ítem 16.** Negación de $\forall x\ \exists y\ (reporta(x,y)\land activo(y))$.
1. Negar $\forall x$ (Clase 8): $\neg\forall x\ \exists y(\dots) \equiv \exists x\ \neg\exists y(\dots)$.
2. Negar $\exists y$ (Clase 8): $\exists x\ \forall y\ \neg(reporta(x,y)\land activo(y))$.
3. De Morgan proposicional (Clase 6) sobre lo interno: $\neg(reporta\land activo)\equiv\neg reporta\lor\neg activo$.
4. Conclusión: $\exists x\ \forall y\ \bigl(\neg reporta(x,y)\lor\neg activo(y)\bigr)$.

**Ítem 17.** Negación de $\exists x\ \forall y\ (disponible(x,y)\lor enMantenimiento(x,y))$.
1. Negar $\exists x$ (Clase 8): $\neg\exists x\ \forall y(\dots) \equiv \forall x\ \neg\forall y(\dots)$.
2. Negar $\forall y$ (Clase 8): $\forall x\ \exists y\ \neg(disponible(x,y)\lor enMantenimiento(x,y))$.
3. De Morgan proposicional (Clase 6) sobre lo interno: $\neg(disponible\lor enMantenimiento)\equiv\neg disponible\land\neg enMantenimiento$.
4. Conclusión: $\forall x\ \exists y\ \bigl(\neg disponible(x,y)\land\neg enMantenimiento(x,y)\bigr)$.

---

## Reto Final — La ruta del domiciliario

**Ítem 18.** Formalización comparativa, sin tabla todavía.
1. "Cada cliente tiene un repartidor asignado": $\forall$ exterior con testigo dependiente de $x$ → $\forall x\in U_{cliente}\ \exists y\in U_{repartidor}\ asignado(y,x)$.
2. "Hay un repartidor que cubre a todos": $\exists$ exterior con testigo fijo para todo $x$ → $\exists y\in U_{repartidor}\ \forall x\in U_{cliente}\ asignado(y,x)$.
3. Diferencia (núcleo de la Parte II): la primera permite un repartidor distinto por cliente; la segunda exige uno solo, común a todos — afirmación estrictamente más fuerte.

**Ítem 19.** Evaluación con tabla $C1\to R1$, $C2\to R1$, $C3\to R2$, $C4\to R1$, y negación. Notación uniformada con el Ítem 18 (explícita sobre $U_{cliente}$ y $U_{repartidor}$).
1. $\forall x\in U_{cliente}\ \exists y\in U_{repartidor}\ asignado(y,x)$: cada cliente tiene fila con repartidor ($C1,C2,C4\to R1$; $C3\to R2$). **V.**
2. $\exists y\in U_{repartidor}\ \forall x\in U_{cliente}\ asignado(y,x)$: probar $y=R1$ — falla en $C3$. Probar $y=R2$ — falla en $C1,C2,C4$. Ningún $y$ cubre los cuatro. **F.**
3. Negar la fórmula falsa (Clase 8, dos pasos): $\neg\exists y\in U_{repartidor}\ \forall x\in U_{cliente}\ asignado(y,x) \equiv \forall y\in U_{repartidor}\ \neg\forall x\in U_{cliente}\ asignado(y,x) \equiv \forall y\in U_{repartidor}\ \exists x\in U_{cliente}\ \neg asignado(y,x)$.
4. Lectura: "para cada repartidor existe al menos un cliente que no tiene asignado ese repartidor" — cierto para ambos repartidores del caso ($R1$ falla con $C3$; $R2$ falla con $C1,C2,C4$).

---

*Fin del bloque de verificación. 11 ítems desarrollados en total: Serie 2 (Ítems 9-13, 5 ítems), Serie 3 — Cruzada (Ítems 14-17, 4 ítems), Reto Final (Ítems 18-19, 2 ítems).*
