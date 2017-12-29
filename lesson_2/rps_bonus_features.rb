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

def add_points(board, player, computer)
  if win?(player, computer)
    board[:human] += 1
  elsif win?(computer, player)
    board[:human] += 1
  end
end

def win_five?(points)
  points == 5
end

def erase_score(board)
  board[:human] = 0
  board[:computer] = 0
end

prompt("Welcome to the game of #{VALID_CHOICES[:choice_list].join(', ')}!")
prompt("Win five games and become the Grand Winner!")

score_board =
  {
    human: 0,
    computer: 0
  }

choice_prompt = <<-MSG
  Choose an operation to perform:
    'r' for rock
    'p' for paper
    'l' for lizard
    'sc' for scissors
    'sp' for spock
MSG

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

  add_points(score_board, player_choice, computer_choice)
  prompt("Computer points: #{score_board[:computer]}")
  prompt("Your points: #{score_board[:human]}")

  if win_five?(score_board[:human])
    prompt("You win the match!")
    erase_score(score_board)
  elsif win_five?(score_board[:computer])
    prompt("Computer wins the match!")
    erase_score(score_board)
  end

  prompt("Do you want to play again? (Y for yes)")
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
  system('clear') || system('cls')
end

prompt("Thank you for playing! Have a nice day!")
