def pig_latinify(str)
  vowels = "aeiouAEIOU"
  until vowels.include?(str[0])
    if str[0..1] == "qu"
    	str = str[2..-1] + str[0..1]
    else
      str = str[1..-1] + str[0]
    end
  end
  str + "ay"
end
#pig_latinify("quick")

def translate(string)
  string = string.split(" ")
  string.map! {|word|	pig_latinify(word)}
  string.join(" ")
end


translate("hello")
