class ProductCollection

  attr_reader :products
  # COnstants with product types
  PRODUCT_TYPES = {
      books: {dir: 'books', class: Book},
      movies: {dir: 'movies', class: Movie}
  }
  # create an empty products array if nothing comes
  def initialize(products = [])
    @products = products
  end

  # Listing directories contained data
  def self.from_dir(dir_path)
    products = []
    PRODUCT_TYPES.each do |type, hash|
      product_dir = hash[:dir]
      product_class = hash[:class]

      Dir[dir_path + '/' + product_dir + '/*.txt'].each do |path|
        products << product_class.from_file(path)
      end
    end
    # create new objects which contains all our movies and books
    self.new(products)
  end

   # method sort
   def sort!(params)
    case params[:by]
    when :title
      @products.sort_by! { |product| product.title }
    when :price
      @products.sort_by! { |product| product.price.to_i }
    when :amount
      @products.sort_by! { |product| product.amount.to_i }
    end

    @products.reverse! if params[:order] == :asc

    self
  end
end