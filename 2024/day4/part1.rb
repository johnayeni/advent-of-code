require "set"

def input(filename)
  File.read(filename)
end

def data(file)
  file.split("\n").map { |line| line.split("") }
end

def get_input_data(filename)
  file = input(filename)
  data(file)
end

def xmas_count(filename)
  file_data = get_input_data(filename)
  count = 0
  rows = file_data.length
  cols = file_data[0].length

  directions = [
    [-1, 0],  # up
    [1, 0],   # down
    [0, -1],  # left
    [0, 1],   # right
    [-1, 1],  # up-right
    [1, -1],  # down-left
    [-1, -1], # up-left
    [1, 1],   # down-right
  ]

  check = lambda do |row, col, word, direction|
    if word.length < 1
      count += 1
      return
    end

    return if row >= rows || row < 0 || col >= cols || col < 0 || file_data[row][col] != word[0]
    if direction.nil?
      directions.each do |d|
        check.call(row + d[0], col + d[1], word[1..-1], d)
      end
    else
      check.call(row + direction[0], col + direction[1], word[1..-1], direction)
    end
  end

  for row in 0...rows
    for col in 0...cols
      check.call(row, col, "XMAS", nil)
    end
  end

  count
end

start = Time.now
puts xmas_count("input.txt")
puts Time.now - start
