WINNING_COMBOS = {'rock' => ['scissors', 'lizard'], 
                  'paper' => ['rock', 'spock'],
                  'scissors' => ['paper', 'lizard'],
                  'lizard' => ['spock', 'paper'],
                  'spock' => ['scissors', 'rock']
                  }

def prompt(message)
  puts("=> #{message}")
end

def player_win?(player, computer)
  WINNING_COMBOS.has_key?(player) && 
  WINNING_COMBOS[player].include?(computer) 
end

def computer_win?(computer, player)
  WINNING_COMBOS.has_key?(computer) && 
  WINNING_COMBOS[computer].include?(player)
end

player_wins = []
computer_wins = []

def display_result(player, computer, player_wins, computer_wins)
  if player_win?(player, computer)
    prompt('You won!')
    player_wins.push(1)
  elsif computer_win?(computer, player)
    prompt('The computer won!')
    computer_wins.push(1)
  else
    prompt('It was a tie!')
  end
end

display_result('lizard', 'scissors', player_wins, computer_wins)
display_result('scissors', 'lizard', player_wins, computer_wins)
display_result('rock', 'paper', player_wins, computer_wins)
display_result('paper', 'spock', player_wins, computer_wins)
display_result('lizard', 'spock', player_wins, computer_wins)
display_result('rock', 'paper', player_wins, computer_wins)
display_result('scissors', 'rock', player_wins, computer_wins)
display_result('spock', 'paper', player_wins, computer_wins)

p player_wins
p computer_wins

if player_wins.length == 5 
  prompt('You won 5 games for a match win! Congratulations!')
elsif computer_wins.length == 5
  prompt('The computer won 5 games for a match win.')
end