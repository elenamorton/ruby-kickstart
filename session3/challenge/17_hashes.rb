# Print to stdout, each element in a hash based linked list, in reverse.
# If you don't know what that is, go check out the previous problem.
#
# EXAMPLES:
# head = {:data => 1, :next => nil}
# head = {:data => 2, :next => head}
#
# print_list_in_reverse head   # >> "1\n2\n"

def print_list_in_reverse(list)
    output = []
    while list
        output << list[:data]
        list = list[:next]
    end
    puts output.reverse!
end


head = {:data => 1, :next => nil}
print_list_in_reverse head
head = {:data => 2, :next => head}
print_list_in_reverse head