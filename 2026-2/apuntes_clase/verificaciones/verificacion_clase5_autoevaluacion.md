# 🔒 Bloque de verificación — clase6_autoevaluacion.md
### Solo para el profesor — NO entregar al estudiante

*Desarrollo completo en formato Afirmación–Razón de los ítems de Serie 2 en adelante (cadenas de 3+ pasos). El archivo del estudiante solo muestra la respuesta final de cada uno. Todos los ítems fueron verificados por evaluación exhaustiva de la tabla de verdad (validez global y validez de cada paso intermedio en los renglones críticos).*

---

## Serie 2

**Ítem 10.** $\ p\rightarrow q,\ q\rightarrow r,\ r\rightarrow s,\ p\ \vdash\ s$

| # | Afirmación | Razón |
|:---:|:---:|:---|
| 1 | $p\rightarrow q$ | Premisa |
| 2 | $q\rightarrow r$ | Premisa |
| 3 | $r\rightarrow s$ | Premisa |
| 4 | $p$ | Premisa |
| 5 | $q$ | Modus Ponens en 1 y 4 |
| 6 | $r$ | Modus Ponens en 2 y 5 |
| 7 | $s$ | Modus Ponens en 3 y 6 |

*(Alternativa: 5' $p\rightarrow r$ Silog. hipotético 1,2; 6' $p\rightarrow s$ Silog. hipotético 5',3; 7' $s$ Modus Ponens 6',4.)*

---

**Ítem 11.** $\ p\lor q,\ p\rightarrow r,\ q\rightarrow s,\ \neg r\ \vdash\ s$

| # | Afirmación | Razón |
|:---:|:---:|:---|
| 1 | $p\lor q$ | Premisa |
| 2 | $p\rightarrow r$ | Premisa |
| 3 | $q\rightarrow s$ | Premisa |
| 4 | $\neg r$ | Premisa |
| 5 | $\neg p$ | Modus Tollens en 2 y 4 |
| 6 | $q$ | Eliminación en 1 y 5 |
| 7 | $s$ | Modus Ponens en 3 y 6 |

---

**Ítem 12.** $\ \neg(p\lor q),\ r\rightarrow p\ \vdash\ \neg r$ *(usa ley de equivalencia)*

| # | Afirmación | Razón |
|:---:|:---:|:---|
| 1 | $\neg(p\lor q)$ | Premisa |
| 2 | $r\rightarrow p$ | Premisa |
| 3 | $\neg p\land\neg q$ | De Morgan en 1 |
| 4 | $\neg p$ | Simplificación en 3 |
| 5 | $\neg r$ | Modus Tollens en 2 y 4 |

---

**Ítem 13.** $\ (p\land q)\rightarrow r,\ \neg r,\ p\ \vdash\ \neg q$

| # | Afirmación | Razón |
|:---:|:---:|:---|
| 1 | $(p\land q)\rightarrow r$ | Premisa |
| 2 | $\neg r$ | Premisa |
| 3 | $p$ | Premisa |
| 4 | $\neg(p\land q)$ | Modus Tollens en 1 y 2 |
| 5 | $\neg p\lor\neg q$ | De Morgan en 4 |
| 6 | $\neg q$ | Eliminación en 5 y 3 (con $p\equiv\neg(\neg p)$) |

*Nota sobre el paso 6:* la Eliminación (silogismo disyuntivo) sobre $\neg p\lor\neg q$ requiere descartar $\neg p$; como se tiene $p$, es decir $\neg(\neg p)$, se descarta el primer disyunto y queda $\neg q$.

---

**Ítem 14.** *(lenguaje natural)* $\ b\rightarrow d,\ \neg d,\ b\lor m,\ m\rightarrow n\ \vdash\ n$

Proposiciones: $b$ = el backup se ejecutó; $d$ = los datos están a salvo; $m$ = se activó el modo solo lectura; $n$ = se notificó al administrador.

| # | Afirmación | Razón |
|:---:|:---:|:---|
| 1 | $b\rightarrow d$ | Premisa |
| 2 | $\neg d$ | Premisa |
| 3 | $b\lor m$ | Premisa |
| 4 | $m\rightarrow n$ | Premisa |
| 5 | $\neg b$ | Modus Tollens en 1 y 2 |
| 6 | $m$ | Eliminación en 3 y 5 |
| 7 | $n$ | Modus Ponens en 4 y 6 |

---

## Serie 3

**Ítem 15.** *(traducción)* $\ s\rightarrow t,\ t\rightarrow a,\ s\ \vdash\ a$

Proposiciones: $s$ = el usuario inicia sesión; $t$ = se crea un token; $a$ = se registra en auditoría.

| # | Afirmación | Razón |
|:---:|:---:|:---|
| 1 | $s\rightarrow t$ | Premisa |
| 2 | $t\rightarrow a$ | Premisa |
| 3 | $s$ | Premisa |
| 4 | $t$ | Modus Ponens en 1 y 3 |
| 5 | $a$ | Modus Ponens en 2 y 4 |

---

**Ítem 16.** *(ley de equivalencia)* $\ \neg p\lor q,\ p\ \vdash\ q$

| # | Afirmación | Razón |
|:---:|:---:|:---|
| 1 | $\neg p\lor q$ | Premisa |
| 2 | $p$ | Premisa |
| 3 | $p\rightarrow q$ | Implicación en 1 |
| 4 | $q$ | Modus Ponens en 3 y 2 |

*(Alternativa sin convertir: Eliminación directa sobre $\neg p\lor q$ descartando $\neg p$ con $p$ → $q$.)*

---

**Ítem 17.** *(tautología ↔ validez)* Argumento $\ p\rightarrow q,\ p\ \vdash\ q$.

Forma condicional: $\bigl[(p\rightarrow q)\land p\bigr]\rightarrow q$.

| $p$ | $q$ | $p\rightarrow q$ | $(p\rightarrow q)\land p$ | $\bigl[(p\rightarrow q)\land p\bigr]\rightarrow q$ |
|:-:|:-:|:-:|:-:|:-:|
| 0 | 0 | 1 | 0 | 1 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |

Columna final toda en 1 → **tautología** → argumento **válido**. Clasificación pedida: tautología.

---

## Reto Final

**Ítem 18.** $\ c\rightarrow g,\ \neg g,\ c\lor o,\ o\rightarrow s,\ s\rightarrow l\ \vdash\ l$

Proposiciones: $c$ = el CDN respondió; $g$ = la página cargó; $o$ = se sirvió desde el origen; $s$ = se registró petición al servidor central; $l$ = aumentó la latencia.

| # | Afirmación | Razón |
|:---:|:---:|:---|
| 1 | $c\rightarrow g$ | Premisa |
| 2 | $\neg g$ | Premisa |
| 3 | $c\lor o$ | Premisa |
| 4 | $o\rightarrow s$ | Premisa |
| 5 | $s\rightarrow l$ | Premisa |
| 6 | $\neg c$ | Modus Tollens en 1 y 2 |
| 7 | $o$ | Eliminación en 3 y 6 |
| 8 | $s$ | Modus Ponens en 4 y 7 |
| 9 | $l$ | Modus Ponens en 5 y 8 |

---

**Ítem 19.** $\ d,\ d\rightarrow v,\ c\lor h,\ h\rightarrow\neg v\ \vdash\ c$

Proposiciones: $d$ = el despliegue se completó; $v$ = la versión nueva quedó activa; $c$ = se limpió la caché; $h$ = falló el healthcheck.

| # | Afirmación | Razón |
|:---:|:---:|:---|
| 1 | $d$ | Premisa |
| 2 | $d\rightarrow v$ | Premisa |
| 3 | $c\lor h$ | Premisa |
| 4 | $h\rightarrow\neg v$ | Premisa |
| 5 | $v$ | Modus Ponens en 2 y 1 |
| 6 | $\neg h$ | Modus Tollens en 4 y 5 (con $v\equiv\neg(\neg v)$) |
| 7 | $c$ | Eliminación en 3 y 6 |

*Nota sobre el paso 6:* Modus Tollens sobre $h\rightarrow\neg v$ requiere la negación del consecuente $\neg v$, es decir $\neg(\neg v)=v$, que se tiene del paso 5. Se concluye $\neg h$.

---

*Fin del bloque de verificación. Todos los ítems: validez global confirmada y cada conclusión intermedia verificada verdadera en todos los renglones críticos.*
