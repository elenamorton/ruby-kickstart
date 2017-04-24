# Write a method, spiral_access, that takes a 2d square array (an array of arrays)
# and a block, and calls the block for each of the elements, in spiral order.
#
# HINT: This method is probably best sovled recursively
#
# Example:
# two_d = [
#   [ 1,  2,  3,  4, 5],
#   [16, 17, 18, 19, 6],
#   [15, 24, 25, 20, 7],
#   [14, 23, 22, 21, 8],
#   [13, 12, 11, 10, 9],
# ]
# order = []
# spiral_access two_d do |i|
#   order << i
# end
# order # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]


two_d = [
   [ 1,  2,  3,  4, 5],
   [16, 17, 18, 19, 6],
   [15, 24, 25, 20, 7],
   [14, 23, 22, 21, 8],
   [13, 12, 11, 10, 9],
 ]


def spiral_access(arr_d, i=0, &block)
    y_max = arr_d.length - 1
    x_max = arr_d.first.length - 1

    # base step
    return if y_max/2 < i || x_max/2 < i

    # top row
    i.upto x_max-i do |x|
        block.call arr_d[i][x]
    end

    # right column
    (i + 1).upto y_max-i do |y|
        block.call arr_d[y][x_max - i]
    end

    # bottom row
    (x_max - 1 - i).downto i do |x|
        block.call arr_d[y_max - i][x]
    end

    # left column
    (y_max - 1 - i).downto i + 1 do |y|
        block.call arr_d[y][i]
    end

    # recursive step
    spiral_access arr_d, i + 1, &block
end

order = []
spiral_access two_d do |i|
   order << i
end
p order
#p spiral_access [[1]]