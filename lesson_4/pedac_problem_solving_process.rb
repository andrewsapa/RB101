### The PEDAC Process ###


## P: Understanding the Problem (video 1)---------------------------------------
# => this is one of most important steps
# => gives you a point of reference to base your understanding on
# => you should be checking your understanding of the problem throughout all the other steps

    # - Establish the rules / define the boundaries of the problem
        # - Assess available information
        # - Restate Explicit requirements (rules clearly stated in the problem)
        # - Identify Impliict requirements (rules that are NOT stated in the problem that can be extrapolated from our understanding of the problem)
    # - Spend enough time. Do NOT rush this step.
    
## **General Exmple**
# Given a string, produce a new string with every other word removed.

# - Explicity requirements:
#   -Input: string
#   -Output: new string
#   -Remove every other word from input string

# - Questions(the answers to these form the implicity requirements): 
#   - What do we mean by every other word?
#   - How do we define a word in this context?
#       -Words are delimited by spaces
    

## D: Data Structures
## A: Algorithms
## C: Implementing a solution in Code



## Sum Even Number Rows

# Imagine a sequence of consecutive even integers beginning with 2. The integers 
# are grouped in rows, with the first row containing one integer, the second row 
# two integers, the third row three integers, and so on. Given an integer representing 
# the number of a particular row, return an integer representing the sum of all the 
# integers in that row.

# - Explicit rules:
    # - Sequence of even integers
    # - Sequence begins with two
    # - Integers are consecutive
    # - Sequence is grouped in to rows
    # - Each row incrementally larger: 1, 2, 3, ...
    # - Row 'number' equals the number of elements in th row
        # - Row 1 has 1 element, row 2 has 2 elements, ...

# - Input: a single integer
    # - Identifies a 'row', which is a subset of a sequence of integers
# - Output: a single integer
    # - The sum of the integer in the row identified by the input integer
        
# - Visual Sequence:
# 2, 4, 6, 8, 10, 12, 14, 16, 18, ...

# 2 => 1 element, sum is 2
# 4, 6 => 2 elements, sum is 10
# 8, 10, 12 => 3 elements, sum is 30
# 14, 16, 18, 20 => 4 elements, sum is 68
# etc...

# - How do we create the structure?


## E: Examples and Test Cases(video 2)---------------------------------------------------

# - Can confirm/ refute assumptions
# - Help to answer questions about implicit requirements
# - Act as assertions which help to codify the rules and boundaries

# **Examples**

# row number: 1 --> sum of integers in row: 2
# row number: 2 --> sum of integers in row: 10
# row number: 3 --> sum of integers in row: 30
# row number: 4 --> sum of integers in row: 68

# 2 => 1 element, sum is 2
# 4, 6 => 2 elements, sum is 10
# 8, 10, 12 => 3 elements, sum is 30
# 14, 16, 18, 20 => 4 elements, sum is 68
# etc...


## D: Data Structures(video 3)-----------------------------------------------------------

# - Help to reason with data logically
# - Help to interact with data at implementation level
# - Thinking in terms of data structures is part of problem solving process
# - Data structures closely linked to algorithms
    # - set of steps from input to output
        # - involves structuring data in a certain way

# ** Data Struture**

# 2 => 1 element, sum is 2
# 4, 6 => 2 elements, sum is 10
# 8, 10, 12 => 3 elements, sum is 30
# 14, 16, 18, 20 => 4 elements, sum is 68
# etc...

# - overall structure representing sequence as a whole
# - individual rows within overall structure
# - individual rows in a set order in context of sequence
# - individual rows contain even integers
# - can assume that integers are in a set order in the context of the sequence

[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20],
  #...
]
  

## A: Algorithms(video 4)-------------------------------------------------------

# - an algorithm is a logical sequence of steps for accommplishing a task or objective
  # - closely linked to data structures
  # - series of steps to structure data to produce the required output
# - Stay abstract/ high-level
  # - avoid implementation detail
  # - Don't worry about efficiency for now
  
# **Algorithm**

# 1. Create an empty 'rows' array to contain all of the rows
# 2. Create a 'row' array and add it to the overall 'rows' array
# 3. Repeat step 2 until all the necessary rows have been created
  # - All rows have been created when the length of the 'rows' array is equal to the input integer
# 4. Sum the final row
# 5. Return the sum

# *Problem: Create a Row*
# Rules:
  # - Rows is an array
  # - Arrays contain integers
  # - Integers are consecutive even numbers
  # - Integers in each row form part of an overall larger sequence
  # - Rows are of different lengths
  # - Input: the information needed to create the output
    # - The starting integer
    # - Length of the row
  # - Output: the row itself: (e.g. if you wanted 3rd row '[8, 10, 12]')
  
# Examples: 
  # start: 2, length: 1 --> [2]
  # start: 4, length: 2 --> [4, 6]
  # start: 8, length: 3 --> [8, 10, 12]
  
# Data Structures:
# - An array of integers
  
# Algorithm:
# 1. Create an empty 'row' array to contain the integers
# 2. Add the starting integer
# 3. Increment the starting integer by 2 to get the next integer in the sequence
# 4. Repeat steps 2 & 3 until the array has reached the correct length
# 5. Return the 'row' array


## Code or Implementing a Solution in Code(video 5)-------------------------------

# - Translating solution algorithm to code
# - Think about algorithm in context of programming language
  # - Language features and constraints
  # - Characteristics of data structures
  # - Built in functions/ methods
  # - Syntax and coding patterns
# - Create test cases
# - Code with intent (think about each line of code and what it is doing as your writing it)


# main method
def sum_even_number_row(row_number)
  rows = []
  start_integer = 2
  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end
  rows.last.sum
end

# help method
def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  loop do
    row << current_integer
    current_integer += 2
    break if row.length == row_length
  end
  row
end

# row number: 1 --> sum of integers in row: 2
# row number: 2 --> sum of integers in row: 10
# row number: 3 --> sum of integers in row: 30
# row number: 4 --> sum of integers in row: 68

p sum_even_number_row(1) == 2 # true
p sum_even_number_row(2) == 10 # true
p sum_even_number_row(4) == 68 # true

# 1. Create an empty 'rows' array to contain all of the rows
# 2. Create a 'row' array and add it to the overall 'rows' array
# 3. Repeat step 2 until all the necessary rows have been created
  # - All rows have been created when the length of the 'rows' array is equal to the input integer
# 4. Sum the final row 
# 5. Return the sum

# start: 2, length: 1 --> [2]
# start: 4, length: 2 --> [4, 6]
# start: 8, length: 3 --> [8, 10, 12]

p create_row(2, 1) == [2] # true
p create_row(4, 2) == [4, 6] # true
p create_row(8, 3) == [8, 10, 12] # true

# 1. Create an empty 'row' array to contain the integers
# 2. Add the starting integer
# 3. Increment the starting integer by 2 to get the next integer in the sequence
# 4. Repeat steps 2 & 3 until the array has reached the correct length
# 5. Return the 'row' array

# Start the loop
  # - Add the start integer to the row
  # - Increment the start integer by 2
  # - Break out of the loop if length of row == row_length

[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20],
  #...
]
# Calculating the start integer:
# Rule: First integer of row == last integer of preceding row + 2
# Algorithm:
  # - Get the last row of the rows array
  # - Get last integer of that row
  # - add 2 to the integer
  
# ** Final Thoughts
# - Not a completely linear process
# - Move back and forth between the steps
# - Switch from implementation mode to abstact solving mode when necessary
# - Don't try to problem solve at the code level
