---
title: Stoliczku API
---

# Stoliczku API

* <a href="#paginacja">Paginacja</a>
* <a href="#bdy">Błędy</a>

## Paginacja

Żądania do zasobów które zwracają wiele obiektów są domyślnie wyświetlane po 25 obiektów na stronę.
Za pomocą parametru `?page` można określić kolejne wyświetlane strony. Można również określić liczbę
obiektów na stronie za pomocą parametru `?per_page`, który nie może przyjąć wartości powyżej 100.

<pre class="terminal">
$ curl http://api.stoliczku.pl/restaurants?page=2&per_page=50
</pre>

Informacja o paginacji jest zawarta w nagłówku [Link](http://www.w3.org/Protocols/9707-link-header.html):

    Link: <https://api.stoliczku.pl/restaurants?page=3&per_page=100>; rel="next",
    <https://api.stoliczku.pl/restaurants?page=5&per_page=100>; rel="last"

Możliwe wartości `rel`:

`next`
: Pokazuje URL do następnej strony wyników.

`last`
: Pokazuje URL do ostatniej strony wyników.

`first`
: Pokazuje URL do pierwszej strony wyników.

`prev`
: Pokazuje URL do poprzedniej strony wyników.

## Błędy

Jeśli żądanie zwróciło kod błędu 422 odpowiedź będzie zawierała opis błędu:

<%= headers 422 %> <%= json(:error) %>
