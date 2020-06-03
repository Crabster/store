puts 'Какой товар вы хотите добавить'

require_relative 'lib/products_writer'
require_relative 'lib/ask_user'
require_relative 'lib/book_writer'
require_relative 'lib/movie_writer'
require_relative 'lib/disk_writer'
require 'rexml/document'

user_choice = nil

until user_choice == 'x' do
  puts '0: Book'
  puts '1: Movie'
  puts '2: Disk'
  puts 'X: Exit'
  user_choice = STDIN.gets.strip.downcase
  break if user_choice == 'x'
  if (0..2).include?(user_choice.to_i)
    puts 'Укажите стоимость продукта в рублях'
    product_price = STDIN.gets.to_i

    puts 'Укажите остаток товара на складе'
    product_amount = STDIN.gets.to_i

    product_obj = AskUser.ask(user_choice.to_i, {price: product_price, amount: product_amount})

    product_obj.user_data

    file_name = File.dirname(__FILE__) + '/data/products.xml'

    product_obj.to_xml(file_name)
  end
end

