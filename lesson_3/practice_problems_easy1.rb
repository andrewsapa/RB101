# Practice Problems: Easy 1


# Question 1---------------------------------
# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
# 1 
# 2 
# 2
# 3


# Question 2------------------------------------

# Describe the difference between ! and ? in Ruby. And explain what would happen
# in the following scenarios:

# 1. what is != and where should you use it?
# != is the not sign and means not eaqual. You can use it in a conditional.

# 2. put ! before someting, !user_name
# ! is a not operator and returns false unless true (soluation: turns any object 
# into opposite of their boolean equivalent.)

# 3. put ! after something, like words.uniq!
# .uniq is a method that causes a mutation to the variable 'words' and '!' causes a destructive mutation

# 4. put ? before something
# you get and error unless we're talking about using a ternary operator?

# 5. put ? after something
# you can use in a method definition but in a local variable you get syntax error

# 6. put !! before something, like !!user_name
# returns true


# Question 3------------------------------------------------------
# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

def word_replacer(sentence, word)
    string_array = sentence.split
    word_index = string_array.index(word)
    string_array[word_index] = 'urgent'
    sentence = string_array.join(' ')
    puts sentence
end

word_replacer(advice, 'important')
# returns = > Few things in life are as urgent as house training your pet dinosaur.
# luanchschool solution: advice.gsub!('important', 'urgent')


# Question 4------------------------------------------

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original
# array between method calls)?

numbers.delete_at(1) # this deletes at index 1 which is element 2
numbers.delete(1) # this deletes element 1 in the array


# Question 5---------------------------------------------
# Programmatically determine if 42 lies between 10 and 100.

(10..100).include?(42) # returns => true
#or
(10..100).cover?(42) # returns => true

# Question 6-----------------------------------------------
# Starting with the string:

famous_words = "seven years ago..."

puts "Four score and " + famous_words
# or
puts "Four score and #{famous_words}"
# or
def concantenate_words(words)
    words_array = words.split
    new_words = words_array.unshift("Fours score and")
    puts new_words.join(' ')
end

concantenate_words(famous_words)

# launchschool possible solution:
famous_words.prepend("Four score and ")
# or
"Four score and " << famous_words

# Question 7----------------------------------------------
# If we build an array like this:
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# We will end up with this "nested" array:
flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
#Make this into an un-nested array.
new_flintstones = flintstones.flatten
p new_flintstones
# or
p flintstones.flatten!

# Question 8-----------------------------------------------
# Given the hash below
flintstones = {"Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5}

# Turn this into an array containing only two elements: Barney's name and Barney's number
flintstones_array = flintstones.to_a
flintstones_array_pair = flintstones_array[2]
p flintstones_array_pair

# or launchschools solution
flintstones.assoc("Barney")



