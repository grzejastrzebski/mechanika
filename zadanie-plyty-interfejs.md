# Zadanie dla Claude Code: przebudowa interfejsu kalkulatora płyt (kompaktowy układ z zakładkami)

## Kontekst
`plyty-okragle.html` — kalkulator płyt okrągłych. Przeczytaj plik. To zadanie zmienia **TYLKO
układ/interfejs (UX), NIE logikę obliczeń**. Wszystko, co liczy (tryb liczbowy i symboliczny,
warunki brzegowe, „Przykłady", wyniki), ma działać dokładnie tak jak teraz.

## Cel
Interfejs ma być bardziej **zwarty** i czytelny, tak żeby od razu było widać, co się zmienia przy
klikaniu. Układ **dwukolumnowy**:

### Lewa kolumna — panel wejściowy z zakładkami
Pogrupuj istniejące pola w trzy zakładki:
- **„Schemat"** — rodzaj układu (płyta pełna / pierścień / pełna + pierścień), wymiary i promienie,
  warunki brzegowe (podparcie brzegów).
- **„Obciążenia"** — obciążenia `q` (w poszczególnych obszarach) oraz ewentualne obciążenia
  brzegowe (moment `M`, siła `P`).
- **„Współczynniki"** — `ν` (Poisson), `D` (liczbowo/symbolicznie), przełącznik trybu
  symbolicznego (R, q).

Poza zakładkami, **zawsze widoczne**: lista „Przykłady" oraz przycisk OBLICZ.

### Prawa kolumna — rysunek (mniejszy) + wyniki
- Rysunek (schemat płyty + wykresy) zrób **mniejszy**, żeby nie dominował i mieścił się wygodnie
  obok lewej kolumny.
- Wyniki / wartości liczbowe pokaż w pobliżu rysunku.

## Podgląd na żywo
Rysunek **schematu** ma odświeżać się od razu przy zmianie wejścia (zmiana typu podparcia,
promienia, obciążenia), żeby natychmiast było widać efekt klikania. Pełne obliczenie wyników
może zostawać na przycisku OBLICZ (albo też na żywo, jeśli to wygodne i szybkie).

## Zasady
- To **refaktor układu, nie logiki** — żadnych zmian w obliczeniach ani w wynikach.
- Zachowaj obecny styl/wygląd (jasny, „akademicki") — chodzi o ciaśniejsze rozmieszczenie
  i zakładki, a nie o nowy motyw. Zmniejsz odstępy / padding, żeby było zwięźle.
- Ma dobrze wyglądać w iframe w ciemnej powłoce strony **oraz na telefonie** (na wąskim ekranie
  kolumny i zakładki niech układają się jedna pod drugą).
- Zachowaj „Przykłady" oraz tryb symboliczny.

## Na koniec
Najpierw pokaż mi podgląd nowego układu (opis rozmieszczenia albo zrzut), ZANIM zrobisz commit
i push. Tego pliku (`zadanie-plyty-interfejs.md`) nie commituj.
