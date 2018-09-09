# Input: Array
# Output: Hash
#
class Array
#   Write a new Array method (using monkey-patching) that will return
#   the location of all identical elements. The keys are the
#   duplicated elements, and the values are arrays of their positions,
#   sorted lowest to highest.
  def dups
    positions = Hash.new { |h, k| h[k] = [] }
    self.each_with_index do |item, index|
      positions[item] << index
    end
    positions.select { |key, val| val.count > 1 }
  end
end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.
  #
  # : ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)
#
#
# ([5, 1, -7, -5].pair_sum(0)).to eq([[0, 3
#
  def pair_sum(target)
    pairs = []
    (0...self.length).each do |i|
      (i + 1...self.length).each do |j|
        pairs << [i, j].sort if self[i] + self[j] == target
      end
    end
    pairs
  end
end

#
# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.
#
def caesar_cipher(str, shift)
  letters = ("a".."z").to_a
  encoded_str = ""
  str.each_char do |char|
    if char == " "
      encoded_str << " "
      next
    end
    old_idx = letters.find_index(char)
    new_idx = (old_idx + shift) % 26
    encoded_str << letters[new_idx]
  end
  encoded_str
end


# Jumble sort
 # takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet=nil)
  alphabet = ("a".."z").to_a unless alphabet != nil
  sorted = false
  while sorted == false
    sorted = true
    str.length.times do |times|
      (0...str.length-1).each do |i|
        current_letter = str[i]
        current_letter_index = alphabet.find_index(current_letter)
        next_letter = str[i + 1]
        next_letter_index = alphabet.find_index(next_letter)
        if current_letter_index > next_letter_index
          str[i], str[i + 1] = str[i + 1], str[i]
          # current_letter, next_letter = next_letter, current_letter
          sorted = false
        end
      end
    end
  end
  str
end


# Write a method that will transpose a rectangular matrix (array of arrays)
def transpose(matrix)
  final_array = Array.new
  (0...matrix[0].length).each do |i|
    new_array = Array.new
    (0...matrix.length).each do |j|
      new_array.push(matrix[j][i])
    end
    final_array.push(new_array)
  end
  final_array
end


#need help explaining

class Array
  def my_inject(accumulator = nil, &block)
    i = 0
    if accumulator.nil?
      accumulator = self[0]
      i += 1
    end
    while i < self.length
      accumulator = block.call(accumulator, self[i])
      i += 1
    end
    accumulator
  end
end
