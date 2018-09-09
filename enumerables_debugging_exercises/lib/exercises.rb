class Array
  def my_select(&blk)
    result = []
    i = 0
    while i < self.length
      result << self[i] if blk.call(self[i]) == true
      i += 1
    end
    result
  end
end



class Array
  def my_map(&blk)
    result = []
    i = 0
    while i < length
      result << blk.call(self[i])
      i += 1
    end
    result
  end
end


class Array
  def my_find(&blk)
    i = 0
    while i < self.length
      return self[i] if blk.call(self[i]) == true
      i += 1
    end
    nil
  end
end


class Array
  def my_any?(&prc)
    self.each do |el|
      return true if prc.call(el) == true
    end
    false
  end
end


class Array
  def my_all?(&blk)
    self.each { |el| return false if blk.call(el) == false or el == nil}
    true
  end
end


class Array
  # Write an array method that returns `true` if the array has duplicated
  # values and `false` if it does not
  def dups?
    # elements = Hash.new(true)
    self.uniq != self
  end
end


class Hash

  # # Hash#merge takes a proc that accepts three arguments: a key and the two
  # # corresponding values in the hashes being merged. Hash#merge then sets that
  # # key to the return value of the proc in a new hash. If no proc is given,
  # # Hash#merge simply merges the two hashes.
  # #
  # # Write a method with the functionality of Hash#merge. Your Hash#my_merge method
  # # should optionally take a proc as an argument and return a new hash. If a proc
  # # is not given, your method should provide default merging behavior. Do not use
  # # Hash#merge in your method.
  #
  #self = hash1

  #
  # 1. Combine the keys
  # 2. iterate throught keys, using the key I get the value, if they both have values



  def my_merge(hash2, &prc)

    combo_hash = Hash.new
    if block_given?
      combined_keys = self.keys + hash2.keys
      combined_keys.uniq.each do |key|

      	if self[key] != nil and hash2[key] != nil
         combo_hash[key] = prc.call(key, self[key], hash2[key])
        elsif self[key] == nil
        	combo_hash[key] = hash2[key]
        else
        	combo_hash[key] = self[key]
        end
      end
      return combo_hash
    else
      combined_hash = Hash.new
      self.each do |k, v|
        combined_hash[k] = v
      end
      hash2.each do |k, v|
        combined_hash[k] = v
      end
      return combined_hash
    end
  end

end

# test_hash_1 = { a: 10, b: 2 }
# test_hash_2 = { a: 5, b: 10, c: 3 }
# p test_hash_1.my_merge(test_hash_2) { |key, oldval, newval| newval - oldval }
# .to eq({a: -5, b: 8, c: 3})

#
# test_hash_1 = { a: 10, b: 2 }
# test_hash_2 = { b: 3, c: 4 }
# p test_hash_1.my_merge(test_hash_2)
#

#
# tes



# ({a: 10, b: 3, c: 4})

# test_hash_1.my_merge(test_hash_2)).to eq({a: 10, b: 3, c: 4})
