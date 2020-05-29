# class Movie
class Movie < Product
  attr_accessor :title, :year, :director

  def initialize(params)
    super
    @title = params[:title]
    @year = params[:year]
    @director = params[:director]
  end

  def info
    "Фильм \"#{@title}\", реж. #{@director} (#{@year})"
  end

  # method for update movie parameters
  def update(params)
    super

    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end
end