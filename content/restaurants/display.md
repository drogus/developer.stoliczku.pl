---
title: Stoliczku.pl API - Wyświetlanie restauracji
---

## Lista restauracji

    GET /restaurants

### Odpowiedź

<%= headers 200, :pagination => true %> <%= json(:restaurant) { |h| [h] } %>
