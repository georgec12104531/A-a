require 'byebug'

class MaxIntSet
  def initialize(max)
    @store = Array.new(max) {false}
  end

  def insert(num)
    raise 'Out of bounds' if num < 0 || num > @store.size
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] << num
  end

  def remove(num)
    @store.each do |arr|
      arr.delete(num) if arr.first == num
    end 
  end

  def include?(num)
    @store.each do |arr|
      return true if arr[0] == num
    end 
    false 
  end

  private

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    
    if @count >= num_buckets
      resize!
    end 
    
    unless self.include?(num)
      @store[num % num_buckets] << num 
      @count += 1
    end 
  end

  def remove(num)
    @store.each do |arr|
      if arr.first == num
        arr.delete(num) 
        @count -= 1
      end 
    end 
  end

  def include?(num)
    @store.each do |arr|
      return true if arr[0] == num
    end 
    false 
  end

  private

  def [](num)
    @store[num % @store.length]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    # create a new store
    new_store = Array.new(num_buckets * 2) { Array.new }
    # access the nested @store array to expose each number
    @store.each do |array|
      array.each do |num|
        # shovel the old store into the new store 
        new_store[num % num_buckets] << num
      end
    end
    # reset the old store to the new store 
    @store = new_store
  end
end
