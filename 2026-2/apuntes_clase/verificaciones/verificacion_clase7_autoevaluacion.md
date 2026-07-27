# Verificación (uso exclusivo del profesor) — `clase8_autoevaluacion.md`

*No compartir con estudiantes. Contiene el desarrollo completo de los ítems de Serie 2 en adelante, para permitir una revisión rápida (5-6 líneas por ítem) en vez de resolver cada uno desde cero.*

> [!IMPORTANT]
> `clase8.md` todavía no enseña un formato de inferencia formal (Afirmación-Razón) para lógica cuantificacional — ese formato se enseñó en Clase 6 para lógica proposicional. Aquí se usa, en su lugar, una justificación **paso a paso** equivalente, como lo permite el prompt maestro (Sección 5, punto 7).

> [!NOTE]
> **Alcance.** Este archivo cubre únicamente los Ítems 10 a 24 (Serie 2, Serie 3 — Integración, Reto Final), por diseño: los Ítems 1-9 (Calentamiento y Serie 1) son de concepto único y se verifican por inspección directa contra `clase8.md`, sin necesitar desarrollo adicional.

---

## Serie 2

**Ítem 10.** $\exists!\ x\ perfecto(x)$ con tabla $U=\{E1,\dots,E5\}$, solo $E2$="sí".
1. Existencia: $perfecto(E2)=V$.
2. Unicidad, formalmente (definición I.2): se verifica $\forall y\bigl(perfecto(y)\rightarrow y=E2\bigr)$. Para $y\in\{E1,E3,E4,E5\}$, $perfecto(y)=F$, así que el condicional es vacuamente V; para $y=E2$, se cumple trivialmente ($E2=E2$). El universal es V.
3. Conclusión: $\exists!\ x\ perfecto(x)$ es **V**, testigo $E2$.

**Ítem 11.** Negar "Algún estudiante que tomó Lógica y Representación I reprobó el examen de admisión a prácticas".
1. $R(x)$: "x tomó Lógica y Representación I"; $F(x)$: "x reprobó el examen". Traducción: $\exists x(R(x)\land F(x))$.
2. Negar con De Morgan cuantificacional (Parte IV): $\neg\exists x(R(x)\land F(x))\equiv\forall x\ \neg(R(x)\land F(x))$.
3. De Morgan proposicional (Clase 6): $\neg(R(x)\land F(x))\equiv\neg R(x)\lor\neg F(x)$.
4. Reconocer como implicación ($\neg p\lor q\equiv p\rightarrow q$, con $q=\neg F(x)$): $\neg R(x)\lor\neg F(x)\equiv R(x)\rightarrow\neg F(x)$.
5. Conclusión: $\forall x\bigl(R(x)\rightarrow\neg F(x)\bigr)$ — "todo el que tomó LyR1 no reprobó el examen". **Cuidado:** $\neg F(x)$ es "no reprobó", no "aprobó" — el enunciado no declaró una partición binaria aprobar/reprobar, así que no debe traducirse como "aprobó" (error señalado por ambas auditorías externas, ChatGPT y Gemini).

**Ítem 12.** $P(x)$: $x^2\leq 9$, dominios $\{-3,\dots,3\}$ y $\mathbb{Z}$.
1. En $\{-3,\dots,3\}$: los siete cuadrados ($9,4,1,0,1,4,9$) son todos $\leq 9$. $\forall x\ P(x)$ es **V**.
2. En $\mathbb{Z}$: contraejemplo $x=4$, $16\leq 9$ es F. $\forall x\ P(x)$ es **F**.
3. Conclusión: mismo predicado, el dominio infinito reintroduce el contraejemplo que el dominio finito excluía (Parte II.1).

**Ítem 13.** $\exists!\ x\ Q(x)$, $Q(x)$: múltiplo de 4, dominio $\{1,\dots,15\}$.
1. Múltiplos de 4 en el rango: $4, 8, 12$ — tres testigos.
2. Existencia: $Q(4)=V$.
3. Unicidad, formalmente: se busca refutar $\forall y\bigl(Q(y)\rightarrow y=4\bigr)$. Basta $y=8$: $Q(8)=V$ pero $8\neq4$, así que el condicional es F — el universal queda refutado, la unicidad falla (también existe $12$ como testigo adicional).
4. Conclusión: $\exists!\ x\ Q(x)$ es **F**; testigos que rompen la unicidad: $4$ y $8$.

**Ítem 14.** $U=\{a,b\}$, $R(x)$, derivar $\neg\forall xR(x)\equiv\exists x\neg R(x)$ desde cero.
1. Parte III: $\forall x\ R(x)\equiv R(a)\land R(b)$.
2. Negar con De Morgan proposicional (Clase 6): $\neg(R(a)\land R(b))\equiv\neg R(a)\lor\neg R(b)$.
3. Parte III aplicada a $\neg R$: $\neg R(a)\lor\neg R(b)\equiv\exists x\ \neg R(x)$.
4. Conclusión: $\neg\forall x\ R(x)\equiv\exists x\ \neg R(x)$ — coincide con la ley de De Morgan cuantificacional (Parte IV), aquí reconstruida para $n=2$.
5. **Nota de alcance:** este ítem ilustra el caso $n=2$. La generalización a un $n$ arbitrario no se sigue automáticamente de este caso particular — sigue el mismo patrón, pero aplicando De Morgan proposicional de dos términos a la vez, tantas veces como haga falta, exactamente como ya lo hace `clase8.md` en su propia derivación simbólica general (Parte IV, con $U=\{x_1,\dots,x_n\}$). Este ítem no reemplaza esa prueba general; solo la ilustra en el caso más pequeño posible.

---

## Serie 3 — Integración

**Ítem 15.** $U=\{L1,L2,L3\}$, $activo(x)$.
1. (a) $\forall x\ activo(x)$.
2. (b) Parte III: $activo(L1)\land activo(L2)\land activo(L3)$.
3. (c) Vía De Morgan cuantificacional (Parte IV): $\neg\forall x\ activo(x)\equiv\exists x\ \neg activo(x)$.
4. Verificación cruzada — negar (b) con De Morgan proposicional: $\neg activo(L1)\lor\neg activo(L2)\lor\neg activo(L3)$, que por Parte III aplicada a $\neg activo$ es exactamente $\exists x\ \neg activo(x)$.
5. Conclusión: ambos caminos coinciden.

**Ítem 16.** $P(x)$: $x>5$, dominio $\{5,\dots,9\}$.
1. $\forall x\ P(x)$: falla en $x=5$ ($5>5$ es F) → **F**.
2. $\exists x\ P(x)$: $6>5$ es V → **V**.
3. Combinación $(F,V)$: consistente con la tabla de la Parte II (no es la combinación prohibida $(V,F)$).
4. $\exists!$: testigos $6,7,8,9$ (cuatro) → unicidad falla → $\exists!\ x\ P(x)$ es **F**.

**Ítem 17.** "Todo sensor de temperatura defectuoso genera una alerta falsa".
1. $D(x)$: "x es un sensor de temperatura defectuoso"; $F(x)$: "x genera una alerta falsa". Forma A: $\forall x(D(x)\rightarrow F(x))$.
2. Negar cuantificador (Parte IV): $\exists x\ \neg(D(x)\rightarrow F(x))$.
3. Negar el condicional (Clase 7, $\neg(p\rightarrow q)\equiv p\land\neg q$): $\exists x(D(x)\land\neg F(x))$.
4. Conclusión: "existe un sensor de temperatura defectuoso que no genera una alerta falsa".

**Ítem 18.** $P(x)$: $x^2\leq4$.
1. (a) $x_0=3$: $9\leq4$ es F — contraejemplo válido.
2. (b) Resolver $x^2\leq4\Leftrightarrow -2\leq x\leq2$. Dominio finito: $\{-2,-1,0,1,2\}$.
3. Verificar los cinco: $4,1,0,1,4$, todos $\leq4$ — todos V.
4. Conclusión: (a) $x_0=3$. (b) $P(-2)\land P(-1)\land P(0)\land P(1)\land P(2)$, verdadera.

**Ítem 19 (Depuración).** Tres formalizaciones de "hay un único administrador con acceso root".
1. (A) $\exists x(admin(x)\land root(x))$ — solo existencia, sin la cláusula $\forall y(\dots\rightarrow y=x)$; es el error de confundir $\exists$ con $\exists!$ (Parte I). Incorrecta.
2. (B) Coincide exactamente con la definición de la Parte I.2 aplicada a $P(x)=admin(x)\land root(x)$. Correcta.
3. (C) Es forma A ($\forall x(admin(x)\rightarrow root(x))$): dice "todo administrador tiene root", no exige existencia de ninguno ni habla de unicidad. Incorrecta, y es un error distinto al de (A) — aquí se cambió la estructura completa, no solo se omitió una cláusula.

**Ítem 20 (Construcción de dominios).** No tiene solución única; la respuesta de referencia es: Dominio 1 $=\{2,4,6\}$, $V(x)$="par": los tres cumplen, $\forall$ y $\exists$ ambas V (combinación V,V de la tabla de la Parte II). Dominio 2 $=\{2,3,5\}$, mismo $V$: solo el 2 es par, $\exists$ V (testigo 2), $\forall$ F (falla en 3 y 5) — combinación F,V. Al calificar, aceptar cualquier propuesta del estudiante que efectivamente produzca esas dos combinaciones y las justifique.

**Ítem 21 (Especificación CS).** Sistema de reservas, $\exists!\ x\ reservada(x)$ vs. $\exists x\ reservada(x)$.
1. $\exists!$ garantiza exactamente una sala por franja: existencia (siempre hay asignación) y unicidad (sin conflicto simultáneo).
2. Relajar a $\exists$ permite dos o más salas reservadas a la vez para la misma franja, sin que el sistema distinga cuál es la vigente.
3. Consecuencia operacional concreta: dos equipos podrían presentarse a la misma sala física el día del evento. (Dominio distinto al de P4 de `clase8.md`, que usa administradores de sistema — aquí se usa un sistema de reservas, evitando la repetición señalada por la auditoría de ChatGPT.)

---

## Reto Final — El Pastorcito Mentiroso

**Ítem 22.** $\exists!\ x\ acudio(x)$, tabla con solo $A4$="Sí".
1. Existencia: $acudio(A4)=V$.
2. Unicidad: $acudio(A1)=acudio(A2)=acudio(A3)=acudio(A5)=F$.
3. Conclusión: $\exists!\ x\ acudio(x)$ es **V**, testigo $A4$.

**Ítem 23.** Barrio Alto $=\{A1,A4\}$, Barrio Bajo $=\{A2,A3,A5\}$, mismo predicado $acudio(x)$.
1. Barrio Alto: $acudio(A4)=V$ → $\exists x\ acudio(x)$ es **V** (testigo $A4$).
2. Barrio Bajo: $acudio(A2)=acudio(A3)=acudio(A5)=F$ → $\exists x\ acudio(x)$ es **F** (sin testigo).
3. Conclusión: el predicado y sus valores fijos por aldeano no cambiaron; el universo de cuantificación sí, y eso basta para cambiar el valor de verdad — Parte II.1 aplicada a un caso binario.

**Ítem 24 (Construcción — modificación mínima).** Modificar la tabla del Ítem 22 para que $\exists!\ x\ acudio(x)$ deje de cumplirse.
1. Estado actual: solo $A4$ cumple $acudio(x)$ → $\exists!$ es V.
2. Cambiar cualquier otro aldeano de F a V (p. ej. $A1$) introduce un segundo testigo.
3. Conclusión: existencia se mantiene (sigue habiendo al menos uno), pero unicidad se rompe (ya hay dos) → $\exists!\ x\ acudio(x)$ pasa de V a F. Cualquier aldeano distinto de $A4$ sirve como respuesta válida.

---

*Fin del bloque de verificación. 15 ítems desarrollados en total: Serie 2 (Ítems 10-14, 5 ítems), Serie 3 — Integración (Ítems 15-21, 7 ítems), Reto Final (Ítems 22-24, 3 ítems).*
