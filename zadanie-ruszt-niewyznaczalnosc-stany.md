# Zadanie dla Claude Code: stopień niewyznaczalności + propozycja stanów (solver rusztów)

## Kontekst
`solver-rusztow.html` — solver rusztów płaskich (React), liczy **metodą sił** (m.in. wykresy
Mz/Ms, graficzne mnożenie Wereszczagina). Przeczytaj plik.

**WAŻNE na start:** skoro solver liczy metodą sił, to najpewniej **wewnętrznie już wyznacza**
stopień statycznej niewyznaczalności oraz układ podstawowy ze stanami. Najpierw sprawdź, czy te
wielkości już są liczone w środku — jeśli tak, zadanie sprowadza się głównie do **wyświetlenia
ich w interfejsie**. Jeśli nie — dolicz je.

## Cel
Po zbudowaniu schematu rusztu kalkulator ma:
1. Policzyć i pokazać **stopień statycznej niewyznaczalności** `n`.
2. **Zaproponować stany** metody sił:
   - **układ podstawowy** (statycznie wyznaczalny i geometrycznie niezmienny) — przez usunięcie
     `n` więzów nadliczbowych (niewiadome `X₁ … Xₙ`),
   - **stan od obciążenia** („stan 0"),
   - **stany jednostkowe** `X₁ = 1, …, Xₙ = 1`.

## Szczegóły
- Stopień niewyznaczalności licz standardowo dla rusztu płaskiego (3 równania równowagi w węźle:
  ΣFz, ΣMx, ΣMy):
  `n = (niewiadome: składowe reakcji + nadliczbowe więzy wewnętrzne) − (liczba niezależnych
  równań równowagi)`. Trzymaj się konwencji, której solver już używa.
- Propozycja układu podstawowego: wybierz `n` więzów do usunięcia tak, żeby układ pozostał
  statycznie wyznaczalny **oraz geometrycznie niezmienny** (bez mechanizmu). Jeśli możliwych
  wyborów jest wiele — zaproponuj jeden sensowny i czytelnie opisany (które podpory/więzy
  zwolnione, co jest `X₁ … Xₙ`).
- Stany przedstaw opisowo; a jeśli da się to zrobić bez dużego nakładu — pokaż też ich **wykresy**
  (solver i tak rysuje wykresy), dla stanu od obciążenia i dla każdego stanu jednostkowego.

## Zasady
- Nie psuj istniejących obliczeń ani wyników solvera.
- Jeśli `n = 0` (układ statycznie wyznaczalny) — napisz to jasno (brak niewiadomych, brak stanów).
- Zweryfikuj na przykładzie, który solver już obsługuje (znany ruszt niewyznaczalny).

## Na koniec
Najpierw pokaż mi **PLAN**: jak liczysz `n`, jak wybierasz układ podstawowy i czy/jak to już jest
liczone wewnątrz. Dopiero potem kod, na końcu commit + push. Tego pliku nie commituj.
