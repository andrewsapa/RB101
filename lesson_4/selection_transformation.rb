# Lesson 4: Selection and Transformation


# Selection and Transformation are the two most common actions to perform on a collection

# Transformation - refers to manipulating every element in the collection 
    # e.g increment all elements of the array by 1 (always results in all elements changing)
    
# Selection - is picking certain elements out of the collection depending on some criterion
    # e.g. increment 1 element of the array by 1 (results in all or less elements in the array)
 
 
 
# example of selection using looping   
alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0

loop do
  current_char = alphabet[counter]

  if current_char == 'g'
    selected_chars << current_char    # appends current_char into the selected_chars string
  end

  counter += 1
  break if counter == alphabet.size
end

selected_chars # => "g" 


# example of transformation using looping
fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do
  current_elements = fruits[counter]
    
  transformed_elements << current_element + 's' # appends transformed string into array
    
  counter += 1
  break if counter == fruits.size
end

transformed_elements # => ["apples", "bananas", "pears"]

# Note that, in this example, we perform the transformation on a new array and leave 
# the original array unchanged. When performing transformation, it's always important 
# to pay attention to whether the original collection was mutated or if a new collection 
# was returned.


## Extracting to Methods ##-----------------------------------------------

# e.g. select all the vowels in a given string

if 'aeiouAEIOU'.include?(current_char)
  selected_chars << current_char
end

# above combined into bigger looping method below
def select_vowels(str)
  selected_chars = ''
  counter = 0
    
  loop do
    current_char = str[counter]
    
    if 'aeiouAEIOU'.inlude?(counter_char)
      selected_chars << current_char
    end

    counter += 1
    break if counter == str.size
  end

  selected_chars
end

select_vowels('the quick brown fox') # => 'euioo'

sentence = 'I wandered lonely as a cloud'
select_vowels(sentence) # => 'Iaeeoeaaou'

# calling other methods on the return value below
number_of_vowels = select_vowels('hello world').size
number_of_vowels # => 3 (meaning 3 vowels, including 'eoo' in 'hello world')


# Practice Problem: How would implement a method with the hash below?
produce = {
    'apple' => 'Fruit',
    'carrot' => 'Vegetable', 
    'pear' => 'Fruit',
    'broccoli' => 'Vegetable'
}

def select_fruit(produce_hash)
  selected_produce = [] 
  produce_array = produce_hash.to_a
  counter = 0
  
  loop do
    current_produce = produce_array[counter]
    
    if current_produce.include?('Fruit')
      selected_produce << current_produce
    end
    
    counter += 1
    break if counter == produce_array.size
  end
  selected_produce.to_h
end
 
select_fruit(produce)) # => {"apple"=>"Fruit", "pear"=>"Fruit"}


# launch school's answer(incorpates using keys) 
def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do
    # this has to be at the top in case produce_list is empty hash
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end


# a transformation method example
def double_numbers(numbers)
  doubled_numbers = []
  counter = 0
  
  loop do
    break if counter == numbers.size
    
    current_number = numbers[counter]
    doubled_numbers << current_number * 2
    
    counter += 1
  end
  
  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]

# Practice Problems: Can you implement a double_numbers! method that mutates its argument?
def double_numbers!(numbers)
  numbers.map! do |num|
    num * 2
  end
  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
my_numbers # => [2, 8, 6, 14, 4, 12]

# launch school's solution:
def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2 # two lines can be condensed into numbers[counter] *= 2

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers)   # => [2, 8, 6, 14, 4, 12]

my_numbers # => [2, 8, 6, 14, 4, 12]


# example that transforms a subset of the elements in the colleciton.  Here, we 
# only multiply by 2 if the value is odd. The if condition will only evaluate to 
# true if current_number is odd (we check this using Integer#odd?).
def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if current_number.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

# not mutated, different object
my_numbers                      # => [1, 4, 3, 7, 2, 6]

# Exercise for the reader: What if we wanted to transform the numbers based on 
# their position in the array rather than their value? Try coding a solution that 
# doubles the numbers that have odd indices: 
my_numbers = [1, 4, 3, 7, 2, 6]

def double_num_with_odd_index(array)
  double_num_with_odd_index_array = []
  counter = 0
  
  loop do
    break if counter == array.length
    
    current_num = array[counter]
    
    if counter % 2 == 1 # if index is odd put into index (also counter.odd?)
      current_num *= 2
    end
    
    double_num_with_odd_index_array << current_num
    
    counter += 1
  end
  double_num_with_odd_index_array 
end

double_num_with_odd_index(my_numbers) # => [1, 8, 3, 14, 2, 12]

# Example of method that is a more generic general_select that can select both
# fruits and vegetables from hash list
def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_produce = {}
  
  loop do
    break if counter == produce_keys.size
    
    current_key = produce_keys[counter]
    current_value = produce_list[current_key]
    
    #used to be current_value == 'Fruit'
    if current_value == selection_criteria
      selected_produce[current_key] = current_value
    end
    
    counter += 1    
  end

  selected_fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

general_select(produce, 'Fruit')     # => {"apple"=>"Fruit", "pear"=>"Fruit"}
general_select(produce, 'Vegetable') # => {"carrot"=>"Vegetable", "broccoli"=>"Vegetable"}
general_select(produce, 'Meat')      # => {}

# Note that we chose to not name the method select because of collision with 
# Kernel#select, which does something completely different than what we're talking 
# about here with collections.
def multiply(array, num_multiply)
  multiplied_nums = []
  counter = 0
  
  loop do
    break if counter == array.length
    
    current_element = array[counter]
    current_element *= num_multiply
    
    multiplied_nums << current_element
    
    counter += 1
  end
  multiplied_nums
end

my_numbers = [1, 4, 3, 7, 2, 6]

multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18] # solution returns new array
multiply(my_numbers, 2) # => [2, 8, 6, 14, 4, 12]
multiply(my_numbers, 0) # => [0, 0, 0, 0, 0, 0]
multiply(my_numbers, 10) # => [10, 40, 30, 70, 20, 60]

# or launch school's solution:
def multiply(numbers, multiplier)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    multiplied_numbers << numbers[counter] * multiplier
    counter += 1
  end

  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]

multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18] # solution returns new array
multiply(my_numbers, 2) # => [2, 8, 6, 14, 4, 12]
multiply(my_numbers, 0) # => [0, 0, 0, 0, 0, 0]
multiply(my_numbers, 10) # => [10, 40, 30, 70, 20, 60]

# Let's write a method called select_letter, that takes a string and returns a 
# new string containing only the letter that we specified. 
def select_letter(sentence, character)
  selected_chars = ''
  counter = 0

  loop do
    break if counter == sentence.size
    current_char = sentence[counter]

    if current_char == character
      selected_chars << current_char
    end

    counter += 1
  end

  selected_chars
end

question = 'How many times does a particular character appear in this sentence?'

select_letter(question, 'a') # => "aaaaaaaa"
select_letter(question, 't') # => "ttttt"
select_letter(question, 'z') # => ""

# also for example, one could use this below to find how many times a letter occurs in a sentence
select_letter(question, 'a').size # => 8
select_letter(question, 't').size # => 5
select_letter(question, 'z').size # => 0


# The 'for' loop
alphabet = 'abcdefghijklmnopqrstuvwxyz'

for char in alphabet.chars
  puts char
end
# the loop and for are interchangeable syntax


# iteration, selection, and or transformation are often the performed operations
# on a collection of data

# typically these are used in a method to manipulate different collecctions

# look at when the original collection is mutated vs when the method returns a 
# new colletion

# look out for returning empty collections or returning nil!!