def get_input_data file
  input_file = File.open file
  file_data = input_file.readlines.map(&:chomp)
  input_file.close
  return file_data
end

PRIORITIES = (("a".."z").to_a + ("A".."Z").to_a)

def priority_sum file
  file_data = get_input_data file

  sum = 0

  file_data.each_slice(3) { |rucksacks|
    common = rucksacks[0].split("").select { |letter|
      rucksacks[1].include?(letter) && rucksacks[2].include?(letter)
    }.uniq
    common.each { |letter|
      sum += PRIORITIES.find_index(letter) + 1
    }
  }
  return sum
end

puts priority_sum "input.txt"
