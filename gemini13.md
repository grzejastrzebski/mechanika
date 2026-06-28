# Rozbudowa modułu: Tryb liczenia na symbolach (P, q, M, R)

Cześć Claude. Potrzebujemy dodać jeszcze jedną kluczową funkcję dydaktyczną do naszego kalkulatora. Na zajęciach większość zadań rozwiązuje się operując wyłącznie na symbolach (np. promień to `R`, obciążenie ciągłe to `q`, siła skupiona to `P`), a wynikiem jest współczynnik liczbowy pomnożony przez odpowiedni ułamek (np. `0.3584 * qR^3 / EJ`).

Proszę o dodanie "Trybu symbolicznego" do naszego narzędzia. Zaktualizuj kod zgodnie z poniższymi wytycznymi:

## 1. Przełącznik trybu wprowadzania
Dodaj na samej górze formularza wyraźny przełącznik (Radio buttons lub Toggle): 
* **"Tryb liczbowy"** (standardowy, z wpisywaniem wartości w m/cm i kN/kNm).
* **"Tryb symboliczny"** (akademicki).

## 2. Zachowanie interfejsu w Trybie symbolicznym
Gdy użytkownik wybierze tryb symboliczny:
* Ukryj pola do wpisywania konkretnych wartości liczbowych dla obciążeń (P, q, M) oraz promienia (R). 
* Zostaw tylko checkboxy/przełączniki do aktywacji danego obciążenia (np. "Uwzględnij obciążenie q", "Uwzględnij siłę P").
* Ukryj wybór jednostek (m, cm, mm), ponieważ w symbolach nie mają one znaczenia.
* Zostaw pole na podanie wartości sztywności `EJ/GC` (ponieważ ten stosunek zawsze jest podawany jako liczba, np. 1.3 czy 2.0).

## 3. Logika obliczeniowa dla symboli (Silnik JS)
Zastosuj sprytne podejście w JS, aby ominąć potrzebę używania ciężkich bibliotek do algebry symbolicznej (CAS):
1. Jeśli tryb symboliczny jest aktywny, dla wybranych obciążeń przypisz sztucznie wartość 1 (np. q = 1, R = 1).
2. Przeprowadź standardowe całkowanie numeryczne na tych jedynkach.
3. Wyliczona całka będzie dokładnym współczynnikiem liczbowym, którego szukamy.
4. Następnie w raporcie wyników doklej odpowiedni ciąg znaków ("sufiks symboliczny") na podstawie tego, czego dotyczyły obliczenia.

## 4. Mapowanie sufiksów symbolicznych
Zaimplementuj w kodzie prosty słownik/mapę, która na podstawie wybranego obciążenia i szukanej wartości przypisze odpowiednie symbole na końcu wyniku. 

* Jeśli szukamy **Ugięcia**:
  * Dla obciążenia siłą P: `* P*R^3 / EJ`
  * Dla obciążenia momentem M: `* M*R^2 / EJ`
  * Dla obciążenia q: `* q*R^4 / EJ`
* Jeśli szukamy **Kąta obrotu**:
  * Dla obciążenia siłą P: `* P*R^2 / EJ`
  * Dla obciążenia momentem M: `* M*R / EJ`
  * Dla obciążenia q: `* q*R^3 / EJ`

*(Zadbaj o eleganckie formatowanie HTML tych ułamków w raporcie końcowym).*

## 5. Raport Krok po Kroku w Trybie symbolicznym
Raport "krok po kroku" musi uwzględniać ten tryb. Jeśli tryb symboliczny jest włączony, wypisywane wzory w kroku 1 i 2 nie powinny zawierać żadnych podstawionych liczb poza ewentualnym ułamkiem `EJ/GC`. Mają wyglądać czysto algebraicznie, dokładnie tak jak w notatkach studentów.