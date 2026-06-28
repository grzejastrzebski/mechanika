# Cel: Transformacja `MiniBasicSystem` w pełny, interaktywny widok 3D (Aksonometria)

Obecna implementacja `MiniBasicSystem` jest płaska (2D). Chcę, aby układ podstawowy w Etapie 2 był wyświetlany i obsługiwany dokładnie tak samo jak interaktywny widok 3D z `StructureView`. Użytkownik musi móc obracać ten schemat myszką.

## Zadania do zaimplementowania w `MiniBasicSystem`:

1. **Dodanie interaktywności i stanu kamery:**
   - Dodaj lokalny stan widoku: `const [view, setView] = useState({ yaw: -Math.PI / 4, pitch: Math.PI / 6, zoom: 1, panX: 0, panY: 0 });`
   - Skopiuj do `MiniBasicSystem` wszystkie funkcje obsługi myszy ze `StructureView` (`onMouseDown`, `onMouseMove`, `onMouseUp`, `onWheel`) wraz ze zmienną `dragRef`. 
   - Przypnij te handlery do głównego tagu `<svg>`.

2. **Silnik rzutowania 3D:**
   - Zaimplementuj funkcję `proj(x, y, z)` dokładnie taką samą jak w `StructureView`.
   - Zastąp dotychczasowe płaskie zmienne `tx` i `ty` funkcją `ps(x, y, z)`, która przelicza współrzędne 3D na piksele ekranowe z uwzględnieniem `sc` i offsetów. Do obliczenia skali i bounding boxa (`sc`, `ccx`, `ccy`) użyj tablic `px` i `py` wygenerowanych z `proj(x, y, 0)`.

3. **Rysowanie sił nadliczbowych w 3D (Bardzo ważne!):**
   Nie używaj płaskiego komponentu `ForceArrow` dla sił działających wzdłuż osi Z, ponieważ nie poddaje się on obrotowi kamery. 
   Aby narysować pionową siłę $X$:
   - Oblicz punkt bazowy: `const [bx, by] = ps(x, y, 0);`
   - Oblicz punkt grota: `const [tx, ty] = ps(x, y, arrowLength);` (gdzie `arrowLength` to wartość w przestrzeni 3D, ustalona proporcjonalnie do wielkości układu, np. Z = +15 dla siły w górę).
   - Narysuj `<line x1={bx} y1={by} x2={tx} y2={ty} />` oraz mały okrąg lub trójkąt na grocie.
   
   **W przypadku rozcięcia wewnętrznego (np. siły tnącej T):**
   - Narysuj dwie takie strzałki 3D obok siebie w węźle: jedną od `z=0` do `z=arrowLength`, a drugą od `z=0` do `z=-arrowLength`. 
   - Przesuń ich punkty bazowe (`x, y`) minimalnie w lewo i w prawo względem oryginalnego węzła, aby nie nachodziły na siebie (np. korzystając z wektora kierunkowego uciętego pręta, lub zdejmując stały offset).

4. **Rysowanie momentów:**
   Momenty (`Mg`, `Ms` lub reakcje momentowe) możesz na razie rysować dodając okręgi/łuki w punkcie `ps(x, y, 0)`. Pamiętaj, by dodać czytelną etykietę `$X_i$`.

5. **Wizualizacje prętów i węzłów:**
   Każdy `<line>` dla pręta i każdy `<circle>` dla węzła musi używać rzutowanych współrzędnych `ps(x, y, 0)`.

Dzięki tej zmianie widok `MiniBasicSystem` stanie się małym "oknem 3D", pozwalającym użytkownikowi na obejrzenie zwolnień pod dowolnym kątem.