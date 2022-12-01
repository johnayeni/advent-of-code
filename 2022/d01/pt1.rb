def get_input_data file
  input_file = File.open file
  file_data = input_file.readlines.map(&:chomp)
  input_file.close
  return file_data
end


def elf_wtih_most_calories file
  file_data = get_input_data file

  most_calories = 0
  current_total = 0

  file_data.each { |calorie|
    if calorie.empty?
      if current_total > most_calories
        most_calories = current_total
      end
      current_total = 0
    else
      current_total += calorie.to_i
    end
  }
  return most_calories
end

puts elf_wtih_most_calories "input.txt"
