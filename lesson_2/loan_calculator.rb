def valid_number?(input)
  input.to_f.to_s == input || input.to_i.to_s == input || input.end_with?("0")
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt('Welcome to the loan calculator!')

loop do
  prompt('Please enter in a loan amount:')

  loan_amount = nil
  loop do
    loan_amount = Kernel.gets().chomp()
    if loan_amount.include?(',')
      prompt("Please do NOT include ','")
    elsif loan_amount.to_f <= 0
      prompt('Please enter a positive loan amount number.')
    elsif valid_number?(loan_amount)
      break
    else
      prompt("That's not a valid number! Please enter a valid loan amount:")
    end
  end

  prompt('Please enter an annual percentage rate (APR) Note: this calculator
  uses APR as percentage and not as decimal (e.g. 2.9% instead of 0.029).')

  apr = nil
  loop do
    apr = Kernel.gets().chomp()
    if apr.to_f <= 0
      prompt('Please enter a positive annual percentage rate (APR) number.')
    elsif valid_number?(apr) || apr.end_with?('%')
      break
    else
      prompt("That's not a valid number! Please enter a annual
             percentage rate (APR).")
    end
  end

  prompt('Please enter a loan duration (i.e. in months).')

  loan_duration = nil
  loop do
    loan_duration = Kernel.gets().chomp()
    if loan_duration.to_i <= 0
      prompt('Please enter a positive loan duration number (i.e. in months).')
    elsif valid_number?(loan_duration)
      break
    else
      prompt('Please enter a valid loan duration number (i.e. in months).')
    end
  end

  prompt('I will now figure out your monthly payment
         (i.e. includes principle + interest)...')

  monthly_interest_rate = apr.to_f / 100 / 12

  monthly_payment = loan_amount.to_f * (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**(-loan_duration.to_i)))

  prompt("Your monthly payment is: $#{format('%.2f', monthly_payment)}")

  prompt('Would you like to perform another calculation? (Y = to continue)')

  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')

  if answer == 'y'
    prompt("\e[H\e[2J")
  end
end

prompt('Thank you for using the loan calculator! Goodbye!')
