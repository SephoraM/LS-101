VALID_CHOICES =
  {
    choice_list: %w(rock paper scissors lizard spock),
    r: "rock",
    p: "paper",
    sc: "scissors",
    l: "lizard",
    sp: "spock"
  }

WINNING_MOVES =
  {
    rock: ['scissors', 'lizard'],
    paper: ['rock', 'spock'],
    scissors: ['paper', 'lizard'],
    lizard: ['spock', 'paper'],
    spock: ['scissors', 'rock']
  }

def prompt(message)
  puts("=> #{message}")
end

def win?(player1, player2)
  WINNING_MOVES[player1.to_sym].include?(player2)
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

player_points = 0
computer_points = 0

choice_prompt = <<-MSG
  Choose an operation to perform:
    'r' for rock
    'p' for paper
    'l' for lizard
    'sc' for scissors
    'sp' for spock
MSG

prompt("Welcome to the game of #{VALID_CHOICES[:choice_list].join(', ')}!")

loop do
  choice = ''

  loop do
    prompt(choice_prompt)
    choice = gets.chomp.to_sym
    break if VALID_CHOICES.include?(choice)
    prompt("That is not a valid choice!")
  end

  computer_choice = VALID_CHOICES[:choice_list].sample
  player_choice = VALID_CHOICES[choice]

  prompt("The computer chose #{computer_choice}. You chose #{player_choice}.")

  display_results(player_choice, computer_choice)

  player_points += 1 if win?(player_choice, computer_choice)
  computer_points += 1 if win?(computer_choice, player_choice)

  if player_points == 5
    prompt("You are the grand winner!")
    player_points = 0
    computer_points = 0
  elsif computer_points == 5
    prompt("The computer is the grand winner!")
    player_points = 0
    computer_points = 0
  end

  prompt("Do you want to play again? (Y for yes)")
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing! Have a nice day!")
