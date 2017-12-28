
def valid_integer?(str)
  str.to_i.to_s == str
end

def valid_float?(str)
  str.to_f.to_s == str
end

def monthly_interest(apr)
  (apr / 100) / 12
end

def number_of_months(years)
  years * 12
end

def payment_per_month(loan, rate, months)
  loan * (rate / (1 - (1 + rate)**-months))
end

def prompt(string)
  puts "=> #{string}"
end

def determine_amounts(question, sym)
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

# START  -- main program
prompt("Welcome to the Mortgage/Car Loan Calculator!")

loan_amount = determine_amounts("What is the size of your loan in dollars?",
                                "$ ")
annual_rate = determine_amounts("What is the Annual Percentage Rate?", "% ")
loan_duration = determine_amounts("What is the duration of the loan in years?",
                                  "-> ")

monthly_rate = monthly_interest(annual_rate.to_f)
duration_in_months = number_of_months(loan_duration.to_i)

monthly_payment = payment_per_month(loan_amount.to_f,
                                    monthly_rate,
                                    duration_in_months.to_f)

prompt("Your monthly payment will be $ #{format('%.2f', monthly_payment)}")

# END
