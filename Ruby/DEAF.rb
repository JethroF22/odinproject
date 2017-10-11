input = ''

while input != 'BYE'
  input = gets.chomp
  if input != input.upcase
    puts 'HUH?!  SPEAK UP, SONNY!'
  else
    year = rand(20) + 1930
    puts "NO, NOT SINCE #{year}!"
  end
end
