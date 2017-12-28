
def valid_integer?(str)
  str.to_i.to_s == str
end

def valid_float?(str)
  str.to_f.to_s == str
end

def calculate_monthly_interest(apr)
  (apr / 100) / 12
end

def calculate_months(years)
  years * 12
end

def calculate_payment(loan, rate, months)
  loan * (rate / (1 - (1 + rate)**-months))
end

def prompt(string)
  puts "=> #{string}"
end

def determine_amount(question, sym)
  amount = ''
  loop do
    prompt(question)
    print sym
    amount = gets.chomp
    break if valid_float?(amount) || valid_integer?(amount)
    prompt("Sorry, I need a number! Please try again.")
  end
  amount
end

prompt("Welcome to the Mortgage/Car Loan Calculator!")

loop do
  loan_amount = determine_amount("What is the size of your loan in dollars?",
                                 "$ ")
  annual_rate = determine_amount("What is the Annual Percentage Rate?", "% ")
  loan_duration = determine_amount("What is the duration of the loan in years?",
                                   "-> ")

  monthly_rate = calculate_monthly_interest(annual_rate.to_f)
  duration_in_months = calculate_months(loan_duration.to_i)

  monthly_payment = calculate_payment(loan_amount.to_f,
                                      monthly_rate,
                                      duration_in_months.to_f)

  prompt("Your monthly payment will be $ #{format('%.2f', monthly_payment)}")

  prompt("Would you like to make another calculation? (Y for yes)")
  continue = gets.chomp
  break unless continue.downcase.start_with?("y")
end
