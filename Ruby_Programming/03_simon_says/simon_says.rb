#write your code here
def echo(text)
  text
end

def shout(text)
  text.upcase
end

def repeat(text, reps=2)
  text = text + ' '
  (text * reps)[0..-2]
end

def start_of_word(text, letters)
  text[0..letters-1]
end

def first_word(text)
  text.split.first
end

def titleize(text)
  title = text.split
  title[0].capitalize!
  title.each do |word|
    word.capitalize! if not ['and', 'of', 'the', 'in', 'on', 'an', 'a', 'over'].include?(word)
  end
  title.join(' ')
end
