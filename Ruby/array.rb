words = []

while true
  puts "Enter word:"
  input = gets.chomp
  if input == 'exit'
    break
  end
  words << input.downcase
end

puts ''
puts words.sort
