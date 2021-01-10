# Practice Problems: Medium 2

# Question 1--------------------------------------------------------

# Every named entity in Ruby has an object_id. This is a unique identifier for 
# that object. It is often the case that two different things "look the same",
# but they can be different objects. The "under the hood" object referred to by 
# a particular named-variable can change depending on what is done to that named
# -variable. In other words, in Ruby, all values ore objects...but they are not
# always the same object. Predict how the values and object ids will change throughout
# the flow of the code below. 

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block."
    puts

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
    puts


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)."
    puts
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
end

# Question 2--------------------------------------------------------

# Let's look at object id's again from the perspective of a method call instead of
# a block. Here we haven't changed ANY of the code outside or inside of the block
# /method. We simply took the contents of the block from the previous practice problem 
# and moved it to a method, to which we are passing all of our outer variables. Predict how
# the values and object ids will change throughout the flow of the code below:

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)


  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method."
  puts

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
  puts

  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer)."
  puts
end

fun_with_ids

# Question 3--------------------------------------------------------
# Let's call a method, and pass both a string and an array as parameters and see
# how even though they are treated in the same way by Ruby, the results can be
# different. Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# below is my modified code of looking at object_id's to get a clearer picture of what's going on
def tricky_method(my_string_param, an_array_param)
  puts "my_string_param inside the method #{my_string_param.object_id}"
  my_string_param += "rutabaga"
  puts "my_string_param inside the method after re-assignment #{my_string_param.object_id}"
  puts
  puts "an_array_param inside the method before mutation #{an_array_param.object_id}"
  an_array_param << "rutabaga"
  puts "an_array_param inside the method after mutation #{an_array_param.object_id}"
end

my_string = "pumpkins"
puts "my_string before the method #{my_string.object_id}"

my_array = ["pumpkins"]
puts "my_array before the method #{my_array.object_id}"
puts

tricky_method(my_string, my_array)
puts
puts "My string looks like this now: #{my_string}"
puts "my_string after the method #{my_string.object_id}"
puts 
puts "My array looks like this now: #{my_array}"
puts "my_array after the method #{my_array.object_id}"

################ my answer #########################
puts "My string looks like this now: #{my_string}"
# This returns the original object that the my_string variable points to with the same value of "pumpkins".
# When my_string gets passed through the method the object_id is changed through re_assignment and points to the
# value "pumpkinsrutabaga". Because my_string is outside the scope and was not mutated, the my_array variable points the original
# value of "pumpkins."

puts "My array looks like this now: #{my_array}"
# This returns the original object that the my_array variable points but with a mutated value of ["pumpkins", "rutabaga"]. 
# Due to the mutating concatentation of '<<' inside the method, the variable my_array has been mutated and therefore prints the 
# new value ["pumpkins", "rutabega"].

# Question 4---------------------------------------------------------------
# To drive that last one home...let's turn the tables and have the string show a 
# modified output, while the array thwarts the method's efforts to modify the caller's
# version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# A similar thing is demonstrated in this question as question 4 but just reversed.
# The '<<' mutation is applied to the object that the a_string_param and my_string variables 
# point to but the object remains the same before and after the method.
puts "My string looks like this now: #{my_string}"
# This prints "pumpkinsrutabaga". 
puts "My array looks like this now: #{my_array}"
# this prints ["pumpkins"] as reassignment causes the a differenct object to be creaeted
# inside the method my_array and an_array_param point to different objects. Because of scoping rules
# the method does not have access to the m_array varriable. 

# Question 5----------------------------------------------------------------
# Depending on a method to modify its arguments can be tricky:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Whether the above "coincidentally" does what we think we wanted "depends" upon 
# what is going on inside the method. How can we refactor this practice problem to
# to make the result easier to predict and easier for the next programmer to
# maintain?

######### my answer below ################

my_string = "pumpkins"
my_array = ["pumpkins"]

def tricky_method(string, array)
  string = string + "rutabaga" 
  array << "rutabaga"
end

tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
# My string looks like this now: pumpkins
# My array looks like this now: ["pumpkins", "rutabaga"]

# I think it makes it a little more clear and concise changing the variable names inside 
# the method to just string and array. Also, reformating the += to the longer form of 
# 'string = string + "rutabaga"' makes it more clear what's happening with the 
# conctenation, as well as reassignment of the string variable and showing that
# now the string variable is pointing to a different object and value than the my_string variable.

###### here is launchschool's answer ######################

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
# My string looks like this now: pumpkinsrutabaga
# My array looks like this now: ["pumpkins", "rutabaga"]

# I didn't realize the question wanted to not only create a solution that is easier
# to read but also change the output to return a concatenation of both lines in the method.
# I thought the point was to desing a method that more easily shows why the output is the way it 
# is, with changing objects and variable reassignment.
# Frankly, I find this method more confusing. 

# Question 6--------------------------------------------------------
# How could the unnecessary duplication in this method be removed?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

color_valid("blue")
color_valid("green")
color_valid("black")

##### my reformatted method ##########

def color_valid(color)
  if 
    puts color == "blue" || color == "green"
  end
end

color_valid('green') # returns => true
color_valid('blue') # returns => true
color_valid('black')# returns => false

#### launch school's answer ##########

def color_valid(color)
  color == "blue" || color == "green"
end

# a little simpler

