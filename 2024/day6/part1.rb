def input(filename)
  File.read(filename)
end

def data(file_content)
  file_content.split("\n").map { |c| c.split("") }
end

def get_input_data(filename)
  file = input(filename)
  data(file)
end

def get_distinct_positions(filename)
  positions = get_input_data filename

  blocker = "#"
  visited = "*"

  movements = {
    "^" => [-1, 0],
    ">" => [0, 1],
    "<" => [0, -1],
    "v" =>  [1, 0],
  }

  turns = {
    "^" => ">",
    ">" => "v",
    "<" => "^",
    "v" => "<",
  }

  distinct_positions = 0

  patrol = lambda do |row, col, move|
    return if row >= positions.length || row < 0 || col >= positions[0].length || col < 0

    if positions[row][col] != visited
      positions[row][col] = visited
      distinct_positions += 1
    end


    movement = movements[move]
    cell_ahead = positions[row + movement[0]][col + movement[1]]

    if cell_ahead == blocker
      move = turns[move]
    end

    new_movement = movements[move]

    patrol.call(row + new_movement[0], col + new_movement[1], move)
  end

  guard_starting_position = []

  for row in 0...positions.length
    for col in 0...positions[0].length
      if positions[row][col] == "^"
        guard_starting_position = [row, col]
        break
      end
    end
  end

  patrol.call(guard_starting_position[0],
              guard_starting_position[1],
              positions[guard_starting_position[0]][guard_starting_position[1]])

  distinct_positions
end

start = Time.now
puts get_distinct_positions("input.txt")
elapsed_time = ((Time.now - start) * 1000).to_i
puts "Elapsed time: #{elapsed_time} milliseconds"
