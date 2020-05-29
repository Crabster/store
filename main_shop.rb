# Programm book and movie store

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/movie'
require_relative 'lib/product_collection'

current_path = File.dirname(__FILE__)

# products = ProductCollection.from_dir(current_path + "/data")

# products.sort!(by: :title, order: :asc)

# products.products.each do |item|
#   puts item
# end
products = []
products = Product.read_from_xml(current_path + "/data/products.xml")

puts products

choice = nil

# while choice != "x"
#   Product.showcase(products)
#
#   choice = STDIN.gets.strip
#
#
#
# end

# path to books and movies lists
path_movie = '/data/movies/01.txt'
# path_book = '/data/books/01.txt'

# movie3 = Movie.from_file(current_path + path_movie)
# book2 = Book.from_file(current_path + path_book)

# Print books and movies was readed from file
# puts movie3.to_s
# puts book2.to_s

# begin
#   Product.from_file(current_path + path_movie)
# rescue
#   puts 'Метод класса не реализован'
# end



