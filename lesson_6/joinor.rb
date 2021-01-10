### joinor ###


# To be use with TTT bonus features
# => Choose a position to place a piece: 1, 2, 3, 4, 5, 6, 7, 8, or 9
# Currently, we're using the Array#join method, which can only insert a delimiter
# between the array elements, and isn't smart enough to display a joining word 
# for the last element.

# Write a method called joinor that will produce the following result:

def joinor(array, symbol = ', ', symbol_2 = 'or')
  if array.size == 2
    array.join(' ').insert(-2, 'or ')
  elsif array.size == 1
    array.join
  else
    array.join("#{symbol}").insert(-2, "#{symbol_2} ")
  end
end

p joinor([1])                      # => "1"
p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"