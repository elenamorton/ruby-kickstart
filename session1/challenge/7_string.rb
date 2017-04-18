# given a string, return the character after every letter "r"
# 
# pirates_say_arrrrrrrrr("are you really learning Ruby?") # => "eenu"
# pirates_say_arrrrrrrrr("Katy Perry is on the radio!")   # => "rya"
# pirates_say_arrrrrrrrr("Pirates say arrrrrrrrr")        # => "arrrrrrrr"

def pirates_say_arrrrrrrrr(string)
    final_string = ""

    for index in 0..(string.length - 2)
      if string[index] == 'r' || string[index] == 'R'
          final_string << string[index + 1]
      end
    end
    
    final_string
end

#puts pirates_say_arrrrrrrrr("Pirates say arrrrrrrrr")
