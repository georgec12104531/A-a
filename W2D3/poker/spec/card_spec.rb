require 'card'

RSpec.describe Card do 
  
  subject(:card) { Card.new(2, "clubs")}

  
  describe "#initialize" do 
    
    
    it "excepts an integer as an argument and assigns it to an instance variable: value" do 
      expect(card.value).to be_a(Integer)
      expect(card.value).to eq(2)
    end
    
    it "accepts a string as an argument and assigns it to an instance variable: suit" do 
      expect(card.suit).to be_a(String)
      expect(card.suit).to eq("clubs")
    end
    
    context "passing in wrong arguments" do 
      it "raises an argument error if input types are not an integer followed by a string" do 
        expect { Card.new( "clubs", 2) }.to raise_error(ArgumentError, "Wrong Inputs!")
      end
    end
    

  end
  
end