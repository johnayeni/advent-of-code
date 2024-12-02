def get_input_data file
  input_file = File.open file
  file_data = input_file.readlines.map(&:chomp)
  input_file.close
  file_data
end


def distance_between_lists file
  file_data = get_input_data file

  total_distance_of_list = 0

  list_1 = []
  list_2 = []

  file_data.each { |item|
    nums = item.to_s.split " "
    list_1.append nums[0].to_i
    list_2.append nums[1].to_i
  }

  list_1 = list_1.sort
  list_2 = list_2.sort

  for i in 0..list_1.length
    distance = list_1[i].to_i - list_2[i].to_i
    total_distance_of_list += distance.abs
  end

  total_distance_of_list
end

start = Time.now
puts distance_between_lists "input.txt"
puts Time.now - start
