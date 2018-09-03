class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count >= num_buckets
      resize!
    end 
    unless self.include?(key)
      @store[key.hash % num_buckets] << key
      @count += 1
    end 
  end

  def include?(key)
    @store.each do |arr|
      return true if arr[0] == key
    end 
    false
  end

  def remove(key)
    @store.each do |arr|
      if arr.first == key
        arr.delete(key) 
        @count -= 1
      end 
    end 
  end

  private

  def [](key)
    # optional but useful; return the bucket corresponding to `key`
  end

  def num_buckets
    @store.length
  end

  def resize!
    # create a new store
    new_store = Array.new(num_buckets * 2) { Array.new }
    # access the nested @store array to expose each number
    @store.each do |array|
      array.each do |key|
        # shovel the old store into the new store 
        new_store[key.hash % num_buckets] << key
      end
    end
    # reset the old store to the new store 
    @store = new_store
  end
end



# class ResizingIntSet
#   attr_reader :count
# 
#   def initialize(num_buckets = 20)
#     @store = Array.new(num_buckets) { Array.new }
#     @count = 0
#   end
# 
#   def insert(num)
# 
#     if @count >= num_buckets
#       resize!
#     end 
# 
#     unless self.include?(num)
#       @store[num % num_buckets] << num 
#       @count += 1
#     end 
#   end
# 
#   def remove(num)
#     @store.each do |arr|
#       if arr.first == num
#         arr.delete(num) 
#         @count -= 1
#       end 
#     end 
#   end
# 
#   def include?(num)
#     @store.each do |arr|
#       return true if arr[0] == num
#     end 
#     false 
#   end
# 
#   private
# 
#   def [](num)
#     @store[num % @store.length]
#     # optional but useful; return the bucket corresponding to `num`
#   end
# 
#   def num_buckets
#     @store.length
#   end
# 
#   def resize!
#     # create a new store
#     new_store = Array.new(num_buckets * 2) { Array.new }
#     # access the nested @store array to expose each number
#     @store.each do |array|
#       array.each do |num|
#         # shovel the old store into the new store 
#         new_store[num % num_buckets] << num
#       end
#     end
#     # reset the old store to the new store 
#     @store = new_store
#   end
# end
