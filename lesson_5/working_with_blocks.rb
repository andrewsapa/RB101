### Working with Blocks ###


# Example 1:
[[1, 2], [3, 4]].each do |arr|
  puts arr.first # returns the object at index 0
end
# 1
# 3
# => [[1, 2], [3, 4]]

# Ask yourself these questions when evaluating the above cod:
# What is the type of action being performed (method call, block conditional, etc..)?
# What is the object that action is being performed on?
# What is the side-effect of that action (e.g. output or destructive action)?
# What is the return value of that action? 
# Is the return value used by whatever instigated the action?

# Tabular Format:
# Line  Action               Object              Side Effect      Return Value                       Is Return Value Used?                      
# 1     method call (each)   The outer array     None             The calling object                 No, but shown on line 6
# 1-3   block execution      Each sub-array      None             nil                                No
# 2     method call (first)  Each sub-array      None             Element at index 0 of sub_array    Yes, used by puts
# 2     method call (puts)   Element at index 0  Outputs string   nil                                Yes, used to determin 
#                            of sub-array        representation                                      return value of block
#                                                of an integer


# Example 2
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]


# Line	Action	            Object	            Side Effect        Return Value	           Is Return Value Used?
# 1	    method call (map)	The outer array	    None	           New array [nil, nil]	   No, but shown on line 6
# 1-3	block execution	    Each sub-array	    None	           nil	                   Yes, used by map for transformation
# 2	    method call (first)	Each sub-array	    None	           Element at index 	   Yes, used by puts
#                                                                  0 of sub-array
# 2	    method call (puts)	Element at index 0  Outputs a string   nil	                   Yes, used to determine 
#                           of each sub-array   representation of                          return value of block
#                                               an Integer


# Example 3 (creatd on your own)
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# 1 
# 3
# => [1, 3]

# Line  Action              Object              Side Effect        Return Value     Is Return Value Used?
# 1     method call(.map)   outer Array         none               new array        No
#                                                                  [1, 3]                         
# 1-4   block exection      each sub-array      none               integer at       Yes, used by map 
#                                                                  index 0 of       for transformation
#                                                                  sub-array
# 2     method call(puts)   element at index 0  outputs a string   nil              No
#                           of each sub-array   integer
#
# 2     method call(.first) each sub_aray       none               index 0 of       Yes, used by puts
#                                                                  sub-array
# 3     method call(.first) each sub-array      none               index 0 of       Yes, used to determine return
#                                                                  sub-array        value for block
#                                                                                           


# Example 4:
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
# 18
# 7
# 12
# => [[18, 7], [3, 12]]

# Line  Action          Object          Side Effect     Return Value          Is Return Value Used?
# 1     variable        n/a             None            [[18, 7], [3, 12]]    No
#       asignement
#
# 1     method call     [[18, 7],       none            [[18, 7], [3, 12]]    Yes, used by my_arr
#       (.each)         [3, 12]]                           
#                                                           
# 1-7   outer block     each sub-       none            each sub-             No
#       execution       array                           array         
#                                                                           
# 2     method call     each sub-       none            each sub-array        Yes, used to determine     
#       (.each)         array                           in current iteration  return value of outer
#                                                                             block
# 2-6   inner block     each element    none            nil                   No
#       execution                                       
#
# 3     comparison      each element    none            boolean               Yes evaluated 
#       ( > )                                                                 by if
#
# 3-5   conditional     each element    none            nil                   Yes, used to determine
#       ( if )                                                                return value of inner
#                                                                             block
# 4     method call     each element    outputs string  nil                   Yes, used to determine 
#       (puts)                          integers                              return value of inner
#                                       greater than 5                        block
#


# Example 5:
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
# => [[2, 4], [6, 8]]

# Line   Action         Object            Side Effect   Return value    Is Return Value Used?
# 1      method call    [[1, 2],          none          [[2, 4]],       No
#        (.map)         [3, 4]]                         [[6, 8]]
# 
# 1-5    outer block    each sub-         none          new transf.     Yes, used by outer 
#        execution      array                           array           map for transfomration
#                                                                       
# 2      method call    each sub-         none          new transf.     Yes, used to determine outer
#        (.map)         array                           array           block's return value
# 
# 2-4    inner block    each element of   none          an integer      Yes, used by innner map
#        execution      current sub-                                    for transformation
#                       array                                           
#
# 3      multiply       each element of   none          a multiple      Yes, used to dtermine
#        operator(*)    current sub-                                    return value of inner
#        with 2 as      array                                           block
#        the argument


# Example 6:
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]

# Line  Action        Object      Side Effect     Return Value      Is Return Value Used?
# 1     method call   original    none            new collection    No
#       (.select)     array
#
# 1-5   outer block   each hash   none            new array with    Yes, used by .select 
#       execution                                 selection         for selection
#
# 2     method call   each hash   none            boolean           Yes, used to help determine
#       (.all?)                                                     outer block return value
#
# 2-4   inner block   each hash   none            boolean           Yes, used by .all? to help 
#       execution                                                   determine return value
#
# 3    uses == and    each key,   none            boolean           Yes, used to help determine
#      method call    value pair                                    value of inner block
#      (.to_s)

# What would happend if, instead of using .all? , we used any? . Why would this affect
# the return value of select?
# If any? were used that will cause any? to return true if at least one of the 
# collection members is not false or nil. Since since the array includes hash { :c => "cat" } and { a: 'ant'} than this impacts .select by
# returning the whole original array => [{:a=>"ant", :b=>"elephant"}, {:c=>"cat"}]. In the original problem .all?  returns false
# since not all of the hashes contain keys that match value[0] and the one that does [{ :c => "cat" }] is returned. 


# Example 7:
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
arr.sort # => [["1", "8", "11"], ["1", "8", "9"], ["2", "12", "15"], ["2", "6", "13"]]

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]


# Example 8:
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item  # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ["apple"]]


# Example 9: 
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [['a'], ['b'], ['c']]]


# Example 10: (difficult because of nested uneven array)
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1  # it's an integer
      el + 1
    else
      el.map do |n|     # it's an array
        n + 1
      end
    end
  end
end
# => [[[2, 3], [4, 5]], [6, 7]]


# Exampe of bad code:
def remove_evens!(arr)
  arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  arr
end

p remove_evens!([1,1,2,3,4,6,8,9])
# expected return value [1, 1, 3, 9]
# actual return value [1, 1, 3, 6, 9]

# create a shallow copy of the array to fix the code
def remove_evens!(arr)
  cloned_arr = arr.dup
  cloned_arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  arr
end
# => [1, 1, 3, 9]
