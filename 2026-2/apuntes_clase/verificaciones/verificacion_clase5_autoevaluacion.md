# 🔒 Bloque de verificación — clase5_autoevaluacion.md
### Solo para el profesor — NO entregar al estudiante

*Desarrollo completo en formato Afirmación–Razón de los ítems de Serie 2 en adelante (cadenas de 3+ leyes). El archivo del estudiante solo muestra la respuesta final de cada uno.*

---

## Serie 2

**Ítem 10.** $\neg(a\rightarrow b)\lor b$

| # | Afirmación | Razón |
|:---:|:---:|---|
| 1 | $\neg(a\rightarrow b)\lor b$ | Hipótesis |
| 2 | $(a\land\neg b)\lor b$ | Negación del condicional en (1) |
| 3 | $b\lor(a\land\neg b)$ | Conmutatividad del $\lor$ en (2) |
| 4 | $(b\lor a)\land(b\lor\neg b)$ | Distributividad del $\lor$ sobre el $\land$ en (3) |
| 5 | $(b\lor a)\land V$ | Complemento del $\lor$ en (4) |
| 6 | $b\lor a$ | Identidad del $\land$ en (5) |
| 7 | $a\lor b$ | Conmutatividad del $\lor$ en (6) |

$$\therefore\; \neg(a\rightarrow b)\lor b \equiv a\lor b$$

---

**Ítem 11.** $\neg(e\lor f)\lor e$

| # | Afirmación | Razón |
|:---:|:---:|---|
| 1 | $\neg(e\lor f)\lor e$ | Hipótesis |
| 2 | $(\neg e\land\neg f)\lor e$ | De Morgan para el $\lor$ en (1) |
| 3 | $e\lor(\neg e\land\neg f)$ | Conmutatividad del $\lor$ en (2) |
| 4 | $(e\lor\neg e)\land(e\lor\neg f)$ | Distributividad del $\lor$ sobre el $\land$ en (3) |
| 5 | $V\land(e\lor\neg f)$ | Complemento del $\lor$ en (4) |
| 6 | $e\lor\neg f$ | Identidad del $\land$ en (5) |

$$\therefore\; \neg(e\lor f)\lor e \equiv e\lor\neg f$$

---

**Ítem 12.** $(g\land\neg h)\rightarrow h \;\equiv\; g\rightarrow h$

| # | Afirmación | Razón |
|:---:|:---:|---|
| 1 | $(g\land\neg h)\rightarrow h$ | Hipótesis |
| 2 | $\neg(g\land\neg h)\lor h$ | Implicación en (1) |
| 3 | $(\neg g\lor h)\lor h$ | De Morgan y doble negación en (2) |
| 4 | $\neg g\lor(h\lor h)$ | Asociatividad en (3) |
| 5 | $\neg g\lor h$ | Idempotencia del $\lor$ en (4) |
| 6 | $g\rightarrow h$ | Implicación (sentido inverso) en (5) |

$$\therefore\; (g\land\neg h)\rightarrow h \equiv g\rightarrow h$$

---

**Ítem 13.** $(i\land j)\rightarrow i$

| # | Afirmación | Razón |
|:---:|:---:|---|
| 1 | $(i\land j)\rightarrow i$ | Hipótesis |
| 2 | $\neg(i\land j)\lor i$ | Implicación en (1) |
| 3 | $(\neg i\lor\neg j)\lor i$ | De Morgan en (2) |
| 4 | $(\neg i\lor i)\lor\neg j$ | Conmutatividad y Asociatividad en (3) |
| 5 | $V\lor\neg j$ | Complemento del $\lor$ en (4) |
| 6 | $V$ | Dominación del $\lor$ en (5) |

$$\therefore\;(i\land j)\rightarrow i \equiv V \quad\text{(tautología)}$$

---

**Ítem 14.** $\bigl[(k\rightarrow l)\land(l\rightarrow m)\bigr]\rightarrow(k\rightarrow m)$ — Silogismo Hipotético

| # | Afirmación | Razón |
|:---:|:---:|---|
| 1 | $[(k\to l)\land(l\to m)]\to(k\to m)$ | Hipótesis |
| 2 | $\neg[(k\to l)\land(l\to m)] \lor (k\to m)$ | Implicación en (1) |
| 3 | $\neg[(k\to l)\land(l\to m)] \lor (\neg k\lor m)$ | Implicación en (2), aplicada a $k\to m$ |
| 4 | $[\neg(k\to l)\lor\neg(l\to m)] \lor (\neg k\lor m)$ | De Morgan en (3) |
| 5 | $[(k\land\neg l)\lor(l\land\neg m)] \lor (\neg k\lor m)$ | Negación del condicional (dos veces) en (4) |
| 6 | $(k\land\neg l)\lor(l\land\neg m)\lor\neg k\lor m$ | Asociatividad en (5) |
| 7 | $[(k\land\neg l)\lor\neg k] \lor [(l\land\neg m)\lor m]$ | Conmutatividad y Asociatividad en (6) |
| 8 | $(\neg k\lor\neg l) \lor (m\lor l)$ | Distributividad, Complemento e Identidad en cada paréntesis de (7) |
| 9 | $\neg k\lor m\lor(\neg l\lor l)$ | Conmutatividad y Asociatividad en (8) |
| 10 | $\neg k\lor m\lor V$ | Complemento del $\lor$ en (9) |
| 11 | $V$ | Dominación del $\lor$ en (10) |

$$\therefore\;\bigl[(k\to l)\land(l\to m)\bigr]\to(k\to m) \equiv V \quad\text{(tautología)}$$

---

## Serie 3

**Ítem 15(c).** $\neg(p\rightarrow q)$

| # | Afirmación | Razón |
|:---:|:---:|---|
| 1 | $\neg(p\rightarrow q)$ | Hipótesis |
| 2 | $\neg(\neg p\lor q)$ | Implicación en (1) |
| 3 | $\neg(\neg p)\land\neg q$ | De Morgan en (2) |
| 4 | $p\land\neg q$ | Doble negación en (3) |

$$\therefore\;\neg(p\rightarrow q)\equiv p\land\neg q$$

---

**Ítem 16.** $\neg r\lor(r\land s)$

| # | Afirmación | Razón |
|:---:|:---:|---|
| 1 | $\neg r\lor(r\land s)$ | Hipótesis |
| 2 | $(\neg r\lor r)\land(\neg r\lor s)$ | Distributividad del $\lor$ sobre el $\land$ en (1) |
| 3 | $V\land(\neg r\lor s)$ | Complemento del $\lor$ en (2) |
| 4 | $\neg r\lor s$ | Identidad del $\land$ en (3) |

$$\therefore\;\neg r\lor(r\land s)\equiv\neg r\lor s \quad\text{(contingencia)}$$

Verificación por tabla de verdad (Protocolo de 6 pasos, clase3.md):

| $r$ | $s$ | $r\land s$ | $\neg r\lor(r\land s)$ | $\neg r\lor s$ |
|:---:|:---:|:---:|:---:|:---:|
| 1 | 1 | 1 | 1 | 1 |
| 1 | 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 1 | 1 |
| 0 | 0 | 0 | 1 | 1 |

Columnas idénticas en las 4 filas; columna mixta $V/F$ → contingencia confirmada.

---

**Ítem 17.** Traducción: $(w\lor x)\rightarrow\neg t$

| # | Afirmación | Razón |
|:---:|:---:|---|
| 1 | $(w\lor x)\rightarrow\neg t$ | Hipótesis (traducción) |
| 2 | $\neg(w\lor x)\lor\neg t$ | Implicación en (1) |
| 3 | $(\neg w\land\neg x)\lor\neg t$ | De Morgan en (2) |

$$\therefore\;(w\lor x)\rightarrow\neg t \equiv (\neg w\land\neg x)\lor\neg t$$

---

## Reto Final

**Ítem 18.** A dice: "B es un bribón, o yo soy un bribón." → $a\leftrightarrow(\neg b\lor\neg a)$

| # | Afirmación | Razón |
|:---:|:---:|---|
| 1 | $a\leftrightarrow(\neg b\lor\neg a)$ | Hipótesis |
| 2 | $[a\to(\neg b\lor\neg a)] \land [(\neg b\lor\neg a)\to a]$ | Equivalencia en (1) |

Rama izquierda:

| # | Afirmación | Razón |
|:---:|:---:|---|
| 3a.1 | $\neg a\lor(\neg b\lor\neg a)$ | Implicación |
| 3a.2 | $\neg a\lor\neg a\lor\neg b$ | Conmutatividad y Asociatividad |
| 3a.3 | $\neg a\lor\neg b$ | Idempotencia del $\lor$ |

Rama derecha:

| # | Afirmación | Razón |
|:---:|:---:|---|
| 3b.1 | $\neg(\neg b\lor\neg a)\lor a$ | Implicación |
| 3b.2 | $(b\land a)\lor a$ | De Morgan y doble negación |
| 3b.3 | $a\lor(a\land b)$ | Conmutatividad |
| 3b.4 | $a$ | Absorción |

Combinando:

| # | Afirmación | Razón |
|:---:|:---:|---|
| 4 | $(\neg a\lor\neg b)\land a$ | Combinando (3a.3) y (3b.4) en (2) |
| 5 | $a\land(\neg a\lor\neg b)$ | Conmutatividad del $\land$ en (4) |
| 6 | $(a\land\neg a)\lor(a\land\neg b)$ | Distributividad del $\land$ sobre el $\lor$ en (5) |
| 7 | $F\lor(a\land\neg b)$ | Complemento del $\land$ en (6) |
| 8 | $a\land\neg b$ | Identidad del $\lor$ en (7) |

$$\therefore\; a\leftrightarrow(\neg b\lor\neg a) \equiv a\land\neg b$$

Verificación por casos (4 combinaciones de $a,b$): solo $a=1,b=0$ es consistente con que A (caballero) diga la verdad y B sea bribón; los otros tres casos producen contradicción entre lo que la declaración evalúa y lo que el estatus de A exige.

---

**Ítem 19.** C dice: "Yo soy un bribón." → $c\leftrightarrow\neg c$

| # | Afirmación | Razón |
|:---:|:---:|---|
| 1 | $c\leftrightarrow\neg c$ | Hipótesis |
| 2 | $(c\to\neg c)\land(\neg c\to c)$ | Equivalencia en (1) |
| 3a | $\neg c\lor\neg c \equiv \neg c$ | Implicación e Idempotencia (rama $c\to\neg c$) |
| 3b | $c\lor c \equiv c$ | Implicación, doble negación e Idempotencia (rama $\neg c\to c$) |
| 4 | $\neg c\land c$ | Combinando (3a) y (3b) en (2) |
| 5 | $F$ | Complemento del $\land$ en (4) |

$$\therefore\; c\leftrightarrow\neg c \equiv F \quad\text{(contradicción — sin solución posible)}$$

