# Zadanie dla Claude Code: solver rusztów — graficzny wybór podpór + oznaczenia stanów na rysunku

## Kontekst
`solver-rusztow.html` — solver rusztów płaskich (React), metoda sił. Przeczytaj plik. Te dwie
zmiany dotyczą **interfejsu/wizualizacji** — nie zmieniają logiki obliczeń. Symbole, strzałki
i oznaczenia rób jako **SVG** (wektorowo), wielokrotnego użytku, dziedziczące kolor (żeby pasowały
do motywu) i z możliwością obrotu.

## Zmiana 1 — graficzny wybór podpory (zakładka „Podpory")
Obecnie podporę ustawia się, klikając okienka blokujące poszczególne siły/więzy. Zamień to na:
- **listę rozwijaną z typami podpór** — każdy typ z małą **grafiką** (symbolem) podpory,
- obok wybranej podpory pokaż **strzałki kierunków zablokowanych więzów/sił** — np. dla
  **utwierdzenia trzy strzałki** (trzy zablokowane składowe), dla podpory zwykłej mniej.

Jak zrobić to poprawnie:
- Najpierw odczytaj z pliku, **jakie więzy/składowe da się aktualnie blokować w węźle** (to
  definiuje model rusztu — zwykle: siła pionowa + dwa momenty). Na tej podstawie zdefiniuj zestaw
  nazwanych **typów podpór** (presetów), z których każdy blokuje określoną kombinację tych składowych.
- Wybór typu z listy → ustawia odpowiednią kombinację blokad (dokładnie to, co robiły okienka).
- Strzałki obok mają pokazywać, co dany typ blokuje: **strzałka prosta = siła**, **strzałka łukowa
  = moment**.
- Opcjonalnie zostaw pozycję „własna", która odsłania stare okienka — żeby nie tracić elastyczności.

## Zmiana 2 — oznaczenia stanów na rysunku schematu zastępczego
W etapie po obliczeniu stopnia niewyznaczalności, gdzie pokazywane są **schematy zastępcze**
(układy podstawowe) do wyboru: po kliknięciu któregoś z nich **po prawej stronie** ma pojawić się
rysunek tego układu z **oznaczeniami niewiadomych na rysunku** — np. `X₁` ze strzałką w górę,
`X₂` itd. — narysowanymi w miejscach zwolnionych więzów, w założonym dodatnim kierunku
(**siła = strzałka prosta, moment = strzałka łukowa**). Dzięki temu od razu widać, czym są
`X₁`, `X₂` i gdzie działają.

> Jeśli realizujesz to razem z etapowym przewodnikiem rusztów — **zintegruj**; to jest część
> prezentacji kombinacji w „Etapie 2 — Stany".

## Zasady
- To zmiany UI/wizualizacji — **nie psuj logiki obliczeń ani wyników**.
- Symbole podpór, strzałki i oznaczenia `X` jako SVG: wielokrotnego użytku, przekolorowywalne,
  obracalne (podpory bywają w różnych orientacjach).
- Ma działać w iframe w ciemnej powłoce strony i na telefonie.

## Na koniec
Najpierw pokaż mi **PLAN i podgląd** (jak będzie wyglądać lista podpór ze strzałkami oraz rysunek
z oznaczeniami `X`), ZANIM zrobisz commit i push. Tego pliku nie commituj.
