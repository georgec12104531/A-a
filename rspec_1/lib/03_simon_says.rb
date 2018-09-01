def echo(str)
  str
end

def shout(str)
  str.upcase
end

def repeat(str)
  str + " " + str
end

def repeat(str, repeats=2)
	og_str = str.dup
  until repeats == 1
  	og_str += " #{str}"
  	repeats -= 1
  end
  og_str
end

def start_of_word(str, num)
  str[0...num]
end

def first_word(str)
  str = str.split(" ")
  str[0]
end

def titleize(str)
	str = str.split(" ")
  first_word = str[0][0].upcase + str[0][1..-1]
  return first_word if str.length == 1
  final_array = str.map do |st|
    if st != "and" and st != "or" and st != "over" and st != "the"
      (st[0].upcase + st[1..-1])
    else
    	st
    end
  end
  final = [first_word] + final_array[1..-1]
  final.join(" ")
end
