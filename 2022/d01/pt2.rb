def get_input_data file
  input_file = File.open file
  file_data = input_file.readlines.map(&:chomp)
  input_file.close
  return file_data
end


def top_three_elfs_calories file
  file_data = get_input_data file

  calories = []
  current_total = 0

  file_data.each { |calorie|
    if calorie.empty?
      calories.push current_total
      current_total = 0
    else
      current_total += calorie.to_i
    end
  }
  return calories.sort.last(3).sum
end

puts top_three_elfs_calories "input.txt"
