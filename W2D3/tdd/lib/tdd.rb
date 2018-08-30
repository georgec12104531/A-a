class Array 
  
  def my_uniq
    result_array = []
    self.each do |num|
      result_array << num unless result_array.include?(num)
    end
    result_array
  end
  
  def two_sum
    indices = []
    (0...self.length - 1).each do |i|
      (i + 1...self.length).each do |j|
        indices << [i, j] if (self[i] + self[j]).zero?
      end
    end
    
    indices
  end
  
  def my_transpose
    raise ArgumentError, "array is empty!" if self.empty?
    result = Array.new(self.length) { Array.new }
    
    (0...self.length).each do |i|
      (0...self.length).each do |j|
        result[j] << self[i][j]
      end
    end
    
    result
  end


end