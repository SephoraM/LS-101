# 1. What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# -> 1
# -> 2
# -> 2
# -> 3

# 2. Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

#    what is != and where should you use it?
#        -> not equal. It should be used in a conditional expression
#    put ! before something, like !user_name
#        -> It would evaluate to the opposite boolean. So, a true expression becomes false, and false, true.
#    put ! after something, like words.uniq!
#        -> It's usually an indicator that the method will mutate the caller.
#    put ? before something
#        -> used with : in the ternary expression like so ? :
#    put ? after something
#        -> It's usually an indicator that the method will evaluate to a boolean.
#      put !! before something, like !!user_name
#        -> It'll turn the expression into it's boolean equivalent

# 3. Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!("important", "urgent")

# 4. The Ruby Array class has several methods for removing items from the array.
#    Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1) # -> delete at the 1 index (the number 2 will be removed and returned)
numbers.delete(1)    # -> delete the value 1 and return it

# 5. Programmatically determine if 42 lies between 10 and 100.

(10..100).include?(42)
# or
(10..100).cover?(42)

# 6. Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

famous_words.insert(0, "Four score and ")
# or
"Four score and " << famous_words
# or
"Four score and " + famous_words
# or
famous_words.prepend("Four score and ")

# Fun with gsub:

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

# This gives us a string that looks like a "recursive" method call:
# -> "add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"

# If we take advantage of Ruby's Kernel#eval method to have
# it execute this string as if it were a "recursive" method call

eval(how_deep)

# what will be the result?

# -> 42

# 8. If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# Make this into an un-nested array.

flintstones.flatten!

# 9. Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and Barney's number

flintstones.assoc("Barney")
