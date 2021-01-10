##### refactored version of walk_through_calculator #####

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(input)
  input.to_f.to_s == input || input.to_i.to_s == input || input.include?(".")
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name:")

name = nil
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Please enter a valid name!")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  first_number = nil
  loop do
    prompt("Please type your first number.")
    first_number = Kernel.gets().chomp()

    if valid_number?(first_number)
      break
    else
      prompt("That's not a valid number!")
    end
  end

  second_number = nil

  loop do
    prompt("Please type your second number.")
    second_number = Kernel.gets().chomp()

    if valid_number?(second_number) &&
       second_number != "0" &&
       second_number != "0.0"
      break
    else
      prompt("That's not a valid number!")
    end
  end

  operation_prompt = <<-MSG
    Please type which mode of operation:
      '1' to add
      '2' to subtract
      '3' to multiply
      '4' to divide
  MSG

  prompt(operation_prompt)

  operation = nil
  loop do
    operation = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers...")

  result = case operation
           when '1'
             first_number.to_f() + second_number.to_f()
           when '2'
             first_number.to_f() - second_number.to_f()
           when '3'
             first_number.to_f() * second_number.to_f()
           when '4'
             first_number.to_f() / second_number.to_f()
           end

  prompt("The result is #{result}")

  prompt("Would you like to perform another calculation? (Y = to continue)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the calculator! Goodbye!")
