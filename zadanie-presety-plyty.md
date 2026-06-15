# Zadanie dla Claude Code: warianty PP2 do kalkulatora płyt okrągłych

## Kontekst
W tym repo `plyty-okragle.html` to kalkulator osiowo-symetrycznych płyt kołowych.
Ma tryb „Płyta pełna + pierścień" (mode `"two"`) oraz system zapisu/wczytywania układów.

Najpierw przeczytaj `plyty-okragle.html` i znajdź, jak reprezentowany jest układ oraz ID
pól dla trybu „two":
- modecard `data-mode="two"`
- `nu`
- `Dmode` / `Dval`
- `a_two`, `b_two`
- `q1t` (q w obszarze 0..a), `q2t` (q w obszarze a..b)
- `iface_type` (`"cont"` = zwykła ciągłość, `"ring"` = podpora pierścieniowa), `iface_M`, `iface_P`
- `outer_type` (`"clamped"` / `"pinned"` / `"free"`), `outer_M`, `outer_P`
- przycisk `#go` (OBLICZ)

## Zadanie
Dodaj **wbudowany (hardcodowany)** wybór gotowych przykładów „Warianty z zadania (PP2)" —
listę rozwijaną z 16 wariantami. Wybranie wariantu ma:
1. ustawić wszystkie pola na jego konfigurację,
2. od razu wywołać OBLICZ (`#go`), żeby użytkownik natychmiast zobaczył wynik i wykresy.

Wymagania:
- Presety mają być **wbudowane w kod**, ODRĘBNE od układów zapisywanych przez użytkownika
  w localStorage (to ma działać dla każdego, bez żadnej konfiguracji).
- Po wejściu na stronę domyślnie wczytaj **Wariant 1** (zasada „nie pusty start").
- W etykiecie każdego wariantu pokaż kluczowe dane, np.:
  `Wariant 8 — D=3·10⁵, q=8 kN/m², a=5, b=10, podpora pierścieniowa`.

## Wspólne ustawienia dla WSZYSTKICH wariantów
- tryb = `"two"` (płyta pełna + pierścień)
- `nu` = 0.3
- `Dmode` = `"num"` (wartość liczbowa)
- **q wewn. (0..a) = 0**  ← obciążenie jest TYLKO na pierścieniu zewnętrznym
- **q zewn. (a..b) = q**
- wszystkie momenty/siły brzegowe i w styku = 0

## Warianty
Format: nr — D — q — a — b — styk (`iface_type`) — brzeg zewn. (`outer_type`)

```
1:  D=200000 q=1 a=5  b=10 iface=cont outer=pinned
2:  D=250000 q=2 a=6  b=14 iface=cont outer=clamped
3:  D=200000 q=3 a=4  b=10 iface=ring outer=free
4:  D=300000 q=4 a=6  b=12 iface=cont outer=pinned
5:  D=250000 q=5 a=3  b=9  iface=cont outer=clamped
6:  D=350000 q=6 a=6  b=11 iface=ring outer=free
7:  D=300000 q=7 a=6  b=11 iface=cont outer=clamped
8:  D=300000 q=8 a=5  b=10 iface=ring outer=free
9:  D=300000 q=9 a=6  b=15 iface=cont outer=clamped
10: D=250000 q=1 a=6  b=12 iface=cont outer=clamped
11: D=200000 q=2 a=8  b=12 iface=ring outer=free
12: D=250000 q=3 a=7  b=14 iface=cont outer=pinned
13: D=200000 q=4 a=6  b=14 iface=cont outer=clamped
14: D=250000 q=5 a=3  b=10 iface=cont outer=clamped
15: D=250000 q=6 a=5  b=14 iface=ring outer=free
16: D=300000 q=7 a=6  b=15 iface=cont outer=clamped
```

(Warianty 17 i 18 z oryginału są identyczne z 11 i 12 — można pominąć.)

## Na koniec
Najpierw pokaż mi plan i podgląd, jak podłączysz presety pod istniejące pola, ZANIM zrobisz
commit i push. Tego pliku (`zadanie-presety-plyty.md`) nie commituj.
