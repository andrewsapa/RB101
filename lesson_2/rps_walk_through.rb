### rock paper scissors walk through ###

## game flow ##
# the user makes a choice
# the computer makes a choice
# the winner is displayed

VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_result(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif player == computer
    prompt('It was a tie.')
  else
    prompt('The computer won!')
  end
end

loop do
  user_choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    user_choice = gets.chomp

    if VALID_CHOICES.include?(user_choice)
      break
    else
      prompt("Invalid choice!")
    end
  end

  computer_choice = VALID_CHOICES.sample

  display_result(user_choice, computer_choice)

  puts "You chose: #{user_choice}; and the computer chose: #{computer_choice}."

  prompt("Do you want to play again (type 'y' to play again)?")
  answer = gets.chomp

  unless answer.downcase == 'y'
    break
  end
end

prompt('Thank you for playing. Good bye!')
