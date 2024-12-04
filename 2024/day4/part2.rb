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

  points = [
    [[-1, 1], [1, -1]],  # up-right and down-left
    [[-1, -1], [1, 1]], # up-left and down-right
  ]

  check = lambda do |row, col|
    return if file_data[row][col] != 'A'

    count += 1 if points.all? { |p|

      return false if row + p[0][0] >= rows || row + p[0][0] < 0 || col + p[0][1] >= cols || col + p[0][1] < 0
      return false if row + p[1][0] >= rows || row + row + p[1][0] < 0 || col + p[1][1] >= cols || col + p[1][1] < 0

      a = file_data[row + p[0][0]][col + p[0][1]]
      b = file_data[row + p[1][0]][col + p[1][1]]

      [a, b].sort == ['M', 'S']
    }

  end

  for row in 0...rows
    for col in 0...cols
      check.call(row, col)
    end
  end

  count
end

start = Time.now
puts xmas_count("input.txt")
puts Time.now - start
