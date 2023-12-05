def get_input_data file
  input_file = File.open file
  file_data = input_file.readlines.map(&:chomp)
  input_file.close
  file_data
end


def get_sum_of_calibration_values file
  file_data = get_input_data file

  sum = 0

  file_data.each { |val|
    nums = val.delete("^0-9")
    sum += "#{nums[0]}#{nums[-1]}".to_i
  }

  sum
end

puts get_sum_of_calibration_values "input.txt"
