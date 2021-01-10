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

def display_running_total(player_wins, computer_wins)
  prompt("Game wins: player #{player_wins.sum}, computer #{computer_wins.sum}.")
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

def display_match_winner(player_wins, computer_wins)
  if player_wins.sum == FIVE
    prompt(MESSAGES['you_won'])
  elsif computer_wins.sum == FIVE
    prompt(MESSAGES['computer_won'])
  end
end

def reset_scores(player_wins, computer_wins, answer)
  if (player_wins.sum == FIVE || computer_wins.sum == FIVE) && answer == 'y'
    player_wins.clear && computer_wins.clear
  end
end

def clear_screen(answer)
  if answer.downcase == 'y'
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

prompt(MESSAGES['welcome'])
prompt(MESSAGES['chance'])
prompt(MESSAGES['first'])
prompt(MESSAGES['ready'])
prompt(MESSAGES['line'])
clear_welcome


loop do
  user_choice = ''
  choice = ''
  user_choice = ask_for_user_choice(choice)
  
  computer_choice = VALID_CHOICES.sample

  display_result(user_choice, computer_choice, player_wins, computer_wins)

  display_choices(user_choice, computer_choice)
  
  display_running_total(player_wins, computer_wins)

  display_match_winner(player_wins, computer_wins)
  
  prompt(MESSAGES['line'])
  prompt(MESSAGES['again'])
  answer = gets.chomp

  reset_scores(player_wins, computer_wins, answer)

  break unless clear_screen(answer) == 'y'
end

prompt(MESSAGES['goodbye'])
