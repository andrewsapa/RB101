### Introduction to PEDEAC Process ###

# PEDAC is a process to help solve programming problems. It's goal to help you identify
# and avoid pitfalls.


# P - [Understand the] Problem

# E - Examples / Test cases

# D - Data Structure

# A - Algorithm

# C- Code


# PEDAC helps to save you time and solve complex problems efficiently


## P - [Understand the] Problem ##-----------------------------------
# Understanding the problem has three steps.
    # 1. Read the problem description.
    # 2. Check the test cases, if any.
    # 3. If any part of the problem is unclear, ask the interviewer or problem 
        # requester to clarify the matter.

# Walk through example:
# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# Test Cases:
# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"


# 1. What is a palindrome? You might ask the interviewer to tell you what a palindrome 
# is, and the interviewer would tell you that it is a word that reads the same forwards and backward.

# 2. Should the words in the string remain the same if they already use uppercase? 
# Here, you can check the test cases. In the fourth test case, the word LOVE already 
# uses uppercase, and it remains uppercase in the solution.

# 3. How should I deal with empty strings provided as input? The test cases frequently 
# answer this question. In this case, test case number 3 provides the answer. This is 
# an implicit requirement that we can infer from the test cases.

# 4. Can I assume that all inputs are strings? Test cases don't show any non-string 
# inputs, so you should ask whether the inputs can contain non-string values, and 
# what you should do with them. In this problem, we won't worry about non-string values.

# 5. Should I consider letter case when deciding whether a word is a palindrome? 
# Again, test cases don't show any appropriate examples. The interviewer might 
# tell you that the palindrome words should be case sensitive: 'mom' is a palindrome, 'Mom' is not.

# 6. Do I need to return the same string object or an entirely new string? This 
# question is one of the most important and most overlooked that you can ask. 
# Typically, while solving problems, students make certain assumptions. One 
# assumption might be that they need to return the same string object. Students 
# often start solving the problem without checking whether the assumption is correct. 
# For this reason, the student might end up losing 10-15 minutes struggling with 
# the wrong problem. In this problem, you should return an entirely new string.

# Always verify your assumptions either by looking at the test cases or by asking 
# the interviewer. Some assumptions, like whether we should treat strings as 
# case-sensitive or not, can be verified either by looking at the problem description, 
# if that is mentioned there, or by checking the test cases. If you can't determine 
# the answer with the test cases or problem description, you should ask the interviewer 
# to clarify this for you.



# write down your notes like this:

# input: string
# output: string (not the same object)
# rules:
#      Explicit requirements:
#        - every palindrome in the string must be converted to
#          uppercase. (Reminder: a palindrome is a word that reads
#          the same forwards and backward).
#        - Palindromes are case sensitive ("Dad" is not a palindrome, but "dad" is.)

#      Implicit requirements:
#        - the returned string shouldn't be the same string object.
#        - if the string is an empty string, the result should be an empty array



### DATA Structure / Algorithm ###-------------------------------------


# Practice Problem: Let's consider another problem. Try to work through the 
# "understand the problem" part of this problem on your own, and write the input, 
# output, and rules for it. We'll provide a solution below. Later, we'll tackle 
# the data structure and algorithm.

# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# my answer

# input: string
# output: array
# rules:
#      Explicit requirements: 
#       -a palindrome is word that reads the same forward and backward
#       -palindromes are case sensitive (e.g. Mom is not a palindrome, but mom is)
#      Implicit requirements:
#       -the returned array will be a different object from the input string object
#       -if an empty string is the input an empty array will be the output
# questions? are spaces considered to be a apart of the palindrom
#            should I combined seperated words into one long string before finding subtrings
#            e.g. "it is a nice day" to "itisaniceday"


# launchschool's answer

# Some questions you might have?
# 1. What is a substring?
# 2. What is a palindrome?
# 3. Will inputs always be strings?
# 4. What does it mean to treat palindrome words case-sensitively?

# input: string
# output: an array of substrings
# rules:
#      Explicit requirements:
#        - return only substrings which are palindromes.
#        - palindrome words should be case sensitive, meaning "abBA"
#          is not a palindrome.


# Algorithm part here:
# Algorithm:
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array

# The code might look like this:

def palindrome_substrings(str)
    result = []
    substrings_arr = subtrings(str)
    substrings_arr.each do |substring|
        result << substring if is_palindrome?(substring)
    end
    result
end

# we have two undefined methods substrings and is_palindrome?

# for substring method, the resulting loop would look something like this:
# for each starting index from 0 through the next to last index position
  # for each substring length from 2 until there are no substrings of that length
    # extract the substring of the indicated length starting at the indicated index position
  # end of inner loop
# end of outer loop.


# complete algorithm for this method:

# - create an empty array called `result` that will contain all required substrings
# - create a `starting_index` variable (value `0`) for the starting index of a substring
# - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
#   - create a `num_chars` variable (value `2`) for the length of a substring
#   - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
#     - extract a substring of length `num_chars` from `string` starting at `starting_index`
#     - append the extracted substring to the `result` array
#     - increment the `num_chars` variable by `1`
#   - end the inner loop
#   - increment the `starting_index` variable by `1`
# - end the outer loop
# - return the `result` array

# above informal pseuodocode is kind of complex. below is more formal pseudocode:

# START
#
#   /* Given a string named `string` */
#
#   SET result = []
#   SET starting_index = 0
#
#   WHILE starting_index <= length of string - 2
#     SET numChars = 2
#     WHILE numChars <= length of string - starting_index
#       SET substring = num_chars characters from string starting at index starting_index
#       append substring to result array
#       SET num_chars = num_chars + 1
#
#     SET starting_index = starting_index + 1
#
#   RETURN result
#
# END


def substrings(str)
  result = []
  starting_index = 0;

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

# - Inside the `is_palindrome?` method, check whether the string
#   value is equal to its reversed value. You can use the
#   String#reverse method.

def is_palindrome?(str)
  return str == str.reverse
end

# Here's the complete informal pseudocode for this problem:

# input: a string
# output: an array of substrings
# rules: palindrome words should be case sensitive, meaning "abBA"
#        is not a palindrome

# Algorithm:
#  substrings method
#  =================
#    - create an empty array called `result` that will contain all required substrings
#    - create a `starting_index` variable (value `0`) for the starting index of a substring
#    - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
#      - create a `num_chars` variable (value `2`) for the length of a substring
#      - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
#        - extract a substring of length `num_chars` from `string` starting at `starting_index`
#        - append the extracted substring to the `result` array
#        - increment the `num_chars` variable by `1`
#      - end the inner loop
#      - increment the `starting_index` variable by `1`
#    - end the outer loop
#    - return the `result` array

#  is_palindrome? method
#  =====================
# - Inside the `is_palindrome?` method, check whether the string
#   value is equal to its reversed value. You can use the
#   String#reverse method.

#  palindrome_substrings method
#  ============================
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array


# The code for this with all the helper methods :

def substrings(str)
  result = []
  starting_index = 0;

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious"); # ["ili"]
p palindrome_substrings("abcddcbA");   # ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome"); # []
p palindrome_substrings("");           # []

## Testing Frequently ##---------------------------------------------

# Testing isn't properly part of the PEDAC approach, but it's an important step 
# that you don't want to omit. Test your code early and often while writing it.