class ProductWriter
  attr_accessor :price, :amount

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  def user_data
  end

  def to_xml(file_name)
    unless File.exist?(file_name)
      file = File.new(file_name, 'w+:UTF-8')
      file.puts "<?xml version='1.0' enconding='utf-8'?>"
      # file2 = File.new(file_name, 'r+:UTF-8')
      xml_doc = REXML::Document.new(file)
      xml_doc.add_element 'products'
      xml_doc.root.add_element 'books'
      xml_doc.root.add_element 'movies'
      xml_doc.root.add_element 'discs'
      xml_doc.write(file, 2)
      file.close
    end
  end
end

