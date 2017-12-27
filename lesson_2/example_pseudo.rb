
# A method that returns the sum of two integers

# Casual:
# Given two numbers
# Return the value of the first number plus the value of the second number

# Formal:
# START
# Given two numbers called "a" and "b"
# PRINT a + b
# END


# A method that takes an array of strings, and returns a string that is all
# those strings concatenated together

# Casual:
# Given a collection of strings
# Create an empty string
# Iterate through the collection
# - for each iteration, add the current value to the string
# After iterating through the collection, return the string

# Formal:
# START
# Given a collection of strings called "strings"
# SET result = ""
# SET iterator = 0
# WHILE iterator < length of strings
#   result = result + value within strings collection at space "iterator"
#   iterator = iterator + 1
# PRINT result
# END


# A method that takes an array of integers, and returns a new array with every
# other element

# Casual:
# Given a collection of integers
# Create an empty array
# Iterate through the collection
# - for each iteration, check if the iterator is an even number
# - if it is even, add the current value to the created array
# - otherwise, skip the iteration
# return new array of integers

# Formal:
# START
# Given a collection of integers called "numbers"
# SET every_other = []
# SET iterator = 0
# WHILE iterator < length of numbers
#   IF iterator is an even number
#     push value within numbers collection at the space "iterator" to every_other
#   ELSE
#     go to the next iterator
#   iterator = iterator + 1
# PRINT every_other
# END 
