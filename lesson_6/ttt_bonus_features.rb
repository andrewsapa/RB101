INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
CHOICE = ['player', 'computer']
GAME_WINS = 5

def prompt(msg)
  puts "=> #{msg}"
end

def welcome
  loop do
    prompt "Welcome to Tic Tac Toe!"
    prompt "First to win 5 games wins the match!"
    prompt "(press 'enter' to continue)"
    user_input = gets.chomp

    break if user_input
    clear_screen
  end
end

def clear_screen
  system 'clear'
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  clear_screen
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
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
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

# joinor bonus feature
def joinor(array, symbol = ', ', symbol_2 = 'or')
  if array.size == 2
    array.join(' ').insert(-2, 'or ')
  elsif array.size == 1
    array.join
  else
    array.join(symbol.to_s).insert(-2, symbol_2.to_s + ' ')
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_offense(brd)
  WINNING_LINES.each do |line| # AI offense first
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      empty_squares(brd).select do |empty_sqr|
        line.each do |winning_square|
          if winning_square == empty_sqr
            return brd[winning_square] = COMPUTER_MARKER
          end
        end
      end
    end
  end
  nil
end

def computer_defense(brd)
  WINNING_LINES.each do |line| # AI defense second
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      empty_squares(brd).select do |empty_sqr|
        line.each do |at_risk_square|
          if at_risk_square == empty_sqr
            return brd[at_risk_square] = COMPUTER_MARKER
          end
        end
      end
    end
  end
  nil
end

def middle_square(brd)
  if brd[5] == ' ' # pick square 5 third, if empty
    return brd[5] = COMPUTER_MARKER
  end
  nil
end

def random_square(brd)
  square = empty_squares(brd).sample # pick random square last
  brd[square] = COMPUTER_MARKER
end

def computer_places_piece!(brd)
  computer_offense(brd) || computer_defense(brd) ||
    middle_square(brd) || random_square(brd)
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

# *line == line[0], line[1], line[2]
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

player_wins = []
def player_score(brd, player_wins)
  if detect_winner(brd) == 'Player'
    player_wins << 1
  end
  player_wins.count
end

computer_wins = []
def computer_score(brd, computer_wins)
  if detect_winner(brd) == 'Computer'
    computer_wins << 1
  end
  computer_wins.count
end

def display_running_total(brd, player_wins, computer_wins)
  a = player_score(brd, player_wins)
  b = computer_score(brd, computer_wins)
  prompt "Game wins: player #{a}, computer #{b}."
  prompt "First to #{GAME_WINS} games wins the match."
end

def match_win?(brd, player_wins, computer_wins)
  if player_wins.count == GAME_WINS || computer_wins.count == GAME_WINS
    player_wins.clear && computer_wins.clear
    prompt "Congratulations! #{detect_winner(brd)} won the match!"
  end
end

def determine_current_player
  loop do
    prompt "Would you like the player or computer to go first?"
    prompt "Type 'c' (computer), 'p' (player), or 'r' (random) to choose."
    current_player = gets.chomp.downcase

    if current_player == 'p'
      return CHOICE[0]
    elsif current_player == 'c'
      return CHOICE[1]
    elsif current_player == 'r'
      return CHOICE.sample
    end

    break if ['p', 'c', 'r'].include?(current_player)
    prompt "Sorry. Invalid choice!"
  end
  current_player
end

def alternate_player(current_player, next_player)
  if current_player == ''
    next_player = determine_current_player
  elsif current_player == 'computer'
    next_player = 'player'
  elsif current_player == 'player'
    next_player = 'computer'
  end
  next_player
end

def place_piece!(brd, current_player)
  if current_player == 'computer'
    computer_places_piece!(brd)
  elsif current_player == 'player'
    player_places_piece!(brd)
  end
  current_player
end

def play_again?
  prompt "Play again? (y or n)"
  answer = nil
  loop do
    answer = gets.chomp.downcase
    break if ['y', 'n', 'yes', 'no'].include?(answer)
    prompt "Sorry, please enter y/yes or n/no."
  end
  answer.start_with?("y")
end

# program loop
welcome

loop do
  board = initialize_board
  current_player = ''
  next_player = ''

  loop do
    display_board(board)
    display_running_total(board, player_wins, computer_wins)
    current_player = alternate_player(current_player, next_player)
    next_player = place_piece!(board, current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)
  display_running_total(board, player_wins, computer_wins)
  match_win?(board, player_wins, computer_wins)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  break unless play_again?
end

prompt "Thanks for play Tic Tac Toe! Goodbye!"
