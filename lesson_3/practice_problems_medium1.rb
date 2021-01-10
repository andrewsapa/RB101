# Practice Problems: Medium 1

# Question 1-------------------------------------------------------
# Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the 
# days before computers had video screens).

# For this practice problem, write a one-line program that creates the following 
# output 10 times, with the subsequent line indented 1 space to the right:

#The Flintstones Rock!
# The Flintstones Rock!
#  The Flintstones Rock!
# I got stuck on this one. 
# launchschool's solution: 10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# Question 2------------------------------------------------------
# The result of the following statement will be an error:
puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?
# The reason for this is no implicit conversion of Integer into String.
# You can fix this here: 
puts "the value of 40 + 2 is " + (40 + 2).to_s
# or
# Like this:
puts "the value of 40 + 2 is #{40 + 2}"

# Question 3-----------------------------------------------------
# Alan wrote the following method, which was intended to show all of the factors
# of the input number:
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end
# Alyssa noticed that this will fail if the input is 0, or a negative number, and
# asked Alan to change the loop. How can you make this work without using begin/end/until? 
# Note that we're not looking to find the factors for 0 or negative numbers, but we 
# just want to handle it gracefully instead of raising an exception or going into an 
# infinite loop.

# my answer
def factors(number)
  divisor = number
  factors = []
  loop do
  break if number <= 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  break if divisor == 0
  end 
  factors
end
# This solution returns an empty array if the argument in the method is a negative number
# or zero but returns an array full of whatever factors if number is > 0 as the argument.

# launchschool's answer (both return empty arrays with 0 or negative numbers)
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# Bonus 1
# What is the purpose of the number % divisor == 0 ?
# The purpose of this is to provide a conditiona that makes sure the numbers that 
# are put into the method as an argument are only returning factors. This makes 
# sure that the numbers evenly divide and the remainder is equal to 0 using the 
# modulos operator. 

# Bonus 2
# What is the purpose of the second-to-last line (line 8) in the method (the factors
# before the method's end)?
# Without factors on line 8, the method returns nil. 'factors' on line is returning an array
# of numbers or factors to whatever number is put in as an argument in the method. 

# Question 4-----------------------------------------------------------
# Alyssa was asked to write an implementation of a rolling buffer. Elements are 
# added to the rolling buffer and if the buffer becomes full, then new elements 
# that are added will displace the oldest elements in the buffer

# She wrote two implementations saying, "Take your pick. Do you like << or + for
# modifying the buffer? Is there a difference between the two, other than what
# operator she chose to use to add an element to the buffer?"

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
# This method uses '<<' mutating method and appends the new_element value to the buffer
# value. Both the new_element and buffer object's remain the same both before and after 
# using the '<<'' mutation and so no new objects are created. 

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# This method uses '+' to concatenate the input_array and new_element values and then uses assignment '='
# to the buffer value. A new object is created with the buffer value but both the input_array and new_element 
# objects remain the same. I like this method a little more as it's more clear what is happening as far as the 
# as the variable names of 'input_array' concatentating a new_element that is stored in a new 'buffer' array object.

# launchschool's solution:
# Yes, there is a difference. While both methods have the same return value, in the 
# first implementation, the input argument called buffer will be modified and will 
# end up being changed after rolling_buffer1 returns. That is, the caller will have
# the input array that they pass in be different once the call returns. In the other 
# implementation, rolling_buffer2 will not alter the caller's input argument.

# Question 5----------------------------------------
# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator.
# A user passess in two numbers, and the calculator will keep computing the sequence
# until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it, he got
# an error. Something about the limit variable. What's wrong with the code?

limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# How would you fix this so that it works?
# The problem is that the local variable 'limit' is unused because it is out of 
# the scope of the 'fib()' method and it needs to be passed in as an argument 
# in order to be used. 

# Question 6-------------------------------------------------------
# What is the output of the following code?
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# The code outputs 34. It would have outputed 42 had the last line been rewritten
# to p new_answer - 8. 

# Question 7-----------------------------------------------------

# One day Spot was playing with the Munster family's home computer and
# he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = 'other'
  end
end

mess_with_demographics(munsters)

# The munsters familiy data did get ransacked the value pairs of age and gender were changed.
# The method returns an array full of the altered key/value pairs of everyones age increasing by 42 years
# and everyones gender changing to 'other'. The variable munsters now stores a hash with the name key's still 
# intact but the key/value pairs altered. Because of assignment in the method using '=',
# the key/value pairs now point to a new object for 'age' values
# and for the "gender" values. 

# Question 8-------------------------------------------------------
# Method calls can take expressions as arguments. Suppose we define a method called
# 'rps' as follow, which the classic rules of rock-paper-scissors game, but with a
# slight twist that it decleares whatever hand was used in the tie as the  result 
# of that tie. 

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else 
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

# What is the result of the following?
puts rps(rps(rps("rock" , "paper"), rps("rock", "scissors")), "rock")
# puts rps("rock", "paper") => 'paper'
# puts rps("rock", "scissors") => 'rock' 
# puts rps('paper', 'rock') => 'paper'
# puts rps ('paper', 'rock') = > 'paper'
# result is 'paper'

# Question 9-----------------------------------------------
# Consider these two simple methods:
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What would be the return value of the following method invocation?

bar(foo)
# returns 'no'

# Thought process below:
# The foo method returns 'yes' and then the foo return 'yes' goes into bar(param = 'no') 
# which now. param now points to 'yes'. The ternary operatior in the bar method now states
# 'yes' == 'no' is not equal and is false which therefore returns 'no' 
# in the ternary operator.
