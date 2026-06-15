# Zadanie dla Claude Code: kalkulator reakcji w belkach (zakładka „Reakcje")

## Kontekst
W tym repo `index.html` to powłoka z zakładkami (ciemny motyw), ładująca kalkulatory w iframe.
Działają już: `solver-rusztow.html`, `plyty-okragle.html`. Zakładka „Reakcje" jest na razie
placeholderem „w przygotowaniu" w configu TABS w `index.html`. Hosting: Cloudflare Workers,
auto-deploy po `git push` do main.

## Zadanie
Zbuduj kalkulator REAKCJI PODPOROWYCH dla belek jako nowy plik `reakcje.html` i podłącz go pod
zakładkę „Reakcje" w `index.html` (zamień placeholder na iframe wskazujący `reakcje.html`).

## Zakres (belki statycznie wyznaczalne)
Użytkownik definiuje belkę:
- Długość `L` [m].
- Podpory (pozycja `x` + typ):
  - przesuwna (roller) → 1 reakcja pionowa `V`,
  - stała / przegubowa (pin) → 2 reakcje: `V` i `H`,
  - utwierdzenie (fixed) → 3 reakcje: `V`, `H`, `M`.
- Obciążenia (typ, wartość, pozycja):
  - siła skupiona `P` [kN] (domyślnie pionowa; opcjonalnie składowa pozioma) w punkcie `x`,
  - obciążenie równomierne `q` [kN/m] na odcinku `[x1, x2]`,
  - moment skupiony `M` [kN·m] w punkcie `x`.

Obliczenia:
- Rozwiąż równania równowagi: `ΣFx = 0`, `ΣFy = 0`, `ΣM = 0`, wyznaczając reakcje.
- Sprawdź statyczną wyznaczalność: jeśli liczba niewiadomych reakcji ≠ 3 (układ
  przesztywniony albo mechanizm), pokaż czytelny komunikat zamiast liczyć błędnie.

Wyniki:
- Wartości reakcji w każdej podporze (`V`, `H`, `M` wg typu), ze znakiem i jednostkami
  (kN, kN·m).
- Pokaż użyte równania równowagi z podstawionymi wartościami — walor dydaktyczny, student
  widzi „jak" powstał wynik.
- Narysuj prosty schemat belki: podpory, obciążenia i wyznaczone reakcje (strzałki), SVG,
  czytelnie.

## Przykłady do wczytania ("Przykłady")
Zgodnie z konwencją projektu: u góry przyciski/lista „Przykłady"; po wejściu na stronę
domyślnie wczytaj **Przykład 1** (już policzony), żeby nie było pustego startu.
Zaimplementuj te 6:

1. Wolnopodparta, L=6 m: przegub w x=0, przesuwna w x=6; siła P=10 kN (w dół) w x=3.
2. Wolnopodparta, L=6 m: przegub w x=0, przesuwna w x=6; q=5 kN/m na [0, 6].
3. Wolnopodparta, L=8 m: przegub w x=0, przesuwna w x=8; siła P=12 kN (w dół) w x=2.
4. Wspornik, L=4 m: utwierdzenie w x=0; siła P=8 kN (w dół) na końcu w x=4.
5. Belka z przewieszeniem, L=8 m: przegub w x=0, przesuwna w x=6; q=4 kN/m na [0, 8].
6. Wolnopodparta, L=6 m: przegub w x=0, przesuwna w x=6; moment skupiony M=15 kN·m w x=3.

## Styl i technologia
Czysty, „inżynierski"; ma dobrze wyglądać w ciemnej powłoce w iframe. Samodzielny plik,
vanilla JS + SVG (bez kroku budowania, jak `plyty-okragle.html`).

Jeśli istnieje `CLAUDE.md`, dopisz krótko ten moduł; jeśli nie — możesz go pominąć.

## Na koniec
Najpierw pokaż mi plan i podgląd, ZANIM zrobisz commit i push. Tego pliku
(`zadanie-reakcje-belki.md`) nie commituj.
