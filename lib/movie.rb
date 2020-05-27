# class Movie
class Movie < Product
  attr_accessor :title, :year, :director

  # method to read from file
  def self.from_file(path)
    line = File.readlines(path, chomp: true)

    self.new(
        title: line[0],
        director: line[1],
        year: line[2],
        price: line[3],
        amount: line[4]
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @year = params[:year]
    @director = params[:director]
  end

  def to_s
    "Фильм \"#{@title}\", #{@year}, реж. #{@director}, #{super}"
  end

  # method for update movie parameters
  def update(params)
    super

    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end
end