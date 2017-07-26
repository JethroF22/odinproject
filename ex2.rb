puts 'What is your first name?'
first_name = gets.chomp
puts 'What is your middle name?'
middle_name = gets.chomp
puts 'And what is your last name?'
last_name = gets.chomp
puts "Hello, #{first_name + ' ' + middle_name + ' ' + last_name}!"
puts ' '
puts "What is your favorite number, #{first_name}?"
favorite_number = gets.chomp.to_f + 1
puts "Mx. #{last_name}, might I respectfully suggest you adopt #{favorite_number} as your new favorite? It is *bigger* and *better*!"
