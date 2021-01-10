=begin
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.
=end

DECK = {"clubs"=>[2, 3, 4, 5, 6, 7, 8, 9, ['jack', 10], ['queen', 10], ['king', 10], ['ace', [1, 11]]],
        "hearts"=>[2, 3, 4, 5, 6, 7, 8, 9, ['jack', 10], ['queen', 10], ['king', 10], ['ace', [1, 11]]],
        "diamonds"=>[2, 3, 4, 5, 6, 7, 8, 9, ['jack', 10], ['queen', 10], ['king', 10], ['ace', [1, 11]]],
        "spades"=>[2, 3, 4, 5, 6, 7, 8, 9, ['jack', 10], ['queen', 10], ['king', 10], ['ace', [1, 11]]]
        }
            
PLAYERS_HAND = {}

COMPUTERS_HAND = {}

SPECIAL_CARDS = ['queen', 'jack', 'king', 'ace']

PLAYERS_POINTS = []

COMPUTERS_POINTS = []

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system 'clear'
end

def welcome_message
  loop do 
    prompt "Welcome to 21!"
    prompt "press 'enter' to contiue"
    
    input = gets.chomp
    
    break if input
  end
  clear_screen
end

def generate_cards_player
  random_card_suit = DECK.keys.sample
  PLAYERS_HAND[random_card_suit]
  
  value = DECK[random_card_suit]
  random_value = value.sample
  
  PLAYERS_HAND[random_card_suit] = random_value
end

def generate_cards_commputer
  random_card_suit = DECK.keys.sample
  COMPUTERS_HAND[random_card_suit]
  
  value = DECK[random_card_suit]
  random_value = value.sample
  
  COMPUTERS_HAND[random_card_suit] = random_value
end

def display_computer_cards
  suit = COMPUTERS_HAND.keys
  computers_value = COMPUTERS_HAND.values.flatten

  if SPECIAL_CARDS.include?(computers_value[0])
    special_card = computers_value[0]
    points = computers_value[1]
    prompt "Computer has #{special_card} of #{suit[0]}"
  else
    points = computers_value[0]
    prompt "Computer has #{points} of #{suit[0]}"
  end
end

def display_player_cards
  suit = PLAYERS_HAND.keys
  players_value = PLAYERS_HAND.values.flatten

  if SPECIAL_CARDS.include?(players_value[0]) # face cards and ace
    special_card = players_value[0]
    prompt "Player has #{special_card} of #{suit[0]}"
  else
    points = players_value[0]
    prompt "Player has #{points} of #{suit[0]}"
  end
end

def player_points
  players_value = PLAYERS_HAND.values.flatten

  if SPECIAL_CARDS.include?(players_value[0]) # face cards and ace
    points = players_value[1]
    
    if players_value[0] == 'ace'
      points = players_value[1..2]
    end
    
  else
    points = players_value[0]
  end
  PLAYERS_POINTS << points
  PLAYERS_POINTS.sum
end

def computer_points
  computers_value = COMPUTERS_HAND.values.flatten

  if SPECIAL_CARDS.include?(computers_value[0]) # face cards and ace
    points = computers_value[1]
    
    if computers_value[0] == 'ace'
      points = computers_value[1..2]
    end
    
  else
    points = computers_value[0]
  end
  COMPUTERS_POINTS << points
  COMPUTERS_POINTS.sum
end

def busted?
  if PLAYERS_POINTS.sum > 21
    prompt "I'm sorry you lost!"
  end
  PLAYERS_POINTS.sum
end

welcome_message
answer = nil
loop do
  generate_cards_player
  generate_cards_commputer
  
  display_player_cards
  puts player_points
  busted?
  
  display_computer_cards
  puts computer_points
  
  prompt "hit or stay?"
  answer = gets.chomp
  break if answer == 'stay' || busted? > 21
end
