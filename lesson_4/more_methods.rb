### MORE METHODS ###

# Enumerable#any?------------------------------------------------------
[1, 2, 3].any? do |num|
    num > 2
end
# => true

# Consider both the return value of the method and the return value of the block
# in the above expression. any? looks at the 'truthinesss' of the block's 
# return value in order to determine what the method's return value will be
# If the block returns a "truthy" value for any of the element in the collection,
# then the any? method weill return 'true'. 
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
    value.size > 4
end
# => false

# Enumberable#all?-------------------------------------------------------
# all? functions in a similar way to any?. It also looks at the truthiness of the
# block's return value, but the method only returns true if the block's return
# value in every iteration is truthy (that is, not false or nil).
[1, 2, 3].all? do |num|
    num > 2
end
# => false

{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
    value.length >= 3
end
# => true


# Enumerable#each_with_index----------------------------------------------------
# each_with_index is like each but it takes a second argument for the index
[1, 2, 3].each_with_index do |num, index|
    puts "The index of #{num} is #{index}."
end
# The index of 1 is 0.
# The index of 2 is 1.
# The index of 3 is 2.
# => [1, 2, 3]

# with a hash each_with_index uses key and value
{ a: "ant", b: "bear", c: "cat" }.each_with_index do |pair, index|
    puts "The index of #{pair} is #{index}."
end

# The index of [:a, "ant"] is 0.
# The index of [:b, "bear"] is 1.
# The index of [:c, "cat"] is 2. 
# => { :a => "ant", :b => "bear", :c => "cat" }
# just like each, each_with_index always returns the original calling collection.


# Enumerable#each_with_object---------------------------------------------------
# In addition to taking a block, each_with_object takes a method argument. The 
# method argument is a collection object that will be returned by the method.
# Also the block takes 2 arguments of its own. The first block argument represents
# the current element and the second block argument represents the collection object
# that was passed in as an argument to the method. The method returns the collection 
# object that was passed in after it's done iterating. 
[1, 2, 3].each_with_object([]) do |num, array|
    array << num if num.odd?
end
# => [1, 3]

{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
    array << pair.last
end
# => ["ant", "bear", "cat"]

{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
    hash[value] = key
end
# => { "ant" => :a, "bear" => :b, "cat" => :c }


# Enumerable#first--------------------------------------------------------
# first doesn't take a block, but it does take an optional argument which represents
# the number of elements to return. When no argument is given, it returns only 
# the first element in the colletion.
[1, 2, 3].first
# => 1
# first with an argument
{ a: "ant", b: "bear", c: "cat" }.first(2)
# => [[:a, "ant"], [:b, "bear"]]

[[:a, "ant"], [:b, "bear"]].to_h
#=> {:a=>"ant", :b=>"bear"} 
# first is usually not used on hashes

# Enumerable#include?------------------------------------------------------
# include? doesn't take a block, but it does require one argument. It returns true
# if the argument exists in the collection and false if it doesn't. When called on
# on hash include? only checks the keys, not the values.
{ a: "ant", b: "bear", c: "cat" }.include?("ant")
# => false
{ a: "ant", b: "bear", c: "cat" }.include?(:a)
# => true
# Hash#include? is essentially like Hash#key? or Hash#has_key?
# Hash# key? or Hash#has_key?
# Hash#value? or Hash#has_value?
# Hash.values.include?

# Enumerable#partition-----------------------------------------------------
# partition divides up elements in the current collection into two collections,
# depending on the block's return value
[1, 2, 3].partition do |num|
    num.odd?
end
# => [[1, 3], [2]]

odd, even = [1, 2, 3].partition do |num|
    num.odd?
end

odd # => [1, 3]
even # => [2]

# even if the collection is a hash, the return value of partition will always be an array
long, short = { a: "ant", b: "bear", c: "cat" }.partition do |key, value|
    value.size > 3
end
# => [[[:b, "bear"]], [[:a, "ant"], [:c, "cat"]]]
# to transform these arrays into a hash, we can invoke Array#to_h
long.to_h # => { :b => "bear" }
short.to_h # => { :a => "ant", :c => "cat" }
