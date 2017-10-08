class Game

  def initialize
    @board = Hash.new
    1.upto(9) { |x| @board[x] = " "}
    @turns = 0
    @player1 = []
    @player2 = []
  end

  def play
    until over?
      display_board
      move(prompt_player)
    end
    display_board
    puts "Game over!"
  end

  def prompt_player
    player_choice = nil
    puts "Player #{(@turns % 2)+1} place your mark.  (Choose Square 1-9)"
    attempts = 0
    until (1..9).to_a.include?(player_choice)
      player_choice = gets.chomp.to_i
      attempts == 0 ?  attempts += 1 : puts("Please enter a numeral 1 - 9")
    end

    if @board[player_choice] == " "
      puts "Player #{@turns % 2 == 0 ? '1' : '2'} chose square #{player_choice}."
      @turns += 1
      return player_choice
    else
      puts "Your move is bad and you should feel bad!"
      prompt_player
    end
  end

  def move(square)
    if @turns % 2 == 1
      @player1 << square
      @board[square] = "×"
    else
      @player2 << square
      @board[square] = "⚪"
    end
  end

  def over?
    if line?
      puts "Player #{@turns % 2 == 1 ? "1" : "2"} won!"
      return true
    elsif @turns >= 9
      puts "It's a tie!"
      return true
    else
      return false
    end
  end

  def line?
    lines = [ [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7] ]
    (@player1.permutation(3).to_a & lines).length > 0 or (@player2.permutation(3).to_a & lines).length > 0
  end

  def display_board
    puts " #{@board[1]} ┃ #{@board[2]} ┃ #{@board[3]}"
    puts "━━━╋━━━╋━━━"
    puts " #{@board[4]} ┃ #{@board[5]} ┃ #{@board[6]}"
    puts "━━━╋━━━╋━━━"
    puts " #{@board[7]} ┃ #{@board[8]} ┃ #{@board[9]}"
  end

end
