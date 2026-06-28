# Modyfikacja generatora układów podstawowych - faworyzowanie pełnych rozcięć i istniejących przegubów

Aktualna heurystyka sortowania w `enumerateBasicSystems` faworyzuje podpory nad rozcięciami, a dla rozcięć stosuje wagę Mg < Ms < T. Przez to rozcięcia siły tnącej (T) spadają na koniec listy i są odcinane przez limit 5 elementów. 

W ręcznej metodzie sił najwygodniejszym układem podstawowym jest całkowite przerwanie obwodu w miejscu, gdzie JUŻ ISTNIEJE fizyczny przegub (np. uwolnienie siły tnącej T na końcu pręta, na którym użytkownik już wcześniej zdefiniował zwolnienie Mg i Ms). 

Zadania do modyfikacji w kodzie:
1. **Zwiększ limit wyników:** W funkcji `goToStage2` (lub w miejscu sortowania) zwiększ limit krojonej tablicy opcji z 5 na np. 15 lub 20. Interfejs jest przewijany, więc zmieszczą się bez problemu.
2. **Inteligentna heurystyka w `enumerateBasicSystems`:** Zmień funkcję sortującą `valid` układy tak, aby faworyzowała "studenckie" podejście do rozcięć:
   - Nadaj ogromny priorytet (np. ujemne punkty karne) takim kandydatom wewnętrznym (T, Mg, Ms), którzy aplikują zwolnienie na końcu pręta posiadającym już fizyczny przegub zdefiniowany przez użytkownika w tabeli prętów (`el.release1` lub `el.release2`).
   - Jeśli rozcięcie T (siły tnącej) wypada w miejscu istniejącego przegubu, zignoruj dla niego standardową karę "Mg < Ms < T" i przesuń tę opcję na sam szczyt propozycji związanych z obwodami zamkniętymi.