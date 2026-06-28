# Cel: Przebudowa `WereshchaginPanel` na wzór klasycznego zapisu odręcznego (zapis równaniowy / inline)

Użytkownik dostarczył referencyjne zdjęcie odręcznych obliczeń całkowania metodą Wereszczagina (np. dla \delta_22). Zamiast obecnego układu "karta pod kartą" dla każdego pręta, program musi generować jeden spójny, wieloliniowy ciąg matematyczny.

## Wymagany wygląd (Struktura 4-linijkowa dla każdej Delty):

Dla każdej obliczanej wartości (np. \delta_11), panel ma wygenerować kontener układający się w następujące linie:

**Linia 1: Wzór ogólny (Całki)**
- Zapisz ogólny wzór: `\delta_{ij} = (1/EJ) * [ \int M_{zi} M_{zj} ds + (EJ/GC) \int M_{si} M_{sj} ds ]`
- Użyj czcionki szeryfowej (np. `font-serif text-lg`) i odpowiednich tagów `<sub>` dla indeksów. Własność `(EJ/GC)` sformatuj jako ułamek pionowy.

**Linia 2: Równanie graficzne (Wykresy w jednej linii)**
- Linia zaczyna się od znaku `= (1/EJ) [`.
- Następnie, dla każdego pręta, wygeneruj miniaturowe wykresy wplecione w tekst.
- Utwórz nowy, lekki komponent `<InlineDiagram>`, który jest mocno pomniejszony (np. `w-16 h-12`), nie ma tytułów ani siatki – rysuje TYLKO obrys kształtu (trójkąt/prostokąt/parabola) i ewentualnie maksymalną rzędną. 
- Logika: `[WykresMz1] \cdot [WykresMz2] + [WykresMz1] \cdot [WykresMz2] ...`
- Po zsumowaniu wszystkich wykresów Mz zamknij nawias i dodaj człon dla Ms: `... ] + (EJ/GC) * ( [WykresMs1] \cdot [WykresMs2] + ... )`
- **Ważne:** Użyj `flex flex-wrap items-center gap-y-4 gap-x-2`, aby równanie mogło się łamać na kolejne linie, jeśli prętów jest dużo. Do dużych nawiasów kwadratowych użyj po prostu stylizacji CSS (np. `text-4xl font-light`).

**Linia 3: Równanie liczbowe (Podstawienie wzorów figur)**
- Linia zaczyna się od znaku `= (1/EJ) [`.
- W miejsce `[Wykres] * [Wykres]` z poprzedniej linii, wstaw odpowiadające im liczby z wzoru (np. pole * rzędna). 
- Ułamek (np. 1/3, 1/6) sformatuj jako pionowy element HTML. Przykład: `<span className="inline-flex flex-col text-center align-middle mx-1 text-sm"><span className="border-b border-current pb-px">1</span><span className="pt-px">3</span></span>`.
- Liczby ujemne MUSZĄ być w nawiasach: `(-4.00)`.
- Zapisz to z użyciem kropki `\cdot` i odpowiednich spacji wokół operatorów.

**Linia 4: Ostateczny wynik**
- `= (1/EJ) [ <suma_dla_Mz> ] + <suma_dla_Ms> = <Wynik_Końcowy> / EJ`.
- Wynik końcowy ma być wyraźnie pogrubiony.

## Instrukcje techniczne dla `WereshchaginPanel`:
1. Zmień główną pętlę renderującą: zamiast mapować po `results.details.segments` tworząc osobne karty, najpierw zmapuj segmenty aby zebrać wszystkie pary graficzne dla $M_z$, a potem wszystkie pary dla $M_s$.
2. Używaj wszędzie czcionki o kroju matematycznym (`font-serif` lub klasyczny font matematyczny, jeśli dostępny).
3. Upewnij się, że element `<InlineDiagram>` używa minimalnej ilości SVG, `display: inline-block` oraz skaluje się odpowiednio do reszty tekstu (wyrównanie w pionie za pomocą `align-middle` we flexboxie).