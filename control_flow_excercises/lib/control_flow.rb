# # EASY
#




# # Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  new_string = str.chars.select {|el| el == el.upcase}
  new_string.join("")
end













#
# # Return the middle character of a string. Return the middle two characters if
#
# # the word is of even length, e.g. middle_substring("middle") => "dd",
# # middle_substring("mid") => "i"
# def middle_substring(str)
# 	middle = str.length / 2
# 	return str[middle - 1] + str[middle] if str.length.even?
# 	return str[middle]
# end
#
# # Return the number of vowels in a string.
# VOWELS = %w(a e i o u)
# def num_vowels(str)
#   str.each_char.count {|el| VOWELS.include?(el) }
# end
#
# # Return the factoral of the argument (num). A number's factorial is the product
# # of all whole numbers between 1 and the number itself. Assume the argument will
# # be > 0.
# def factorial(num)
#   (1..num).to_a.reduce(:*)
# end
#
#
# # MEDIUM
#
# # Write your own version of the join method. separator = "" ensures that the
# # default seperator is an empty string.
# def my_join(arr, separator = "")
#   return "" if arr == []
# 	empty_string = ""
# 	(0...arr.length-1).each do |i|
# 		empty_string << arr[i] + separator
# 	end
# 	empty_string + arr[-1]
# end
#
# # Write a method that converts its argument to weirdcase, where every odd
# # character is lowercase and every even is uppercase, e.g.
# # weirdcase("weirdcase") => "wEiRdCaSe"
# def weirdcase(str)
# 	(0..str.length-1).each do |i|
# 		current = i + 1
# 		str[i] = str[i].downcase if current.odd?
# 		str[i] = str[i].upcase if current.even?
# 	end
# 	str
# end
#
# # Reverse all words of five more more letters in a string. Return the resulting
# # string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# # my luck has desrever")
# def reverse_five(str)
# 	str = str.split(" ")
# 	str.map! do |el|
# 		el.length >= 5 ? el = el.reverse : el
# 	end
# 	str.join(" ")
# end
#
# # Return an array of integers from 1 to n (inclusive), except for each multiple
# # of 3 replace the integer with "fizz", for each multiple of 5 replace the
# # integer with "buzz", and for each multiple of both 3 and 5, replace the
# # integer with "fizzbuzz".
# def fizzbuzz(n)
# 	arr = (1..n).to_a
# 	(0..arr.length-1).each do |i|
# 		arr[i] = "fizzbuzz" if arr[i] % 3 == 0 and arr[i] % 5 == 0
# 		arr[i] = "fizz" if arr[i] % 3 == 0
# 		arr[i] = "buzz" if arr[i] % 5 == 0
# 	end
# 	arr
# end
#
#
# # HARD
#
# # Write a method that returns a new array containing all the elements of the
# # original array in reverse order.
# def my_reverse(arr)
# 	new_array = []
# 	arr.reverse_each {|el| new_array << el }
# 	new_array
# end
#
# # Write a method that returns a boolean indicating whether the argument is
# # prime.
# def prime?(num)
#   factors = (1..num).select {|el| num % el == 0}
#   factors.length == 2
# end
#
# # Write a method that returns a sorted array of the factors of its argument.
# def factors(num)
#   factors = (1..num).select {|el| num % el == 0}
#   factors.sort
# end
#
# # Write a method that returns a sorted array of the prime factors of its argument.
# def prime_factors(num)
#   num_factors = factors(num)
#   num_factors.select {|el| prime?(el)}
# end
#
# # Write a method that returns the number of prime factors of its argument.
# def num_prime_factors(num)
#   prime_factors(num).count
# end
#
#
# # EXPERT
#
# # Return the one integer in an array that is even or odd while the rest are of
# # opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
# def oddball(arr)
# 	even_odd = Hash.new {|k,v| k[v] = []}
# 	arr.each do |el|
# 		even_odd["even"] << el if el.even?
# 		even_odd["odd"] << el if el.odd?
# 	end
# 	odd_one_out = even_odd.values.select {|v| v.length == 1}
# 	odd_one_out[0][0]
# end
