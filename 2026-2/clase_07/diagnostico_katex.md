# Diagnóstico — fallo de renderizado $x$ dentro de cursiva/comillas

Suba este archivo tal cual al repositorio (o pegue esta tabla temporalmente al final de `clase7.md`), revíselo en GitHub, y cuénteme **cuáles filas se ven bien y cuáles mal**. Con eso identificamos la variable exacta que rompe el renderizado.

| # | Variante | Código fuente (para que compare con lo que ve) |
|---:|---|---|
| 1 | *"$x$ es cerveza"* | `*"$x$ es cerveza"*` |
| 2 | "$x$ es cerveza" | `"$x$ es cerveza"` (comillas, sin cursiva) |
| 3 | *$x$ es cerveza* | `*$x$ es cerveza*` (cursiva, sin comillas) |
| 4 | $x$ es cerveza | `$x$ es cerveza` (ni cursiva ni comillas) |
| 5 | *" $x$ es cerveza "* | `*" $x$ es cerveza "*` (cursiva y comillas, con espacio a ambos lados del $) |
| 6 | *"algo $x$ algo"* | `*"algo $x$ algo"*` (cursiva y comillas, pero el $ ya no toca ninguna de las dos) |

**Lo que cada fila prueba:**
- Fila 1 = el patrón roto tal como está en el documento (control).
- Fila 2 vs. 1 = ¿la cursiva es la culpable?
- Fila 3 vs. 1 = ¿las comillas son la culpable?
- Fila 4 = ¿el `$x$` solo, sin nada alrededor, funciona? (debería funcionar — ya lo confirmamos con `$C(x)$`, `$T(y)$`, etc.)
- Fila 5 = ¿basta con separar el `$` de la comilla con un espacio, incluso dejando la cursiva?
- Fila 6 = ¿basta con que el `$` no toque directamente ni la comilla ni el asterisco, sin importar qué tan cerca estén?
