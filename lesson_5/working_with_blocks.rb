# Example 3: Map out a detailed breakdown of code

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# =>  | line  |      Action       |     Object     | Return Value | Value Used?
# =>  |   3   | method call(map)  | the outer array| new array    | Not here
#                                                  |   [1, 3]     |
# Side Effect? None
# =>  |  3-6  | block execution   | each sub-array | each sub-    | Yes, map
#                                                  |  array's 0   | uses for
#                                                  | index element|transformation
# Side Effect? None
# =>  |  4    | method call(puts) | 0 index of sub |   nil        | no
#                                 |    -array      |
# Side effect? Yes, prints the object#to_string
# =>  |  5    | method call(first)| each sub-array | each sub-    | Yes, by the
#                                                  |  array's 0   | block's
#                                                  | index element| return value
# Side Effect? None
# Example 4:

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

# => 18
# => 7
# => 12
# => [[18, 7], [3, 12]]

# => Line: 25
# => Action: variable assignment
# => Object: n/a
# => Side Effect: none
# => Return Value: [[18, 7], [3, 12]], the return value of each
# => Is Return Value Used?  No

# => Line: 25
# => Action: method call(each)
# => Object: [[18, 7], [3, 12]]
# => Side Effect: none
# => Return Value: the original array [[18, 7], [3, 12]]
# => Is Return Value Used? yes, it is used to instantiate my_arr

# => Line: 25 - 31
# => Action: block execution
# => Object: each sub-array
# => Side Effect: none
# => Return Value: each original sub-array
# => Is Return Value Used? no

# => Line: 26
# => Action: method call(each)
# => Object: each sub-array
# => Side Effect: none
# => Return Value: each original sub-array
# => Is Return Value Used? yes, it's the return value of the outer block

# => Line: 26 - 30
# => Action: block execution
# => Object: each element in sub-array
# => Side Effect: none
# => Return Value: nil
# => Is Return Value Used? no

# => Line: 27
# => Action: conditional(if)
# => Object: each element of the sub-array
# => Side Effect: none
# => Return Value: nil
# => Is Return Value Used? yes, as block's return value

# => Line: 28
# => Action: method call(puts)
# => Object: each element in sub-array
# => Side Effect: prints string representation of each element that is true
# => Return Value: nil
# => Is Return Value Used? yes, as block's return value

# Example 5:

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# => [[2, 4], [6, 8]]

# => Line: 89
# => Action: method call(map)
# => Object: [[1, 2], [3, 4]]
# => Side Effect: none
# => Return Value: new array created with the return values of block
# => Is Return Value Used? no

# => Line: 89 - 93
# => Action: outer block execution
# => Object: each sub-array
# => Side Effect: none
# => Return Value: each sub array returned by inner block
# => Is Return Value Used? yes, it's used to assign the elements of returned array

# => Line: 90
# => Action: method call(map)
# => Object: each sub-array
# => Side Effect: none
# => Return Value: new array created with the return values of block
# => Is Return Value Used? yes, it's used as the outer block's return value

# => Line: 90 - 92
# => Action: inner block execution
# => Object: each element in the sub-array
# => Side Effect: none
# => Return Value: each element * 2
# => Is Return Value Used? yes, as the transformed elements of the sub-arrays

# => Line: 91
# => Action: method call(*)
# => Object: each element in sub-array
# => Side Effect: none
# => Return Value: each element * 2
# => Is Return Value Used? yes as the returned value of block
