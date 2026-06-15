# Zadanie dla Claude Code: analizator belek (zakładka „Belki") — reakcje + siły wewnętrzne N, T, M

## Kontekst
W tym repo `index.html` to powłoka z zakładkami (ciemny motyw), ładująca kalkulatory w iframe.
Działają: `solver-rusztow.html`, `plyty-okragle.html` (+ ewentualnie `reakcje.html`).
Zakładka „Belki" jest na razie placeholderem „w przygotowaniu" w configu TABS w `index.html`.
Hosting: Cloudflare Workers, auto-deploy po `git push` do main.

W folderze repo znajduje się też plik `belka1.pdf` — kompletnie rozwiązany przykład
(belka Gerbera). **Przeczytaj go** — zawiera geometrię (do odczytania z równań równowagi),
obciążenia, siły wewnętrzne, ekstremum momentu i wykresy oraz gotowe odpowiedzi liczbowe.
Posłuży jako wzorzec i jako test poprawności.

## Zadanie
Zbuduj ogólny **analizator belek płaskich statycznie wyznaczalnych** jako nowy plik
`belki.html` i podłącz go pod zakładkę „Belki" w `index.html` (zamień placeholder na iframe
wskazujący `belki.html`).

## Zakres
Użytkownik definiuje belkę:
- Długość `L` [m]; oś `x` od lewego końca.
- Podpory (pozycja + typ): przesuwna (V), przegubowa/stała (V, H), utwierdzenie (V, H, M).
- Przeguby wewnętrzne (belka Gerbera): pozycje przegubów, każdy daje dodatkowy warunek
  (moment zginający = 0 w przegubie).
- Obciążenia:
  - siła skupiona o wartości i **kącie** względem poziomu (obsługa sił ukośnych → składowe
    pozioma i pionowa, stąd siła normalna N),
  - obciążenie równomierne `q` [kN/m] na odcinku `[x1, x2]`,
  - moment skupiony `M` [kN·m] w punkcie.

Obliczenia:
- Sprawdź statyczną wyznaczalność (równania równowagi + warunki przegubowe). Jeśli układ jest
  niewyznaczalny lub geometrycznie zmienny — czytelny komunikat zamiast błędnego wyniku.
- Wyznacz reakcje.
- Wyznacz przebiegi sił wewnętrznych: siła normalna N(x), siła tnąca T(x), moment zginający M(x)
  — funkcje przedziałami; znajdź ekstrema momentu (tam gdzie T = 0).

Wyniki:
- Wartości reakcji (V, H, M wg typu podpory), ze znakiem i jednostkami.
- Wykresy N, T, M (SVG, czytelnie, polskie konwencje znaków: moment dodatni rozciąga włókna dolne).
- Charakterystyczne wartości na wykresach i położenie/ wartość ekstremum momentu.

## Test poprawności (z `belka1.pdf`)
Po zbudowaniu zakoduj przykład z PDF jako wbudowany „Przykład" i **sprawdź, że narzędzie
odtwarza** (z tolerancją ~0,01):
- R_A = 17,002 kN
- R_B = 15,328 kN
- H_E = 5 kN
- V_E = 4,330 kN
- M_E = −2,010 kN·m
- ekstremum momentu: M = 1,065 kN·m przy x₀ = 2,125 m
- przebiegi N, T, M zgodne z wykresami w PDF (m.in. charakterystyczne wartości T: 9,002 /
  −8 / −10,998 / 4,330; M: 4 / 6,495 / 4,330 / 8,505 / 2,010; N = 5 na odcinku od siły 10 kN do E).

Jeśli wyniki się nie zgadzają — popraw solver, aż będą. To jest najważniejsze kryterium.

## Przykłady do wczytania ("Przykłady")
Zgodnie z konwencją projektu: lista/przyciski „Przykłady", domyślnie wczytany pierwszy
(żeby nie było pustego startu). Dodaj co najmniej:
- przykład z `belka1.pdf` (belka Gerbera),
- belka wolnopodparta + siła skupiona,
- belka wolnopodparta + obciążenie równomierne,
- wspornik + siła na końcu.

## Styl i technologia
Czysty, „inżynierski", dobrze wyglądający w ciemnej powłoce w iframe. Samodzielny plik,
vanilla JS + SVG (bez kroku budowania, jak `plyty-okragle.html`).

## Na koniec
Najpierw pokaż mi PLAN podejścia (jak rozwiążesz układ z przegubami i jak policzysz N/T/M),
ZANIM zaczniesz pisać dużo kodu. Potem buduj i waliduj względem `belka1.pdf`. Na końcu commit
i push. Nie commituj plików `belka1.pdf` ani `zadanie-belki-analizator.md` (to materiały robocze).
