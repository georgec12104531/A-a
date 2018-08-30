class Card 
  
  attr_reader :value, :suit
  
  def initialize(value, suit)
    raise ArgumentError, 'Wrong Inputs!' unless value.is_a?(Integer) && suit.is_a?(String)
    @value, @suit = value, suit
  end
  
  def inspect
    "Suit:#{suit} value:#{value}"
  end
  
end