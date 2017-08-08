require_relative 'mastermind'

class AI < Mastermind

  def initialize
    super
    @guesses = Hash.new("")   # The AI uses this to evaluate its guess candidates
  end

  def play
    puts "Please enter four digits between 1 and 6."
    @secret = input_combination
    while @moves < 12
      ai_guess = guess
      result = check(ai_guess, @secret)
      process(ai_guess, result)
    end
  end

  # The AI starts by guessing at random. It stores both the guess and its result
  # into the @guesses hash. Then, every new random guess candidate is evaluated.
  # Evaluation is carried out by '#consistent?' . As soon as this helper method
  # finds an inconsistency between the guess candidate and the existing results,
  # that candidate is discarded and a new one is generated. The first candidate
  # to survive being tested against all previous guesses is then used as guess.
  def guess
    found = false
    if @guesses.empty?
      return random_array
    else
      until found
        candidate = random_array
        if @guesses.all? { |guess, output| consistent?(candidate, guess, output) }
          found = true
        end
      end
    end
    candidate
  end   # end of guess

  # This is the helper method that evaluates each guess candidate. It does so by
  # assuming that the candidate is the correct answer. All previous guesses are
  # tested against this assumption. If the guess candidate gives an output diff-
  # erent from any previous guess, this returns false.
  def consistent?(candidate, guess, output)
    result = check(guess, candidate)
    result == output
  end

  def process(ai_guess, result)
    if result == "****"
      win
    else
      @guesses[ai_guess] = result
      @moves += 1
    end
  end

  def win
    puts "HAHA I win, I guessed the secret #{@secret.join} in #{@moves} moves."
    try_again
  end

end