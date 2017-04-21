# Write a method that takes a string and returns an array
# whose keys are all the downcased words in the string,
# and values are the number of times these words were seen.
#
# No punctuation will appear in the strings.
#
# Example:
# word_count "The dog and the cat" # => {"the" => 2, "dog" => 1, "and" => 1, "cat" => 1}

def word_count(str)
    counts = Hash.new { |my_hash, num| my_hash[num] = 0 }
    
    str.downcase.split(" ").each do |word|
        counts[word] += 1
    end   
    counts
    
end