# Write a program that outputs the lyrics for "Ninety-nine Bottles of Beer on the Wall"
# Your program should print the number of bottles in English, not as a number. For example:
#
# Ninety-nine bottles of beer on the wall,
# Ninety-nine bottles of beer,
# Take one down, pass it around,
# Ninety-eight bottles of beer on the wall.
# ...
# One bottle of beer on the wall,
# One bottle of beer,
# Take one down, pass it around,
# Zero bottles of beer on the wall.
#
# Your program should not use ninety-nine output statements!
# Design your program with a class named BeerSong whose initialize method 
# receives a parameter indicating the number of bottles of beer initially on the wall.
# If the parameter is less than zero, set the number of bottles to zero. Similarly,
# if the parameter is greater than 99, set the number of beer bottles to 99
# Then make a public method called print_song that outputs all stanzas from the number of bottles of beer down to zero.
# Add any additional methods you find helpful.

class BeerSong
    attr_accessor 'bottles'
    
    def initialize(bottles)
        if bottles <= 0
            @bottles = 0
        elsif bottles > 99
            @bottles = 99
        else
            @bottles = bottles
        end
    end
            
    def translate num
        if num == 0
            return 'Zero'
        end

        numString = ''  # This is the string we will return.
#p numString
        onesPlace = ['one','two','three','four','five','six','seven','eight','nine']  
        tensPlace = ['ten','twenty','thirty','forty','fifty','sixty','seventy','eighty','ninety']
        teenagers = ['eleven','twelve','thirteen','fourteen','fifteen',
               'sixteen', 'seventeen', 'eighteen', 'nineteen']

        # "left" is how much of the number we still have left to write out.
        # "write" is the part we are writing out right now.
        left  = num
        ones = true
        write = left/10          # How many tens left to write out?
        left  = left - write*10  # Subtract off those tens.
#p write, left, num
        if write > 0
            ones = false
            if ((write == 1) and (left > 0))
                # Since we can't write "tenty-two" instead of "twelve",
                # we have to make a special exception for these.
                numString = numString + teenagers[left-1]
                # The "-1" is because teenagers[3] is 'fourteen', not 'thirteen'.

                # Since we took care of the digit in the ones place already,
                # we have nothing left to write.
                left = 0
            else
                numString = numString + tensPlace[write-1]
                # The "-1" is because tensPlace[3] is 'forty', not 'thirty'.
            end

            if left > 0
                # So we don't write 'sixtyfour'...
                numString = numString + '-'
            end
            numString.capitalize!
        end
        
            
        write = left  # How many ones left to write out?
        left  = 0     # Subtract off those ones.
#p write, left
        if write > 0
            numString = numString + onesPlace[write-1]
            # The "-1" is because onesPlace[3] is 'four', not 'three'.
        end
        if ones 
            numString.capitalize! 
        end

        # Now we just return "numString"...
        numString
        
    end      
      
    def print_song

        while (@bottles > 0)
            
            word = translate @bottles
           
            if @bottles > 1 || @bottles == 0
                quantity = "bottles"
            elsif @bottles == 1
                quantity = "bottle"
            end
            
            puts "#{word} #{quantity} of beer on the wall,"
            puts "#{word} #{quantity} of beer,"
            puts 'Take one down, pass it around,'
            
            @bottles -= 1
            word = translate @bottles
            #p word, @bottles
                        if @bottles > 1 || @bottles == 0
                quantity = "bottles"
            elsif @bottles == 1
                quantity = "bottle"
            end
            
            puts "#{word} #{quantity} of beer on the wall."

        end
    end

end

beer = BeerSong.new 4
#beer.bottles = 50
beer.print_song