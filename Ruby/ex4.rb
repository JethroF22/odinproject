year = 2017

while year != 'exit'
  puts 'Give me a year:'
  year = gets.chomp.to_i
  if year % 400 == 0
    leap = true
  elsif year % 4 == 0 and year % 100 != 0
    leap = true
  else
    leap = false
  end
  puts "#{year} is #{leap == true ? '' : 'not '}a leap year."
end
