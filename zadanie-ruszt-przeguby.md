# Zadanie dla Claude Code: solver rusztów — przeguby (zwolnienia więzów wewnętrznych)

## Kontekst
`solver-rusztow.html` — solver rusztów płaskich (React), metoda sił. Przeczytaj plik i zobacz, jak
reprezentowane są węzły, pręty i połączenia oraz jak składany jest układ do rozwiązania. To
zadanie dodaje **PRZEGUBY** (zwolnienia ciągłości sił wewnętrznych w połączeniach) — to zmiana
w modelu i obliczeniach, więc traktuj ostrożnie.

## Co to są przeguby w ruszcie
W ruszcie istotne siły wewnętrzne to **moment gnący `Mg`** i **moment skrętny `Ms`**. Przegub
w połączeniu zwalnia ciągłość jednej z tych składowych:
- **przegub momentowy (giętny)** — zwalnia moment gnący (`Mg = 0` w tym punkcie); strony mogą się
  niezależnie obracać w zginaniu,
- **przegub skrętny** — zwalnia moment skrętny (`Ms = 0`),
- ewentualnie pełne zwolnienie (oba).

## Cel
1. Pozwól użytkownikowi **wstawić przegub** w węźle / na końcu pręta i **wybrać, co zwalnia**
   (`Mg`, `Ms`, lub oba). Pokaż go symbolem na schemacie.
2. Solver ma to poprawnie uwzględnić: zwolniona składowa = 0 w tym miejscu.
3. Przeguby wpływają na **stopień niewyznaczalności** — każde niezależne zwolnienie zmniejsza `n`
   o 1. Zadbaj, żeby liczenie `n` i etap stanów uwzględniały przeguby (integracja z funkcją
   niewyznaczalności / stanów).

## Jak podejść (propozycja)
- Najpierw odczytaj, jak solver składa układ i jak liczy `n` — i zaproponuj, gdzie wpiąć
  zwolnienia. (W metodzie sił przegub to dodatkowy warunek `M = 0`; w ujęciu macierzowym to
  zwolnienie na końcu pręta / kondensacja danej składowej.) Wybierz podejście **spójne
  z istniejącym kodem**.
- Reprezentacja danych: przegub jako atrybut połączenia / końca pręta, z flagą, co zwalnia.
- **Pilnuj geometrycznej niezmienności** — zbyt wiele zwolnień może zrobić mechanizm; jeśli układ
  staje się geometrycznie zmienny, pokaż czytelny komunikat zamiast liczyć błędnie.

## Zasady
- **Nie psuj** obliczeń dla układów bez przegubów (mają dawać to samo, co teraz).
- Zweryfikuj na prostym przykładzie z jednym przegubem (gdzie znasz wynik) — sprawdź, że `n`
  spada i że zwolniona składowa (`Mg` lub `Ms`) jest zerowa w przegubie.
- Symbol przegubu jako SVG, spójny z resztą rysunku; działanie w iframe i na telefonie.

## Na koniec
To zmiana w modelu — **NAJPIERW pokaż mi PLAN**: jak reprezentujesz przegub, gdzie wpinasz
zwolnienie w obliczeniach, jak wpływa na `n` i jak wykrywasz mechanizm. Dopiero po akceptacji
pisz kod. Na końcu commit + push. Tego pliku nie commituj.
