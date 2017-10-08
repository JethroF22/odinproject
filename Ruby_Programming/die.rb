class Die

  def initialize
    # I'll just roll the die, though we
    # could do something else if we wanted
    # to, like setting the die with 6 showing.
    roll
  end

  def roll
    @numberShowing = 1 + rand(6)
  end

  def showing
    @numberShowing
  end

  def cheat
    number = gets.chomp.to_i
    if number > 0 and number < 7
      @numberShowing = number
    end
  end
end

die = Die.new
puts die.showing
die.cheat
puts die.showing
