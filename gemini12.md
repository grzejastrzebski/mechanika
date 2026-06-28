# Cel: Dopracowanie komponentu `<InlineDiagram>` oraz usunięcie nadmiarowych zer

Użytkownik jest bardzo zadowolony z zapisu równaniowego, ale zgłasza dwie proste poprawki kosmetyczne:
1. Figury typu trapez pokazują tylko jedną wartość (rzędną) na wykresie. Powinny pokazywać obie (lewą i prawą).
2. W liczbach pojawia się mnóstwo niepotrzebnych zer po przecinku (np. `4.00`, `-8.00`, `640.0000`), co zmniejsza czytelność.

## Zadania do zaimplementowania:

### 1. Usunięcie nadmiarowych zer (Formatowanie)
- Zlokalizuj funkcję `fmt(x, d=2)` w kodzie.
- Zmień logikę zwracania wyniku. Zamiast surowego `x.toFixed(d)`, użyj funkcji ucinającej zera, np.: `return parseFloat(x.toFixed(d)).toString();` lub `return Number(x.toFixed(d)).toString();`.
- Dzięki temu `4.00` zamieni się na `4`, `4.50` na `4.5`, a `4.3333` na `4.3333`.

### 2. Dwie rzędne w `<InlineDiagram>`
- Upewnij się, że komponent `<InlineDiagram>` przyjmuje obie wartości brzegowe (`M1` i `M2`, albo `a` i `b`).
- Dodaj warunek rysowania tekstu: jeśli figura to trapez (albo po prostu jeśli po obu stronach rzędne są niezerowe), wygeneruj DWA tagi `<text>` z wartościami.
- Pierwszy tekst umieść po lewej stronie (np. `x={pad}`, `textAnchor="start"` lub `middle`), a drugi po prawej stronie (np. `x={w-pad}`, `textAnchor="end"` lub `middle`).
- Upewnij się, że odpowiednio sprawdzasz znaki obu wartości, aby tekst dla wartości dodatnich rysował się nad figurą (`dy="-5"`), a dla ujemnych pod figurą.