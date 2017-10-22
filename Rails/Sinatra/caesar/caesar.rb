require "sinatra"
require "rerun" if development?

enable :sessions

get "/" do
  @ciphertext = session[:ciphertext]
  erb :index
end

post "/cipher" do
  text = params["text"]
  key = params['key'].to_i
  session[:ciphertext] = caesar_cipher(text, key)
  redirect '/'
end

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
