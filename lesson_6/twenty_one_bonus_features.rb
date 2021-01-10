SUITS = ['clubs', 'hearts', 'spades', 'diamonds']

VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', 'jack',
          'queen', 'king', 'ace']

HOLD = 17

WIN = 21

MATCH_WIN = 5

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system 'clear'
end

def welcome
  loop do
    prompt "Welcome to 21!"
    prompt "First to #{MATCH_WIN} games wins the match."
    prompt "press 'enter' to contiue"

    input = gets.chomp

    break if input
  end
  clear_screen
end

def initialize_deck
  deck = []
  SUITS.each do |suit|
    VALUES.each do |value|
      deck << [value, suit]
    end
  end
  deck.shuffle
end

def points_tracker(cards)
  points = 0
  cards.each do |card|
    if card == 'ace'
      return points += 11
    elsif card.join.to_i == 0
      points += 10
    else
      points += card.join.to_i
    end
  end
  ace_checker(cards, points)
end

def ace_checker(cards, points)
  if cards.include?("ace") && points > WIN
    points -= 10
  end
  points
end

def busted?(cards)
  points_tracker(cards) > WIN
end

def detect_result(dealer_total, player_total)
  if player_total > WIN
    'player_busted'
  elsif dealer_total > WIN
    'dealer_busted'
  elsif dealer_total < player_total
    'player'
  elsif dealer_total > player_total
    'dealer'
  else
    'tie'
  end
end

def display_result(dealer_total, player_total)
  result = detect_result(dealer_total, player_total)

  case result
  when 'player_busted'
    prompt 'You busted! Dealer wins!'
  when 'dealer_busted'
    prompt 'Dealer busted! You win!'
  when 'player'
    prompt 'You win!'
  when 'dealer'
    prompt 'Dealer wins!'
  when 'tie'
    prompt "It's a tie!"
  end
end

player_wins = []
dealer_wins = []
def detect_game_win(result, dealer_wins, player_wins)
  case result
  when 'player_busted'
    dealer_wins << 1
  when 'dealer_busted'
    player_wins << 1
  when 'player'
    player_wins << 1
  when 'dealer'
    dealer_wins << 1
  end
end

def display_running_total(player_wins, dealer_wins)
  player = player_wins.count
  dealer = dealer_wins.count
  prompt "Game wins. Player: #{player} Dealer: #{dealer}."
end

def match_win?(player_wins, dealer_wins)
  if player_wins.count == MATCH_WIN
    puts "***********"
    prompt "Congratulations! You won the match!"
    puts "***********"
    player_wins.clear && dealer_wins.clear
  elsif dealer_wins.count == MATCH_WIN
    puts "***********"
    prompt "Sorry.The dealer won the match."
    puts "***********"
    player_wins.clear && dealer_wins.clear
  end
end

def display_grand_output(dealer_hand, player_hand, player_total, dealer_total)
  puts "***********"
  prompt "Dealer has #{dealer_hand},
          for a total of: #{dealer_total}"
  prompt "Player has #{player_hand},
          for a total of: #{player_total}"
  display_result(dealer_total, player_total)
  puts "***********"
end

def play_again?
  prompt "Play again? (y or n)"
  answer = nil
  loop do
    answer = gets.chomp.downcase
    if ['y', 'n', 'yes', 'no'].include?(answer)
      clear_screen
      break
    else
      prompt "Sorry, please enter y/yes or n/no."
    end
  end
  answer.start_with?("y")
end

welcome
loop do
  deck = initialize_deck
  player_hand = []
  dealer_hand = []

  2.times do
    player_hand << deck.slice!(0, 1).flatten
    dealer_hand << deck.slice!(0, 1).flatten
  end

  player_total = points_tracker(player_hand)
  dealer_total = points_tracker(dealer_hand)

  prompt "You have: #{player_hand[0]} and #{player_hand[1]},
          for a total of #{player_total}."
  prompt "Dealer's hand: #{dealer_hand[0]} and ?"

  loop do
    player_turn = nil
    loop do
      prompt "Type 'h for hit or 's' for stay."
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Invalid choice!"
    end

    if player_turn == 'h'
      player_hand << deck.slice!(0, 1).flatten
      player_total = points_tracker(player_hand)
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_hand}"
      prompt "Your total is now: #{player_total}"
    end

    break if player_turn == 's' || busted?(player_hand)
  end

  clear_screen

  if player_total > WIN
    display_grand_output(dealer_hand, player_hand, player_total, dealer_total)
    result = detect_result(dealer_total, player_total)
    detect_game_win(result, dealer_wins, player_wins)
    display_running_total(player_wins, dealer_wins)
    match_win?(player_wins, dealer_wins)
    play_again? ? next : break
  else
    prompt "You stayed at #{player_total}"
  end

  clear_screen

  prompt "Dealer turn..."

  loop do
    break if dealer_total >= HOLD

    prompt "Dealer hits!"
    dealer_hand << deck.slice!(0, 1).flatten
    dealer_total = points_tracker(dealer_hand)
    prompt "Dealer's cards are now: #{dealer_hand}"
  end

  if dealer_total > WIN
    prompt "Dealer total is now: #{dealer_total}"
    display_grand_output(dealer_hand, player_hand, player_total, dealer_total)
    result = detect_result(dealer_total, player_total)
    detect_game_win(result, dealer_wins, player_wins)
    display_running_total(player_wins, dealer_wins)
    match_win?(player_wins, dealer_wins)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  display_grand_output(dealer_hand, player_hand, player_total, dealer_total)
  result = detect_result(dealer_total, player_total)
  detect_game_win(result, dealer_wins, player_wins)
  display_running_total(player_wins, dealer_wins)
  match_win?(player_wins, dealer_wins)

  break unless play_again?
end

prompt "Thank you for playing Twenty-One!"
