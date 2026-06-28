# Cel: Dodanie dedykowanego widoku do druku (Raport Egzaminacyjny)

Użytkownik chce, aby po kliknięciu "Drukuj" (lub wywołaniu `window.print()`) aplikacja generowała czysty, akademicki raport z obliczeń zamiast drukować aktualny interfejs użytkownika (który ma tła, przyciski i ukryte zakładki).

Raport ma być sformatowany na białym tle, z czarnymi/ciemnymi czcionkami, przygotowany pod format A4 i ułożony w ściśle określonej kolejności, odwzorowującej ręczne rozwiązywanie zadania z mechaniki budowli.

## Wymagane zmiany w `solver-rusztow.html`:

1. **Zarządzanie widocznością (Media Queries):**
   - Owiń główny, obecny interfejs aplikacji (header, kontenery, panele) w `<div className="print:hidden">`.
   - Na samym dole wewnątrz głównego kontenera aplikacji dodaj nowy komponent `<PrintReport />`, który będzie renderowany tylko, jeśli `results` istnieją, i owiń go w `<div className="hidden print:block bg-white text-slate-900">`.

2. **Komponent `<PrintReport />` - zawartość i kolejność:**
   Komponent ten musi przyjmować niezbędne dane (nodes, elements, supports, staticInfo, basicSystemOptions, selectedOption, results, sym) i renderować ułożony pionowo raport. Każda sekcja powinna mieć wyraźny nagłówek (np. `h2` lub `h3`).

   **Kolejność sekcji w raporcie:**
   1. **Schemat ogólny:** Parametry (L, P, q, EJ/GC) oraz rzut konstrukcji (wykorzystaj `StructureView` w trybie `structure`, ale z nadpisanymi kolorami lub bez ciemnego tła kontenera).
   2. **Stopień statycznej niewyznaczalności:** Równanie: `n = 3·m + r - 3·w - h = ...` wraz z krótkim podsumowaniem.
   3. **Układ podstawowy:** Wizerunek układu podstawowego (wykorzystaj `MiniBasicSystem`).
   4. **Stan 1 (X₁ = 1):** Wykresy Mz i Ms dla Stanu 1 (jeśli `activeState` w głównym widoku wymusza dane, zmodyfikuj propsy `StructureView` tak, aby dla druku można było wymusić pokazanie konkretnego stanu, albo stwórz lekką pętlę renderującą SVG na sztywno dla `state1`).
   5. **Stan 2 (X₂ = 1):** (Jeśli n=2) Wykresy Mz i Ms dla Stanu 2.
   6. **Stan 0 (Obciążenia rzeczywiste):** Wykresy Mz i Ms dla Stanu 0.
   7. **Obliczenia całek Wereszczagina (Delt):** Rozwinięte obliczenia dla wszystkich całek (δ₁₁, δ₂₂, δ₁₂, δ₁₀, δ₂₀). Nie mogą być one w zwijanych akordeonach – podczas druku muszą być widoczne wszystkie na raz, jedne pod drugimi.
   8. **Układ równań i wyniki:** Wyświetl macierz równań kanonicznych, podstawienia oraz ostatecznie wyliczone siły nadliczbowe $X_1$ (i $X_2$).

3. **Technikalia:**
   - Aby użyć `StructureView` w pętli dla różnych stanów podczas druku, upewnij się, że nie polega on wyłącznie na zmiennej stanu `activeState` z głównego komponentu, lecz przyjmuje wymuszony zestaw sił elementowych (np. `printForceData`) jako props.
   - Pamiętaj o ustawieniu przerw między stronami, używając klas Tailwind np. `print:break-inside-avoid` dla kluczowych wykresów, aby nie przecinało schematów w połowie strony.
   - Konwertuj ciemne kolory z UI (np. tła `bg-slate-950`) na jasne w trybie druku lub usuń tła z SVG.