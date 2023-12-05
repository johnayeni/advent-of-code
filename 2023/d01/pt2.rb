def get_input_data(file)
  input_file = File.open file
  file_data = input_file.readlines.map(&:chomp)
  input_file.close
  file_data
end

STR_TO_INT_HASH = {
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9
}.freeze

def get_sum_of_calibration_values(file)
  file_data = get_input_data file
  pattern = /(?=([1-9]|one|two|three|four|five|six|seven|eight|nine))/

  sum = 0

  file_data.each do |val|
    nums = val.scan(pattern).flatten

    sum += "#{STR_TO_INT_HASH[nums[0]] || nums[0]}#{STR_TO_INT_HASH[nums[-1]] || nums[-1]}".to_i
  end

  sum
end

puts get_sum_of_calibration_values 'input.txt'
