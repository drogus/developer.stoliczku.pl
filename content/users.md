---
title: Stoliczku.pl API - Rejestracja użytkowników
---

## Rejestracja użytkowników

    POST /registration

### Parametry

first_name
: * imię użytkownika
last_name
: * nazwisko użytkownika
phone
: * numer telefonu
email
: * email
password
: * hasło
password_confirmation
: * potwierdzenie hasła
city
: * miasto
birth_date
: * data urodzenia
terms_of_service
: * akceptacja regulaminu

### Przykładowe parametry

    {
      "first_name": "Jan",
      "last_name": "Kowalski",
      "phone": "344-555-111",
      "email": "jan.kowalski@example.org",
      "password": "secret",
      "password_confirmation": "secret",
      "city": "Warszawa",
      "birth_date": "2011-10-20",
      "terms_of_service": true
    }

### Odpowiedź
Poprawne zapytanie zwróci zarejestrowanego użytkownika:

<%= headers 200 %> <%= json(:registered_user) %>

### Błędy walidacji

Jeśli nie będzie można stworzyć użytkownika, to zostanie zwrócony status 422 oraz klucze w których występują błędy wraz z ich opisem:

<%= headers 422 %> <%= json(:registration_validation_error) %>
