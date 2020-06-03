class AskUser
  def self.ask(choice, params)
    case choice
    when 0
      BookWriter.new(params)
    when 1
      MovieWriter.new(params)
    when 2
      DiskWriter.new(params)
    end
  end
end
