require 'pp'
require 'yajl/json_gem'
require 'stringio'

module Stoliczku
  module Resources
    module Helpers
      STATUSES = {
        200 => '200 OK',
        201 => '201 Created',
        204 => '204 No Content',
        301 => '301 Moved Permanently',
        304 => '304 Not Modified',
        401 => '401 Unauthorized',
        403 => '403 Forbidden',
        404 => '404 Not Found',
        409 => '409 Conflict',
        422 => '422 Unprocessable Entity',
        500 => '500 Server Error'
      }

      def headers(status, head = {})
        css_class = (status == 204 || status == 404) ? 'headers no-response' : 'headers'
        lines = ["Status: #{STATUSES[status]}"]
        head.each do |key, value|
          case key
            when :pagination
              lines << 'Link: <http://api.stoliczku.pl/resource?page=2>; rel="next",'
              lines << '      <http://api.stoliczku.pl/resource?page=5>; rel="last"'
            else lines << "#{key}: #{value}"
          end
        end

        %(<pre class="#{css_class}"><code>#{lines * "\n"}</code></pre>\n)
      end

      def json(key)
        hash = case key
          when Hash
            h = {}
            key.each { |k, v| h[k.to_s] = v }
            h
          when Array
            key
          else Resources.const_get(key.to_s.upcase)
        end

        hash = yield hash if block_given?

        %(<pre class="highlight"><code class="llanguage-javascript">#{JSON.pretty_generate(hash)}</code></pre>")
      end
    end

    RESTAURANT = {
      "additional_info"          => "Przytulny lokal, miła obsługa",
      "alias"                    => "restauracja-pizzeria",
      "anticipation_time"        => "2000-01-01T00:30",
      "created_at"               => "2011-01-01T00:00:00+01:00",
      "description"              => "Najlepsza pizza w mieście",
      "gastro_rating"            => 4.44,
      "latitude"                 => "52.228535",
      "longitude"                => "21.015639",
      "menu"                     => "Wszystkie rodzaje pizzy",
      "name"                     => "Restauracja Pizzeria",
      "phone"                    => "22 777 77 77",
      "postcode"                 => "29915",
      "price_range"              => "20_40",
      "seats"                    => 20,
      "special_offer"            => "Darmowa druga pizza w dostawie",
      "special_offer_conditions" => "Tylko dla zamówień powyżej 100 zł",
      "street"                   => "ul. Nieistniejąca 21",
      "updated_at"               => "2011-10-26T12:19:53+02:00",
      "www"                      => "example.biz",
      "opening_hours"            => {
        "monday" => {
          "from" => "2000-01-01T12:00",
          "to"   => "2000-01-01T23:00"
        },
        "tuesday" => {
          "from" => "2000-01-01T12:00",
          "to"   => "2000-01-01T23:00"
        },
        "wednesday" => {
          "from" => "2000-01-01T12:00",
          "to"   => "2000-01-01T23:00"
        },
        "thursday" => {
          "from" => "2000-01-01T12:00",
          "to"   => "2000-01-01T23:00"
        },
        "friday" => {
          "from" => "2000-01-01T12:00",
          "to"   => "2000-01-01T23:00"
        },
        "saturday" => {
          "from" => "2000-01-01T12:00",
          "to"   => "2000-01-01T23:00"
        },
        "sunday" => {
          "from" => "2000-01-01T12:00",
          "to"   => "2000-01-01T23:00"
        }
      },
      "advance"  => 7200,
      "city"     => "Wrocław",
      "province" => "Dolnośląskie",
      "cuisine"  => "pizza",
      "district" => "Stare Miasto"
    }

    AVAILABILITY = {
      "availability" => [
        {"from" => "15:30", "available" => false},
        {"from" => "15:45", "available" => false},
        {"from" => "16:00", "available" => true},
        {"from" => "16:15", "available" => true},
        {"from" => "16:30", "available" => true},
      ]
    }

    RESTAURANT_WITH_AVAILABILITY = RESTAURANT.merge(AVAILABILITY)

    PAST = {:message => 'selected_time_is_in_the_past'}

    NO_SEATS_AVAILABLE = {:message => 'no_seats_available'}

    TOO_FAR = {:message => 'search_date_is_too_far_in_future'}

    BEFORE_ADVANCE = {:message => 'hour_is_before_advance', :from => "16:00"}

    RESERVATIONS_NOT_ACCEPTED = {:message => 'reservations_not_accepted'}

    REGISTERED_USER = {
      "first_name" => "Jan",
      "last_name" => "Kowalski",
      "phone" => "344-555-111",
      "email" => "jan.kowalski@example.org",
      "city" => "Warszawa",
      "birth_date" => "1980-12-12"
    }

    REGISTRATION_VALIDATION_ERROR = {
      "message" => "Błąd walidacji",
      "errors" => [
        {
          "field" => "password",
          "code"  => "wprowadzone hasło i jego powtórzenie różnią się"
        },
        {
          "field" => "city",
          "code"  => "nie może być puste"
        }
      ]
    }

    TOKEN_IS_BLANK = {"message" => 'activation_token_is_blank'}
    TOKEN_NOT_FOUND = {"message" => 'activation_token_not_found'}
    TOKEN_USED = {"message" => 'activation_token_already_used'}
  end
end

include Stoliczku::Resources::Helpers
