---
title: Stoliczku.pl API - Sprawdzanie dostępności restauracji
---

## Sprawdzanie dostępności restauracji

    GET /restaurants/:id/availability/:date/:hour/:seats

:id
: * numer id restauracji

:date
: * data w formacie RRRR-MM-DD
  * data nie może być w przeszłości

:hour
: * godzina w formacie GG-MM
  * Rezerwacja może być złożona z wyprzedzeniem równym co najmniej ilości sekund w polu advane_time restauracji.

  Przykład:

  Dla wartości advance_time = 3600 (60 minut) o godzinie 14:00 danego dnia, najbliższa rezerwacja może być w tym dniu złożona o godzinie 15:00.

:seats
: * liczba miejsc dla poszukiwanej rezerwacji

### Odpowiedź

<%= headers 200 %> <%= json(:availability) %>

### Komunikaty błędów:

Podana data jest w przeszłości:

<%= headers 422 %> <%= json(:past) %>

Brak miejsc w restauracji:

<%= headers 422 %> <%= json(:no_seats_available) %>

Podana data jest za daleko w przyszłości:

<%= headers 422 %> <%= json(:too_far) %>

Podana godzina jest zbyt wczesna. Klucz `from` zwraca najwcześniejszą możliwą godzinę rezerwacji:

<%= headers 422 %> <%= json(:before_advance) %>

Rezerwacja nie może być wykonana:

<%= headers 422 %> <%= json(:reservations_not_accepted) %>
