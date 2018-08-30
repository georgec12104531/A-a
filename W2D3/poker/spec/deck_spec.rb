require 'deck'

RSpec.describe Deck do 
  describe '#initialize' do
    subject(:deck) { Deck.new }
    let(:card) { double({ value: 2, suit: "clubs" })}
    
    # allow(card).to receive(:value) { 2 }
    it 'creates an instance variable @deck that contains an array with a length of 52' do 
      expect(deck.cards.length).to eq(52)
      expect(deck.cards).to be_a(Array)
    end
    
    it 'instance variable @deck contains elements that are all of the card class' do 
      expect(deck.cards.first).to be_a(Card)
    end
    
    it 'instance variable @deck contains 52 unique elements' do 
      expect(deck.cards.uniq).to eq(deck.cards)
    end
  end
  
  
  
  
end