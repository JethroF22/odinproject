#write your code here
def translate(text)
  original = text.split(' ')
  translated = []
  original.each do |word|
    translated << trans_word(word)
  end
  text = translated.join(' ')
  text
end

def trans_word(word)
  start = ''

  punctuation = ''

  capital = word != word.downcase   # To capitalize again at the end

  word = word.downcase              # Easier to just work with lowercase

  # Instead of breaking as soon as the first vowel is found,
  # we set this flag to true and keep searching.
  # This is outside of the block so that it remains set to true.
  looking_for_punctuation = false

  word.each_char do |letter|
    if (['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q',
      'r', 's', 't', 'v', 'w', 'x', 'y', 'z'].include?(letter)) and (not looking_for_punctuation)
      start << letter
      if letter == 'q' or letter == 'Q'
        start << 'u'
      end
    else
      looking_for_punctuation = true
      if ['.', ',', '!', '?', ':', ';', "'", '"'].include?(letter)
        punctuation << letter
      end
      next
    end
  end
  word = word[start.length..-(punctuation.length + 1)] + start + 'ay' + punctuation
  if capital
    word = word.capitalize
  end
  word
end
