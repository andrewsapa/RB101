require 'yaml'
MESSAGES = YAML.load_file('rps_messages.yml')

VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

VALID_ABBR = ['r', 'l', 's', 'sp', 'p']

WINNING_COMBOS = { 'rock' => ['scissors', 'lizard'],
                   'paper' => ['rock', 'spock'],
                   'scissors' => ['paper', 'lizard'],
                   'lizard' => ['spock', 'paper'],
                   'spock' => ['scissors', 'rock'] }

FIVE = 5

PLAYER_WINS = []

COMPUTER_WINS = []

def prompt(message)
  puts("=> #{message}")
end

def ask_for_user_choice(choice)
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt(MESSAGES['note'])
    choice = gets.chomp.downcase

    if VALID_CHOICES.include?(choice)
      break
    elsif VALID_ABBR.include?(choice)
      choice = translate_abbr(choice)
      break
    else
      prompt('Invalid choice!')
    end
  end
  choice
end

def player_win?(player, computer)
  WINNING_COMBOS.key?(player) && WINNING_COMBOS[player].include?(computer)
end

def computer_win?(computer, player)
  WINNING_COMBOS.key?(computer) && WINNING_COMBOS[computer].include?(player)
end

def display_result(player, computer)
  if player_win?(player, computer)
    prompt('You won!')
    PLAYER_WINS.push(1)
  elsif computer_win?(computer, player)
    prompt('The computer won!')
    COMPUTER_WINS.push(1)
  else
    prompt('It was a tie!')
  end
end

def display_running_total
  prompt("Game wins: player #{PLAYER_WINS.sum}, computer #{COMPUTER_WINS.sum}.")
end

def translate_abbr(user_choice)
  case user_choice
  when 'r'
    'rock'
  when 'l'
    'lizard'
  when 'sp'
    'spock'
  when 's'
    'scissors'
  when 'p'
    'paper'
  end
end

def display_choices(user_choice, computer_choice)
  if VALID_CHOICES.include?(user_choice)
    puts "You chose: #{user_choice}, computer chose: #{computer_choice}."
  end
end

def display_match_winner
  if PLAYER_WINS.sum == FIVE
    prompt(MESSAGES['you_won'])
  elsif COMPUTER_WINS.sum == FIVE
    prompt(MESSAGES['computer_won'])
  end
end

def reset_scores(answer)
  if (PLAYER_WINS.sum == FIVE || COMPUTER_WINS.sum == FIVE) && (answer == 'y'|| answer == 'yes')
    PLAYER_WINS.clear && COMPUTER_WINS.clear
  end
end

def clear_screen(answer)
  if answer.downcase == ('y' || 'yes')
    system('clear')
  end
  answer
end

def clear_welcome
  prompt(MESSAGES['continue'])
  loop do
    input = gets.chomp

    if input
      system('clear')
      break
    end
  end
end

def program_loop
  answer = ''
  user_choice = ''
  choice = ''
  user_choice = ask_for_user_choice(choice)

  computer_choice = VALID_CHOICES.sample

  display_result(user_choice, computer_choice)

  display_choices(user_choice, computer_choice)

  display_running_total

  display_match_winner

  reset_scores(answer)
end

answer = ''
def play_again?(answer)
  loop do
    prompt(MESSAGES['line'])
    prompt(MESSAGES['again'])
    answer = gets.chomp
    answer.downcase!
    if (answer == 'n') || (answer == 'no')
    break
    elsif (answer == 'y') || (answer == 'yes')
      reset_scores(answer)
      system('clear')
      program_loop
    else
      puts "Invalid input!"
    end
  end
end

prompt(MESSAGES['welcome'])
prompt(MESSAGES['chance'])
prompt(MESSAGES['first'])
prompt(MESSAGES['ready'])
prompt(MESSAGES['line'])
clear_welcome

loop do
  program_loop
  break unless play_again?(answer)
end

prompt(MESSAGES['goodbye'])
