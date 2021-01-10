# Practice Problems: Hard 1

# Question 1---------------------------------------------------------
# What do you expect to happen when the greeting variable is referenced in the 
# last line of code below?

if false
    greeting = "hello world"
end

greeting
# Nothing will be printed to the screen. I predict nil will be returned.

# launchschool's answer:
# greeting is nil here, and no "undefined method or local variable" exception is 
# thrown. Typically, when you reference an uninitialized variable, Ruby will raise
# an exception, stating that it’s undefined. However, when you initialize a local 
# variable within an if block, even if that if block doesn’t get executed, the 
# local variable is initialized to nil.

# Question 2---------------------------------------------------------
# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there' 

puts informal_greeting # => "hi there"
puts greetings

## my reformated code
greetings = { a: 'hi' }
puts greetings.object_id # => 1857020

informal_greeting = greetings[:a]
puts greetings.object_id # => 1857020
puts informal_greeting.object_id # => 18570740

informal_greeting << ' there' 
puts informal_greeting # => "hi there"
puts greetings.object_id # => 1857020
puts informal_greeting.object_id # => 18570740
puts greetings # => {:a=> "hi there"}

### my answer ###
# puts greetings outputs {:a => "hi there"}. greetings and informal_greeting 
# share a 'similar' value (due the mutation using '<<') of 'hi there' and 
# {:a=> "hi there"} but are different variables. They also point to different objects. 
# informal_greetings is pointing to a string object where as greetings is pointing to
# a hash object.

### launchschool's answer###
# The output is {:a=>"hi there"}. The reason is because informal_greeting is a 
# reference to the original object. The line informal_greeting << ' there' was 
# using the String#<< method, which modifies the object that called it. This means 
# that the original object was changed, thereby impacting the value in greetings. 
# If instead of modifying the original object, we wanted to only modify informal_greeting 
# but not greetings, there are a couple of options:

# we could initialize informal_greeting with a reference to a new object containing 
# the same value by informal_greeting = greetings[:a].clone.
# we can use string concatenation, informal_greeting = informal_greeting + ' there', 
# which returns a new String object instead of modifying the original object.

# Question 3-------------------------------------------------------------
# In other practice problems, we have looked at how the scope of variables affects 
# the modification of one "layer" when they are passed to another. To drive home 
# salient aspects of variable scope and modification of one scope by another, consider
# the following similar sets of code. What will be printed by each of these code
# groups?

# A)
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => "one"
puts "two is: #{two}" # => "two"
puts "three is: #{three}" # => "three"
# limited by scoping rules and no mutation

# B)

def mess_with_vars(one, two, three)
    one = "two"
    two = "three"
    three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => "one"
puts "two is: #{two}" #  => "two"
puts "three is: #{three}" # => "three"
# limited by scoping rules and no mutation

# C)
def mess_with_vars(one, two, three)
    one.gsub!("one", "two")
    two.gsub!("two", "three")
    three.gsub!("three", "one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => "two"
puts "two is: #{two}" # => "three"
puts "three is: #{three}" # => "one"
# because of the destructive nature of '!'on the .gsub mutates the values

# Question 4-----------------------------------------------------------

# Ben was tasked to write a sample ruby method to determine if an input string is
# an IP address representing dot-seperated numbers. e.g. "10.4.5.11". He is not 
# familiar with regular expressions. Alyssa supplied Ben with a method called 
# is_an_ip_number? that determines if a string is a numeric string between 0 and 255
# as required for IP numbers and asked Ben to use it.

def dot_separated_ip_address?(input_string)
    dot_separated_words = input_string.split(".")
    while dot_separated_words.size > 0 do
        word = dot_separated_words.pop
        break uness is_an_ip_number?(word)
    end
    return true
end

# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things.
# You're not returning a false condition, and you're not handling the case that there
# are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" 
# should be invalid)." Help Ben fix his code.


### my answer ###
def is_an_ip_number?(word)
  word.to_i.to_s == word && (word.to_i >= 0 && word.to_i <= 255)
end

def valid_number?(word)
  word.to_i.to_s == word 
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  joint_string = dot_separated_words.join("")
  while dot_separated_words.size == 4 do
    word = dot_separated_words.pop
  break 
  end
  is_an_ip_number?(word) && valid_number?(joint_string)
end

dot_separated_ip_address?("2.3.4.5") # => true
dot_separated_ip_address?("apple3.2.4.255") # => false
dot_separated_ip_address?("0") # => true
dot_separated_ip_address?("2.3.4.256") # => false
dot_separated_ip_address?("1.2.3.4.5") # => false
dot_separated_ip_address?("apple, banana, kiwi, 255") # => false
dot_separated_ip_address?("255.34.45.6") # => true

### launch school's solution ###
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end

# works with this method added to it
def is_an_ip_number?(word)
  word.to_i.to_s == word && (word.to_i >= 0 && word.to_i <= 255)
end
# this solution outputs the same as mine granted much smaller