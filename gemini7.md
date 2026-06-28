# Wytyczne: Moduł "Kalkulator pręta zakrzywionego w planie koła"

Cześć Claude. Rozbudowuję moją stronę z kalkulatorami inżynierskimi `mechanika.kalkulator` (opartą na HTML, CSS i Vanilla JS). Mamy już ruszty i płyty, teraz potrzebuję napisać moduł do obliczania przemieszczeń pręta zakrzywionego w planie koła, wykorzystując metodę Maxwella-Mohra.

Proszę o przygotowanie kompletnego kodu (HTML + logika JS) na podstawie poniższej specyfikacji. Zadbaj o to, aby kod był modułowy i gotowy do osadzenia na istniejącej stronie.

## 1. Założenia teoretyczne i wzory (Zasada prac wirtualnych)
Przemieszczenie (ugięcie lub obrót) liczymy z całkowania numerycznego:
Przemieszczenie = calka( (Mz * Mz_wirtualne)/EJ + (Ms * Ms_wirtualne)/GC ) ds

Z uwagi na to, że pręt jest kołowy: ds = R * d(phi).
W interfejsie użytkownik nie podaje całych wartości EJ i GC, ale definiuje stosunek sztywności: EJ/GC (zazwyczaj jest to wartość rzędu 1.3 - 1.5).

Momenty (rzeczywiste i wirtualne) dla poszczególnych obciążeń w funkcji kąta (phi):
- Dla siły skupionej P na końcu pręta: 
  Mz = -P * R * sin(phi)
  Ms = -P * R * (1 - cos(phi))
- Dla momentu skupionego M: 
  Mz = -M * cos(phi)
  Ms = +M * sin(phi)
- Dla obciążenia ciągłego równomiernie rozłożonego q: 
  Mz = -q * R^2 * (1 - cos(phi))
  Ms = +q * R^2 * (phi - sin(phi))

## 2. Silnik obliczeniowy (JavaScript)
Nie rozwiązuj całek analitycznie. Zbuduj prosty silnik do całkowania numerycznego (np. metodą trapezów lub Simpsona) po kącie `phi`. 
- Silnik ma uwzględniać zasadę superpozycji (sumować momenty Mz i Ms od różnych obciążeń przed pomnożeniem przez wartości wirtualne).
- Jeśli szukamy ugięcia, obciążeniem jednostkowym wirtualnym jest P_wirtualne = 1.
- Jeśli szukamy kąta obrotu, obciążeniem jednostkowym wirtualnym jest M_wirtualne = 1.
- Pamiętaj o uwzględnieniu mnożnika R (wynikającego z przejścia z 'ds' na 'd(phi)') w samej całce oraz stosunku sztywności EJ/GC przy członie skręcającym.

## 3. Interfejs Użytkownika (UI / HTML)
Zbuduj przejrzysty formularz wejściowy obejmujący:
* **Geometrię:** Promień R oraz zakres kątowy pręta (np. wpisywany w stopniach od 0 do 90). W interfejsie uwzględnij rozwijaną listę do wyboru jednostek długości, aby moduł był uniwersalny: milimetry (mm) dla warsztatowych detali stalowych, centymetry (cm) dla standardowych elementów budowlanych oraz metry (m) do planów i założeń urbanistycznych.
* **Sztywność:** Pole input dla stosunku EJ/GC (domyślnie 1.3).
* **Obciążenia:** Możliwość dodania P, M lub q (lub ich kombinacji).
* **Szukana wartość:** Przełącznik/Radio button: "Szukane ugięcie" / "Szukany kąt obrotu".

## 4. Prezentacja wyników
Poniżej formularza stwórz sekcję wyników:
* Wyświetl ostateczny wynik w formie mnożnika (np. "Wynik: 26 * (M * R^2) / EJ").
* Dodaj małą tabelę weryfikacyjną, która pokaże wyliczone wartości momentów Mz i Ms na początku (phi=0), w środku i na końcu łuku. Pomoże mi to w szybkiej weryfikacji poprawności działania silnika numerycznego z wykresami.

Proszę o sam czysty kod JS odpowiedzialny za logikę całkowania oraz strukturę HTML dla formularza i wyników.