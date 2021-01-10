### PRACTICE PROBLEMS: ADDITIONAL PRACTICE ###


# Practice Problem 1-------------------------------------------------------
# Given the array below
flintstones = ['Fred', 'Barney', 'Wilma', 'Betty', 'Peblles', 'BamBam']
# Turn this array into a hash where the names are they keys and the values are
# the positions in the array.
# Assuming positions mean indexes...

def array_to_hash_with_index_as_value(array)
  new_hash = {}
  index_array = []
  counter_one = 0
  counter_two = -1
  
  loop do
    break if (counter_one == array.length) && (counter_two == array.length - 1)
    counter_two += 1
    index_array << counter_two
    current_value = index_array[counter_one]
    current_key = array[current_value]
    new_hash[current_key] = current_value
    counter_one += 1
  end
  new_hash
end

array_to_hash_with_index_as_value(flintstones)
# => {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Peblles"=>4, "BamBam"=>5}

# You could also break this up into two methods here for better readability:
def array_to_array_of_indexes(array)
  counter = -1
  index_array = []
  
  loop do
    break if counter == array.length - 1
    counter += 1
    index_array << counter
  end
  index_array # => [0, 1, 2, 3, 4, 5]
end

def array_to_hash_with_index_as_value(array)
  new_hash = {}
  counter = 0
  index_array = array_to_array_of_indexes(array)
  
  loop do
    break if counter == array.length
   
    current_value = index_array[counter]
    current_key = array[current_value]
    
    new_hash[current_key] = current_value
    
    counter += 1
  end
  new_hash
end

array_to_hash_with_index_as_value(flintstones)
# => {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Peblles"=>4, "BamBam"=>5

# or this way with new built in method using each_with_object
flintstones = ['Fred', 'Barney', 'Wilma', 'Betty', 'Peblles', 'BamBam']

flintstones.each_with_object({}) do |(key, value), hash|
  counter_one = -1
  index_array = []
  counter_two = 0
  
  loop do
    break if (counter_one == flintstones.length - 1) && (counter_two == flintstones.length)
    counter_one += 1
    index_array << counter_one
    
    value = index_array[counter_two]
    key = flintstones[counter_two]
    
    hash[key] = value
    counter_two += 1
  end
end
# => {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Peblles"=>4, "BamBam"=>5}

# launch school's (much simpler) answer:
flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

flintstones_hash 
# => => {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Peblles"=>4, "BamBam"=>5}


# Practice Problem 2------------------------------------------------------------
# Add up all of the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Marilyn" => 22, "Spot" => 237 }

# couple different answers
ages_array = []
ages.select do |name, age|
  ages[name] = age
  ages_array << age
end

ages_array.sum # => 6164

# or 
ages_array = ages.each_with_object([]) do |(_, age), array|
  array << age
end

ages_array.sum # => 6164

# or
ages_array = []
ages.all? do |name, age|
    array << age
end

ages_array.sum # => 6164

# or 
ages_array = []
ages.each do |name, age|
  array << age
end
ages_array.sum # => 6164

# launchschool's answers:

total_ages = 0
ages.each { |_,age| total_ages += age }
total_ages # => 6174
# or
ages.values.inject(:+) # => 6174


# Practice Problem 3------------------------------------------------------------
# In the age hash, remove people with age 100 and greater. 
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select do |name, age|
  if age > 100
    ages.delete(name)
  end
end

ages # => {"Herman"=>32, "Lily"=>30, "Eddie"=>10}
# removes destructively from the original hash  

# or another approach
new_ages = ages.each_with_object({}) do |(name, age), hash|
  if age > 100
    hash.delete(name)
  else
    hash[name] = age
  end
end

new_ages # => {"Herman"=>32, "Lily"=>30, "Eddie"=>10}
ages # => {"Herman"=>32, "Lily"=>30, "Grandpa"=>402, "Eddie"=>10}
# original ages hash still intact

# or with loop do
names = ages.keys
counter = 0
selected_ages = {}

loop do
  break if counter == names.size
  
  current_key = names[counter]
  current_value = ages[current_key]
  
  if current_value > 100
    ages.delete(current_value)
  else
    selected_ages[current_key] = current_value
  end
  
  counter += 1
  selected_ages
end

ages # => {"Herman"=>32, "Lily"=>30, "Grandpa"=>402, "Eddie"=>10}
selected_ages # => {"Herman"=>32, "Lily"=>30, "Eddie"=>10}

# or launchschool's answer
ages.keep_if { |_, age| age < 100 }
# you can also use Hash#select! too


# Practice Problem 4------------------------------------------------------------

# Pick out the minimum age from out current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

youngest = ages.min # => ["Eddie", 10]
youngest_hash = {}
youngest_hash[youngest[0]] = youngest[1]

youngest_hash # => {"Eddie"=>10}

# launchschool's answer:
ages.values.min # => 10

# Practice Problem 5------------------------------------------------------------
# In the array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find that index of the first name that starts with "Be"

# this solution would find whatever words start wtih 'Be'
flintstones.each_with_index do |name, index|
  if name.start_with?('Be')
   puts "#{name} is at index #{index}"
  end
end
# Betty is at index 3
# => > ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"] 

# or (this solution finds only the first name that starts with 'Be')
find_name = []
flintstones.any? do |name|
  if name.start_with?('Be')
    find_name << name
  end
end

be_index = flintstones.index(find_name[0]) # => 3
puts "#{find_name[0]} is at index #{be_index}."
# Betty is at index 3.

# or launchschool's answer:
flintstones.index { |name| name[0, 2] == "Be" } # => 3
# finds first 'Be' name, even if you add 'Betsy' to the array


# Practice Problem 6------------------------------------------------------------
# Amend this array so that the names are all shortened to just the first three
# characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# destructive
flintstones.map! do |name|
  name.slice(0, 3)
end

flintstones # => ["Fre", "Bar", "Wil", "Bet", "Bam", "Peb"]

# or non-destructive
short_flint = []
flintstones.select do |name|
  short_flint << name[0, 3]
end

short_flint # => ["Fre", "Bar", "Wil", "Bet", "Bam", "Peb"]

# launch school's answer:
flintstones.map! { |name| name[0, 3] }


# Practice Problem 7------------------------------------------------------------
# Create a hash that expresses the frequency with which each letter occurs in 
# this string:

statement = "The Flintstones Rock"
# example: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

characters = statement.split('')
counter = 0
count_array = []
count_hash = {}
  
loop do
  break if (counter == characters.length) && (counter == count_array.length)
    
  current_char = characters[counter]
    
  count_array << characters.count(current_char)
    
  current_count = count_array[counter]
    
  count_hash[current_char] = current_count
    
  counter += 1
    
  count_hash
end

count_hash # => {"T"=>1, "h"=>1, "e"=>2, " "=>2, "F"=>1, "l"=>1, "i"=>1, "n"=>2, "t"=>2, "s"=>2, "o"=>2, "R"=>1, "c"=>1, "k"=>1}
count_hash.sort.to_h # => {" "=>2, "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, "h"=>1, "i"=>1, "k"=>1, "l"=>1, "n"=>2, "o"=>2, "s"=>2, "t"=>2}

# if you don't want {""=>2}
new_char_array = count_hash.sort
new_char_array.shift
new_count_hash =  new_char_array.sort.to_h
new_count_hash # =>{"F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, "h"=>1, "i"=>1, "k"=>1, "l"=>1, "n"=>2, "o"=>2, "s"=>2, "t"=>2}

# or launchschool's answer:
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

result # => {"F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, "h"=>1, "i"=>1, "k"=>1, "l"=>1, "n"=>2, "o"=>2, "s"=>2, "t"=>2}


# Practice Problem 8------------------------------------------------------------
# What happens when we modify an array while we are iterating over it? What would
# be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number # => [1, 2, 3, 4]
  numbers.shift(1) # => [1]
end
# MY ANSWER:
# => [1, 2, 3, 4]
# => [1, 2, 3, 4]
# LAUNCH SCHOOL'S ANSWER:
# 1
# 3
# => [3, 4] 
# What would be output this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# ANSWER:
# 1
# 2
# => [1, 2]


# Practice Problem 9------------------------------------------------------------
# ruby on rails has a method called titleize that Ruby does not have
# the method creates a string that has each word capitalized like this:
words = "the flintstones rock"
# would be:
words = "The Flintstones Rock"
# Write your own version of the rails titleize implementation. 
words_array = words.split(' ')

words_array.map! do |word|
  word.capitalize
end

words_array.join(' ') # => "The Flintstones Rock"

# or with method def
words = "the flintstones rock"

def cap_each_word(string)
  words_array = string.split(' ')
  
  words_array.map! do |word|
    word.capitalize
  end
  
  words_array.join(' ')
end

cap_each_word(words) # => "The Flintstones Rock"

# launchschool's answer:
words.split.map { |word| word.capitalize }.join(' ')


# Practice Problem 10-----------------------------------------------------------
# Given the munsters hash below:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional 
# "age_group" key that has one of three values describing the age group the family 
# member is in (kid, adult, or senior). Your solution should produce the hash below

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
  
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

# I had trouble with this one although I had though about doing a case statement 
# at one point before looking at the hint. I Wrote multiple methods and looping
# constructs much longer than the answer below and couldn't figure it out. It makes 
# sense now that I've seen the answer. 

# launch school's answer
munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

# my practice
munsters.each do |name, details|
  case details['age']
    when 0..17
      details['favorite-activity'] = 'skateboarding'
    when 18..64
      details['favorite-activity'] = 'traveling'
    else 
      details['favorite-activity'] = 'napping'
  end
end

# continued practice longer manual way of looping through munsters
names = munsters.keys
counter = 0

loop do
  break if counter == names.length

  current_name = names[counter]
  details_hash = munsters[current_name]
  
    case details_hash['age']
    when 0..17
      details_hash['age_group'] = 'kid'
    when 18..64
      details_hash['age_group'] = 'adult'
    else
      details_hash['age-group'] = 'senior'
    end
  counter += 1
end