class Book
  # write your code here
  attr_accessor :title

  def titleize(text)
    title = text.split
    title[0].capitalize!
    title.each do |word|
      word.capitalize! if not ['and', 'of', 'the', 'in', 'on', 'an', 'a', 'over'].include?(word)
    end
    title.join(' ')
  end

  def title
    titleize @title
  end

end
