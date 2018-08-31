class Array
  
  # phase 1
  def my_min
    
    smallest_min_num = 0
    
    (0...length - 1).each do |i|
      (i + 1...length).each do |j|
        current_num = self[i]
        next_num = self[j]
        smallest_min_num = current_num if current_num < smallest_min_num
      end     
    end
    
    smallest_min_num
  end 
  
  #phase 2
  def my_min_2
    smallest_min_num = self.first 
    
    self.each do |num|
      smallest_min_num = num if num < smallest_min_num
    end
    
    smallest_min_num
  end
  
  #phase 1 
  def sub_sum
    subs = []
    
    (0...length).each do |start|
      (start...length).each do |ending|
        subs << self[start..ending].reduce(:+)
      end
    end
    
    subs.max
  end
  
  [1,2,-4,4,-3,4]
  #phase 2 
  def sub_sum_2 
    max = 0 # 1
    current = 0 # 3 

    
    self.each do |num|
    p "This is num"
    p num
    p  "current"
    p  current += num 
      if current < 0
        p "this is when current is less than 0"
        current = 0 
      end

      if current > max
        p "This is when current is greater than max"
        p max = current 
      end 
    end 
    
    p "MAXXX babyy"
    p max 
  end

  
end 

if __FILE__ == $0
  p [1,2,-4,4,-3,4].sub_sum_2
end 