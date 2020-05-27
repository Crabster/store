# class Book
class Book < Product
  attr_writer :title, :genre, :author

  def initialize(params)
    super
    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    puts "Книга \"#{@title}\", #{@genre}, автор #{@author}, #{super}"
  end

  # method for update book parameters
  def update(params)
    super
    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end
  # method to read from file
  def self.from_file(path)
    line = File.readlines(path, chomp: true)

    self.new(
      title: line[0],
      genre: line[1],
      author: line[2],
      price: line[3],
      amount: line[4]
    )
  end
end