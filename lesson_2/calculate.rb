# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

Kernel.puts("Please give me a number")
number_1 = Kernel.gets().chomp()

Kernel.puts("Please give me a second number")
number_2 = Kernel.gets().chomp()

Kernel.puts("Choose an operation to perform.")
operator = Kernel.gets().chomp()

def operate(a, b, operator)
  case operator
  when "add" then a + b
  when "divide" then a.to_f / b.to_f
  when "multiply" then a * b
  when "subtract" then a - b
  when "remainder" then a % b
  else
    Kernel.puts("Invalid input. Please type 'add', 'subtract','multiply','subtract', or 'remainder'.")
    new_operator = Kernel.gets().chomp()
    operate(a, b, new_operator)
  end
end

Kernel.puts(operate(number_1.to_i, number_2.to_i, operator))
