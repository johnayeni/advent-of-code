require "set"

def get_input_data file
  input_file = File.open file
  file_data = input_file.readlines.map(&:chomp)
  input_file.close
  file_data
end


def similarity_between_lists file
  file_data = get_input_data file

  total_similarity_of_lists = 0

  list_1_set = Set.new
  list_2_hash = {}

  file_data.each { |item|
    nums = item.to_s.split " "
    list_1_set.add nums[0]

    if list_2_hash.key?(nums[1])
      list_2_hash[nums[1]] = list_2_hash[nums[1]] + nums[1].to_i
    else
      list_2_hash[nums[1]] = nums[1].to_i
    end
  }

  list_1_set.each do |element|
    total_similarity_of_lists += list_2_hash[element] if list_2_hash.key?(element)
  end

  total_similarity_of_lists
end

start = Time.now
puts similarity_between_lists "input.txt"
puts Time.now - start
