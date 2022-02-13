def get_input_data file
  input_file = File.open file
  file_data = input_file.readlines.map(&:chomp)
  input_file.close
  return file_data
end


def sonar_sweep file 
  file_data = get_input_data file

  prev_measurement = nil
  num_of_increaments = 0

  file_data.each { |item|
    if prev_measurement.is_a? Integer and item.to_i > prev_measurement
      num_of_increaments += 1
    end
    prev_measurement = item.to_i
  }
  return num_of_increaments
end

puts sonar_sweep "input.txt"
