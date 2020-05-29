# Programm book and movie store

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/movie'
require 'rexml/document'
# require_relative 'lib/product_collection'

# current programm file path
current_path = File.dirname(__FILE__)

# create empty array for products
products = []
# parsing xml file into products array
products = Product.read_from_xml(current_path + "/data/products.xml")

choice = nil
total = 0
# inifinite cycle for buying until user choose "x"
while choice != "x"
  Product.showcase(products)

  choice = STDIN.gets.strip
  if choice != 'x' && (0...products.size) === choice.to_i
    total += products[choice.to_i].buy
    puts "Your intermediate total is: #{total} \n\n"
  end
end

puts "Thanks for shopping! Your total is #{total} roubles."
