---
title: Stoliczku.pl API - Wyszukiwanie restauracji
---

## Parametry

name
: * nazwa restauracji lub jej część

special_offer
: * jeśli ma wartość `true` wyszukuje tylko restauracje z ofertą specjalną

cuisines
: * tablica zawierająca typy kuchni

localization
: * tablica zawierająca 3 klucze: `longitude` - długość geograficzną, `latitude` - szerokość geograficzną, `distance` - maksymalna odległość w metrach od podanego punktu

availablity
: * tablica zawierająca 3 klucze: `date` - data rezerwacji, `hour` - godzina rezerwacji, `seats` - liczba miejsc do rezerwacji
  * parametr `date` powinien mieć format RRRR-MM-DD
  * parametr `hour` powinien mieć format GG-MM

### Przykładowe parametry żądania
Szukanie po nazwie:

    {"name": "Pizzeria"}

Szukanie po typach kuchni:

    {"cusines": ["pizza","amerykańska"]}

Szukanie restauracji w pewnym promieniu od danego punktu:

    {
      "localization": {
        "longitude": "11",
        "latitude": "20",
        "distance": 1000
      }
    }

Szukanie po nazwie, typie kuchni i odległości:

    {
      "name": "Pizzeria",
      "cusines": ["pizza","amerykańska"],
      "localization": {
        "longitude": "11",
        "latitude": "20",
        "distance": 1000
      }
    }

### Odpowiedź
<%= headers 200 %> <%= json(:restaurant){|h| [h]} %>

### Odpowiedź gdy parametr availability jest dostępy
<%= headers 200 %> <%= json(:restaurant_with_availability){|h| [h]} %>

