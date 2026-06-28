# Cel: Transformacja "MiniBasicSystem" z 2D na 3D (Aksonometria) z graficzną reprezentacją par sił

Aktualnie komponent `MiniBasicSystem` (wyświetlany w Etapie 2) używa płaskiego rzutowania 2D i prostych symboli. Chcę, aby rysował wybrany układ podstawowy w rzucie aksonometrycznym (tak samo jak robi to `StructureView` w trybie `mz3d`), dzięki czemu "studenckie" schematy uwolnień będą czytelniejsze.

## Wymagane zmiany w `MiniBasicSystem`:

1. **Rzutowanie 3D:**
   - Skopiuj do `MiniBasicSystem` logikę rzutowania `proj(x, y, z)` oraz parametry kamery (`yaw = 0`, `pitch = Math.PI/6`) z komponentu `StructureView`.
   - Zmień obliczanie współrzędnych węzłów i prętów z płaskiego `tx`/`ty` na rzutowanie 3D (z `z=0` dla geometrii ramy).

2. **Rysowanie sił nadliczbowych (strzałek):**
   Gdy iterujesz po `removedConstraints`, zmień sposób rysowania ujęć w zależności od typu zwolnienia:
   
   - **Dla usuniętej podpory zewnętrznej (`rc.dof === 'z'` i typ to podpora):**
     Narysuj jedną pionową strzałkę skierowaną w górę (wykorzystaj komponent `ForceArrow` poddany rzutowaniu 3D lub narysuj linię w 3D od z=0 do z=odpowiednia_wysokość). Obok dodaj etykietę (np. $X_1$).
     
   - **Dla rozcięcia Wewnetrznego Siły Tnącej (`rc.dof === 'T'` lub `type === 'internal'` z `T`):**
     Narysuj **dwie przeciwne strzałki pionowe** w tym samym węźle, aby idealnie odwzorować schematy z zajęć z mechaniki budowli. 
     Jedną strzałkę skieruj do góry (odpowiadającą np. lewej stronie cięcia), drugą do dołu (dla prawej strony). Przesuń je minimalnie względem siebie (np. lekki offset wzdłuż osi uciętego pręta), aby obie były czytelne. Obok dodaj wspólną etykietę.
     
   - **Dla rozcięć Momentów (`Mg` / `Ms`) lub zwolnień `rx`/`ry` na podporach:**
     Możesz zachować rysowanie za pomocą `MomentArrow`, ale upewnij się, że są rzutowane lub chociaż pozycjonowane na odpowiednich współrzędnych 3D węzła. Dla wewnętrznych cięć momentów również wygeneruj parę symboli (lub dwie przeciwne strzałki reprezentujące parę sił).

Zaimplementuj to w taki sposób, aby po kliknięciu "Wybierz ten układ", użytkownik od razu widział przestrzenną ramę ze strzałkami działającymi w osi Z. Upewnij się, że skalowanie (bounding box 3D) działa poprawnie, zapobiegając wychodzeniu rysunku poza obszar SVG.