### SORTING ###

# Sorting is mostly performed on arrays: since items in arrays are accessed via 
# their index, the order in which those items appear is important. 

# Since Ruby 1.9, it is possible to sort a hash but you don't usually need to to
# do this as hashes are accessible by their keys.

## What is sorting?-------------------------------------------------------------
# Sorting is setting the order of the items in a collection according to a certain
# criterion. 

### .sort ### and .sort_by ###
            
# ex:
[2, 3, 3, 4, 1].sort # => [1, 2, 3, 4, 5]
# return value is a new array order sequentially

## Comparison-------------------------------------------------------------------
# Comparision is at the heart of how sorting works. The items in the collection
# are compared to each other and then ordered. 

# ex:
['c', 'a', 'e', 'b', 'd'].sort # => ['a', 'b', 'c', 'd', 'e']

## The <=> Method---------------------------------------------------------------
# Ruby uses <=> the comparison operator(or spaceship operator) to compare items
# in a collection in order to sort. 

# Any object in a collection must use <=> method. -1, 0, or 1 is returned

# -1,  first object < second object
# 0,  first object == second object
# 1,  first object > greater than second object
# nil, if the two objects can NOT be compared

2 <=> 1 # => 1
1 <=> 2 # => -1
2 <=> 2 # => 0
'b' <=> 'a' # => 1
'a' <=> 'b' # => -1
'b' <=> 'b' # => 0
1 <=> 'a' # => nil

# If <=> returns nil to sort then it throws an argument error.

['a', 1].sort # => ArgumentError: comparison of String with 1 failed

# If you want to sort a collection that contains particular types of objects 
# (e.g. strings or integers) you need to know two things:

    # 1.Does that object type implement a <=> comparison method?
    # 2.If yes, what is the specific implementation of that method for that object type (e.g. String#<=> will be implemented differently to Integer#<=>).

# The String#<=> order is determined by a characater's position in the ASCII table.
# ASCII (American Standard Code for Information Interchange)

# It is this ASCII character order that determines the result if we compare one 
# ASCII character with another using the String#<=> method.

'A' <=> 'a' # => -1 # 'A' precedes 'a' in ASCIIbetical order

'!' <=> 'A' # => -1 # '!' precedes 'A' in ASCIIbetical order

# You can determin a string's ASCII position by calling .ord on the string
'b'.ord # => 98
'}'.ord # => 125

'b' <=> '}' # => -1

# Don't need to remember positions of ASCII table. Useful rules:

    # 1.Uppercase letters come before lowercase letters
    # 2.Digits and (most) punctuation come before letters
    # 3.There is an extended ASCII table containing accented and other characters 
    #   (this comes after the main ASCII table).


## The .sort method-------------------------------------------------------------

[2, 5, 3, 4, 1].sort do |a, b| # [2, 5, 3, 4, 1].sort by itself 
    a <=> b                    # does the same thing here
end
# => [1, 2, 3, 4, 5]


[2, 5, 3, 4, 1].sort do |a, b|
    b <=> a
end
# => [5, 4, 3, 2, 1]


[2, 5, 3, 4, 1].sort do |a, b|
  puts "a is #{a} and b is #{b}"
  a <=> b
end
# a is 2 and b is 5
# a is 5 and b is 3
# a is 2 and b is 3
# a is 5 and b is 4
# a is 3 and b is 4
# a is 5 and b is 1
# a is 4 and b is 1
# a is 3 and b is 1
# a is 2 and b is 1
# => [1, 2, 3, 4, 5]


# Practice Problems-------------------------------------------------------------

['arc', 'bat', 'cape', 'ants', 'cap'].sort
# guess => ['ants', 'arc', 'bat', 'cap', 'cape']
# result => ["ants", "arc", "bat", "cap", "cape"]

[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
# guess => [['b', 2], ['a', 'car', 'd'], ['a', 'car', 'd', 3], ['a', 'cat', 'b', 'c']]
# result => # => [["a", "car", "d"], ["a", "car", "d", 3], ["a", "cat", "b", "c"], ["b", 2]]


# The sort_by method------------------------------------------------------------
# sorty_by is like sort but is usualy called with a block

# ex:
['cat', 'bed', 'mat'].sort_by do |word|
    word[1]
end
# => ["mat", "bed", "cat"] # organized at index 1 by 'a', 'e', 'o'

# normally wouldn't sort a hash but if you wanted to
people = { Kate: 27, john: 25, Mike: 18 }

people.sort_by do |_, age|
    age
end
# => [[:Mike, 18], [:john, 25]] # an array is alwasy returned, even with hash

people.sort_by do |name, _|
    name.capitalize # need capitalize here as :john is lower case
end
# => [[:john, 25], [:Kate, 27], [:Mike, 18]]


## Special note
# Array#sort has an Array#sort! => returns a new collection and is desctructive
# Array#sort_by has an Array#sort_by! => returns a new collection and is destructive


## Other methods which use comparison <=>-------------------------------------------
# min
# max
# min_by
# max_by
# minmax_by

