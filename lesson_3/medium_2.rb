# 1 and 2

# => Very long answers but I've spent time working with them and studying
#    the solutions.

# 3.

# -> My string looks like this now: pumpkins
# -> My array looks like this now: ["pumpkins", "rutabaga"]

# my_string isn't directly impacted by the method. += doesn't mutate
# the caller. It reassigns the concatenated string to a new object.
# The 'shovel' concatenation operator does affect the caller as it
# appends the new element to the same object.

# 5.

def color_valid(color)
  color == "blue" || color == "green"
end
