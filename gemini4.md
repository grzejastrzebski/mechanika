# Cel: Poprawa czytelności wzorów, indeksów oraz dopracowanie rzutu 3D układu podstawowego

Użytkownik zgłasza potrzebę poprawy czytelności (małe indeksy) w panelu Wereszczagina oraz prosi o korekty wizualne w widoku 3D wybranego układu podstawowego (w komponencie `MiniBasicSystem`).

## Zadania do zaimplementowania:

### 1. Widok 3D (`MiniBasicSystem`) - Korekty wizualne:
- **Obrót (Kąt widzenia):** Zmień ustawienie kąta `yaw` w funkcji rzutowania tak, aby układ obracał się o około 45 stopni w prawo względem punktu 0,0 (klasyczna aksonometria inżynierska). Ustaw `yaw = -Math.PI / 4` (lub `Math.PI / 4`, w zależności od osi), aby schemat był zorientowany przodem do użytkownika.
- **Skala układu:** Powiększ rysowaną konstrukcję, aby lepiej wypełniała dostępne białe pole. Zmniejsz zmienną `padding` (np. na `15` lub `20`) lub dodaj mnożnik (np. `1.2`) przy obliczaniu skali `sc`.
- **Strzałki i oznaczenia:** - Skróć odrobinę długość strzałek sił nadliczbowych i momentów (zmniejsz zmienną określającą `arrowLen` / `radius`). 
  - Wyraźnie powiększ czcionkę dla oznaczeń `X1`, `X2` (np. na `fontSize="14"` lub `15`) i upewnij się, że jest pogrubiona (`fontWeight="bold"`), aby była widoczna na pierwszy rzut oka.
  - Odsuń delikatnie etykiety od grotów strzałek, aby się z nimi nie zlewały.

### 2. Poprawa czytelności w `WereshchaginPanel` (Indeksy i Wzory):
- Zmień klasy kontenerów zawierających główne wzory z `text-sm` / `text-xs` na `text-base` (lub większe).
- Dodaj reguły powiększające tagi indeksów przy użyciu klas Tailwind, np.: `[&_sup]:text-[0.8em] [&_sub]:text-[0.8em]` na kontenerach z równaniami, aby obejść domyślne kurczenie czcionek.
- Zastąp małe znaki Unicode (np. `₁₁`, `¹`) standardowymi tagami HTML `<sub>` i `<sup>` we wszystkich łańcuchach znaków renderujących wzory. Przykład: zamień `δ₁₁` na `δ<sub>11</sub>`.
- Upewnij się, że we wzorze sumacyjnym `[∫Mz·Mz ds...]` indeksy potęgowe (jeśli występują) i indeksy stanów (`Mz_1`) są czytelnie oddzielone za pomocą tagów HTML.

### 3. Poprawa czytelności w wykresach (`MiniDiagram` i `MiniRect`):
- Zwiększ atrybut `fontSize` dla tekstów z wynikami na końcach prętów (z `9` na `11` lub `12`).
- Zwiększ rozmiar czcionki dla atrybutu `title` (np. z `9` na `11`).
- Skoryguj offsety dla pozycjonowania tekstów na osi `y`. Po powiększeniu czcionki musisz dodać/odjąć kilka pikseli, aby wartości nie nachodziły na linie wykresów.
- Ostateczne wyniki liczbowe całek (zmienne wartości sum w zielonych i czerwonych polach) podświetl większą czcionką (np. `text-lg` i pogrubienie).