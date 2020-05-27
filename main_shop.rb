# Programm book and movie store

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/movie'
require_relative 'lib/product_collection'

products = []

# Create some movies and books
movie1 = Movie.new(
  title: 'Леон', year: 1994, director: 'Люк Бессон', price: 990, amount: 5
)
products << movie1

movie2  = Movie.new(
  title: 'Дурак', year: 2014, director: 'Юрий Быков', price: 390, amount: 1
)
products << movie2

book1 = Book.new(
  title: 'Идиот', genre: 'Роман', author: 'Федор Достоевский', price: 1490, amount: 10
)
products << book1

# Show products in console
puts "Вот такие товары у нас в наличии: \n\n"

products.each { |item| puts item.to_s }

current_path = File.dirname(__FILE__)

# path to books and movies lists
path_movie = '/data/movies/01.txt'
path_book = '/data/books/01.txt'

movie3 = Movie.from_file(current_path + path_movie)
book2 = Book.from_file(current_path + path_book)

# Print books and movies was readed from file
puts movie3.to_s
puts book2.to_s

begin
  Product.from_file(current_path + path_movie)
rescue
  puts 'Метод класса не реализован'
end



