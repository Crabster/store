# Programm book and movie store

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/movie'

params = {
    price: 290,
    amount: 4
}

movie1 = Movie.new(params)

puts "Фильм Лион стоит #{movie1.price} р."
