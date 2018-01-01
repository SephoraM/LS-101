# 1. For this practice problem, write a one-line program that creates the following output 10 times,
#    with the subsequent line indented 1 space to the right:

10.times { |i| puts (" " * i) << "The Flintstones Rock!"}

# 2. The result of the following statement will be an error:
#      puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?

# It can't concatenate a string and a number
# We can use string interpolation
puts "the value of 40 + 2 is #{40 + 2}"
# or we can convert the number to a string before concatenation
puts "the value of 40 + 2 is " + (40 + 2).to_s

# From now on I will simply write the answers rather than the questions and answers
# 3.

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

# Bonus 1: It checks that number divided by dividend has no remainder
# Bonus 2: returns the divisors array because it's the last statement executed

# 4.
# The first method will change the original array.
# The second will return a new array with all the elements

# 5.

def fib(first_num, second_num)
  limit = 15
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# or
limit = 15

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# 6. This is a direct copy of the solution because the question didn't make sense to me
#    until I looked at the solution. I didn't see why I would want to create a
#    new string and then do nothing with it and then change the given array within the
#    same method. Since the result made no sense, the question "How can we refactor this
#    practice problem to make the result easier to predict and easier for the next programmer
#    to maintain?" made no sense. Why would I make a method that did this in the first place?
#    Looking at the solution, I understand what they want. This method no longer changes the
#    array. It now also returns the new string and array. This method now makes sense.

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

# 7.

# -> 34

# 8.

# Yes. The method receives a reference to the hash object as an argument so it affects it directly.

# 9.

# paper

# 10.

# no
