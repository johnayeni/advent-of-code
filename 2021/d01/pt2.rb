def get_input_data file
  input_file = File.open file
  file_data = input_file.readlines.map(&:chomp)
  input_file.close
  return file_data
end

def sonar_sweep file 
  file_data = get_input_data file

  prev_sum = 0
  num_of_increaments = 0

  for i in 0..file_data.length - 2
    sum = file_data[i...i + 2].map { |num| num.to_i }.sum
    if prev_sum != 0 and sum > prev_sum
      num_of_increaments += 1
    end
    prev_sum = sum
  end

  return num_of_increaments
end

puts sonar_sweep "input.txt"
