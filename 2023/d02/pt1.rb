MAX_CUBES = {
  'red' => 12,
  'green' => 13,
  'blue' => 14
}

def get_input_data file
  input_file = File.open file
  file_data = input_file.readlines.map(&:chomp)
  input_file.close
  file_data
end

def get_sum_of_game_ids file
  file_data = get_input_data file

  sum = 0

  file_data.each_with_index { |game, idx|
    sets = game.split(':')[1].split(';')

    possible = true

    puts sets

    sets.each do |set|
      cubes = set.split ','

      cubes.each do |cube|
        num, name = cube.split(' ')
        if MAX_CUBES[name] < num.to_i
          possible = false
          break
        end
      end

      break unless possible
    end

    sum += idx + 1 if possible
  }

  sum
end

puts get_sum_of_game_ids "input.txt"