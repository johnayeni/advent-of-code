def input(filename)
  File.read(filename)
end

def data(file_content)
  file_content.split("\n").flat_map.with_index do |line, row|
    line.chars.map.with_index do |ch, col|
      [[col, row], ch]
    end
  end.to_h
end

def get_input_data(filename)
  file = input(filename)
  data(file)
end

def has_loop(map, start)
  current_pos = start
  direction = [0, -1]
  visited = {}

  next_direction = {
    [0, -1] => [1, 0],
    [1, 0] => [0, 1],
    [0, 1] => [-1, 0],
    [-1, 0] => [0, -1]
  }

  loop do
    visited[current_pos] ||= []

    break true if visited[current_pos].include?(direction)

    visited[current_pos] << direction

    next_pos = current_pos.zip(direction).map(&:sum)

    if map[next_pos] == '#'
      direction = next_direction[direction]
    else
      current_pos = next_pos
    end

    break false if map[current_pos].nil?
  end
end

def get_obstruction_positions_count(filename)
  positions = get_input_data filename

  start = positions.find { |k, v| v == '^' }.first

  positions.count do |k, v|
    next if v == '#' || k == start

    has_loop(positions.merge(k => '#'), start) == true
  end
end

start = Time.now
puts get_obstruction_positions_count("input.txt")
elapsed_time = ((Time.now - start) * 1000).to_i
puts "Elapsed time: #{elapsed_time} milliseconds"
