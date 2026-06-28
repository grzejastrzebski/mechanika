# Cel: Rozbudowa komponentu `<InlineDiagram>` o widoczne wymiary i zwiększenie jego skali

Użytkownik prosi o powiększenie miniaturowych wykresów wklejanych w linię równania (w sekcji Wereszczagina) oraz o dodanie do nich etykiet tekstowych, które będą informować o wymiarach figury (długość podstawy oraz wartość maksymalna/rzędna).

## Wytyczne do implementacji w `<InlineDiagram>`:

### 1. Zwiększenie rozmiaru i modyfikacja kontenera
- Zwiększ fizyczny rozmiar komponentu. Zmień klasy Tailwind kontenera na większe, np. z `w-16 h-12` na `w-28 h-20` (lub podobne proporcje), aby wykresy były wyraźne.
- **Bardzo ważne (Margin wewnętrzny):** Zmodyfikuj atrybut `viewBox` lub przeliczanie współrzędnych wewnątrz SVG tak, aby sam rysunek figury (trójkąta/prostokąta) nie zajmował 100% obszaru. Zostaw około 20-30% marginesu na górze i na dole na napisy, inaczej tekst zostanie ucięty (clipping).

### 2. Dodanie etykiet rzędnych (wysokość figury)
- Wygeneruj tag `<text>` w pobliżu maksymalnej wartości figury (np. przy wierzchołku trójkąta lub nad krawędzią prostokąta).
- Wyświetl tam dokładną wartość rzędnej (np. `4.00` lub `-8.00`).
- Użyj małej czcionki (np. `fontSize="10"` lub `fontSize="12"`, `fontFamily="sans-serif"`).
- Tekst dla wartości dodatnich umieszczaj nad figurą (`dy="-5"`), a dla ujemnych pod spodem, odpowiednio centrując (`textAnchor="middle"` lub `end` w zależności od położenia piku).

### 3. Dodanie etykiety długości ($s$)
- Pod osią zerową (lub pod samą figurą) na środku jej długości dodaj kolejny tag `<text>`.
- Wyświetl tam długość odcinka całkowania pręta (np. wartość `4.00` ze zmiennej długości pręta).
- Pokoloruj ten tekst na szaro (np. `fill="#64748b"`) lub zostaw w kolorze figury, aby odróżniał się od rzędnych, i wyśrodkuj go (`textAnchor="middle"`).

### 4. Spójność układu w linii
- Po powiększeniu figur upewnij się, że równanie matematyczne nadal poprawnie układa się w jednej osi. Znaki `\cdot`, `+` oraz nawiasy kwadratowe muszą być idealnie wyśrodkowane w pionie względem środków powiększonych figur (użyj `items-center` we wrapperze flexboxa).