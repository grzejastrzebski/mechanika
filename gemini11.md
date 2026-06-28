# Poprawka modułu: Geometria rysowania pręta (łuk wypukły, a nie wklęsły)

Cześć Claude. Funkcje rysujące pręt na wykresie wymagają poprawki, ponieważ obecnie pręt generuje się w złej orientacji. 

W tym momencie aplikacja rysuje pręt jak "miskę" (wklęsły, środek krzywizny promienia R znajduje się NAD prętem). 
Na zajęciach obowiązuje geometria "sklepienia" (łuk wypukły ku górze, środek krzywizny promienia R znajduje się POD prętem). Musimy zaktualizować kod rysujący (Canvas/SVG), aby układ wizualny w 100% odpowiadał notatkom z wykładów.

Proszę o wprowadzenie następujących zmian w logice rysowania:

## 1. Położenie środka krzywizny
Dla obu przypadków (pręt w lewo i pręt w prawo), punkt wyznaczający środek okręgu (od którego odmierzany jest promień R) musi znajdować się wizualnie **pod** narysowanym łukiem pręta.

## 2. Orientacja "Pręt w lewo" (Lewa kolumna notatek)
* **Kształt:** Łuk wypukły ku górze.
* **Początek (phi=0):** Swobodny koniec pręta znajduje się po **prawej** stronie (wyżej). To tutaj przykładamy siłę P, moment M itp.
* **Koniec (phi=phi_max):** Utwierdzenie znajduje się po **lewej** stronie (niżej).
* **Kierunek przyrostu kąta:** Kąt phi rośnie od prawej do lewej, przeciwnie do ruchu wskazówek zegara (patrząc od środka krzywizny pod prętem).

## 3. Orientacja "Pręt w prawo" (Prawa kolumna notatek)
* **Kształt:** Łuk wypukły ku górze.
* **Początek (phi=0):** Swobodny koniec pręta znajduje się po **lewej** stronie (wyżej). To tutaj przykładamy obciążenia.
* **Koniec (phi=phi_max):** Utwierdzenie znajduje się po **prawej** stronie (niżej).
* **Kierunek przyrostu kąta:** Kąt phi rośnie od lewej do prawej, zgodnie z ruchem wskazówek zegara (patrząc od środka krzywizny pod prętem).

## 4. Estetyka rysunku
* Promień R powinien być narysowany przerywaną linią od środka krzywizny do swobodnego końca (phi=0).
* Zaznacz łukiem kąt phi zaczynający się przy swobodnym końcu.
* Ikona utwierdzenia musi znajdować się na końcu łuku (phi=phi_max) i być narysowana tak, aby pasowała do stycznej łuku w tamtym punkcie (nie musi być idealnie pozioma, zależy od kąta phi_max).

Zaktualizuj wyłącznie funkcje odpowiadające za renderowanie widoku. Logika obliczeniowa pozostaje bez zmian.