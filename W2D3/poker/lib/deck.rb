require_relative 'card'

class Deck 
  
  SUITS = %w[clubs diamonds spades hearts]
  FACE_CARDS = {1 => 'Ace', 
    10 => 'Jack', 
    11 => 'Queen', 
    12 => 'King', 
    13 => 'Ace'}
  
  attr_reader :cards
  
  def initialize
    @cards = create_cards
  end
  
  
  
  private 
  
  def create_cards 
    cards = []
    SUITS.each do |suit|
      (1..13).each do |i|
        cards << Card.new(i, suit)
      end
    end
    cards
  end
  
  
  
end