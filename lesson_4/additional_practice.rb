# 1. Turn this array into a hash where the names are the keys and the values
#    are the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_with_index do |elem, index|
  flintstones_hash[elem] = index
end

p flintstones_hash

# 2. Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32,
         "Lily" => 30,
         "Grandpa" => 5843,
         "Eddie" => 10,
         "Marilyn" => 22,
         "Spot" => 237
        }

sum_of_ages = ages.values.reduce(:+)

p sum_of_ages

# 3. Throw out the really old people (age 100 or older).

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if { |_, v| v >= 100 }

p ages

# 4. Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32,
         "Lily" => 30,
         "Grandpa" => 5843,
         "Eddie" => 10,
         "Marilyn" => 22,
         "Spot" => 237
       }

min_age = ages.values.sort[0]

# or better:

min_age = ages.values.min

p min_age

# 5. Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.index { |name| name.start_with?("Be") }

# 6. Amend this array so that the names are all shortened to just the
#    first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |elem| elem[0, 3] }

p flintstones

# 7. Create a hash that expresses the frequency with which each letter
#    occurs in this string:

statement = "The Flintstones Rock"

statement_hash = Hash.new(0)

statement.chars.each { |c| statement_hash[c] += 1 }

p statement_hash

# 8. What happens when we modify an array while we are iterating over it?
#    What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# => 1 --on 0 index.
# then the first item is shifted off the array. The each method goes to the
# next iteration which is the 1 index. 2 is now on the zero index so it won't
# be seen by the method.
# => 3 -- now on the 1 index
# The first item is shifted off the array. So now 1 and 2 have been removed.
# This means there are only 2 items in the array. There have been two iterations,
# so the method will end execution.

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# 1 and 2 will be printed. On each iteration the last element gets popped off
# the array. print 1, pop 4. print 2, pop 3. There are no elements left.

# 9. This method in Ruby on Rails creates a string that has each word
#    capitalized as it would be in a title. Write your own version of
#    the rails titleize implementation.

words = "the flintstones rock"

def titleize(title)
  title.split.map(&:capitalize).join(" ")
end

puts titleize(words)

# 10. Modify the hash such that each member of the Munster family has an
#     additional "age_group" key that has one of three values describing the
#     age group the family member is in (kid, adult, or senior).

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |k, v|
  if (0..17).member?(v["age"])
    munsters[k]["age_group"] = "kid"
  elsif (18..64).member?(v["age"])
    munsters[k]["age_group"] = "adult"
  else
    munsters[k]["age_group"] = "senior"
  end
end

p munsters
