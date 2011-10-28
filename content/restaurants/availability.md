---
title: Stoliczku.pl API - Sprawdzanie dostępności restauracji
---

## Sprawdzanie dostępności restauracji

    GET /restaurants/:id/availability/:from/:seats

:id
: * numer id restauracji

:date
: * data w formacie RRRR-MM-DD
  * data nie może być w przeszłości

:hour
: * godzina w formacie GG-MM
  * należy podać godzinę późniejszą niż obecna o wartość sekund w polu `advance_time` restauracji

:seats
: * liczba miejsc dla poszukiwanej rezerwacji

### Odpowiedź

<%= headers 200 %> <%= json(:availability) %>
