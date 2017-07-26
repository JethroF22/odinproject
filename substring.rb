def substrings string, dictionary
  matches = {}
  dictionary.each do |word|
    matches[word] = 0
  end
  words = string.split
  dictionary.each do |word_in_dict|
    words.each do |word_in_string|
      matches[word_in_dict] += 1 if word_in_string.include?(word_in_dict)
    end
  end
  matches.delete_if { |key, value| value == 0 }
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
print substrings("Howdy partner, sit down! How's it going?", dictionary)
