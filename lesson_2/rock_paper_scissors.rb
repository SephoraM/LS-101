VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(player1, player2)
  (player1 == 'rock' && player2 == 'scissors') ||
    (player1 == 'paper' && player2 == 'rock') ||
    (player1 == 'scissors' && player2 == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets.chomp
    break if VALID_CHOICES.include?(choice)
    prompt("That is not a valid choice!")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("The computer chose #{computer_choice}. You chose #{choice}.")

  display_results(choice, computer_choice)

  prompt("Do you want to play again? (Y for yes)")
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing! Have a nice day!")
