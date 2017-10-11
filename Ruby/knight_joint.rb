class Knight
  attr_accessor :position, :next_moves, :parent, :history

  def initialize(position, parent = nil)
    @position = position
    @parent = parent
    @history = []
    current = self
    begin
      @history.unshift(current.position)
      current = current.parent
    end until current.nil?
  end

  def set_moves
    start_x = position[0]
    start_y = position[1]
    ones_array = [-1, 1]
    twos_array = [-2, 2]
    next_moves = []

    ones_array.map do |n|
      new_x = n + start_x
      twos_array.map do |n|
        new_y = n + start_y
        if new_x.between?(0,7) && new_y.between?(0,7)
          next_moves << [new_x, new_y]
        end
      end
    end

    twos_array.map do |n|
      new_x = n + start_x
      ones_array.map do |n|
        new_y = n + start_y
        if new_x.between?(0,7) && new_y.between?(0,7)
          next_moves << [new_x, new_y]
        end
      end
    end

    return next_moves
  end

end

class Game

  def initialize
    @board = []
    8.times do |n|
      8.times do |q|
        square = [n, q]
        @board.push(square)
      end
    end
    @visited = []
  end

  def display

  end

  def knight_moves(start, finish)
  start_node = Knight.new(start)
  queue = [start_node]

  until queue.empty?
    checking = queue.shift
    @visited << checking.position
      next_moves = checking.set_moves
      next_moves.each do |move|
      return checking.history << move if move == finish

        unless @visited.include?(move)
          move_node = Knight.new(move, checking)
          queue << move_node
      end
    end
  end

  end

end

def randpos
  pos = []
  2.times { pos << rand(0..7) }
  pos
end

stuff = Game.new
p stuff.knight_moves([1, 2], [3, 4])
blargh = Game.new
5.times do
 p blargh.knight_moves(randpos, randpos)
end
