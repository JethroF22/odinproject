# puts "Enter the text to be ciphered:"
# text = gets.chomp
# puts "Enter the key (0-25)"
# key = gets.chomp.to_i

def caesar_cipher(text, key)
  ciphered_text = []
  text.chars.each do |letter|
    ciphered_letter = letter
    if letter.match(/^[[:alpha:]]$/)
      key.times do
        if ciphered_letter == 'z'
          ciphered_letter = 'a'
        elsif ciphered_letter == 'Z'
          ciphered_letter = 'A'
        else
          ciphered_letter = ciphered_letter.next
        end
      end
    end
    ciphered_text << ciphered_letter
  end
  ciphered_text.join('')
end

# puts caesar_cipher(text, key)
