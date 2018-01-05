# 1. Select the key-value pairs where the value is 'Fruit'

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(fruits)
  value_of_fruit = {}
  fruit_array = fruits.to_a
  counter = 0

  loop do
    current_pair = fruit_array[counter]
    if current_pair[1] == 'Fruit'
      value_of_fruit[current_pair[0]] = current_pair[1]
    end

    counter += 1
    break if counter >= fruit_array.size
  end

  value_of_fruit
end

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}


# 2. Can you implement a double_numbers! method that mutates its argument?

def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] = numbers[counter] * 2

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers)

p my_numbers # => [2, 8, 6, 14, 4, 12]

# 3. What if we wanted to transform the numbers based on their position in
#    the array rather than their value?

def double_odd_indices(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_indices(my_numbers) # => [1, 8, 3, 14, 2, 12]

# 4. Try coding a method that allows you to multiply every array item by
#    a specified value

def multiply(numbers, num)
  counter = 0
  multiplied_numbers = []

  loop do
    break if counter == numbers.size

    multiplied_numbers << numbers[counter] * num

    counter += 1
  end

  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
