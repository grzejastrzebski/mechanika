# Zadanie dla Claude Code: tryb symboliczny (R, q) w kalkulatorze płyt okrągłych

## Kontekst
W tym repo `plyty-okragle.html` to kalkulator osiowo-symetrycznych płyt kołowych
(tryby: płyta pełna, pierścień, płyta pełna + pierścień). Ma już opcję symbolicznego D.
Przeczytaj plik, żeby zobaczyć pola wejściowe i format wyników.

## Zadanie
Dodaj **TRYB SYMBOLICZNY**, w którym wymiary podaje się jako wielokrotności promienia `R`,
a obciążenia jako wielokrotności `q` (np. promień `5R`, obciążenie `8q`). Wyniki mają wychodzić
symbolicznie, jako **współczynnik × grupa**:

- ugięcie `w`:               współczynnik · `qR⁴/D`     (zawiera 1/D)
- kąt obrotu `φ` (jeśli jest): współczynnik · `qR³/D`   (zawiera 1/D)
- momenty `M_r`, `M_t`:      współczynnik · `qR²`        (BEZ D — moment nie zależy od D)
- siła poprzeczna `Q`:       współczynnik · `qR`         (BEZ D)

## Jak to policzyć bez biblioteki CAS — skalowanie
Równanie płyty jest liniowe względem `q` i `1/D`, a wielkości skalują się z potęgą długości.
Wszystkie wymiary są wielokrotnościami `R`, więc:

1. Policz wewnętrznie przyjmując `R = 1`, `q = 1`, `D = 1` (geometria zachowuje proporcje:
   `5R → 5`).
2. Otrzymane liczby to wprost współczynniki:
   - `w_num → w = w_num · qR⁴/D`
   - `M_num → M = M_num · qR²`
   - `Q_num → Q = Q_num · qR`

**WAŻNE:** nie dziel momentów ani siły poprzecznej przez `D` — tylko ugięcie i kąt obrotu
mają `1/D`.

## Wymagania
- Dodaj przełącznik: „liczbowy" (jak dotąd) / „symboliczny (R, q)".
- W trybie symbolicznym pola wymiarów przyjmują wielokrotność `R` (wpis „5" = 5R; akceptuj też
  zapis „5R"), a pola obciążeń wielokrotność `q` (wpis „8" = 8q; akceptuj „8q"). Obsłuż oba
  zapisy.
- Różne obciążenia w obszarach (np. `q1 = 8q`, `q2 = 3q`) to nadal wielokrotności tego samego
  `q` — skalowanie działa.
- Tryb liczbowy zostaw bez zmian; zachowaj spójność z istniejącym symbolicznym D.
- Wykresy zostaw; w trybie symbolicznym opisz oś wartości odpowiednią grupą
  (`qR⁴/D`, `qR²`, `qR`).
- Dodaj 1–2 przykłady w trybie symbolicznym do listy „Przykłady".

## Na koniec
Najpierw pokaż mi plan i podgląd zmian, ZANIM zrobisz commit i push. Tego pliku
(`zadanie-plyty-tryb-symboliczny.md`) nie commituj.
