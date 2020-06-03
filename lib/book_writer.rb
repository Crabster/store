class BookWriter < ProductWriter
  attr_accessor :title, :genre, :author

  def initialize(params)
    super
    @title
    @genre
    @author
  end

  def user_data
    puts 'Введите название книги'
    @title = STDIN.gets.strip
    puts 'Кто автор произведения?'
    @author = STDIN.gets.strip
    puts 'В каком жанре написана книга?'
    @genre = STDIN.gets.strip
  end

  def to_xml(file_name)
    super
    file = File.open(file_name, 'r:UTF-8')

    new_element = REXML::Element.new('book')
    new_element.add_element('title').add_text("#{@title}")
    new_element.add_element('genre').add_text("#{@genre}")
    new_element.add_element('author').add_text("#{@author}")
    new_element.add_element('price').add_text("#{@price}")
    new_element.add_element('amount').add_text("#{@amount}")

    xml_doc = REXML::Document.new(file)
    xml_doc.root.elements['books'].add_element(new_element)

    file = File.open(file_name, 'w:UTF-8')
    # solution to avoid unneccessary '\n' between tags
    formatter = REXML::Formatters::Pretty.new
    formatter.compact = true
    formatter.write(xml_doc, file)
    file.close
  end
end