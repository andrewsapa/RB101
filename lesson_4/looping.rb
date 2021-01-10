### LOOPING ###

# reminder of manual incrementing
arr = [1, 2, 3, 4, 5]
arr[0] += 1
arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1
arr # => [2, 3, 4, 5, 6]

# looping example
arr = [1, 2, 3, 4, 5]
counter = 0

loop do
  arr[counter] += 1
  counter += 1
  break if counter == arr.size
end

arr # => [2, 3, 4, 5, 6]

## Controlling a Loop ##--------------------------------------------

# infinite loop will iterate 'Hello' and infinite number of times
loop do
  puts 'Hello!'
end

# will break, puts 'Hello' once
loop do
  puts 'Hello!'
  break
end

# iterate more than once, a set number of times
loop do
  number = rand(1..10)
  puts 'Hello!'
  if number == 5
    puts 'Exiting...'
    break
  end
end

# I observed a random display of puts 'Hello!' amount followed by 'Exiting..'.
# Oddly enough 'Exiting...' is displayed regardless of whether there are 
# 10 'Hello!' or 1 'Hello!'. I think the number of 'Hello!' display is due to the
# the computer iterating over the loop until it reaches the number 5 before breaking.

# A good way to see this visual demonstratino is if you interpolate #{number} into the string 
# like this:
loop do
  number = rand(1..10)
  puts "Hello!#{number}"
  if number == 5
    puts 'Exiting...'
    break
  end
end

# example:
# Hello!8
# Hello!1
# Hello!4
# Hello!4
# Hello!7
# Hello!5
# Exiting...

# Here it took up to 6 iterations of the code before it reach 5. When number == 5 the loop breaks. 


## Iteration ##-----------------------------------------------------

# example:
counter = 0 # notice counter is outside of loop in order to break

loop do
  puts 'Hello!'
  counter += 1
  break if counter == 5
end
# Hello!
# Hello!
# Hello!
# Hello!
# Hello!
# => nil

# if modifier
break if number == 5

## Break Placeent ##--------------------------------------------------

# When the break is placed on the last line within the loop mimics the behavior of a 
# "do/while" loop the code within the block is guaranteed to execute at least once.

# If the break is placed on the first line wihtin the loop than it mimic a while loop
counter = 0

loop do
  break if counter == 0
  puts 'Hello!'
  counter += 1
end
# nothing will print here because break is initated on the first line with a conditional
# that has already been met.

## Next ##-----------------------------------------------------------

# helps control loops
# tells the loop to skip the rest of the current iteration and begin the next one
counter = 0

loop do
  counter += 1
  next if counter.odd?
  puts counter
  break if counter > 5
end
# when next is executed any code after it will be ignored, if counter is placed after next
# it will result in an infinite loop

## Iterating Over Collections ##-------------------------------------------

# String #
alphabet = 'abcdefghijklmnopqrstuvwxyz'
counter = 0

loop do
  break if counter == alphabet.size
  puts alphabet[counter]
  counter += 1
end
# a
# b
# c
# d
# e
# f
# g
# h
# i
# j
# k
# l
# m
# n
# o
# p
# q
# r
# s
# t
# u
# v
# w
# x
# y
# z
# => nil

# Note: String#size and String#length do the same thing

# Array #
colors = ['green', 'blue', 'purple', 'orange']
counter = 0

loop do
  break if counter == colors.size
  puts "I'm the color #{colors[counter]}!"
  counter += 1
end

# I predict the result will be
# "I'm the color green!"
# "I'm the color blue!"
# "I'm the color purple!"
# "I'm the color orange!"
# => nil

# array with various types of objects
objects = ['hello', :key, 10, []]
counter = 0

loop do
  break if counter == objects.size
  puts objects[counter].class # the class method returns the name of the calling object's class.
  counter += 1
end
# output:
# String
# Symbol
# Integer
# Array

# Hash #---------------------------------------------------------------

# hash loop example:
number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1,
}
pets = number_of_pets.keys # => ['dogs', 'cats', 'fish']
counter = 0

loop do
  break if counter == number_of_pets.size
  current_pet = pets[counter]
  current_pet_number = number_of_pets[current_pet]
  puts "I have #{current_pet_number} #{current_pet}!"
  counter += 1
end
