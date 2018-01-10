# 1. Order this array of number strings by descending numeric value

arr = ['10', '11', '9', '7', '8']

sorted_by_arr = arr.sort_by { |n| -n.to_i }

# or

sorted_arr = arr.sort do |a, b|
  b.to_i <=> a.to_i
end

# 2. Order this array of hashes based on the year of publication of each book,
#    from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted_by_year = books.sort_by do |hash|
  hash[:published]
end

# 3. Demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

p arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

p arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

p arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

p hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

p hsh2[:third].keys[0]

# 4. For each of these collection objects where the value 3 occurs,
#    demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]

arr1[1][1] = 4

p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

arr2[2] = 4

p arr2

hsh1 = {first: [1, 2, [3]]}

hsh1[:first][2][0] = 4

p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

hsh2[['a']][:a][2] = 4

p hsh2

# 5. Figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_male_age = 0

munsters.each { |_, m| total_male_age += m["age"] if m["gender"] == "male" }

p total_male_age

# 6. Given this family hash, print out the name, age and gender of each member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |munster, details|
  puts "#{munster} is a #{details["age"]}-year-old #{details["gender"]}."
end

# 7. Given this code, what would be the final values of a and b?

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# a => 2, b => [3, 8]

# 8. Using the each method, write some code to output all of the vowels
#    from the strings.

hsh = {
       first: ['the', 'quick'],
       second: ['brown', 'fox'],
       third: ['jumped'],
       fourth: ['over', 'the', 'lazy', 'dog']
     }

hsh.each do |_, arr|
  arr.each do |word|
    word.chars.each do |c|
      puts c if "aeiou".include?(c)
    end
  end
end

# 9. Return a new array of the same structure but with the sub arrays being
#    ordered in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

descending_sub_arrs = arr.map do |sub_arr|
  sub_arr.sort { |a, b| b <=> a }
end

p descending_sub_arrs

# 10. Given the following data structure and without modifying the original
#     array, use the map method to return a new array identical in structure
#     to the original but where the value of each integer is incremented by 1.

original_arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_arr = original_arr.map do |hash|
  hash.map { |k, v| [k, v + 1] }.to_h
end

p original_arr
p new_arr

# 11. Given the following data structure use a combination of methods,
#     including either the select or reject method, to return a new array
#     identical in structure to the original but containing only the integers
#     that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

multiples_of_three = arr.map do |sub_arr|
  sub_arr.select { |n| n % 3 == 0 }
end

p multiples_of_three

# 12. Given the following data structure, and without using the Array#to_h
#     method, write some code that will return a hash where the key is the
#     first item in each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

arr_to_hash = arr.each_with_object({}) do |element, hash|
  hash[element[0]] = element[1]
end

p arr_to_hash

# 13. Given the following data structure, return a new array containing the
#     same sub-arrays as the original but ordered logically according to the
#     numeric value of the odd integers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

new_arr = arr.sort_by do |sub_array|
  sub_array.select do |e|
    e.odd?
  end
end

p new_arr

# 14. Given this data structure write some code to return an array containing
#     the colors of the fruits and the sizes of the vegetables. The sizes
#     should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = hsh.map do |_, dtls|
  dtls[:type] == 'fruit' ? dtls[:colors].map(&:capitalize) : dtls[:size].upcase
end

p arr

# 15. Given this data structure write some code to return an array which
#     contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

even_arr = arr.select do |hash|
  hash.values.flatten.all? { |n| n.even? }
end

p even_arr

# 16. Write a method that returns one UUID when called with no parameters.

def create_uuid()
  possibles = ('a'..'z').to_a.concat((1..9).to_a)
  portions = [8, 4, 4, 4, 12]

  uuid = portions.map do |portion|
    uuid_string = ''
    portion.times { uuid_string += possibles.sample.to_s }
    uuid_string
  end

  uuid.join('-')
end


puts create_uuid()
