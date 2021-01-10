require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def prompt(messages)
  puts("=> #{messages}")
end

def retrieve_input(input_type)
  prompt(MESSAGES[input_type])
  num = nil
  loop do
    num = gets.chomp
    space_check(num)
    symbol_check(num)
    break if valid_input?(num, input_type)
    prompt(MESSAGES["invalid_#{input_type}"])
  end
  num
end

def valid_input?(num, input_type)
  case input_type
  when 'loan_amount'
    valid_loan_amount?(num)
  when 'apr'
    valid_apr?(num)
  when 'loan_duration'
    valid_loan_duration?(num)
  end
end

def calculate_monthly_payment(loan_amount, apr, loan_duration)
  monthly_interest_rate = (apr / 100) / 12
  if monthly_interest_rate > 0
    loan_amount * (monthly_interest_rate /
    (1 - (1 + monthly_interest_rate)**(-loan_duration)))
  else
    loan_amount / loan_duration
  end
end

def valid_number?(num)
  num.to_f.to_s == num || num.to_i.to_s == num || num.end_with?("0")
end

def valid_loan_amount?(num)
  valid_number?(num) && num.to_f > 0
end

def valid_apr?(num)
  valid_number?(num) && num.to_f >= 0
end

def valid_loan_duration?(num)
  num.to_i.to_s == num && num.to_i > 0
end

def symbol_check(num)
  if num.end_with?('%')
    num.delete!('%')
  end
  if num.include?(',')
    num.delete!(',')
  end
  if num.start_with?('$')
    num.delete!('$')
  end
end

def space_check(num)
  if num.include?(' ')
    num.delete!(' ')
  end
end

def clear_screen(answer)
  if answer.downcase == 'y'
    system('clear')
  end
  answer
end

prompt(MESSAGES['welcome'])

loop do
  principal = retrieve_input('loan_amount')
  interest = retrieve_input('apr')
  loan_term = retrieve_input('loan_duration')
  result = calculate_monthly_payment(principal.to_f,
                                     interest.to_f,
                                     loan_term.to_i)
  prompt(MESSAGES['anticipatory_message'])
  puts "Your monthly payment is: $ #{format('%.2f', result)}"
  prompt(MESSAGES['perform_again?'])
  answer = gets.chomp
  break unless clear_screen(answer).downcase == 'y'
end

prompt(MESSAGES['goodbye'])
