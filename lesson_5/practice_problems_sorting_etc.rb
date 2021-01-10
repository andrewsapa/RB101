### Practice Problems: Sorting, Nested Collections and Working with Blocks ###


# Practice Problem 1------------------------------------------------------------
# How would you order this array of number string by descending numeric value?
arr = ['10', '11', '9', '7', '8']

# my answer
arr2 = arr.sort do |a, b|
  b.to_i <=> a.to_i
end

p arr2
# => ["11", "10", "9", "8", "7"]


# Practice Problem 2------------------------------------------------------------
# How would you order this array of hashes based on the year of publication of 
# each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

# my answer
my_arr = books.sort_by do |hash|
  values = hash.values
  values.each do |value|
    if value.to_s.to_i == value
      value.sort do |a, b|
       a <=> b
      end
    end
  end
end

p my_arr.reverse
# =>[{:title=>"War and Peace", :author=>"Leo Tolstoy", :published=>"1869"}, {:title=>"Ulysses", :author=>"James Joyce", :published=>"1922"}, 
#  {:title=>"The Great Gatsby", :author=>"F. Scott Fitzgerald", :published=>"1925"}, 
#  {:title=>"One Hundred Years of Solitude", :author=>"Gabriel Garcia Marquez", :published=>"1967"}]

# or LS's answer
books.sort_by do |book|
  book[:published]
end
# =>[{:title=>"War and Peace", :author=>"Leo Tolstoy", :published=>"1869"}, {:title=>"Ulysses", :author=>"James Joyce", :published=>"1922"}, 
#  {:title=>"The Great Gatsby", :author=>"F. Scott Fitzgerald", :published=>"1925"}, 
#  {:title=>"One Hundred Years of Solitude", :author=>"Gabriel Garcia Marquez", :published=>"1967"}]


# Practice Problem 3------------------------------------------------------------
# For each of these collection objects demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
p arr1[2][1][3] # => 'g'

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p arr2[1][:third][0] # => 'g'

arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3[2][:third][0][0] # => 'g'

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p hsh1['b'][1] # => 'g'

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p hsh2[:third].keys[0] # => 'g'


# Practice Problem 4------------------------------------------------------------
# For each of these collection objects where the value 3 occurs, demonstrate how
# you would change this to 4.

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
p arr1 # => [1, [2, 4], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
p arr2 # => [{:a=>1}, {:b=>2, :c=>[7, 6, 5], :d=>4}, 4]

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2] = [4] # or hsh1[:first][2][0] = 4
p hsh1 # => {:first=>[1, 2, [4]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
p hsh2 # => {["a"]=>{:a=>["1", :two, 4], :b=>4}, "b"=>5}


# Practice Problem 5------------------------------------------------------------
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" }, 
  "Grandpa" => { "age" => 402, "gender" => "male" }, 
  "Eddie" => { "age" => 10, "gender" => "male" }, 
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# figure out the total age of just the male members of the family. 
# my answer
sum = munsters.map do |name|
  ages = []
  if name[1]['gender'] == 'male'
    ages << name[1]['age']
  end
  ages.flatten.sum
end

p sum.sum # => 444

# LS's answer
total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

total_male_age # => 444


# Practice Problem 6------------------------------------------------------------
# Given this previously seen family hash, print out the name, age and gender of 
# each family member:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# ...like this:
# (Name) is a (age)-year-old (male or female).

# my answer
munsters.each do |name, details| # LS's answer uses .each_pair |name, details|
  puts "#{name} is a #{details['age']}-year-old #{details['gender']}."
end # =>
# Herman is a 32-year-old male.
# Lily is a 30-year-old female.
# Grandpa is a 402-year-old male.
# Eddie is a 10-year-old male.
# Marilyn is a 23-year-old female.


# Practice Problem 7------------------------------------------------------------
# Given this code, what would be the final values of a and b? Try to work this 
# out without running the code.
a = 2
b = [5, 8]
arr = [a, b] # => [2, [5, 8]]

arr[0] += 2 # => [4, [5, 8]]
arr[1][0] -= a # => [4, [3, 8]]


# Practice Problem 8------------------------------------------------------------
# Using the each method, write some code to output all of the vowels from the strings.
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# my answer
hsh.each do |key, array|
  array.join.split('').each do |char|
    if /[aeiou]/.match(char)
      puts char
    end
  end
end # =>
# e
# u
# i
# o
# o
# u
# e
# o
# e
# e
# a
# o

# LS's answer
vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char| # .chars is used here
      puts char if vowels.include?(char)
    end
  end
end


# Practice Problem 9------------------------------------------------------------
# Given this data structure, return a new array of the same structure but with the 
# sub arrays being ordered (alphabetically or numerically as appropriate) in 
# descending order. 

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

my_arr = arr.map do |array| # don't need my_arr = 
  array.sort do |a, b|
    b <=> a
  end
end

p my_arr
# => [["c", "b", "a"], [3, 2, 1], ["green", "blue", "black"]]


# Practice Problem 10------------------------------------------------------------
# Given the following data structure and without modifying the original array, use 
# the map method to retun a new array identical in structure to the original but where 
# the value of each integer is incremented by 1. 

# my answer
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.map do |hash|
  hash2 = hash.dup
  hash2.each do |key, value|
    hash2[key] = value + 1
  end
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]

p arr # => [{:a=>1}, {:b=>2, :c=>3}, {:d=>4, :e=>5, :f=>6}]


# LS's answer
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]

# or LS's answer
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  arr << incremented_hash
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]


# Practice Problem 11-----------------------------------------------------------
# Given the following data structure use a combination of methods, including either
# the select or reject method, to return a new array identical in structure to the
# original but containing only the integers that are multiples of 3. 
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# my answer
arr.map do |array|
  a = []
  array.select do |num|
    if num % 3 == 0
      a << num
    end
  end
end
# => [[], [3], [9], [15]]

# or with .reject
arr.map do |array|
  a = []
  array.reject do |num|
    if num % 3 != 0
      a << num
    end
  end
end
# => [[], [3], [9], [15]]

# LS's answer # no need for empty array
arr.map do |element|
  element.select do |num|
    num % 3 == 0
  end
end


# Practice Problem 12
# Given the following data structure, and without using the Array#to_h method,
# write some code that will return a hash where the key is the first item in each
# sub array and the value is the second item. 

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

hash = {}
arr.each do |array|
  hash[array[0]] = array[1]
end

p hash # => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}


# Practice Problem 13
# Given the following data structure, return a new array containing the same 
# sub-arrays as the original but ordered logically by only taking into consideration
# the odd numbers they contain. 

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
# The sorted array should look like this:
[[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# my answer
arr.sort_by do |array|
  array.select do |num|
    num.odd?
  end
end# => [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# or this answer more by accident
my_arr = arr.sort do |arraya, arrayb|
  arraya <=> arrayb
end

p my_arr.reverse # => [[1, 8, 3], [1, 6, 7], [1, 4, 9]]


# Practice Problem 14
# Given this data structure write some code to return an array containing the 
# colors of the fruits and the sizes of the vegetables. The sizes should be uppercase
# and the colors should be capitalized. 

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# The return value should look like this:
[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# my answer
array = []
hsh.select do |produce|
  if hsh[produce][:type] == 'fruit'
    colors = hsh[produce][:colors]
    array << colors.map do |color|
      color.capitalize
    end
  elsif hsh[produce][:type] == 'vegetable'
   array << hsh[produce][:size].upcase
  end
end

p array # => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# LS's answer
hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end
# => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]


# Practice Problem 15
# Given this data structure write some code to return an array which contains only 
# the hashes where all the integers are even. 
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hash|
  hash.all? do |key, value|
    value.all? do |e|
      e.even?
    end
  end
end
# => [{:e=>[8], :f=>[6, 10]}] 


# Practice Problem 16 
# A UUID is a type of identifier often used as a way to uniquely identify items...which 
# may not all be created by the same system. That is, without any form of synchronization, 
# two or more separate computer systems can create new items and label them with a 
# UUID with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of possible 
# UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 
# sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

# my answer, admittedly got stuck on this one and just looked it up
require 'securerandom'

def uuid_generator
  SecureRandom.uuid
end

uuid_generator
# => "a89dbf74-cc3b-443c-9914-e66bf40c3a83"  # example


# LS's answer, better answer to learn from but above answer more secure according
# LS discussion regarding RFC 4122-compliant UUID generation
def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end