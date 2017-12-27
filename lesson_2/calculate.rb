# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

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
      prompt(MESSAGES['valid_number'])
    end
  end
  number
end

def operate(a, b, operator)
  case operator
  when "add"
    prompt(MESSAGES['adding'])
    a + b
  when "multiply"
    prompt(MESSAGES['multiplying'])
    a * b
  when "subtract"
    prompt(MESSAGES['subtracting'])
    a - b
  when "divide"
    prompt(MESSAGES['dividing'])
    a.to_f / b.to_f
  else
    prompt(MESSAGES['invalid'])
    operator = Kernel.gets().chomp()
    operate(a, b, operator)
  end
end

# begin program
prompt(MESSAGES['welcome'])
name = ''
loop do
  prompt(MESSAGES['given_name'])
  name = Kernel.gets().chomp()
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end
prompt(MESSAGES['greeting'] + name)

loop do # main loop
  number1 = get_number("first")
  number2 = get_number("second")

  operator_prompt = <<-MSG
    Choose an operation to perform:
      'add', 'multiply', 'subtract', or 'divide'
  MSG
  prompt(operator_prompt)
  operator = Kernel.gets().chomp()

  prompt("The result is #{operate(number1.to_i, number2.to_i, operator)}")

  prompt(MESSAGES['another'])
  another = Kernel.gets().chomp()
  break unless another.downcase.start_with?("y")
end
