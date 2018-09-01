class Book

  BANISHED_WORDS = [
    "the",
    "over",
    "a",
    "an",
    "and",
    "of",
    "in"
  ]
  attr_accessor :title


  def initialize
    @title = nil
  end

  def title_split
    @title.split(" ")
  end

  def title
    title_split.map!.with_index do |word, i|
      current_word = title_split[i]
      if i != 0 and BANISHED_WORDS.include?(word)
        current_word
      else
        current_word.capitalize
      end
    end.join(" ")
  end

end
