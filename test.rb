  require 'rexml/document'

  def read_from_xml(file_name)
    abort "Can't find xml file \"#{file_name}\"" unless File.exist?(file_name)

    file = File.new(file_name)
    doc = REXML::Document.new(file)
    file.close

    # puts doc.elements["products"]

products = []

    doc.elements.each("products") do |category|
      category.each_element("books") do

      end
      category.each_element("movies") do

      end
    end

  end

current_path = File.dirname(__FILE__)
read_from_xml(current_path + "/data/products.xml")
