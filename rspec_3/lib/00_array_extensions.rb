# Sum
#
# Write an Array method, `sum`, that returns the sum of the elements in the
# array. You may assume that all of the elements are integers.

class Array
  def sum
    return 0 if self.empty?
    self.reduce(:+)
  end
end

# Square
#
# Write an array method, `square`, that returns a new array containing the
# squares of each element. You should also implement a "bang!" version of this
# method, which mutates the original array.

class Array
  def square!
    self.map! {|num| num **2}
  end

  def square
    self.map {|num| num ** 2}
  end
end

# Finding Uniques
#
# Monkey-patch the Array class with your own `uniq` method, called
# `my_uniq`. The method should return the unique elements, in the order
# they first appeared:
#
# ```ruby
# [1, 2, 1, 3, 3].my_uniq # => [1, 2, 3]
# ```
#
# Do not use the built-in `uniq` method!

class Array
  def my_uniq
    final_array = []
    self.each do |num|
    	final_array << num if !final_array.include?(num)
    end
    final_array
  end
end

# Two Sum
#
# Write a new `Array#two_sum` method that finds all pairs of positions
# where the elements at those positions sum to zero.
#
# NB: ordering matters. I want each of the pairs to be sorted smaller
# index before bigger index. I want the array of pairs to be sorted
# "dictionary-wise":
#
# ```ruby
# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
# ```
#
# * `[0, 2]` before `[1, 2]` (smaller first elements come first)
# * `[0, 1]` before `[0, 2]` (then smaller second elements come first)


# Input: array
# Output: nested array
#
# Gameplan:
# - Use a nested each loop i / j
# - final_array <<  [arr[i], arr[j]] if arr[i] + arr[j] == 0 unless final.include the reverse
# - return the final array


class Array
  def two_sum
    final_array = []
    (0...self.length-1).each do |i|
      (i+1...self.length).each do |j|
        reversed = [j, i].reverse
        final_array << [i, j] if self[i] + self[j] == 0 unless final_array.include?(reversed)
      end
    end
    final_array
  end
end

# Median
#
# Write a method that finds the median of a given array of integers. If
# the array has an odd number of integers, return the middle item from the
# sorted array. If the array has an even number of integers, return the
# average of the middle two items from the sorted array.
#
# Input: Array
# Output: Array
#
# Gameplan:
# - Find the middle index
# - if even?
#  - 4/2 = 2
#  - 4/2 = 2 subtract 1
#
# - If odd?
#   - 3/2 = 1

class Array
  def median
    return nil if self.empty?
    array_length = self.length
    midde_index = self.length / 2
    if self.length.odd?
      return self.sort[midde_index]
    else
      average = (self.sort[midde_index] + self.sort[midde_index - 1]) / 2.0
      return average
    end
  end
end

# My Transpose
#
# To represent a *matrix*, or two-dimensional grid of numbers, we can
# write an array containing arrays which represent rows:
#
# ```ruby
# rows = [
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ]
#
# row1 = rows[0]
# row2 = rows[1]
# row3 = rows[2]
# ```
#
# We could equivalently have stored the matrix as an array of
# columns:
#
# ```ruby
# cols = [
#     [0, 3, 6],
#     [1, 4, 7],
#     [2, 5, 8]
#   ]
# ```
#
# Write a method, `my_transpose`, which will convert between the
# row-oriented and column-oriented representations. You may assume square
# matrices for simplicity's sake. Usage will look like the following:
#
# ```ruby
# matrix = [
#   [0, 1, 2],
#   [3, 4, 5],
#   [6, 7, 8]
# ]
#
# matrix.my_transpose
#  # => [[0, 3, 6],
#  #    [1, 4, 7],
#  #    [2, 5, 8]]
# ```
#
# Don't use the built-in `transpose` method!


class Array
  def my_transpose
  	empty_array = []
  	self.length.times {empty_array << []}
  	(0...self.length).each do |i|
  		(0...self.length).each do |j|
  			empty_array[j] << self[i][j]
  		end
  	end
  	empty_array
  end
end


# Bonus: Refactor your `Array#my_transpose` method to work with any rectangular
# matrix (not necessarily a square one).
