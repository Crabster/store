# class product
class Product
  attr_accessor :price, :amount

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end
  # abstract method every subclass defines this method
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
  # method to parse xml file
  def self.read_from_xml(file_name)
      # check if xml file exist
      abort "Can't find xml file \"#{file_name}\"" unless File.exist?(file_name)
      # create an empty array where our movie and books obj will be store
      result = []

      file = File.new(file_name)
      doc = REXML::Document.new(file)
      file.close
      # goes to products elements in xml
      doc.elements.each("products") do |type|
        # goes to books/book elements in xml
        type.elements.each("books/book") do |book|
          # create an object Book class with instance variables
          obj_book = Book.new(title: book.elements['title'].text,
                         genre: book.elements['genre'].text,
                         author: book.elements['author'].text,
                         price: book.elements['price'].text.to_i,
                         amount: book.elements['amount'].text.to_i)
          #put new Book obj in array
          result << obj_book
        end
        # goes to movie/film elements in xml
        type.elements.each("movies/film") do |movie|
          # create an object Movie class with instance variables
          obj_movie = Movie.new(title: movie.elements['title'].text,
                                director: movie.elements['director'].text,
                                year: movie.elements['year'].text,
                                price: movie.elements['price'].text.to_i,
                                amount: movie.elements['amount'].text.to_i)
          #put new Movie obj in array
          result << obj_movie
        end
      end
      return result
  end
  # method to show what is store consist of
  def self.showcase(products)
    puts "Что хотите приобрести: \n\n"

    products.each_with_index do |item, index|
      puts "#{index}: #{item.show}"
    end
    puts "x. Покинуть магазин\n\n"
  end
  # method for buying product
  def buy
    if @amount > 0
      puts "* * *"
      puts "You bought #{info}"
      puts "* * *\n\n"
      @amount -= 1
      price
    else
      puts "Unfortuantelly slod out"
      0
    end
  end
  # method to show info about product
  def show
    "#{info} - #{@price} roubles. [amount: #{@amount}]"
  end
end