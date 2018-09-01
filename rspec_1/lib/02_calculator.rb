def add(num1, num2)
  sum = num1 + num2
end

def subtract(num1, num2)
  sum = num1 - num2
end

def sum(arr)
  arr.empty? ? 0 : sum = arr.reduce(:+)
end

def multiply(arr)
  arr.reduce(:*)
end

def power(num1, num2)
  num1 ** num2
end

def factorial(num)
  return 0 if num == 0
  product = 1
  (1..num).each {|el| product *= el}
  product
end
