module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        # Выбираем фильмы с более чем двумя странами и не нулевым рейтингом
        films_select = array.select { |film| !film['country'].nil? && film['country'].split(',').length >= 2 && film['rating_kinopoisk'].to_f.positive? }
        # Находим средний рейтинг
        total_raiting = films_select.reduce(0) { |total, film| total += film['rating_kinopoisk'].to_f }
        total_raiting / films_select.length
      end
      
      def chars_count(films, threshold)
        # Выбираем фильмы с рейтингом больше заданного
        films_rait_sel = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
        # Считаем количество 'и' в названиях фильмов
        films_rait_sel.map { |film| film['name'].count('и') }.reduce(:+)
      end
    end
  end
end
