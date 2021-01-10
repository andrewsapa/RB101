### Nested Data Structures ###


## Referencing collection elements
arr = [[1, 3], [2]]

# referenced with indexes as [[0, 1], [0]] inner to outer [[0], [1]
arr[0] # => [1, 3]
arr[0][1] # => 3


# Updating collection elements-------------------------------------------------

arr = [[1, 3], [2]]
arr[1] = "hi there"
arr # => [[1, 3], "hi there"] # destructive method, permanently changed

arr = [[1, 3], [2]]
arr[0][1] = 5
arr # => [[1, 5], [2]] # destructive method, permanently changed


# inserting an additionl element into an inner array 
arr = [[1], [2]]
arr[0] << 3
arr # => [[1, [3]], [2]] # 3-layer nested data structure


## Other nested structures------------------------------------------------------

# hashes can also be nested within an array as well
# ex:

arr = [{ a: 'ant' }, { b: 'bear' }]

arr[0][:c] = 'cat'
arr # => [{ :a => "ant", :c => "cat"}, { :b => "bear" }] # destructive

# ex:
arr = [['a', ['b']], { b: 'bear', c: 'cat' }, 'cab']

arr[0]          # => ["a", ["b"]]
arr[0][1][0]    # => "b"
arr[1]          # => { :b => "bear", :c => "cat" }
arr[1][:b]      # => "bear"
arr[1][:b][0]   # => "b"
arr[2][2]       # => "b"


## Variable reference for nested collections------------------------------------
a = [1, 3]
b = [2]
arr = [a, b] # local variables a and b are pointing to array objects
arr # => [[1, 3], [2]]

a[1] = 5
arr # => [[1, 5], [2]] # gets changed to 5 here

arr [0][1] = 8
arr # => [[1, 8], [2]]
a # => [1 8]
# the same object is being modified here in both cases that bo a and arr point to


## Shallow Copy-----------------------------------------------------------------

# .dup and .close are methods that create a shallow copy of an object
# .dup ex:
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!

arr2 # => ["a", "B", "c"] # contents is the same here because .upcase! is destructive
arr1 # => ["a", "B", "c"]


# .clone ex:
arr1 = ["abc", "def"]
arr2 = arr1.clone
arr2[0].reverse!

arr2 # => ["cba", "def"] # contents is the same here because .reverse! is destructive
arr1 # => ["cba", "def"]

# more examples
# example1:
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
    char.upcase
end

arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]

# versus
arr1 = ["a", "b", "c"]
arr2 = arr1 # without .dup arr1 and arr2 are the same
arr2.map! do |char|
    char.upcase
end

arr1 # => ["A", "A", "C"]
arr2 # => ["A", "B", "C"]

# example2:
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
    char.upcase!
end

arr1 # => ["A", "B", "C"]
arr2 # => ["A", "B", "C"]


## Freezing Objects-------------------------------------------------------------
# in Ruby objects can be frozen in order to prevent them from being modified
# .clone preserves the frozen state of the object here
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.clone
arr2 << "d"
# => RuntimeError: can't modify frozen Array

# .dup does NOT preserve the frozen state of the object
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup
arr2 << "d"

arr2 # => ["a", "b", "c", "d"]
arr1 # => ["a", "b", "c"]


str = "abc".freeze
str << "d"
# => RuntimeError: can't modify frozen String
str.frozen? # => true


# .freeze only works on the object being called upon on
# for ex. with a nested a array the nested objects cant still be modified
arr = [[1], [2], [3]].freeze
arr[2] << 4
arr # => [[1], [2], [3, 4]]

arr = ["a", "b", "c"].freeze
arr[2] << "d"
arr # => ["a", "b", "cd"]


## Deep Copy--------------------------------------------------------------------
# There is no built-in or easy way to create a deep copy or deep freeze of objects
# within objects. 