### METHODS ### 

#  Looking a built in methods: each, select, and map.

## EACH ##-------------------------------------------------

# loop example 
numbers = [1, 2, 3]
counter = 0

loop do
    break if counter == numbers.size
    puts numbers[counter]
    counter += 1
end

# the each method, is a method is functionally equivalent, simpler way to using loop

[1, 2, 3]. each do |num|
    puts num
end

# do...end is the block
# |num| is the argument for each iteration

# for hashes you need two arguments in order to represent both key and and value
hash = { a: 1, b: 2, c: 3 }

hash.each do |key, value|
    puts "The key is #{key} and the value is #{value}"
end

# one could use either .each method or loop to iterate of an array or hash
# but the difference is in the return value. .each methd returns the original collection

# .each example
[1, 2, 3]. each do |num|
    puts num
end

# => [1, 2, 3] returns original collection

# method definition, with .each method
def a_method
    [1, 2, 3].each do |num|
        puts num * 2
    end
end

a_method # => [1, 2, 3] returns original collection

# method definitino, with .each method, and statement added after #each
def a_method
    [1, 2, 3].each do |num|
        puts num * 2
    end

    puts 'hi'
end

a_method # => nil is the return value because the last line uses puts method whose return value is nil

## SELECT ##-----------------------------------------------------------

[1, 2, 3].select do |num|
    num.odd?
end

# to perform selection, select evalutes the return value of the block. 
# the block returns a value on each iteration, which than gets evaluated by select
# when evaluating the block's return value, select only cares about it's truthiness
# Remember in Ruby, everything is considered 'truthy' except for nil and false. 

[1, 2, 3].select do |num|
    num + 1
end

# returns => [1, 2, 3]

# If the block's return value is always "truthy", then all of the elements will 
# be selected. When an element is selected, it's placed in a new collection. In 
# the above example, once select is done iterating, it returns a new collection 
# containing all of the selected elements, because the selection criteria -- the 
# block's return value -- is truthy for every element in the array.

[1, 2, 3].select do |num|
  num + 1
  puts num
end
# => []


## map ##------------------------------------------------------------------
# map uses the return value of the block to perform transformation instead of 
# selection. map doesn't care about truthiness
[1, 2, 3].map do |num|
    num * 2
end
# => [2, 4, 6]  returns new collection, the value of the product of num * 2
[1, 2, 3].map do |num|
    num.odd?
end
#  => [true, false, true] returns an array of booleans here


# What will the return value of map be in the following example?
[1, 2, 3].map do |num|
    num.odd?
    puts num
end
#  => [nil, nil, nil] 

# What if the only statement within the block is a string? What will the return 
# value of map be?
[1, 2, 3].map do |num|
  'hi'
end
#  => ["hi", "hi", "hi"] 

## Enumerable ##--------------------------------------------------------
# not all methods are available to all different types of objects
# array and hash both have the 'each' method specific to them

# select and map (and other) methods are defined to the Enumerable module. they 
# work with array and hash

# Important: certain collection types have access to specific methods for a reason.

#-------------------------------------------------------------------------------
# METHOD |  ACTION  | CONSIDERS THE    |  RETURNS A NEW     |  LENGTH OF       |
#        |          | RETURN VALUE OF  |  COLLECTION FROM   |  THE RETURNED    |
#        |          | THE BLOCK?       |  THE METHOD?       |  COLLECTION      |
# -------|----------|------------------|--------------------|-------------------
#  each  |Iteration |   No             |No, always returns  |Length of         |
#        |          |                  |    the original    | original         |
# -------|----------|------------------|--------------------|-------------------
# select |Selection |   Yes, its       |    Yes             |Length of original|
#        |          |   truthiness     |                    | or less          |
#--------|----------|------------------|--------------------|-------------------
# map    |Transfor- |   Yes            |    Yes             |Length of original|
#        |mation    |                  |                    |                  |
#--------|----------|------------------|--------------------|-------------------