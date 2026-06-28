# Zadanie dla Claude Code: solver rusztów — przewodnik krok po kroku (etapy + wybór stanów)

## Kontekst
`solver-rusztow.html` — solver rusztów płaskich (React), liczy **metodą sił** (stany, współczynniki
δ, wykresy Mz/Ms, mnożenie Wereszczagina). Przeczytaj plik i zobacz, co już jest zrobione.

To zadanie **opakowuje istniejący solver w prowadzony, etapowy przepływ** i dokłada **wybór
stanów**. Silnik obliczeniowy zostaje — zmieniamy głównie przepływ, UI i to, że użytkownik sam
wybiera układ podstawowy.

> Jeśli realizowałeś już zadanie „stopień niewyznaczalności + stany" — **zintegruj z nim, nie
> duplikuj**.

## Docelowy przepływ
Dla zadań kolokwialnych: ruszty **1× lub 2× statycznie niewyznaczalne**. Na górze **pasek
KAFELKÓW (stepper)** podświetlający bieżący etap — żeby było czytelnie dla nowych użytkowników.

**Etap 1 — Schemat.** Użytkownik modeluje/rysuje ruszt (pręty, podpory, obciążenia) — to, co
dostaje na kolokwium. Przycisk „Oblicz / Dalej" przechodzi do etapu 2.

**Etap 2 — Stany.** Po kliknięciu solver:
- liczy **stopień statycznej niewyznaczalności** `n`,
- wyznacza i pokazuje **wszystkie możliwe kombinacje** układu podstawowego (zestawy `n` więzów
  do usunięcia, dające układ statycznie wyznaczalny **oraz geometrycznie niezmienny**),
- pozwala użytkownikowi **wybrać jedną kombinację** (czyli stany `X₁ … Xₙ`).

Po wyborze i kliknięciu „Oblicz / Dalej" → etap 3.

**Etap 3 — Obliczenia / Wyniki.** Solver liczy **dalej dokładnie to, co już teraz** (z wybranym
układem podstawowym): stan od obciążenia, stany jednostkowe, współczynniki δ, równania kanoniczne,
rozwiązanie `Xᵢ`, superpozycja → ostateczne wykresy Mz/Ms i wyniki. **To istniejący silnik — użyj go.**

## Faza 2 — NIE teraz, ale przygotuj strukturę
Wybór metody liczenia współczynników: **Mohr** (analityczne całkowanie Maxwella-Mohra) ↔
**Wereszczagin** (graficzne mnożenie wykresów). Wynik ten sam, różni się sposób/prezentacja.
Zostaw na później, ale zbuduj kod tak, by dało się to wpiąć (np. wspólny punkt liczenia δ).

## Wymagania i zasady
- **Stepper:** poziomy pasek kafelków `[1. Schemat] [2. Stany] [3. Obliczenia]` — aktywny
  podświetlony, ukończone oznaczone, możliwość powrotu do wcześniejszego etapu.
- **„Wszystkie kombinacje":** enumeruj kandydujące zestawy `n` więzów; zostaw tylko te dające
  układ wyznaczalny i **geometrycznie niezmienny** (bez mechanizmu). Dla 1× i 2× jest ich
  niewiele — pokaż czytelnie (opis: które więzy/podpory zwolnione, co jest `X₁…Xₙ`; jeśli się da,
  mały rysunek danego układu podstawowego).
- Jeśli `n = 0` (układ wyznaczalny) — pomiń etap 2, przejdź wprost do wyników.
- **Nie psuj** istniejącego silnika ani wyników; etap 3 ma dawać to samo, co teraz, dla danego
  układu podstawowego.
- Zweryfikuj na przykładzie rusztu **1×** i (jeśli się da) **2×** niewyznaczalnego.
- Ma działać w iframe w ciemnej powłoce strony i na telefonie.

## Na koniec
To duża zmiana — **najpierw pokaż mi PLAN**: jak rozbijesz to na etapy w kodzie, jak liczysz `n`,
jak enumerujesz i filtrujesz kombinacje (uważaj na geometryczną niezmienność!) i jak wepniesz
wybrany układ podstawowy do istniejącego silnika. Dopiero po akceptacji planu pisz kod. Na końcu
commit + push. Tego pliku nie commituj.
