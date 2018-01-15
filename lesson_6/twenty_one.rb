require 'pry'

BUST = 22

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  new_deck = {
    hearts: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace'],
    diamonds: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace'],
    clubs: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace'],
    spades: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace']
  }
  new_deck
end

def initialize_hand
  new_hand = {
    'player' => [],
    'dealer' => []
  }
  new_hand
end

def initialize_game!(deck, hands)
  2.times { deal_card!(deck, hands, 'player') }
  2.times { deal_card!(deck, hands, 'dealer') }
end

def deal_card!(deck, dealt_cards, player)
  current_suit = deck.keys.sample
  current_value = deck[current_suit].sample
  dealt_cards[player] << [current_suit, current_value]
  deck[current_suit].delete(current_value)
end

def bust?(total)
  total >= BUST
end

def calculate_card_value(card)
  case card
  when 'king'  then 10
  when 'jack'  then 10
  when 'queen' then 10
  else card
  end
end

def calculate_ace_value(aces, total)
  aces.pop
  total += total <= (10 - aces.size) ? 11 : 1
  aces.empty? ? total : calculate_ace_value(aces, total)
end

def calculate_total_value(hand)
  aces = hand.select { |card| card.at(1) == 'ace' }
  if aces.empty?
    hand.map { |card| calculate_card_value(card.at(1)) }.reduce(:+)
  else
    no_aces = hand.select { |card| card.at(1) != 'ace' }
    sum = no_aces.map { |card| calculate_card_value(card.at(1)) }.reduce(:+)
    calculate_ace_value(aces, sum)
  end
end

def display_first_card(dealer_hand)
  puts "Dealer has a #{dealer_hand[0][1]} of #{dealer_hand[0][0]}.\n\n"
end

def display_cards(hand, person_has)
  hand.each do |card|
    puts "#{person_has} a #{card[1]} of #{card[0]}."
  end
  puts "\n"
end

def display_busted(winner, loser)
  puts "#{loser} bust! #{winner} Wins."
end

def find_winner(player, dealer)
  if player == dealer
    'tie'
  elsif player > dealer
    'Player'
  else
    'Dealer'
  end
end

def puts_with_newline(msg)
  puts "#{msg}\n\n"
end

def declare_current_score(person, score)
  puts_with_newline("--- #{person}'s cards have a combined" \
                    " value of #{score} ---")
end

def declare_winner(player, dealer)
  system('clear') || system('cls')
  declare_current_score("Player", player)
  declare_current_score("Dealer", dealer)
  winner = find_winner(player, dealer)
  puts winner.start_with?('P', 'D') ? "#{winner} Wins!" : "It's a tie!"
end

def play_again?
  answer = ''
  loop do
    prompt("Would you like to play again? (y/n)")
    answer = gets.chomp

    break if answer.downcase.start_with?('y', 'n')
    prompt("That's not a valid answer. Try again.")
  end
  system('clear') || system('cls')
  answer.downcase.start_with?('y') ? true : false
end

system('clear') || system('cls')
puts "Welcome to the game of Twenty-One."
puts_with_newline("Try to make the total value of your cards " \
                  "as close to 21 as you can without going over.")

loop do
  puts_with_newline(prompt("Beat the dealer's hand without going bust!"))

  deck = initialize_deck
  hands = initialize_hand
  initialize_game!(deck, hands)

  display_first_card(hands['dealer'])
  display_cards(hands['player'], "You have")

  dealers_total = calculate_total_value(hands['dealer'])
  players_total = calculate_total_value(hands['player'])

  loop do
    break if bust?(players_total)

    declare_current_score("Player", players_total)
    prompt("Would you like to 'hit' or 'stay'?")
    answer = gets.chomp

    if answer.downcase == 'hit'
      system('clear') || system('cls')

      deal_card!(deck, hands, 'player')

      display_first_card(hands['dealer'])
      puts_with_newline("Dealer hands you a card.")
      display_cards(hands['player'], "You have")

      players_total = calculate_total_value(hands['player'])
    elsif answer.downcase == 'stay'
      puts_with_newline("You chose to stay!")
      break
    else
      prompt("Oops. That wasn't a valid option. Try again.")
    end
  end

  if bust?(players_total)
    system('clear') || system('cls')
    display_cards(hands['player'], "You have")
    declare_current_score("Player", players_total)
    display_busted("Dealer", "You're")
    play_again? ? next : break
  end

  system('clear') || system('cls')
  display_cards(hands['player'], "You have")
  declare_current_score("Player", players_total)

  loop do
    display_cards(hands['dealer'], "Dealer has")
    declare_current_score("Dealer", dealers_total)

    break if dealers_total >= 17

    deal_card!(deck, hands, 'dealer')
    puts_with_newline("Dealer hands itself a card.")
    dealers_total = calculate_total_value(hands['dealer'])
  end

  if bust?(dealers_total)
    system('clear') || system('cls')
    display_cards(hands['dealer'], "Dealer has")
    declare_current_score("Dealer", dealers_total)
    display_busted("Player", "Dealer's")
    play_again? ? next : break
  end

  declare_winner(players_total, dealers_total)
  break unless play_again?
end

puts "Thank you for playing. Goodbye!"