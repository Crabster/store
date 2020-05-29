# class product
require 'rexml/document'
include REXML

class Product
  attr_accessor :price, :amount

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  def info
  end

  # method for update product parameters
  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end
  # absctract method raise an error
  def self.from_file
    raise NotImplementedError
  end

  def self.read_from_xml(file_name)
      abort "Can't find xml file \"#{file_name}\"" unless File.exist?(file_name)

      result = []

      file = File.new(file_name)
      doc = REXML::Document.new(file)
      file.close

      doc.elements.each("products") do |type|
        type.elements.each("books/book") do |book|
          obj_book = Book.new(title: book.elements['title'].text,
                         genre: book.elements['genre'].text,
                         author: book.elements['author'].text,
                         price: book.elements['price'].text,
                         amount: book.elements['amount'].text)
          result << obj_book
          puts obj_book
        end
        type.elements.each("movies/film") do |movie|
          obj_movie = Movie.new(title: movie.elements['title'].text,
                                director: movie.elements['director'].text,
                                year: movie.elements['year'].text,
                                price: movie.elements['price'].text,
                                amount: movie.elements['amount'].text)

          result << obj_movie
        end
      end
      return result
  end

  def self.showcase(products)
    puts "Что хотите приобрести: \n\n"

    products.each_with_index do |item, index|
      puts "#{index}: #{item}"
    end
    puts "x. Покинуть магазин\n\n"
  end

  def buy

  end
end