
class Dictionary

  attr_accessor :entries, :keywords

  def initialize
    @entries = {}
    @keywords = []
  end

  def add(entry)
    if entry.class == Hash
      key = entry.keys.first
      @entries.merge!(entry)
      @keywords << key

    else
      @entries[entry] = nil
      @keywords << entry
    end

  end

  def find(entry)
    @entries.select { |word, definition| word.include?(entry) }
  end

  def include?(entry)
    @keywords.include?(entry)
  end

  def keywords
    @keywords.sort
  end

  def printable
    keywords.map do |word|
      %Q{[#{word}] "#{@entries[word]}"}
    end.join("\n")


  end

end
