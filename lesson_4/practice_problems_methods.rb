### PRACTICE PROBLEMS: METHODS AND MORE METHODS ###


# Practice Problem 1----------------------------------------------------
# What is the return value of the select method below? Why?
[1, 2, 3].select do |num|
    num > 5
    'hi'
end

# ANSWER
# => []
# The Array#select method considers 'truthiness' of the return value from the block
# and since num > 5 is false as there are no numbers > 5 in the collection. 
# A new blank collection is returned of lesser length than the original and this
# happens to be an empty array. 

# REVISED ANSWER (based off of irb)
# # => [1, 2, 3]
# because the the last line in the block is 'hi' and the Array#select considers 'truthiness' 
# in the return value of the block, 'hi' is considered 'truthy' and neither nil 
# or false, so the return value is an array with the original collection

# launch school's answer
#  => [1, 2, 3]
# select performs selection based on the truthiness of the block's return value. 
# In this case the return value will always be 'hi', which is a "truthy" value. 
# Therefore select will return a new array containing all of the elements in the 
# original array.


# Practice Problem 2-----------------------------------------------------------
# How does count treat the block's return value? How can we find out?
['ant', 'bat', 'caterpillar'].count do |str|
    str.length < 4
end

# ANSWER
# According to the ruby docs, if a block is given, Array#count counts the number 
# of elements for which the block returns a true value. In this case there are
# 2 string elements less than 4 in length including 'ant' and 'bat'.
# => 2

# Practice Problem 3------------------------------------------------------------
# What is the return value of reject in the following code? Why?
[1, 2, 3].reject do |num|
    puts num
end

# ANSWER
# => []
# According to the ruby docs, Array#reject returns a new array containing the 
# items in self for which the given block is not true. The ordering of non-rejected 
# elements is maintained. Since the last line puts num returns nil and is therefore
# not true or false, a new empty array will return. 

# launch school's answer
# => [1, 2, 3]
# Since puts always returns nil, you might think that no values would be selected 
# and an empty array would be returned. The important thing to be aware of here 
# is how reject treats the return value of the block. reject returns a new array
# containing items where the block's return value is "falsey". In other words, if
# the return value was false or nil the element would be selected.


# Practice Problem 4------------------------------------------------------------
# What is the return value of each_with_object in the following code? Why?
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
    hash[value[0]] = value
end

# ANSWER
# => {'ant'}
# According to the ruby docs, Enumerable#each_with_object iterates the given 
# block for each element with an arbitrary object given, and returns the 
# initially given object. It will return the given object {} with string 'ant' 
# as a value.

# launch school's answer
# # => { "a" => "ant", "b" => "bear", "c" => "cat" }
# When we invoke each_with_object, we pass in an object ({} here) as an argument. 
# That object is then passed into the block and its updated value is returned at 
# the end of each iteration. Once each_with_object has iterated over the calling 
# collection, it returns the initially given object, which now contains all of the 
# updates. In this code, we start with the hash object, {}. On the first iteration, 
# we add "a" => "ant" to the hash. On the second, we add "b" => "bear", and on the 
# last iteration, we add "c" => "cat". Thus, #each_with_object in this example 
# returns a hash with those 3 elements.


# Practice Problem 5------------------------------------------------------------
# What does shift do in the following code? How can we find out?
hash = { a: 'ant', b: 'bear' }
hash.shift

# Answer
# => [:a, "ant"]
# According to the ruby docs, Hash#shift removes a key-value pair from hsh and 
# returns it as the two-item array [ key, value ], or the hash's default value if 
# the hash is empty. This is destructive to the original array. As hash now returns
# => {:b=>"bear"}.


# Practice Problem 6------------------------------------------------------------
# What is the return value of the following statement? Why?
['ant', 'bear', 'caterpillar'].pop.size

# ANSWER
# => 11
# According to the ruby docs, Array#pop removes (destructively) the last element from self and returns it, 
# or nil if the array is empty. So the return value of the array from the pop method
# is the string object 'caterpillar'. String#size method is then used on the string object and 
# takes the return value 'caterpillar' from Array#pop. String#size methodd returns
# the character length of str, which is 11. 


# Practice Problem 7------------------------------------------------------------
# What is the block's return value in the following code? How is it determined? Also,
# what is the return value of Array#any? in this code and what does it output?
[1, 2, 3].any? do |num|
    puts num
    num.odd?
end
# Answer
# block => true for 1, false for 2, and true for 3 
# The blocks return value is determined by the last line of code in the block or 
# num.odd?. The method odd? looks at all the num's in the array 1, 2, and 3 and returns false
# or true as to whether or not each number is odd or not odd.
# any => true
# Enumerable#any? looks at the "truthiness" of the block's return value in order
# to determine what the method's return value will be. If the block returns a
# 'truthy' value for any of the element in the collection, then the Enumerable#any?
# method will return 'true'. Since 1 and 3 returned true in the block then any? 
# will return true.


# Practice Problem 8------------------------------------------------------------
# How does take work? Is it destructive? How can we find out?
arr = [1, 2, 3, 4, 5]
arr.take(2)

# ANSWER
# => [1, 2]
# take works by returning the first n elements from the array and returning a new
# array with the n elements. In this case n is 2 for a return of [1, 2]. To find
# out if it is destructive or not to the original arr array, we can run the code
# through irb. After running the code through irb, arr still returns the original
# array of [1, 2, 3, 4, 5] which means take it is not desctructive but creates a new
# array. 


# Practice Problem 9------------------------------------------------------------
# What is the return value of map in the following code? Why?
{ a: 'ant', b: 'bear' }.map do |key, value|
    if value.size > 3
        value
    end
end

# ANSWER
# => [:a, :b, 'bear']
# According to the ruby docs, map transforms the original hash and returns
# a new array made up of keys and values for the elements in the array. map does
# consider the the return value of the block and because the return value of the
# block is value for values > 3 letters, only the 'bear' value is retured out of 
# the two values. 

# launch school's answer
# => [nil, "bear"]
# There are some interesting things to point out here. First, the return value 
# of map is an array, which is the collection type that map always returns. Second, 
# where did that nil come from? If we look at the if condition (value.size > 3), 
# we'll notice that it evaluates to true when the length of value is greater than 3.
# In this case, the only value with a length greater than 3 is 'bear'. This means 
# that for the first element, 'ant', the condition evaluates to false and value 
# isn't returned. When none of the conditions in an if statement evaluates as true, 
# the if statement itself returns nil. That's why we see nil as the first element 
# in the returned array.


# Practice Problem 10-----------------------------------------------------------
# What is the return value of the following code? Why?
[1, 2, 3].map do |num|
  if num > 1 
    puts num
  else
    num
  end
end

# ANSWER
# => [1, nil, nil]
# map is a tranformation method that considers the return value of the block
# since the return value of the block form the condidtional for 2 and 3 in the array is nil 
# and 1 is 1 you get [1, nil, nil] for the return value. 

