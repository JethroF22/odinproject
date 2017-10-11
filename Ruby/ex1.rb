puts "There are #{365 * 24} hours in a year."
puts "There are #{10 * 365 * 24 * 60} minutes in a decade."
days = 32 * 365 + 8
seconds = days * 86400
birth = 3 * 3600 + 5 * 60
now = 17 * 3600 + 31 * 60
age_in_seconds = seconds + now - birth
puts "I am #{age_in_seconds} seconds old"
puts "If I am 1246 million seconds old, I am #{1246000000 / (365.25 * 86400)} years old"
