# Lesson 4 # Review of Loops 2

# 1.) Even or Odd?--------------------------------------------------------
count = 1

loop do 
  count += 1
  if count.even?
    puts "#{count} is even!"
  else 
    puts "#{count} is odd!"
  end
  break if count == 6
end

#or
count = 1

loop do 
  count += 1
  puts "#{count} is #{count.even? ? 'even' : 'odd'}!"
  break if count == 6
end

# launch school's solution:
count = 1

loop do
  if count.even?
    puts "#{count} is even!"
  else
    puts "#{count} is odd!"
  end

  break if count == 5
  count += 1
end


# 2.) Catch the Number-------------------------------------------------
loop do 
  number = rand(100)
  puts number
  break if number >= 0 && number <= 10
end

# or launch school's approach
loop do
  number = rand(100)
  puts number

  if number.between?(0, 10)
    break
  end
end

# 3.) Conditional Loop--------------------------------------------------
process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts 'The loop was processed!'
    break
  end
else
  puts "The loop wasn't processed!"
end


# 4.) Get the Sum----------------------------------------------------
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4
    puts "That's correct!"
    break
  else 
    puts 'Wrong answer. Try again!'
  end
end


# 5.) Insert Numbers--------------------------------------------------
numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers << input
  break if numbers.length == 5
end

puts numbers


# 6.) Empty the Array--------------------------------------------------
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.delete_at(0) # or puts names.shift
  break if names.empty?
end
p names # => []

# further exploration: list names starting with 'Henry'
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.pop
  break if names.empty?
end
p names # => []


# 7.) Stop Counting----------------------------------------------------
5.times do |index|
  puts index
  break if index == 2
end


# 8.) Only Even----------------------------------------------------------
number = 0

until number == 10
  number += 1
  next if number % 2 == 1 #or next if number.odd?
  puts number
end


# 9.) First to Five-----------------------------------------------------
number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next if number_a == 0 || number_b == 0
  if number_a == 5
    puts "5 was reached by number_a!"
    break
  elsif number_b == 5
    puts "5 was reached by number_b!"
    break
  end
end

# or launch school's solution
number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next unless number_a == 5 || number_b == 5

  puts '5 was reached!'
  break
end

# further exploration
number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  if number_a == 5
    puts '5 was reached by number_a!'
    break
  elsif number_b == 5
    puts '5 was reached by number_b!'
    break
  end
end


# 10.) Greeting----------------------------------------------------------
def greeting(number_of_greetings)
  counter = 0
  while
    counter += 1
    puts 'Hello!'
    break if counter == number_of_greetings
  end
end

number_of_greetings = 2

greeting(number_of_greetings)

# or launch school's solution
def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end