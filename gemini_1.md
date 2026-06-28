# Cel
Rozbudowa edukacyjnego solvera rusztów płaskich (React/JS) o "Inteligentny Generator Układów Podstawowych" dla układów statycznie niewyznaczalnych (n > 0).

# Aktualny stan
Aplikacja ma wbudowany, poprawnie działający silnik MES potrafiący liczyć dowolne stany obciążeń. Potrafi poprawnie obliczyć stopień statycznej niewyznaczalności `n`. Jednak brakuje funkcji, która potrafiłaby podpowiedzieć użytkownikowi poprawne układy podstawowe do Metody Sił (włączając w to rozcięcia wewnątrz ramy, a nie tylko usuwanie podpór z zewnątrz).

# Wymagania dla nowej funkcji:
1. Po wejściu w Etap 2 ("Wybór układu podstawowego"), jeśli `n > 0`, uruchom algorytm kombinatoryczny.
2. Zdefiniuj pule "możliwych zwolnień" (Possible Releases):
   - Usuwanie aktywnych reakcji podporowych (np. zmiana utwierdzenia na podporę przegubową lub całkowite usunięcie podpory).
   - Tworzenie "rozcięć" na końcach prętów dochodzących do węzłów w obwodach zamkniętych (uwolnienie momentu Mg, momentu Ms, lub siły tnącej T).
3. Wygeneruj kombinacje tych zwolnień biorąc po `n` elementów z puli.
4. Dla każdej kombinacji stwórz tymczasowy model strukturalny i sprawdź jego stabilność za pomocą istniejącego silnika MES (np. poprzez próbę zbudowania macierzy sztywności i sprawdzenie czy rzuca błąd osobliwości / mechanizmu).
5. Zwróć maksymalnie 3-5 stabilnych i logicznych rozwiązań do interfejsu (UI).
6. UI powinno wyświetlić listę kart (np. "Opcja 1: Usunięcie podpory X oraz dodanie przegubu w węźle Y").
7. Użytkownik wybiera jedną z opcji klikając "Wybierz ten układ". 

Zaimplementuj najpierw sam algorytm kombinatoryczny (logikę) generujący listę zdatnych układów bez integracji z aplikowaniem stanów jednostkowych (to zrobimy w kroku 2). Napisz mi w jaki sposób zmodyfikujesz kod.