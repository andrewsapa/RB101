#### COLLECTIONS BASICS ####

### STRING ELEMENT REFERENCE ###---------------------------------------

str = 'abcdefghi'
# reference a specific character in a string using this index
str[2] # => 'c'
# reference multiple characters in a string here
str[2, 3] # => 'cde' (Here 'c' is 1, 'd' is 2, and 'e' is 3 for 3 letters.)
# str[2, 3] is actually a call to the #slice method of String and is an 
#altenative to this:
str.slice(2, 3) # => 'cde'
# The above is str[start, length] > new_str or nil (start index and a length)
# Also the same as this:
str[2..4] # => 'cde' (this is in range formate)
# Chaining Methods can be incorporated like this:
str[2, 3][0] # => 'c' (str[2, 3] returns 'cde' and then 'cde'[0] returns 'c')

# Practice: How would you reference 'grass' from within this string? Try it out in irb.
str = 'The grass is green'
str[4..8] # => 'grass' (uses the range)
str[4, 5] # => 'grass' (uses the start and length)
str.slice(4, 5) # => 'grass' (uses the .slice method)
# or could do this too
str_array = str.split(" ")
str_array[1] # => 'grass'


### ARRAY ELEMENT REFERENCE ###---------------------------------------

arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
arr[2] # => "c"

# Practice: What do you think would be returned here? Try it out in irb.
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
arr[2,3] # => ['c', 'd', 'e'] (returns array, is the same as Array#slice but is 
# different from String#slice)
arr.slice(2, 3) # => ['c', 'd', 'e']
arr[2, 3][0] # => 'c' (returns just the element without array)

arr = [1, 'two', :three, '4']
arr.slice(3, 1) # => ["4"]
arr.slice(3..3) # => ["4"]
arr.slice(3) # => "4"


### HASH ELEMENT REFERENCE ###--------------------------------------------

# hashes have key value pairs

hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot' }

hsh['fruit'] # => 'apple'
hsh['fruit'][0] # => "a"

# When initializing a hash, the keys must be unique. Try the following code out in irb.
hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }
# irb states "warning: key "fruit" is duplicated and overwritten"
hsh # now returns => {"fruit"=>"pear", "vegetable"=>"carrot"} 

# values can be duplicated however...
hsh = { 'apple' => 'fruit', 'carrot' => 'vegetable', 'pear' => 'fruit' }

country_capitals = { uk: 'London', france: 'Paris', germany: 'Berlin' }
country_capitals.keys # => [:uk, :france, :germany]
country_capitals.values # => ["London", "Paris", "Berlin"]
country_capitals.values[0] # => "London"

# The above examples uses symbols as keys. Although both hash keys and values can
# be any object in Ruby, it is common practice to use symbols as the keys. SYMBOLS
# IN RUBY CAN BE THOUGHT OF AS IMMUTABLE STRINGS. There's a number of advantages to
# using symbols for hash keys, which we won't go into here, but it is important to 
# be aware of this convention. 


### ELEMENT REFERENCE GOTCHAS ###-------------------------------------------

## Out of Bounds Indices ##
str = 'abcde'
arr = ['a', 'b', 'c', 'd', 'e']

str[2] # => "c"
arr[2] # => "c"

str[5] # => nil
arr[5] # => nil
# This is not necessarily a problem for a string, since we know that nil is an
# invalid return value; with an array, nil could be a valid return value since
# arrays can contain an other type of object, including nil. 
arr = [3, 'd', nil]
arr[2] # => nil
arr[3] # => nil
# How can we tell the difference between the valid return and the out-of-bounds reference?
#fetch
# fetch tries to return the element of position index, but throws an IndexError exception
# if the referenced index lies outside of the array bounds.
arr.fetch(2) # => nil
arr.fetch(3) # => IndexError: index 3 outside of array bounds

#fetch is actually better (safer) to use than #[] for catching indices that are out of bounds
# However most exiting Ruby code doesn't use #fetch.

## Neative Indices ##
str = 'abcde'
arr = ['a', 'b', 'c', 'd', 'e'] # ('e' -1 idx, 'd' -2 idx, 'c' -3 idx, 'b' -4 idx, 'a' -5 idx)

str[-2] # => "d"
arr[-2] # => "d"

# Practice: What do you think would be returned by the following calls?
str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

str[-6] # => nil
arr[-6] # => nil
arr.fetch(-6) # => IndexError: index -6 outside of array bounds: -5...5

## Invalid Hash Keys ##
# Hash also has a #fetch method which can be useful when trying to disa

hsh = { :a => 1, 'b' => 'two', :c => nil }

hsh ['b'] # => "two"
hsh[:c] # => nil
hsh['c'] # => nil
hsh[:d] # => nil

hsh.fetch(:c) # => nil
hsh.fetch(:c) # => KeyError: key not found: "c"
hsh.fetch(:d) # => KeyError: key not found: :d


### CONVERSION ###-------------------------------------------------------

str = 'Practice'
arr = str.chars # => ["P", "r", "a", "c", "t", "i", "c", "e"]
arr.join # => "Practice"

str = 'How do you get to Carnegie Hall?'
arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
arr.join # => "HowdoyougettoCarnegieHall?"

# Can you think of a couple of ways in which the items in the array could be joined
# together so that result resembles the original string? 

arr.join(' ') # => 'How do you get to Carnegie Hall?'
arr.select { |element| element }.join(' ') # => 'How do you get to Carnegie Hall?'
arr[0] + ' ' + arr[1] + ' ' + arr[2] + ' ' + arr[3] + ' ' + arr[4] + ' ' + arr[5] + ' ' + arr[6] # => 'How do you get to Carnegie Hall?'

hsh = { sky: "blue", grass: "green" }
hsh.to_a # => [[:sky, "blue"], [:grass, "green"]]

# Practice problem: What do you think if #to_h was called on the following array?
arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]

arr.to_h # => {:name=>"Joe", :age=>10, :favorite_color=>"blue"}
 
### ELEMENT ASSIGNMENT ###--------------------------------------------

## String Element Assignement ##
str = "joe's favorite color is blue"
str[0] = 'J'
str # => "Joe's favorite color is blue"

# Practice Problem: Using the same element assignment method, how would you change
# the first letter of the remaining words in the sentence to their uppercase versions?
# Try it out in a code file or in irb.
str[6] = 'F'
str[15] = 'C'
str[21] = 'I'
str[24] = 'B'
p str # => "Joe's Favorite Color Is Blue"

## Array Element Assignment ##
arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr # => [1, 2, 3, 4, 5]

# Practice Problem: In irb or a code file use the same method to increase the value
# of the rest of the integers in the array by 1. 
arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1
arr # => [2, 3, 4, 5, 6]

## Hash Element Assignment ##
hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh # => {:apple => "Fruit", :carrot => "Produce", :pear => "Produce", :broccoli => "Produce" }

# Practice Problem: In irb or a code file use the same method to set a value of either 'Fruit' or 'Vegetable' to
# each element in the hash. 
hsh[:carrot] = 'Vegetble'
hsh[:pear] = 'Fruit'
hsh[:broccoli] = 'Vegetable'
hsh # => {:apple=>"Fruit", :carrot=>"Vegetble", :pear=>"Fruit", :broccoli=>"Vegetable"}
