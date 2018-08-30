require 'tdd'

RSpec.describe Array do 
  describe '#my_uniq' do 
    it 'returns unique elements in an array' do
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
    end
    
    it 'return a new array' do 
      expect([1, 2, 3].my_uniq).to_not be([1, 2, 3])
    end
  end
  
  
  describe "#two_sum" do 
    it "finds the indices where the sum equals zero" do 
      expect([-1, 0, 2, -2, 1].two_sum).to include([0, 4])
      expect([-1, 0, 2, -2, 1].two_sum).to match_array([[0, 4], [2, 3]])
    end
    
    it "returns the indices in order" do 
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
    
  end
  
  describe "#my_transpose" do 
    subject(:rows)  { [[0, 1, 2],[3, 4, 5],[6, 7, 8]] }
    let(:cols) { [[0, 3, 6], [1, 4, 7],[2, 5, 8]] }
    
    it 'returns a transposed matrix' do 
      expect(rows.my_transpose).to eq(cols)
    end
    
    it 'returns an array with the same length' do 
      expect(rows.my_transpose.length).to eq(rows.length)
    end
    
    it 'result array has the same elements as input array' do 
      expect(rows.my_transpose.flatten.sort).to match_array(rows.flatten.sort)
    end
      
    it "raises an error when input is an empty array" do 
      expect { [].my_transpose }.to raise_error(ArgumentError, "array is empty!")
    end
  end

end
