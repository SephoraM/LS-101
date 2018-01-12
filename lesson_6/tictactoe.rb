require 'pry'

INITIAL_PLAYER = 'choose'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  system('clear') || system('cls')
  puts "You're an #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop: enable Metrics/AbcSize

def initialize_scoreboard
  { Player: 0, Computer: 0 }
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |n| brd[n] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word ='or')
  last_square = arr.empty? ? '' : arr.pop
  arr.empty? ? last_square : "#{arr.join(delimiter)} #{word} #{last_square}"
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square #{joinor(empty_squares(brd))}:")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("That is not a valid choice!")
  end
  brd[square] = PLAYER_MARKER
end

def find_strategic_move(brd, current_player)
  winning_move = []
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(current_player) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      winning_move << line.select { |square| brd[square] == INITIAL_MARKER }
    end
  end
  winning_move.empty? ? nil : winning_move[0][0]
end

def ai_places_piece!(brd)
  if find_strategic_move(brd, COMPUTER_MARKER)
    brd[find_strategic_move(brd, COMPUTER_MARKER)] = COMPUTER_MARKER
  elsif find_strategic_move(brd, PLAYER_MARKER)
    brd[find_strategic_move(brd, PLAYER_MARKER)] = COMPUTER_MARKER
  elsif brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  else
    brd[empty_squares(brd).sample] = COMPUTER_MARKER
  end
end

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  elsif current_player == 'computer'
    ai_places_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end

  nil
end

def keep_score(winner, scorebrd)
  scorebrd[winner.to_sym] += 1
end

def display_current_score(scorebrd)
  prompt("Computer has won #{scorebrd[:Computer]} games.")
  prompt("You have won #{scorebrd[:Player]} games.")
end

def winner_of_five(scorebrd)
  scorebrd.key(5)
end

def determine_initial_player
  system('clear') || system('cls')
  if INITIAL_PLAYER == 'choose'
    loop do
      prompt("Who should start the game? ('c' for Computer, 'p' for Player)")
      choice = gets.chomp

      return 'player' if choice == 'p'
      return 'computer' if choice == 'c'

      prompt("That is not a valid choice! Try Again.")
    end
  end
  INITIAL_PLAYER
end

loop do
  scoreboard = initialize_scoreboard

  loop do
    board = initialize_board
    current_player = determine_initial_player
    display_board(board)

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt("#{detect_winner(board)} won!")
      keep_score(detect_winner(board), scoreboard)
    else
      prompt("It's a tie!")
    end

    break if winner_of_five(scoreboard)

    display_current_score(scoreboard)
    prompt("Do you want to continue playing? (y/n)")
    answer = gets.chomp

    break unless answer.downcase.start_with?('y')
  end

  system('clear') || system('cls')
  if scoreboard.value?(5)
    prompt("#{winner_of_five(scoreboard)} is the Grand Winner with 5 wins!")
  else
    prompt("There is no Grand Winner of this match!")
  end

  prompt("Do you want to start a new game? (y/n)")
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing Tic Tac Toe. Bye!")
