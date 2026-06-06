# STATIKA — kalkulatory konstrukcyjne

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
  techniczne; marka „STATIKA"). Ładuje kalkulatory w `<iframe>`.
- `solver-rusztow.html` — solver rusztów płaskich (MES): reakcje, siły wewnętrzne,
  wykresy Mz/Ms, graficzne mnożenie Wereszczagina. **React + Tailwind przez CDN**,
  JSX kompilowany w locie przez Babel standalone.
- `plyty-okragle.html` — kalkulator płyt okrągłych/pierścieniowych (zginanie
  osiowo-symetryczne). **Vanilla JS**, bez zależności.

## Mapa kalkulatorów (status w `index.html` → `TABS`)

| Moduł          | Status   | Plik                  |
|----------------|----------|-----------------------|
| Ruszty         | `ready`  | `solver-rusztow.html` |
| Płyty okrągłe  | `ready`  | `plyty-okragle.html`  |
| Belki          | `soon`   | —                     |
| Ramy           | `soon`   | —                     |
| Reakcje        | `soon`   | —                     |
| Przesunięcia   | `soon`   | —                     |

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
