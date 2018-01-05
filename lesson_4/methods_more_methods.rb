# 1. What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# => [1, 2, 3] because 'hi' is implicitly returned. It is a truthy value.

# 2. How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# if the length of the current string is less than 4, it evaluates to
# true and counts the element. Returns the total number of iterations
# which return true. Check the docs for help.

# 3. What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# => [1, 2, 3] because it will only reject truthy values, and puts returns nil.

# 4. What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# => { "a" => "ant", "b" => "bear", "c" => "cat" }
# Because we gave the method the hash object as an argument. We then assigned
# hash keys with the current element's first char and the element as the values.
# The hash was then returned.

# 5. What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# We can check the ruby docs for Hash methods.
# Removes the first key-value pair from the hash and returns it in an array.
# hash is now { b: 'bear'} as shift mutates the caller

# 6. What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# => 11
# because pop returns the last element from the array (whilst also removing it)
# so size is called on 'caterpillar'.

# 7. What is the block's return value in the following code? How is it
#    determined? Also, what is the return value of any? in this code.
#    What gets output by this code?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# num.odd? returns a boolean. As the last expression in the block, it is
# implicitly returned.
# any? checks for truthy values. If even one value evaluates to true, then then
# any returns true.
# => true - because there num.odd? has returned true on the first iteration.

# 8. How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# => [1, 2]
# We can check the Ruby docs for the Array class methods
# This is not destructive. It returns an array with the given number of elements
#  starting from the first.

# 9. What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# => [nil, 'bear'] because map returns an array.
# The first element returns 'nil' because the if statement returns 'nil' if
# no conditions evaluate to true.

# 10. What is the block's return value in the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# => [1, nil, nil] because puts returns nil, the last two elements are nil
