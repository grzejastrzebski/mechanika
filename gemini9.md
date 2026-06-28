# Aktualizacja modułu "Kalkulator pręta zakrzywionego w planie koła"

Cześć Claude. Musimy wprowadzić dwie bardzo ważne modyfikacje do naszego kalkulatora pręta zakrzywionego. Aplikacja ma nie tylko liczyć wynik, ale pełnić funkcję narzędzia edukacyjnego dla studentów zaawansowanych kursów mechaniki budowli. Wymaga to specyficznego układu geometrycznego oraz dokładnego, akademickiego rozpisywania obliczeń krok po kroku, identycznie jak na zajęciach.

Proszę o zaktualizowanie kodu JS i HTML na podstawie poniższych wytycznych:

## 1. Modyfikacja geometrii i układu współrzędnych
Wprowadź w interfejsie użytkownika opcję wyboru kierunku wygięcia pręta: **"W lewo"** lub **"W prawo"**.
* **Utwierdzenie (początek układu):** Zawsze znajduje się na samym dole (kąt $\varphi = 0$).
* **Przebieg osi:** Kąt całkowania $\varphi$ zawsze rośnie od $0$ do wartości końcowej podanej przez użytkownika.
* **Wpływ na wzory:** Zadbaj o to, aby silnik w JavaScript odpowiednio modyfikował znaki we wzorach na $M_z$ i $M_s$ w zależności od wybranego kierunku wygięcia (lewo/prawo), zgodnie z zasadami statyki (zmiana orientacji ramienia siły względem osi pręta).

## 2. Raportowanie wyników "Krok po kroku" (Kluczowa funkcja)
Kalkulator nie może zwracać samego wyniku końcowego. Pod formularzem wejściowym musi wygenerować elegancki, przypominający notatki z wykładów raport z obliczeń. Użyj formatowania HTML (np. tagów `<code>`, `<i>`, indeksów dolnych `<sub>`), aby wzory wyglądały czytelnie i profesjonalnie. 

Raport ma być podzielony na następujące sekcje, które użytkownik będzie mógł łatwo przepisać:

* **Krok 1: Rozkład momentów $M_z$ i $M_s$ od obciążeń zewnętrznych**
  Skrypt musi dynamicznie wygenerować i wyświetlić ostateczne wzory analityczne dla wybranych przez użytkownika obciążeń w funkcji kąta $\varphi$. 
  *Przykład wygenerowanego tekstu:* "1) Wyznaczamy rozkład momentów zginających $M_z$ i skręcających $M_s$ od obciążeń zewnętrznych:
  $M_z = -P \cdot R \sin(\varphi)$
  $M_s = -P \cdot R (1 - \cos(\varphi))$"

* **Krok 2: Rozkład momentów od obciążenia jednostkowego**
  Skrypt musi wyświetlić analogiczne wzory dla wirtualnego obciążenia jednostkowego (siła $\overline{P}=1$ dla ugięcia lub moment $\overline{M}=1$ dla kąta obrotu).
  *Przykład:* "2) Wyznaczamy rozkład $\overline{M_z}$ i $\overline{M_s}$ od obciążenia jednostkowego:
  $\overline{M_z} = -1 \cdot R \sin(\varphi)$
  $\overline{M_s} = -1 \cdot R (1 - \cos(\varphi))$"

* **Krok 3: Zestawienie całki (Zasada prac wirtualnych)**
  Wyświetl ogólny wzór Maxwella-Mohra z podstawionymi elementami z Kroku 1 i 2. Skrypt powinien złożyć to w jeden ciąg tekstowy (bez rozwiązywania symbolicznego, po prostu zapis samej całki do wyliczenia).
  *Przykład:*
  "3) Obliczamy szukane przemieszczenie ze wzoru:
  $\delta = \frac{1}{EJ} [ \int M_z \overline{M_z} ds + \frac{EJ}{GC} \int M_s \overline{M_s} ds ]$"
  (Pokaż dynamicznie złożone wnętrze całki dla podanych granic całkowania).

* **Krok 4: Wynik końcowy**
  Tutaj skrypt używa swojego wewnętrznego całkowania numerycznego i podaje gotowy wynik całki oznaczony w przystępnej formie mnożnika, np.:
  "Wynik: $2.54 \frac{P R^3}{EJ}$" (przy założeniu jednostkowego wariantu) lub precyzyjny wynik liczbowy, jeśli podano konkretne dane wejściowe. 

Proszę o dostarczenie zaktualizowanego kodu HTML, zaktualizowanego silnika JS oraz odpowiedniego CSS, który sprawi, że sekcja "Krok po kroku" będzie wizualnie przypominać arkusz papieru z równaniami. Zadbaj o poprawne wyświetlanie znaków specjalnych (jak greckie $\varphi$, $\delta$, $\pi$).