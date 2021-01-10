WINNING_COMBOS = {'rock' => ['scissors', 'lizard'], 
                  'paper' => ['rock', 'spock'],
                  'scissors' => ['paper', 'lizard'],
                  'lizard' => ['spock', 'paper'],
                  'spock' => ['scissors', 'rock']
                  }

def display_result(player, computer)
  if WINNING_COMBOS.has_key?(player) && WINNING_COMBOS[player].include?(computer) 
    puts 'You won!'
  elsif WINNING_COMBOS.has_key?(computer) && WINNING_COMBOS[computer].include?(player)
    puts 'The computer won!'
  else
    puts 'It was a tie!'
  end
end

# you won
display_result('rock', 'scissors') # you won
display_result('rock', 'lizard') # you won
display_result('paper', 'rock') # you won
display_result('paper', 'spock') # you won
display_result('scissors', 'lizard') # you won
display_result('scissors', 'paper') # you won
display_result('lizard', 'spock') # you won
display_result('lizard', 'paper') # you won
display_result('spock', 'scissors') # you won
display_result('spock', 'rock') # you won
puts "----------------------------"
# tie
display_result('rock', 'rock') # tie
display_result('paper', 'paper') # tie
display_result('spock', 'spock') # tie
display_result('scissors', 'scissors') # tie
display_result('lizard', 'lizard') # tie
puts "-----------------------------"
# computer won
display_result('scissors', 'rock') # computer won
display_result('lizard', 'rock') # computer won
display_result('rock', 'paper') # computer won
display_result('spock', 'paper') # computer won
display_result('lizard', 'scissors') # computer won
display_result('paper', 'scissors') # computer won
display_result('spock', 'lizard') # computer won
display_result('paper', 'lizard') # computer won
display_result('scissors', 'spock') # computer won
display_result('rock', 'spock') # computer won













=begin
def win?(first, second)
  (first == 'rock' && second == has_value?(first)) ||
  (first == 'paper' && second == has_value?(first)) ||
  (first == 'scissors' && second == has_value?(first)) ||
  (first == 'lizard' && second == has_value?(first)) ||
  (first == 'spock' && second == has_value?(first))
end
=end
