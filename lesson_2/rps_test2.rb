WINNING_COMBOS = {'rock' => ['scissors', 'lizard'], 
                  'paper' => ['rock', 'spock'],
                  'scissors' => ['paper', 'lizard'],
                  'lizard' => ['spock', 'paper'],
                  'spock' => ['scissors', 'rock']
                  }

player = 'rock'
computer = 'lizard'
puts WINNING_COMBOS[player].include?(computer) 

WINNING_COMBOS.has_key?(computer) && WINNING_COMBOS[computer].include?(player)