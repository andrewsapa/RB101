# Pracitce Problems: Easy 2

# Question 1-----------------------------------

# In this hash of people and their age,
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if 'Spot' is present.
p ages.include?('Spot') # returns false, 'Spot' is a key in in the hash
p ages.has_key?('Spot') # returns false, 'Spot' is not a key in this hash
p ages.key?('Spot') # returns false, 'Spot' is not a key in this hash
p ages.member?('Spot') # returns false, 'Spot' is not a key in this hash

# if you wanted to check if 'Spot' is in the hash either key or value you could do this below:
p ages.values.include?('Spot') # returns false
p ages.keys.include?('Spot') # returns false

# Question 2----------------------------------------
# Starting with this string:

munsters_description = "The Munsters are creepy in a good way."

# Convert the string in the following ways (code will be executed on original
# munsters_description above):

# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."

def munsters_confusing_word_transformation(string)
  string_array = string.upcase!.split(' ').zip
  first_word = string_array[0]
  second_word = string_array[1]
  first_word_letters = first_word.join('').split('')
  second_word_letters = second_word.join('').split('')
  first_word_letters.unshift(first_word_letters[0].downcase)
  first_word_letters.delete_at(1)
  first_word_letters.join('')
  second_word_letters.unshift(second_word_letters[0].downcase)
  second_word_letters.delete_at(1)
  second_word_letters.join('')
  string_array.delete(string_array[0])
  string_array.delete(string_array[0])
  string_array.join(' ')
  puts "#{first_word_letters.join('')} #{second_word_letters.join('')} #{string_array.join(' ')}"
end

munsters_confusing_word_transformation(munsters_description)
# launchschool solution: munsters_description.swapcase! 

# works for strings that have multiple of the same letter as the first letter in the first word or the second word

# "The munsters are creepy in a good way."
munsters_description.gsub(/M/, 'm')
# "the munsters are creepy in a good way."
munsters_description.downcase!
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.upcase!

# Question 3---------------------------------------------
# We have the most of the Munster family in our age hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandap" => 5843, "Eddie" => 10 }

# add ages for Marilyn and Spot to the existing hash
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)

# Question 4-----------------------------------------------
# See if the name "Dino" appears in the string below:
advice = "Few things in life are as imortant as house training your pet dinosaur."

advice.include?('Dino') # returns false, returns true with 'Dinosaur'
# launchschools solution: advice.match?('Dino') # returns false, returns true with 'Dinosaur'

# Question 5-------------------------------------------------
# Show an easier way to write this array:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
# short version below
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 6--------------------------------------------------
# How can we add the family pet "Dino" to our usual array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << 'Dino' # or flintstones.push('Dino')

# Question 7------------------------------------------------
# In the previous problem we added Dino to our array like this:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# We could have used either Array#concat or Array#push to add Dino to the family.
# How can we add multiple items to our array? (Dino and Hoppy)

# my solution
flintstones.push('Dino', 'Hoppy') # adds 'Dino' and 'Hoppy' do the array
# launchschool's solution: flintstones.push("Dino").push("Hoppy") # or flintstones.concat(%w(Dino Hoppy))

# Question 8------------------------------------------
# Shorten this sentence:
advice = "Few things in life are as important as house training your pet dinosaur."

# ...remove everything starting from "house".

advice.slice!(0..38) # returns => "Few things in life are as important as "
# launchschool solution: advice.slice!(0, advice.index('house'))
advice # now returns => "house training your pet dinosaur."


# As a bonus, what happens if you use the String#slice method instead?
advice.slice(0..38) # returns => "Few things in life are as important as "
advice # returns => "Few things in life are as important as house training your pet dinosaur."

# Question 9--------------------------------------------------------------
# Write a one-liner to count the number of lower-case 't' characters in the following string:
statement = "The Flintstones Rock!"

statement.count('t') # returns => 2


# Question 10-------------------------------------------------------
# Back in the stone age (before CSS) we used spaces to align things on the screen. 
# If we had a 40 character wide table of Flintstone family members, how could we 
# easily center that title above the table with spaces?
title = "Flintstone Family Members"
flintstones = ['', 'Fred', 'Barney', 'Wilma', 'Betty', 'BamBam', 'Pebbles', '']
flintstones.join(' ').length # => 40

puts title.center(40)
puts flintstones.join(' ')
#      Flintstone Family Members        
# Fred Barney Wilma Betty BamBam Pebbles 
