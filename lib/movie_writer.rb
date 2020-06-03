class MovieWriter < ProductWriter
  attr_accessor :title, :year, :director

  def initialize(params)
    super
    @title
    @year
    @director
  end

  def user_data
    puts 'Введите название фильма'
    @title = STDIN.gets.strip
    puts 'В каком году снят фильм?'
    @year = STDIN.gets.strip
    puts 'Кто режиссер фильма?'
    @director = STDIN.gets.strip
  end

  def to_xml(file_name)
    super
    file = File.open(file_name, 'r:UTF-8')

    new_element = REXML::Element.new('film')
    new_element.add_element('title').add_text("#{@title}")
    new_element.add_element('year').add_text("#{@year}")
    new_element.add_element('director').add_text("#{@director}")
    new_element.add_element('price').add_text("#{@price}")
    new_element.add_element('amount').add_text("#{@amount}")

    xml_doc = REXML::Document.new(file)
    xml_doc.root.elements['movies'].add_element(new_element)

    file = File.open(file_name, 'w:UTF-8')
    # solution to avoid unneccessary '\n' between tags
    formatter = REXML::Formatters::Pretty.new
    formatter.compact = true
    formatter.write(xml_doc, file)
    file.close
  end
end