def get_input_data file
  input_file = File.open file
  file_data = input_file.readlines.map(&:chomp)
  input_file.close
  file_data
end

def get_sum_of_minimum_cubes file
  file_data = get_input_data file

  sum = 0

  file_data.each_with_index { |game, idx|
    sets = game.split(':')[1].split(';')


    minimum_cubes = {
      'red' => 1,
      'green' => 1,
      'blue' => 1
    }

    sets.each do |set|
      cubes = set.split ','

      cubes.each do |cube|
        num, name = cube.split(' ')
        minimum_cubes[name] = [minimum_cubes[name], num.to_i].max
      end
    end

    sum += minimum_cubes['red'] * minimum_cubes['green'] * minimum_cubes['blue']
  }

  sum
end

puts get_sum_of_minimum_cubes "input.txt"