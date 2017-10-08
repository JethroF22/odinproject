def possible_moves(position)
  moves = []
  new_pos = [position[0] + 1, position[1] + 2]
  moves << new_pos if valid?(new_pos)
  new_pos = [position[0] + 2, position[1] + 1]
  moves << new_pos if valid?(new_pos)
  new_pos = [position[0] + 1, position[1] - 2]
  moves << new_pos if valid?(new_pos)
  new_pos = [position[0] + 2, position[1] - 1]
  moves << new_pos if valid?(new_pos)
  new_pos = [position[0] - 1, position[1] + 2]
  moves << new_pos if valid?(new_pos)
  new_pos = [position[0] - 2, position[1] + 1]
  moves << new_pos if valid?(new_pos)
  new_pos = [position[0] - 1, position[1] - 2]
  moves << new_pos if valid?(new_pos)
  new_pos = [position[0] - 2, position[1] - 1]
  moves << new_pos if valid?(new_pos)
  moves
end

def valid?(position)
  (0..7).include?(position[0]) and (0..7).include?(position[1])
end

def randpos
  pos = []
  2.times { pos << rand(0..7) }
  pos
end

def knight_moves(start, finish, paths=[], visited=[])
  visited << start
  if paths.empty?
    current = start
    moves_from_start = possible_moves(current)
  else
    current = paths[0]
    moves_from_start = possible_moves(current[-1])
  end
  until moves_from_start.include?(finish)
    moves_from_start.each do |move|
      next if visited.include?(move)
      paths << [start, move]
    end
    knight_moves(paths[0][-1], finish, paths, visited)
  end
  current << finish
  return current
end

# 5.times do
#   puts knight_moves(randpos, randpos)
# end
