# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def get_number(target_number)
  number = ''
  loop do
    prompt("What's the #{target_number} number?")
    number = Kernel.gets().chomp()

    if valid_number?(number)
      break
    else
      prompt("Oops, that's not a valid number. Please try again.")
    end
  end
  number
end

def operate(a, b, operator)
  case operator
  when "add"       then a + b
  when "multiply"  then a * b
  when "subtract"  then a - b
  when "divide"    then a.to_f / b.to_f
  else
    prompt("That is not a valid input.")
    prompt("Please type 'add', 'multiply', 'subtract', or 'divide'.")
    operator = Kernel.gets().chomp()
    operate(a, b, operator)
  end
end

# begin program
prompt("Welcome to Calculator!")
name = ''
loop do
  prompt("What is your name?")
  name = Kernel.gets().chomp()
  if name.empty?
    prompt("Please give me a valid name :)")
  else
    break
  end
end
prompt("Nice to meet you, #{name}")

loop do #main loop
  number1 = get_number("first")
  number2 = get_number("second")

  prompt("Choose an operation to perform. ('add', 'multiply', 'subtract', or 'divide')")
  operator = Kernel.gets().chomp()

  prompt("The result is #{operate(number1.to_i, number2.to_i, operator)}")

  prompt("Would you like to make another calculation? (Y for yes)")
  another = Kernel.gets().chomp()
  break unless another.downcase.start_with?("y")
end
