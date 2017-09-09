class Board
  attr_accessor :squares

  def initialize
    @squares = Hash.new
    generate_squares
  end

  def generate_squares
    for x in 0..6
      for y in 0..5
        coord = [x, y]
        @squares[coord] = "☢ "
      end
    end
  end

  def display
    5.downto(0) do |y|
      print (y).to_s
      for x in 0..6
        print " " + @squares[[x, y]]
      end
      print "#{y}\n"
    end
    print "  0  1  2  3  4  5  6\n"
  end
end

class Player
  attr_accessor :symbol, :name

  def initialize(symbol, name)
    @symbol = symbol
    @name = name
  end
end

class Game
  attr_accessor :players, :player1, :player2, :board

  def initialize(players=["Red", "Yellow"])
    @board = Board.new
    @players = players
    @player1s_turn = true
    randomize_players
  end

  def randomize_players
    @player1 = Player.new("⚪ ", @players.sample)
    @players.delete_if { |n| n == @player1.name }
    @player2 = Player.new("⏺ ", @players[0])
  end

  def play
    system "clear"
    puts "Welcome to Connect Four!"
    puts "#{@player1.name} begins."
    choice = ''
    begin
      play_game
      print "Press any key to play again, or press Q to quit: "
      choice = gets.chomp.upcase
    end until choice == 'Q'
  end

  def play_game
    @board.generate_squares
    until line?
      move_select(@player1s_turn ? @player1 : @player2)
    end
    winner = @player1s_turn ? @player2.name : @player1.name
    system "clear"
    print "\n"
    @board.display
    puts "#{winner.capitalize} won! Congratulations!"
  end

  def move_select(current_player)
    system "clear"
    puts "It is #{current_player.name}'s turn."
    @player1s_turn = !@player1s_turn
    @board.display
    valid_move_selected = false
    until valid_move_selected
      print "#{current_player.name.capitalize}, please choose a column to play: "
      x_coord = $stdin.gets.chomp.to_i
      y_coord = check_height(x_coord)
      if x_coord.between(0, 6) and y_coord.between?(0, 5)
        @board.squares[[x_coord, y_coord]] = current_player.symbol
        valid_move_selected = true
      else
        puts "That move is not valid. Please select another one."
      end
    end
  end

  def line?
    # returns true if there are 4 of the same colour horizontally, vertically or diagonally
    paths = []
    6.times do |x|
      5.times do |y|
        paths << [x, y]       # a queue of board squares to test
      end
    end

    until paths.length == 0
      checking = paths.shift
      next if @board.squares[checking] == "☢ "    # an empty square cannot be part of a line
      neighbors = neighbors(checking)
      neighbors.each do |direc, sq|
        if @board.squares[checking] == @board.squares[sq]       # if the square being checked is the same as its neighbor,
          third = neighbors(sq)[direc]    # this is the third square in that direction;
          next unless @board.squares[sq] == @board.squares[third]     # stop unless the third matches the first two
          fourth = neighbors(third)[direc]
          return true if @board.squares[third] == @board.squares[fourth]   # this means a line exists
        end
      end
    end
    return false
  end

  def neighbors(square)
    answer = {}
    moves = {:up => [0, 1], :diag => [1, 1], :right => [1, 0], :down => [1, -1]}
    moves.each do |direc, move|
      neighbor = [(square[0] + move[0]), (square[1] + move[1])]
      answer[direc] = neighbor if (0..6).include?(neighbor[0]) and (0..5).include?(neighbor[1])
    end
    answer
  end

  def check_height(x_coord)
    y = 0
    until @board.squares[[x_coord, y]] == "☢ " or y == 6
      y += 1
    end
    y
  end

end
