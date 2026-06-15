# MECHANIKA — kalkulatory akademickie

Statyczna strona z darmowymi kalkulatorami inżynierskimi (statyka i wytrzymałość
materiałów), licząca wszystko **lokalnie w przeglądarce** — bez backendu, bez
logowania, bez wysyłania danych. Interfejs w języku polskim.

## Hosting / deploy

- **Cloudflare Workers static assets**, auto-deploy po `git push` do `main`.
- Live: https://mechanika.kalkulator.workers.dev/
- Konfiguracja deploya jest w dashboardzie Cloudflare (brak `wrangler.toml` w repo);
  katalogiem assets jest root repo.
- `.assetsignore` wyklucza `.git` z publikacji (gitignore-style składnia).
- Brak buildu — czysty statyczny HTML, zależności (React, Tailwind) z CDN.

## Pliki

- `index.html` — **powłoka** z zakładkami (jasny motyw „papierowy" spójny z
  kalkulatorami: kremowe tło `#fbfaf5` + siatka 22px, atrament `#16243a`,
  akcenty niebieski/zielony/złoty; tekst szeryfowy, IBM Plex Mono na elementy
  techniczne; marka „MECHANIKA"). Ładuje kalkulatory w `<iframe>`.
- `solver-rusztow.html` — solver rusztów płaskich (MES): reakcje, siły wewnętrzne,
  wykresy Mz/Ms, graficzne mnożenie Wereszczagina. **React + Tailwind przez CDN**,
  JSX kompilowany w locie przez Babel standalone.
- `plyty-okragle.html` — kalkulator płyt okrągłych/pierścieniowych (zginanie
  osiowo-symetryczne). **Vanilla JS**, bez zależności.
- `reakcje.html` — kalkulator reakcji podporowych belek statycznie wyznaczalnych
  (równania równowagi ΣFx/ΣFy/ΣM, kontrola wyznaczalności, równania krok po kroku,
  schemat belki w SVG, 6 wbudowanych przykładów). **Vanilla JS + SVG**, bez zależności.
  **Strona ukryta:** celowo poza `TABS` — brak zakładki i kafelka; dostępna wyłącznie
  pod bezpośrednim adresem `/reakcje.html`.
- `belki.html` — analizator belek płaskich statycznie wyznaczalnych, w tym **belek
  Gerbera z przegubami wewnętrznymi**: reakcje (3 równania równowagi + warunek M=0 na
  każdy przegub), siła normalna N(x), tnąca T(x) i moment zginający M(x) — wykresy SVG,
  wartości charakterystyczne i ekstrema momentu. Siły skupione ukośne (składowe lub
  P+kąt). **Vanilla JS + SVG**, bez zależności. Zwalidowany na przykładzie z `belka1.pdf`.
  **Strona chwilowo ukryta:** celowo poza `TABS` — brak zakładki i kafelka; dostępna
  wyłącznie pod bezpośrednim adresem `/belki.html`. Do pokazania, gdy zdecydujemy.

## Mapa kalkulatorów (status w `index.html` → `TABS`)

Publikujemy gotowe kalkulatory pojedynczo. Pozostałe wpisy „soon"
(Belki, Ramy, Przesunięcia/ugięcia) są **poza `TABS`** — dodajemy je później,
gdy kalkulator jest gotowy. Gotowe definicje tych wpisów są w historii gita.

| Moduł          | Status   | Plik                  |
|----------------|----------|-----------------------|
| Ruszty         | `ready`  | `solver-rusztow.html` |
| Płyty okrągłe  | `ready`  | `plyty-okragle.html`  |
| Belki          | ukryty (poza `TABS`, tylko `/belki.html`) | `belki.html` |
| Reakcje        | ukryty (poza `TABS`, tylko `/reakcje.html`) | `reakcje.html` |
| Ramy           | planowane (poza `TABS`) | —      |
| Przesunięcia   | planowane (poza `TABS`) | —      |

## Konwencje

- **Powłoka jest source of truth dla nawigacji.** Wszystkie moduły definiuje
  tablica `TABS` w `index.html`. Zakładki, kafelki na stronie startowej i widoki
  „Wkrótce" generują się z niej automatycznie.
- **Dodanie nowego kalkulatora:**
  1. Utwórz `nazwa-kalkulatora.html` w root repo (samodzielny, działający w iframe).
  2. W `TABS` zmień wpis modułu z `status:"soon"` na
     `status:"ready", type:"iframe", src:"nazwa-kalkulatora.html"`.
- **Motyw:** powłoka (`index.html`) **i** kalkulatory w iframe mają wspólny
  **jasny, „papierowy" motyw** (kremowe tło `#fbfaf5` + delikatna siatka 22px,
  atrament `#16243a`, akcenty niebieski/zielony/złoty). Trzymaj się tej jasnej palety w nowych
  kalkulatorach — patrz `plyty-okragle.html` (zmienne CSS `--paper/--ink/--line/...`)
  lub blok `tailwind.config` na górze `solver-rusztow.html`.
- **Wpłaty (chwilowo wyłączone):** funkcja wsparcia (przycisk „Wesprzyj", link
  w stopce, modal i licznik kliknięć „Oblicz") została **usunięta z powłoki** do
  czasu pojawienia się stałych użytkowników — kod jest w historii gita (commit
  z motywem papierowym). Martwy CSS (`.support/.overlay/.modal/.btn-*`) został
  w `index.html`, by przywrócenie sprowadzało się do dodania HTML + JS. Mimo to
  nowe kalkulatory niech mają główny przycisk akcji z napisem zawierającym
  „Oblicz" — licznik wpłat na nim bazuje, gdy wróci.
- **Druk:** kalkulatory mają `@media print` wymuszające białe tło i ukrywające
  elementy `.no-print` — zachowaj to w nowych modułach (eksport do PDF).
- **Język:** całe UI i komunikaty po polsku.

## Lokalny podgląd

Pliki kalkulatorów otwierane bezpośrednio przez `file://` mogą działać kapryśnie
(React/Babel/Tailwind z CDN, brak CORS dla iframe). Najpewniejsza weryfikacja to
deploy na żywo albo prosty serwer statyczny z jednego origin.
