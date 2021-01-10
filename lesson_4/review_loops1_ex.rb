# Lesson 4 # Review of Loops 1

# 1. Runaway loop-----------------------------------------
loop do
  puts 'Just keep printing...'
  break
end


# 2. Loopception------------------------------------------
loop do
  puts 'This is the outer loop.'
    
  loop do
    puts 'This is the inner loop.'
    break
  end
  
  break
end

puts 'This is outside all loops'


# 3. Control the Loop-------------------------------------
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

# Further exploration:
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  break if iterations == 5
  iterations += 1
end


# 4. Loop on Command--------------------------------------
loop do
    puts 'Should I stop laughing?'
    answer = gets.chomp
    break if answer.downcase == 'yes'
end


# 5. Say Hello--------------------------------------------
say_hello = true
counter = 0

while say_hello
  puts 'Hello!'
  say_hello != false
  counter +=1
  break if counter == 5
end
# launchschool's answer below:
say_hello = true
count = 0

while say_hello
  puts 'Hello!'
  count += 1
  say_hello = false if count == 5
end


# 6. Print While------------------------------------------
numbers = []
num = 99

while numbers.length < 5
  numbers << rand(num)
end

puts numbers


# 7. Count Up---------------------------------------------
count = 1

until count == 11 # or count > 10
  puts count
  count += 1
end


# 8. Print Until------------------------------------------
numbers = [7, 9, 13, 25, 18]

until false
  puts numbers
  break
end
# or launch school's answer
count = 0

until count == numbers.size
  puts numbers[count]
  count += 1
end

# 9. That's Odd-------------------------------------------
for i in 1..100
  if i.odd?
    puts i
  end
end

# or

for i in 1..100
  if i % 2 == 1
    puts i
  end
end

# or launch school's solution
for i in 1..100
  puts i if i.odd?
end

# 10. Greet Your Friends----------------------------------
friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends
  puts "Hello, #{friend}!"
end