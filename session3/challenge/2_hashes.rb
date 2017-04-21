# Given a nonnegative integer, return a hash whose keys are all the odd nonnegative integers up to it
# and each key's value is an array containing all the even non negative integers up to it.
#
# Examples:
# staircase 1  # => {1 => []}
# staircase 2  # => {1 => []}
# staircase 3  # => {1 => [], 3 => [2]}
# staircase 4  # => {1 => [], 3 => [2]}
# staircase 5  # => {1 => [], 3 => [2], 5 =>[2, 4]}

def staircase(n)
    
    results = {}
    i = 1

    while i <= n do
        if i.odd? && i > 2
            local_arr = Array(1..i)
            local_arr.select! { |i| i.even? }
            results[i] = local_arr
        elsif i <= 2
            local_arr = []
            results[1] = local_arr
        end
        
        i += 1
    end
    
    results
   # p results
end

#p staircase(5)