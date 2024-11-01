def num_of_knight_moves(start, goal)
  queue = [[start, 0]]
  current = nil
  distance = nil
  while current != goal
    current, distance = queue.pop
    pp current
    connected = connected(current)
    pp connected
    connected.each { |vertex| queue.unshift [vertex, distance + 1] unless  vertex.nil?}
  end
  distance
end

def connected(vertex)
  possible_combinations = [[2, 1],
                           [-2, 1],
                           [2, -1],
                           [-2, -1],
                           [1, 2],
                           [1, -2],
                           [-1, 2],
                           [-1, -2]]
  possible_combinations.map do |combination|
    x = fits_in_grid?(vertex[0] + combination[0]) ? vertex[0] + combination[0] : nil
    y = fits_in_grid?(vertex[1] + combination[1]) ? vertex[1] + combination[1] : nil
    x.nil? || y.nil? ? nil : [x, y]
  end
end

def fits_in_grid?(num)
  num < 8 && num > -1
end

pp knight_travails([gets.chomp.to_i, gets.chomp.to_i], [gets.chomp.to_i, gets.chomp.to_i])
