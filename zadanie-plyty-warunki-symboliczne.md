# Zadanie dla Claude Code: warunki brzegowe symbolicznie (tryb symboliczny, płyty)

## Kontekst
W tym repo `plyty-okragle.html` to kalkulator płyt okrągłych. Niedawno dodano **TRYB
SYMBOLICZNY**: wymiary jako wielokrotności `R`, obciążenia jako wielokrotności `q`, a wyniki
w postaci współczynnik · `qR⁴/D`, · `qR²`, · `qR`. Przeczytaj plik, żeby zobaczyć, jak to
jest zrobione.

## Zadanie
W trybie symbolicznym rozszerz tę notację także na sekcję **WARUNKÓW BRZEGOWYCH** — to, co
w wyświetlanym rozwiązaniu pojawia się jako **punkt 3**. Obecnie warunki brzegowe są tam
zapisywane liczbowo; zmień to tak, żeby były zapisane symbolicznie, spójnie z resztą trybu
symbolicznego:

- promienie / wymiary jako wielokrotności `R` (np. `r = 4R`),
- obciążenia jako wielokrotności `q` (np. `8q`),
- ewentualne obciążenia brzegowe (moment `M`, siła `P` na brzegu) w spójnej grupie symbolicznej
  (moment ~ `·qR²`, siła ~ `·qR`), jeśli w danym zadaniu występują.

## Wskazówki
- Znajdź w pliku sekcję, która wypisuje warunki brzegowe (krok 3 / „warunki brzegowe"),
  i zadbaj, żeby w trybie symbolicznym używała tej samej notacji `R`, `q`, co pola wejściowe
  i wyniki — bez surowych liczb.
- Tryb liczbowy zostaw **bez zmian** — tam warunki brzegowe nadal liczbowo.
- Zachowaj spójność z istniejącym formatowaniem wyników symbolicznych.

## Na koniec
Najpierw pokaż mi podgląd, jak będzie wyglądać ta sekcja w trybie symbolicznym, ZANIM zrobisz
commit i push. Tego pliku (`zadanie-plyty-warunki-symboliczne.md`) nie commituj.
