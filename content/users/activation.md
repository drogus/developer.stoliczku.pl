---
title: Stoliczku.pl API - Rejestracja użytkowników
---

## Rejestracja użytkowników

    POST /activations

### Parametry
activation_token
: * kod aktywacyjny, który użytkownik dostanie w smsie

### Odpowiedź
Poprawne zapytanie zwróci aktywowanego użytkownika:

<%= headers 200 %> <%= json(:registered_user) %>

### Błędy walidacji
Kod aktywacyjny nie został podany:

<%= headers 422 %> <%= json(:token_is_blank) %>

Kod aktywacyjny jest nieprawidłowy:

<%= headers 422 %> <%= json(:token_not_found) %>

Kod aktywacyjny jest już zużyty:

<%= headers 422 %> <%= json(:token_used) %>
